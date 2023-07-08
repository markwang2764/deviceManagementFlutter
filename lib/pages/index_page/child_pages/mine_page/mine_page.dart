import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 50, left: 0, right: 0),
          children: [
              Container(
                child: personalInformation()
              ),
              Container(
                child: performanceInfo()
              ),
              Container(
                child: setting()
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
                  splashColor: Color.fromARGB(255, 184, 218, 210).withAlpha(30),
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:50,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                left: 16,
                                right: 16,
                                child: Text("111")
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
                splashColor: Color.fromARGB(255, 184, 218, 210).withAlpha(30),
                highlightColor: Colors.transparent,
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
                                      Icon(
                                        Icons.bookmark ,
                                        color: const Color.fromARGB(239, 247, 190, 3),
                                        size: 20.0,
                                      ),
                                      Text(
                                        "我的业绩",
                                        style: TextStyle(
                                          color: Color.fromARGB(239, 247, 190, 3),
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
                                              Text(
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
                                              Text(
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
                                              Text(
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
                                              Text(
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

  Widget setting() {
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
                splashColor: Color.fromARGB(255, 184, 218, 210).withAlpha(30),
                highlightColor: Colors.transparent,
                child: Semantics(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:44,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 16,
                              top: 14,
                              bottom: 0,
                              // child: 
                              //   Icon(
                              //     Icons.settings,
                              //     color: const Color.fromARGB(255, 0, 0, 0),
                              //     size: 30.0,
                              //   ),
                              child:Row(
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 30.0,
                                  ),
                                  Text(
                                    '设置',
                                    style: TextStyle(

                                    ),
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