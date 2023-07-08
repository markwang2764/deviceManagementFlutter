import 'package:flutter/material.dart';
import 'package:mine_platform_app/routes.dart';
class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
          children: [
              Container(
                child: personalInformation()
              ),
              Container(
                child: performanceInfo()
              ),
              Container(
                child: setting(context)
              ),
          ],
        ),
      ),
    );
  }
  Widget personalInformation() {
    return SafeArea(
      top: false,
      bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                  child: Semantics(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:92,
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 16,top:0,right: 16),
                                child:Row(
                                  children: [
                                    const Icon(
                                      Icons.account_box_outlined ,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: 70.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 4,top:18),
                                            child:Text(
                                              '王乐康',
                                              style: TextStyle(
                                                fontSize: 22
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 4),
                                            child:Text(
                                              '手机号: 111111111111',
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded ,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: 25.0,
                                    ),
                                  ],
                                )
                              ),
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

  Widget performanceInfo() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {},
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                highlightColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                child: Semantics(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:92,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Row(
                                    children:[
                                      const Icon(
                                        Icons.bookmark ,
                                        color: const Color.fromARGB(255, 247, 190, 3),
                                        size: 20.0,
                                      ),
                                      const Text(
                                        "我的业绩",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 247, 190, 3),
                                        ),
                                      )
                                    ]
                                  ),
                                  Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(top: 8),
                                                child:Text(
                                                  '5',
                                                  style: TextStyle(
                                                    fontSize: 30
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                '今日完成',
                                                style: TextStyle(
                                                    fontSize: 14
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(top: 8),
                                                child:Text(
                                                  '120',
                                                  style: TextStyle(
                                                    fontSize: 30
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                '今日运载',
                                                style: TextStyle(
                                                    fontSize: 14
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(top: 8),
                                                child:Text(
                                                  '47',
                                                  style: TextStyle(
                                                    fontSize: 30
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                '本月完成',
                                                style: TextStyle(
                                                    fontSize: 14
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(top: 8),
                                                child:Text(
                                                  '2449',
                                                  style: TextStyle(
                                                    fontSize: 30
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                '本月运载',
                                                style: TextStyle(
                                                    fontSize: 14
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
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

  Widget setting(BuildContext context) {
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
                  Navigator.pushNamed(context, mineSettingPage);
                },
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(0),
                child: Semantics(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:44,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 16,top:12,right: 16),
                              child:Row(
                                children: [
                                  const Icon(
                                    Icons.settings_outlined,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 30.0,
                                  ),
                                  Expanded(
                                    child:Container(
                                      padding: const EdgeInsets.only(left: 16),
                                      child:const Text(
                                        '设置',
                                        style: TextStyle(
                                          fontSize: 16
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded ,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 25.0,
                                  ),
                                ],
                              )
                            ),
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