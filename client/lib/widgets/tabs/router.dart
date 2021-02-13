import 'package:client/models/app_tab.dart';
import 'package:client/widgets/tabs/control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Widget> tabs = [
  Container(key: ValueKey(AppTab.Control), child: Control()),
  Container(
    color: Colors.grey.shade200,
    key: ValueKey(AppTab.Routines),
    child: () {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }(),
  ),
  Container(key: ValueKey(AppTab.Settings), color: Colors.green)
];
