import 'package:flutter/material.dart';

class MineResetPasswordPage extends StatelessWidget {
  const MineResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _originalPasswordTextController = TextEditingController();
    final _newPasswordTextController = TextEditingController();
    final _confirmPasswordTextController = TextEditingController();
    final _resetPasswordFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          '修改密码',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        leading: Container(
          //padding: const EdgeInsets.only(left:0,top:0,right: 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            color: const Color.fromARGB(255, 0, 0, 0),
            iconSize: 28,
            onPressed: () => {
              if ((_resetPasswordFormKey.currentState as FormState).validate())
                {
                  if (_originalPasswordTextController.text != "system")
                    {
                      (showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('原密码不正确'),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('确认'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    }
                  else if (_newPasswordTextController.text !=
                      _confirmPasswordTextController.text)
                    {
                      (showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('两次输入密码不一致'),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('确认'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    }
                  else
                    {print("11")}
                },
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        '账号 : system',
                        style: TextStyle(
                          color: Color.fromARGB(255, 109, 109, 109),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                Container(
                  child: Form(
                    key: _resetPasswordFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _originalPasswordTextController,
                            decoration: InputDecoration(
                              labelText: "原密码",
                              hintText: "输入原密码",
                            ),
                            obscureText: true,
                            validator: (v) {
                              return v!.trim().isNotEmpty ? null : "原密码不能为空";
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _newPasswordTextController,
                            decoration: InputDecoration(
                              labelText: "新密码",
                              hintText: "输入新密码",
                            ),
                            obscureText: true,
                            validator: (v) {
                              return v!.trim().length > 5 ? null : "新密码需大于五位！";
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _confirmPasswordTextController,
                            decoration: InputDecoration(
                              labelText: "确认密码",
                              hintText: "确认您的新密码",
                            ),
                            obscureText: true,
                            validator: (v) {
                              return v!.trim().length > 5 ? null : "新密码需大于五位！";
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
