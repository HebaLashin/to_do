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

  late Database database ;

  void initDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'tasks.db');
    opendb(path: path);
    emit(appdatabaseInitialized());
  }


  void opendb({required String path,})  {
    database  = openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
           db.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY,title TEXT,date TEXT,starttime TEXT,endtime TEXT,remind TEXT,repeat TEXT)')
               .then((value) {emit(appdatabasetablecreated());
             });
           },
        onOpen: (Database db) {
          emit(appdatabaseopenedstate());
          debugPrint("DataBaseOpened");
          database = db;
          gettasksData();
        }
    ) as Database;
  }

  //TextEditingController usernameController = TextEditingController();
  void inserttaskData() async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO task(title,date,starttime,endtime,remind,repeat) VALUES("1,2,3,4,5,6")');
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
  void gettasksData() async {
    tasks = await database.rawQuery('SELECT * FROM task');
    emit(appDatabasetasks());
  }
}
