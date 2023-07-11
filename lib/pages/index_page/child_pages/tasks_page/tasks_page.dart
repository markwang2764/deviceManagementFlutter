import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const TabBar(tabs: const [
                Tab(text: '待完成'),
                Tab(text: '已完成'),
                Tab(text: '已取消')
              ]),
            ),
            body: const TabBarView(
              children: [_TabBarItem(), _TabBarItem(), _TabBarItem()],
            )));
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: const SingleChildScrollView(
      child: Center(
          child: Column(
        children: [_TabBarItemCard(), _TabBarItemCard()],
      )),
    ));
  }
}

class _TabBarItemCard extends StatelessWidget {
  const _TabBarItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
                style: TextStyle(color: Colors.black, fontSize: 18),
                '装货时间： 2023-05-23 10:00'),
            const Text(
                style: TextStyle(color: Colors.grey, fontSize: 14), '待出发'),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
                style: TextStyle(color: Colors.black87, fontSize: 12),
                '车次号 20230522039-1'),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(children: [
                  const Text(
                    "装货地：xxxxxxxxxxxxxxx",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    "装货地：xxxxxxxxxxxxxxx",
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
                const SizedBox(width: 20),
                const Icon(
                  color: Color.fromARGB(255, 32, 37, 168),
                  size: 30,
                  Icons.near_me,
                )
              ],
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
                style: TextStyle(color: Colors.black87, fontSize: 12),
                '货物信息 碎石料'),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
                style: TextStyle(color: Colors.black87, fontSize: 12),
                '配载数量（吨） 20'),
          ],
        ),
        SizedBox(
          child: ElevatedButton(
            child: Text('确认出发'),
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
