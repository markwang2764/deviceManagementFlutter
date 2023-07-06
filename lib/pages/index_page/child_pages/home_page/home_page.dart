import 'package:flutter/material.dart';
import 'package:mine_platform_app/model/processJobTask_Model.dart';

import '../../../../utils/http_request/api.dart';
import '../../../../utils/http_request/request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> mList = [];
  List<ExpandState> expandStateList = [];

  @override
  void initState() {
    getProcessTasks();
    for (var i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandState(i, false));
    }
    super.initState();
  }

  getProcessTasks() async {
    print(1);
    try {
      var res = await HttpUtil.get(Api.findMyProcessJob);
      print(res);
      return res;
    } catch (e) {
      // print(e);
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('任务概览'),
        ),
        body: Container(
          child: Center(
              child: SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (index, bool) {
                //回调
                setState(() {
                  expandStateList[index].isOpen =
                      !expandStateList[index].isOpen;
                });
              },
              children: mList.map((index) {
                return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('标题'),
                        subtitle: Text("二级标题"),
                      );
                    },
                    body: ListTile(
                      title: Text('内容内容内容'),
                    ),
                    isExpanded: expandStateList[index].isOpen);
              }).toList(),
            ),
          )),
        ));
  }
}

class ExpandState {
  var isOpen;
  var index;
  ExpandState(this.index, this.isOpen);
}
