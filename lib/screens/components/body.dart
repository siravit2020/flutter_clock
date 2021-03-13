import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'clock_painter.dart';
import 'time_in_hour_and_minute.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Newport Beach USA | PST',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              TimeInHourAndMinute(),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Clock(),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  CountryCard(
                    country: "New York, USA",
                    timeZone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9.20",
                    period: "PM",
                  ),
                  CountryCard(
                    country: "New York, USA",
                    timeZone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9.20",
                    period: "PM",
                  ),
                  CountryCard(
                    country: "New York, USA",
                    timeZone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9.20",
                    period: "PM",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String country, timeZone, iconSrc, time, period;

  CountryCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.time,
    @required this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 0.6.sw,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryIconTheme.color,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              country,
              style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Text(timeZone),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  iconSrc,
                  width: 30.w,
                  color: Theme.of(context).accentIconTheme.color,
                ),
                Spacer(),
                Text(
                  time,
                  style: Theme.of(context).textTheme.headline4,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(period),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
