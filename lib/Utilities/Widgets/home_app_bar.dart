import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Utilities/static_classes.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
    leadingWidth: 68,
    backgroundColor: Palette.secondaryBlackColor,
    leading: const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 24,
        backgroundImage: AssetImage(
          "assests/logo/google logo.png",
        ),
      ),
    ),
    title: Text(
      User.name.toUpperCase(),
      style: bodyMedium(),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: CircleAvatar(
            backgroundColor: Palette.neutralDarkGrey,
            radius: 24,
            child: IconButton(
              icon: const Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
              onPressed: (() {}),
            )),
      )
    ],
  );
}
