import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                  tabs: [Tab(text: '待完成'), Tab(text: '已完成'), Tab(text: '已取消')]),
            ),
            body: TabBarView(
              children: [_TabBarItem(), _TabBarItem(), _TabBarItem()],
            )));
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
      child: Center(
          child: Column(
        children: [TabBarItemCard(), TabBarItemCard()],
      )),
    ));
  }
}

class TabBarItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                style: TextStyle(color: Colors.black, fontSize: 18),
                '装货时间： 2023-05-23 10:00'),
            Text(style: TextStyle(color: Colors.grey, fontSize: 14), '待出发'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                style: TextStyle(color: Colors.black87, fontSize: 14),
                '装货时间： 2023-05-23 10:00'),
          ],
        ),
        Text('车次号'),
      ]),
    );
  }
}
