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
  List _renderTasks = [];
  @override
  void initState() {
    getProcessTasks();
    super.initState();
  }

  getProcessTasks() async {
    try {
      var res = await HttpUtil.get(Api.findMyProcessJob);
      ProcessJobTaskModel processJobTaskModel =
          ProcessJobTaskModel.fromJson(res);

      if (processJobTaskModel.code == 0) {
        List processTasks = processJobTaskModel.data!.processJobTask as List;

        List tasks = [
          {
            "isOpen": false,
            "title": '进行中的流程',
            "data": processTasks.where((v) => v.processing == true).toList(),
          },
          {
            "isOpen": false,
            "title": '延迟的流程',
            "data": processTasks.where((v) => v.delayed == true).toList(),
          },
          {
            "isOpen": false,
            "title": '追踪的流程',
            "data": processTasks.where((v) => v.track == true).toList(),
          },
          {
            "isOpen": false,
            "title": '完成的流程',
            "data": processTasks
                .where((v) => v.processJobComplete == true)
                .toList(),
          },
        ];
        setState(() {
          _renderTasks = tasks;
          print(tasks);
        });
      } else {
        // TODO list
      }
    } catch (e) {
      print(e);
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
          child: SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (index, bool) {
                setState(() {
                  _renderTasks[index]['isOpen'] =
                      !_renderTasks[index]['isOpen'];
                });
              },
              children: _renderTasks.map((v) {
                return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(v['title']),
                      );
                    },
                    body: Container(
                      constraints: BoxConstraints(maxHeight: 200),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10),
                        children: v['data'].map<Widget>((d) {
                          print(d.toString());
                          return ListTile(
                            leading: Image.network(
                                "https://www.baidu.com/img/dong3_ce6e6a5ce66ab92f491f627981a2f77c.gif"),
                            title: Text(d.objectName),
                            subtitle: Text(d.processJobDesc),
                          );
                        }).toList(),
                      ),
                    ),
                    isExpanded: v['isOpen']);
              }).toList(),
            ),
          ),
        ));
  }
}
