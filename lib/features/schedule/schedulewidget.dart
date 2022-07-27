import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:to_do/core/util/blocs/cubit.dart';
import 'package:to_do/core/util/widgets/task.dart';
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
                  print(_selectedValue.toString());

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
             height: MediaQuery.of(context).
             size.height,
           //   child: const ListViewPage(),
             child: ListView.builder(
               itemCount:   AppBloc.get(context).tasks.length,
                 itemBuilder: (context,index) {
                   print(AppBloc.get(context).tasks.length);

                //   Task task = AppBloc().tasks!index];
                   // print(task.toString());
                   /*  return Container(
                     width: 100,
                     height: 50,
                     color: Colors.green,
                     margin: EdgeInsets.only(bottom: 20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           margin: EdgeInsets.only(left: 5.0),

                           child: Text(AppBloc
                               .get(context)
                               .tasks[index]["starttime"], style: TextStyle(
                               fontSize: 20, color: Colors.white),),),
                         Container(margin: EdgeInsets.only(left: 5.0),
                           child: Text(AppBloc
                               .get(context)
                               .tasks[index]["title"], style: TextStyle(
                               fontSize: 15, color: Colors.white),),),
                       ],),
                   );*/

              if (AppBloc.get(context).tasks[index]['repeat'] == 'Daily') {
                     return Container(
                       width: 100,
                       height: 50,
                       color: Colors.green,
                       margin: EdgeInsets.only(bottom: 20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: 5.0),
                             child: Text(AppBloc
                                 .get(context)
                                 .tasks[index]["starttime"], style: TextStyle(
                                 fontSize: 20, color: Colors.white),),),
                           Container(margin: EdgeInsets.only(left: 5.0),
                             child: Text(AppBloc
                                 .get(context)
                                 .tasks[index]["title"], style: TextStyle(
                                 fontSize: 15, color: Colors.white),),),
                         ],),
                     );
                  // }
                 }
                if (AppBloc.get(context).tasks[index]['date']==DateFormat.yMd().format(_selectedValue)){
                  return  Container(
                    width: 100,
                    height: 50,
                    color: Colors.green,
                    margin : EdgeInsets.only(bottom:  20.0),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin : EdgeInsets.only( left:  5.0),

                          child :  Text(AppBloc.get(context).tasks[index]["starttime"],style: TextStyle(fontSize: 20,color: Colors.white),),),
                        Container( margin : EdgeInsets.only( left: 5.0),
                          child :  Text(AppBloc.get(context).tasks[index]["title"],style: TextStyle(fontSize:15,color: Colors.white),),),
                      ],),
                  );
                }
                else {
                  return Container();
                    }
               }
    )),

          ],
        )
    ))
    );
  }
  
}