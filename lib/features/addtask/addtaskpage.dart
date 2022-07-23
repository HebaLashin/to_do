import 'package:flutter/material.dart';
import 'package:to_do/features/addtask/addtaskwidget.dart';


class AddTaskPage extends StatefulWidget{
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPage createState() => _AddTaskPage();

}

class _AddTaskPage  extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar : AppBar(),
        body : AddTaskWidget(),
        ));
  }
}

