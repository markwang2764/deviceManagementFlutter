import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mine_platform_app/routes.dart';
import 'package:mine_platform_app/utils/http_request/api.dart';
import '../../utils/http_request/request.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SingUpForm(),
          ),
        ),
      ),
    );
  }
}

class SingUpForm extends StatefulWidget {
  const SingUpForm({super.key});

  @override
  State<SingUpForm> createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SingUpForm> {
  final _loginNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _roleTextController = TextEditingController();
  Timer? _debounce;
  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;

    final controllers = [
      _loginNameTextController,
      _passwordTextController,
      _roleTextController
    ];
    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    print(indexPage);
    Navigator.pushNamed(context, indexPage);
  }

  @override
  void initState() {
    super.initState();
    _loginNameTextController.addListener(_onLoginNameChange);
  }

  getUserRoleInfo() async {
    try {
      var res = await HttpUtil.get(Api.findRoleVosByLoginName);
      return res;
    } catch (e) {
      print(e);
    }
  }

  void _onLoginNameChange() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      var _res = {};
      getUserRoleInfo().then((res) {
        if (res.code == 0) {
          String roleName = res.data[0].roleName;
          _roleTextController.text = roleName;
        }
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    final controllers = [
      _loginNameTextController,
      _passwordTextController,
      _roleTextController
    ];
    controllers.forEach((v) {
      v.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('登录', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _loginNameTextController,
              decoration: const InputDecoration(hintText: '登录名'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: const InputDecoration(hintText: '密码'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _roleTextController,
              decoration: const InputDecoration(hintText: '角色'),
            ),
          ),
          TextButton(
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: const Text('登录'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;
  const AnimatedProgressIndicator({
    super.key,
    required this.value,
  });

  @override
  State<AnimatedProgressIndicator> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    final colorTween = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.red, end: Colors.orange), weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
          weight: 1),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);
    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => LinearProgressIndicator(
              value: _curveAnimation.value,
              valueColor: _colorAnimation,
              backgroundColor: _colorAnimation.value?.withOpacity(0.4),
            ));
  }
}
