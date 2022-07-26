import 'package:flutter/material.dart';


class ListViewPage extends StatefulWidget{
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPage createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: ListView(
            children: [
           Card( child:   CheckboxListTile(
                title: Text('I am true now'),
             value: _checkboxListTile,

             onChanged: (value) {
                  setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  });
                },
              )
          ),

            ],
            shrinkWrap: true,
          )
      );
  }
}