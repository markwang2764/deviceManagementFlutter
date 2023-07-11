import 'package:flutter/material.dart';
import 'package:mine_platform_app/routes.dart';

class MineSettingPage extends StatelessWidget {
  const MineSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            '设置',
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
          )),
      body: SafeArea(
        child: Container(
            child: SizedBox(
                child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
              children: [
                Container(child: changePassword(context)),
                Container(child: aboutOur(context)),
              ],
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Container(height: 100, child: loginOut(context))),
          ],
        ))),
      ),
    );
  }

  Widget changePassword(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, mineResetPasswordPage);
                },
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                child: Semantics(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 44,
                        child: Stack(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 0, top: 12, right: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: const Text(
                                          '修改密码',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: 25.0,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutOur(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {},
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                child: Semantics(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 44,
                        child: Stack(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 0, top: 12, right: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: const Text(
                                          '关于',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: 25.0,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginOut(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('提示'),
                        content: const Text('确认退出'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('取消'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('确认'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                child: Semantics(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 52,
                        child: Stack(
                          children: [
                            Container(child: const Center(child: Text("退出登录"))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
