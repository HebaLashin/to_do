import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:to_do/core/util/widgets/listviewpage.dart';
import 'package:to_do/features/onboard/onboardpage';
import 'package:intl/intl.dart';



class schedulWidget extends StatefulWidget {
  const schedulWidget({Key? key}) : super(key: key);
  @override
  _schedulWidget createState() => _schedulWidget();
}
  DateTime _selectedValue = DateTime.now();

class _schedulWidget  extends State<schedulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar( title : Text('Schedule',style: TextStyle(fontSize: 25,color: Colors.black,
        fontWeight: FontWeight.bold)),backgroundColor: Colors.white,
    actions: <Widget>[
    IconButton( icon: Icon( Icons.arrow_back_ios,color: Colors.black,   ),
    onPressed : () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => OnBoardPage(),),);
    })]
    ),
    body: Container(
    child : SingleChildScrollView(
    child : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Container(
               margin : EdgeInsets.all(20.0),
               child :  DatePicker(
              DateTime.now(),
              width: 60,height: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.green,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  _selectedValue = date;
                });
              },
            )),

           Container(margin : EdgeInsets.all(20.0),
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text(DateFormat('EEEE').format(_selectedValue),style: TextStyle(fontSize: 20,fontWeight :FontWeight.bold,),),
             Text((DateFormat('d MMM, yyyy').format(_selectedValue))// prints Tuesday, 10 Dec, 2019
               ,style: TextStyle(fontSize: 20,fontWeight :FontWeight.bold,),),

           ],),),

           Container(
             margin : EdgeInsets.all(20.0),
             height: MediaQuery.of(context).size.height,
              child: const ListViewPage(),
            )
          ],
        )
    ))
    );
  }
  
}