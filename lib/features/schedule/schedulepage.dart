import 'package:flutter/material.dart';
import 'package:to_do/features/schedule/schedulewidget.dart';


class schedulePage extends StatefulWidget {
  const schedulePage({Key? key}) : super(key: key);

 @override
 _schedulePage createState() => _schedulePage();
}
class _schedulePage  extends State<schedulePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body : schedulWidget(),
        ));
  }
}
