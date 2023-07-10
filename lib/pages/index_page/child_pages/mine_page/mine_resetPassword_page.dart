import 'package:flutter/material.dart';

class MineResetPasswordPage extends StatelessWidget {
  const MineResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor:const Color.fromARGB(255, 255, 255, 255),
        title:const Text(
          '修改密码',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        leading:Container(
          //padding: const EdgeInsets.only(left:0,top:0,right: 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color:const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions:[
          TextButton(
            onPressed: () {},
            child: IconButton(
              icon: const Icon(Icons.check_rounded),
              color:const Color.fromARGB(255, 0, 0, 0),
              iconSize: 28,
              onPressed: () {
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Text("111"),
        ),
      ),
    );
  }

}