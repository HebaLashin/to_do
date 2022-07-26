import 'package:flutter/material.dart';
import 'package:to_do/core/util/blocs/states.dart';
//import 'package:intl/intl.dart';

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

  List<String> remind_all_items = ['1 day before', '1 hour before', '30 min before', '10 min before'];
  String remind_selectedItem = '10 min before';

  DateTime _selectedDate = DateTime.now();
 // String starttime = "${DateTime.now().hour}".toString()+":"+"${DateTime.now().minute}" .toString();
  String starttime = "10:10 AM";//DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endtime = "11.30 PM";
  bool isstarttime = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return
            //  padding: EdgeInsets.all(16.0),
               Scaffold(
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
                          }
                      ),
                    ],
                  ),

                  body:
                  Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                  SingleChildScrollView(child: Column(
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
                        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText:
                            "${_selectedDate.year}"+"/"+"${_selectedDate.month}"+"/"+"${_selectedDate.day}",
                            border: OutlineInputBorder(),
                          suffixIcon:Padding (
                            padding:  EdgeInsets.all (0.0),
                          child : Icon ( Icons.date_range)),),
                        onTap: (){
                       _getDate();
                          debugPrint ('data clicked');
                        }, ), ),

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
                          Container(width: MediaQuery.of(context).size.width / 2.5
                            , child: TextFormField(
                              decoration: InputDecoration(
                                hintText: starttime ,
                                border: OutlineInputBorder(),
                                suffixIcon:Padding (
                                    padding:  EdgeInsets.all (0.0),
                                    child : Icon ( Icons.access_alarm)),),
                            onTap: (){
                                isstarttime= true;
                                _gettimeAlart();
                            },
                            ),),

                          Spacer(flex: 1,),
                          Container(width: MediaQuery.of(context).size.width / 2.5
                            , child:TextFormField(
                              decoration: InputDecoration(
                                hintText: endtime,
                                border: OutlineInputBorder(),
                                suffixIcon:Padding (
                                    padding:  EdgeInsets.all (0.0),
                                    child : Icon ( Icons.access_alarm)),),
                              onTap: (){
                                isstarttime=false;
                                _gettimeAlart();},
                            ),),
                            ],),),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text('Remind',),),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: DropdownButton(
                          // decoration:  InputDecoration(enabledBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(16),
                          //  borderSide: BorderSide(width: 3,color: Colors.)

                          value: remind_selectedItem,
                          items: remind_all_items.map((item) => DropdownMenuItem(
                            child: Text(item,), value: item,)).toList(),
                          onChanged: (value) =>
                              setState(() => remind_selectedItem = value.toString()),
                        )
                        ,),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text('Repeat',),),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: DropdownButton(
                          // decoration:  InputDecoration(enabledBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(16),
                          //  borderSide: BorderSide(width: 3,color: Colors.)

                          value: repeat_selectedItem,
                          items: repeat_all_items.map((item) => DropdownMenuItem(
                            child: Text(item,), value: item,)).toList(),
                          onChanged: (value) =>
                              setState(() => repeat_selectedItem = value.toString()),
                        )
                        ,),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: MyButton(text: 'Create a Task',
                          onClick: () {
                            AppBloc.get(context).inserttaskData();
//ScaffoldMessenger.of(context).showSnackBar(snackBar(content:const Text ('hhh')));
                           // Navigator.push(context, MaterialPageRoute(
                         //     builder: (context) => OnBoardPage(),),);
                          },
                        ),),],     ),
                  )));
        }

    );
  }

   _getDate()   async{
    DateTime? time = await  showDatePicker(context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000), lastDate: DateTime(2121));
       if (time !=null){
       //  AppBloc.get(context).inserttaskData();
         setState(() {
           _selectedDate = time;
           print("choosing a date correctly");
         });
       }
       else {
         print("error choosing a date");

       }
  }

  _gettimeAlart() async {
    var pickedTime  = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(hour: 9, minute: 10)
    );
    String format_time = pickedTime!.format(context);
    if (pickedTime == null) {
      debugPrint("please choose time");
    } else if (isstarttime == true) {
      setState(() {
        starttime = format_time;
        debugPrint("start time");
      });
    }
    else if (isstarttime == false) {
        setState(() {
          endtime = format_time;
          debugPrint("endtime");
        });
      };
  }
}







