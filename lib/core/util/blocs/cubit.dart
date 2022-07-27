import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p ;
import 'package:to_do/core/util/blocs/states.dart';



class AppBloc extends Cubit<appstates> {
  AppBloc() : super(appIntitStates());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);


  void initDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'tasks.db');
    opendb(path: path);
    emit(appdatabaseInitialized());
  }

  late Database database ;
  void opendb({required String path,}) async {
      openDatabase(path, version: 1,
        onCreate: (Database db, int version)async  {
          await  db.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY,title TEXT,date TEXT,starttime TEXT,endtime TEXT,remind TEXT,repeat TEXT)')
               .then((value) {emit(appdatabasetablecreated());
             });           },
        onOpen: (Database db) {
          emit(appdatabaseopenedstate());
          debugPrint("DataBaseOpened");
          database = db;
          gettasksData();
        }
    );
  }



  TextEditingController titlecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController starttimecontroller = TextEditingController();
  TextEditingController endtimecontroller = TextEditingController();
  TextEditingController remindcontroller = TextEditingController();
  TextEditingController repeatcontroller = TextEditingController();

  void inserttaskData() async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO task(title,date,starttime,endtime,remind,repeat) VALUES("${titlecontroller.text}","${datecontroller.text}",'
              '"${starttimecontroller.text}","${endtimecontroller.text}","${remindcontroller.text}","${repeatcontroller.text}")');
     // 'INSERT INTO task(title,date,starttime,endtime,remind,repeat) VALUES("1","2","3","4","5","6")');

      /*
          'INSERT INTO task(title,date,starttime,endtime,remind,repeat) VALUES("${usernameController.text},'

          '${usernameController.text},'
          ''${usernameController.text},
          '${usernameController.text},'
           '${usernameController.text},
          '${usernameController.text}")');*/
    }).then((value) {
      debugPrint('appdatabasetaskcreated');

      gettasksData();
      emit(appdatabasetaskcreated());

    });
    //  usernameController.clear();
  }

  List<Map> tasks = [];
  Future<List<Map>>  gettasksData() async {
    tasks = await database.rawQuery('SELECT * FROM task');
    emit(appDatabasetasks());
    debugPrint('gettasksData');
    return tasks;

  }


  List<Map> taskswithspecificDay = [];
  Future<List<Map>> gettaskswithspecificDay(DateTime datetime)async{
      taskswithspecificDay = await database.rawQuery('SELECT * FROM task WHERE date = "${datetime}"');
      emit(appDatabasespecificDay());
      debugPrint('appDatabasespecificDay');
      return taskswithspecificDay;

    }


}
