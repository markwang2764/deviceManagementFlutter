import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mine_platform_app/model/loginUserInfo_Model.dart';
import 'package:mine_platform_app/model/loginUserRole_Model.dart';
import 'package:mine_platform_app/routes.dart';
import 'package:mine_platform_app/utils/http_request/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: SizedBox(
            width: 400,
            child: SingUpForm(),
          ),
        ));
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
  String _loginRoleTag = '';
  Timer? _debounce;

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
      throw e;
    }
  }

  void _onLoginNameChange() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      getUserRoleInfo().then((res) {
        LoginUserRoleModel loginUserRoleModel =
            LoginUserRoleModel.fromJson(res);
        if (loginUserRoleModel.code == 0) {
          List<LoginUserRoleData>? _data = loginUserRoleModel.data;
          _roleTextController.text = _data?[0].roleName as String;
          setState(() {
            _loginRoleTag = _data?[0].uid as String;
          });
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
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text('登录', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _loginNameTextController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person),
              ),
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (v) {
                return v!.trim().length > 5 ? null : "密码不能为空！";
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _roleTextController,
              decoration: InputDecoration(
                labelText: "角色",
                hintText: "登录用户的校色",
                icon: Icon(Icons.verified_user_sharp),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("登录"),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if ((_formKey.currentState as FormState).validate()) {
                        print(_roleTextController.value);
                        try {
                          var res = await HttpUtil.post(Api.login, data: {
                            "loginName": _loginNameTextController.text,
                            "password": _passwordTextController.text,
                            "loginRole": _loginRoleTag
                          });
                          LoginUserInfoModel loginUserInfoModel =
                              LoginUserInfoModel.fromJson(res);
                          if (loginUserInfoModel.code == 0) {
                            LoginUserInfoData? _data = loginUserInfoModel.data;
                            await prefs.setString(
                                "loginUserInfoData", _data.toString());
                            print('---------------->');
                            print(indexPage);
                            // Navigator.pushNamed(context, indexPage);
                          }
                          return res;
                        } catch (e) {
                          print(e);
                          throw e;
                        }
                      }
                    },
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
