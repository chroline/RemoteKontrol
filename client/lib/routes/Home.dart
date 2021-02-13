import 'dart:ui';

import 'package:client/ctrls/tab.dart';
import 'package:client/models/app_tab.dart';
import 'package:client/routes/NewRoutine.dart';
import 'package:client/widgets/new_routine_fab.dart';
import 'package:client/widgets/tabs/router.dart';
import 'package:client/widgets/tabs_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final TabsController tabsCtrl = TabsController();
  bool userPageDragging = false;

  @override
  void initState() {
    tabsCtrl.pageCtrl.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    tab$.add(AppTab.values[tabsCtrl.pageCtrl.page.round().toInt()]);
  }

  void _newRoutine() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewRoutine()));
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xffeeeeee),
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              checkUserDragging(scrollNotification);
            },
            child: PageView(
              controller: tabsCtrl.pageCtrl,
              children: tabs.toList(),
              onPageChanged: (page) {},
            ),
          ),
          floatingActionButton: NewRoutineFab(
            onPressed: _newRoutine,
          ),
          bottomNavigationBar: tabsCtrl,
        ),
        /*Container(color: Colors.blueGrey.shade800.withOpacity(0.8)),
        AlertDialog(
          title: Text("It is recording tho"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('wait bitch'),
              ],
            ),
          ),
        )*/
      ],
    );
  }
}
