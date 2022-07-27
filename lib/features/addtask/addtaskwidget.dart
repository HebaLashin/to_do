import 'package:flutter/material.dart';
import 'package:to_do/core/util/blocs/states.dart';
//import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

import 'package:to_do/core/util/blocs/cubit.dart';
import 'package:to_do/core/util/widgets/mybutton.dart';
import 'package:to_do/features/onboard/onboardpage';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({Key? key}) : super(key: key);
  @override
  _AddTaskWidget createState() => _AddTaskWidget();
}
class _AddTaskWidget  extends State<AddTaskWidget> {
  List<String> repeat_all_items = ['Weekly', 'monthly', '3', '4'];
  String repeat_selectedItem = 'Weekly';

  List<String> remind_all_items = [
    '1 day before',
    '1 hour before',
    '30 min before',
    '10 min before'
  ];
  String remind_selectedItem = '10 min before';
  DateTime _selectedDate = DateTime.now();
  String starttime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endtime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Add Task", style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => OnBoardPage(),),);
                      }),],
              ),
              body: Container(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text('Title',),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: TextFormField(
                          controller: AppBloc
                              .get(context)
                              .titlecontroller,
                          decoration: InputDecoration(
                            hintText: 'Design Team meeting',
                            border: OutlineInputBorder(),
                          ),
                        ),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text('Date',),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: TextFormField(controller: AppBloc.get(context).datecontroller,
                          decoration: InputDecoration(
                            hintText: "${_selectedDate.year}" + "-" + "${_selectedDate
                           .month}" + "-" + "${_selectedDate.day}",
                            border: OutlineInputBorder(),
                            suffixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(Icons.date_range)),),
                          onTap: () {
                            _getDate();
                            debugPrint('data clicked');
                            AppBloc.get(context).datecontroller.clear();

                          },),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(alignment: Alignment.topLeft,
                                child: Text('Start Time',)),
                            //    Spacer(flex: 3,),

                            Container(alignment: Alignment.center,
                              child: Text('End Time',),),

                          ],),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Row(children: [
                        Expanded(child :  Container(width: MediaQuery.of(context).size.width / 3
                            , child: TextFormField(
                              controller: AppBloc
                                  .get(context)
                                  .starttimecontroller,
                              decoration: InputDecoration(
                                hintText: starttime,
                                border: OutlineInputBorder(),
                                suffixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(Icons.access_alarm)),),
                              onTap: () {
                                _getstarttimeAlart();
                                AppBloc.get(context).starttimecontroller.clear();
                              },
                            ),),
                        ),
                         // Spacer(),

                          Expanded(child: Container(width: MediaQuery.of(context).size.width / 3
                            , child: TextFormField(
                              controller: AppBloc.get(context).endtimecontroller,
                              decoration: InputDecoration(
                                hintText: endtime,
                                border: OutlineInputBorder(),
                                suffixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(Icons.access_alarm)),),
                              onTap: () {
                                _getendtimeAlart();
                                AppBloc.get(context).endtimecontroller.clear();
                              },
                            ),),)
                        ],),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text('Remind',),),

                  /*    Container(width: MediaQuery.of(context) .size.width,
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: DropdownButton(
                          value: remind_selectedItem,
                          items: remind_all_items.map((item) =>
                              DropdownMenuItem(
                                child: Text(item,), value: item,)).toList(),
                          onChanged: (value) =>
                            setState(() =>
                              remind_selectedItem = value.toString()),
                        )
                        ,),
*/

                      Container(width: MediaQuery.of(context) .size.width,
                        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                         child :  TextFormField(controller: AppBloc.get(context).remindcontroller,
                          decoration: InputDecoration(
                          //  hintText: remind_selectedItem,
                            border: OutlineInputBorder(),
                            suffixIcon: DropdownButton(
                              value: remind_selectedItem,
                           items: remind_all_items.map((item) =>
                               DropdownMenuItem(
                                 child: Text(item,), value: item,)).toList(),
                           onChanged: (value){
                               setState((){
                               remind_selectedItem = value.toString();
                               });
                               AppBloc.get(context).remindcontroller.text= value.toString();
                           },
                            ),
                          )
                           ),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text('Repeat',),),

                  Container(width: MediaQuery.of(context) .size.width,
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    child :  TextFormField(controller: AppBloc.get(context).repeatcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: DropdownButton(
                          value: repeat_selectedItem,
                          items: repeat_all_items.map((item) =>
                              DropdownMenuItem(
                                child: Text(item,), value: item,)).toList(),
                          onChanged: (value) {
                            setState((){
                              repeat_selectedItem = value.toString();
                            });
                            AppBloc.get(context).repeatcontroller.text= value.toString();
                          },


                        ),
                      )
                    ),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: MyButton(text: 'Create a Task',
                          // controller: AppBloc.get(context).usernameController,

                          onClick: () {
                            AppBloc.get(context).inserttaskData();
                            debugPrint('${AppBloc
                                .get(context)
                                .titlecontroller
                                .text}${AppBloc
                                .get(context)
                                .datecontroller
                                .text}'
                                '${AppBloc
                                .get(context)
                                .starttimecontroller
                                .text}${AppBloc
                                .get(context)
                                .endtimecontroller
                                .text}${AppBloc
                                .get(context)
                                .remindcontroller
                                .text}${AppBloc
                                .get(context)
                                .repeatcontroller
                                .text}');

                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => OnBoardPage(),),);
                          },
                        ),),
                    ],),
                  )));
        }

    );
  }

  _getDate() async {
    DateTime? datetime = await showDatePicker(context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000), lastDate: DateTime(2121)).then((value) {
      AppBloc.get(context).datecontroller.text = DateFormat("y-M-d").format(value!);
    });
    if (datetime != null) {
       _selectedDate = datetime;
      print("choosing a date correctly");
    }
    else {
      print("error choosing a date");
    }
  }

  _getstarttimeAlart() async {
    var pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      AppBloc
          .get(context)
          .starttimecontroller
          .text = value!.format(context);
    });
    String format_time = pickedTime!.format(context);
    if (pickedTime == null) {
      debugPrint("please choose time");
    }
    starttime= format_time;
    debugPrint("start time");
  }

  _getendtimeAlart() async {
    var pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay.now(),
    ).then((value) {
      AppBloc
          .get(context)
          .endtimecontroller
          .text = value!.format(context);
    });
    String format_time = pickedTime!.format(context);
    if (pickedTime == null) {
      debugPrint("please choose time");
    }
    endtime= format_time;
    debugPrint("end time");
  }




}







