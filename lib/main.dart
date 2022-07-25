import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/util/blocs/cubit.dart';
import 'package:to_do/features/onboard/onboardpage';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers : [
        BlocProvider<AppBloc>(
          create: (context)=>AppBloc()..initDatabase(),
        )
      ],
      child : MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: OnBoardPage(),
      ) );
  }
}
//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
