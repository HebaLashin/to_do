import 'package:flutter/material.dart';
import 'package:to_do/core/util/blocs/cubit.dart';

class Task extends StatelessWidget {
  final String title;
  final String date;
  final String starttime;
  final String endtime;
  final String remind;
  final String repeat;


  const Task({
    Key? key,
    required this.title,
    required this.date,
    required this.starttime,
    required this.endtime,
    required this.remind,
    required this.repeat,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Column(
          children: [
            Container( child: Text(
                '${starttime}',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Text(
                '${title}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold, ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}