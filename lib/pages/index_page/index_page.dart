import 'package:flutter/material.dart';
import 'package:mine_platform_app/pages/tasks_page/tasks_page.dart';
import 'package:mine_platform_app/pages/mine_page/mine_page.dart';
import 'package:mine_platform_app/pages/notify_page/notify_page.dart';
import 'tab_bar_item.dart';
import 'dart:io';

const List<String> tabNames = [
  "ListView",
  "ListView.builder",
  "ListView.separated",
  "RefreshListView"
];

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  final PageController _controller = PageController(initialPage: 0);
  final List<TabBarItem> items = [
    // TabBarItem(
    //     title: '首页',
    //     norImage: "assets/images/tabbar_chat.png",
    //     selImage: "assets/images/tabbar_chat_hl.png"),
    TabBarItem(
        title: '任务',
        norImage: "assets/images/tabbar_contact.png",
        selImage: "assets/images/tabbar_contact_hl.png"),
    TabBarItem(
        title: '通知',
        norImage: "assets/images/tabbar_discover.png",
        selImage: "assets/images/tabbar_discover_hl.png"),
    TabBarItem(
        title: '我的',
        norImage: "assets/images/tabbar_mine.png",
        selImage: "assets/images/tabbar_mine_hl.png")
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (int page) {
            setState(() {
              _pageIndex = page;
            });
            _controller.jumpToPage(page);
          },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          items: items
              .map((v) => BottomNavigationBarItem(
                    icon: Image.asset(
                      v.norImage,
                      width: 20,
                      height: 20,
                    ),
                    label: v.title,
                    activeIcon: Image.asset(
                      v.selImage,
                      width: 20,
                      height: 20,
                    ),
                  ))
              .toList()),
      body: PageView(
        controller: _controller,
        physics: Platform.isAndroid
            ? const PageScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        children: const [
          TasksPage(),
          NotifyPage(),
          MinePage(),
        ],
      ),
    );
  }
}
