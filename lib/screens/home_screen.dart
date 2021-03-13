import 'package:flutter/material.dart';
import 'package:flutter_clock_mai/screens/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        splashRadius: 25,
        icon: SvgPicture.asset("assets/icons/Settings.svg"),
        color: Theme.of(context).iconTheme.color,
        onPressed: () {},
      ),
      actions: [button(context)],
    );
  }

  Widget button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor, // button color
            child: InkWell(
              child: SizedBox(
                width: 32,
                height: 32,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
