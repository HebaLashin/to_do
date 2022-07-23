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
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('I am true now'),
                value: _checkboxListTile,
                onChanged: (value) {
                  setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  });
                },
              )
          ),
              Card(
                  child: ListTile(
                    title:Text("List Item 1") ,
                  )
              ),
              Card(
                child: ListTile(
                  title: Text("List Item 2"),
                ),
              ),
              Card(
                  child: ListTile(
                    title: Text("List Item 3"),
                  )
              ),
            ],
            shrinkWrap: true,
          )
      );
  }
}