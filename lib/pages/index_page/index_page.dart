import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mine_platform_app/pages/index_page/child_pages/home_page/home_page.dart';
import 'package:mine_platform_app/pages/index_page/child_pages/tasks_page/tasks_page.dart';
import 'package:mine_platform_app/pages/index_page/child_pages/mine_page/mine_page.dart';
import 'package:mine_platform_app/pages/index_page/child_pages/notify_page/notify_page.dart';
import 'tab_bar_item.dart';
import 'dart:io';

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
    TabBarItem(
      title: '首页',
      norIcon: Icon(
        Icons.home,
      ),
      acIcon: Icon(
        Icons.home,
        color: Colors.green,
      ),
    ),
    TabBarItem(
      title: '任务',
      norIcon: Icon(
        Icons.assignment_add,
      ),
      acIcon: Icon(
        Icons.assignment_add,
        color: Colors.green,
      ),
    ),
    TabBarItem(
      title: '通知',
      norIcon: Icon(
        Icons.comment,
      ),
      acIcon: Icon(
        Icons.comment,
        color: Colors.green,
      ),
    ),
    TabBarItem(
      title: '我的',
      norIcon: Icon(
        Icons.person,
      ),
      acIcon: Icon(
        Icons.person,
        color: Colors.green,
      ),
    ),
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
                  icon: v.norIcon, label: v.title, activeIcon: v.acIcon))
              .toList()),
      body: PageView(
        controller: _controller,
        onPageChanged: (int page) {
            setState(() {
              _pageIndex = page;
            });
          },
        physics: Platform.isAndroid
            ? const PageScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          TasksPage(),
          NotifyPage(),
          MinePage(),
        ],
      ),
    );
  }
}
