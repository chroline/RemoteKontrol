import 'package:client/ctrls/tab.dart';
import 'package:client/models/app_tab.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class NewRoutineFab extends StatelessWidget {
  final VoidCallback onPressed;
  final Key rectGetterKey;

  const NewRoutineFab({Key key, this.onPressed, this.rectGetterKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: tab$,
      builder: (context, AsyncSnapshot<AppTab> activeTab) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: activeTab.data != AppTab.Routines
              ? SizedBox.shrink()
              : RectGetter(
                  key: rectGetterKey,
                  child: FloatingActionButton.extended(
                    splashColor: Colors.white30,
                    onPressed: onPressed,
                    icon: new Icon(Icons.add),
                    label: Text("ROUTINE"),
                  )),
        );
      },
    );
  }
}
