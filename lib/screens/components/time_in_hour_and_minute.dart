import 'dart:async';

import 'package:flutter/material.dart';

class TimeInHourAndMinute extends StatefulWidget {
  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_timeOfDay.minute != TimeOfDay.now().minute) {
          setState(() {
            _timeOfDay = TimeOfDay.now();
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    String h = "";
    String m = "";
    if (_timeOfDay.hourOfPeriod < 10) {
      h = "0${(_timeOfDay.hourOfPeriod.toString())}";
    } else
      h = _timeOfDay.hourOfPeriod.toString();
    if (_timeOfDay.minute < 10) {
      m = "0${(_timeOfDay.minute.toString())}";
    } else
      m = _timeOfDay.minute.toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$h:$m',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 5,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
