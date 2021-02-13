import 'dart:convert';

import 'package:client/ctrls/ctrls.dart';
import 'package:client/models/messages/message.dart';
import 'package:client/models/messages/message_data.dart';
import 'package:client/models/speed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import 'stat.dart';

class DriveStation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DriveStation();
}

class _DriveStation extends State {
  @override
  Widget build(BuildContext context) {
    ServerConnection serverConnection = GetIt.instance.get<ServerConnection>();
    return StreamBuilder(
      stream: serverConnection.speed$,
      builder: (context, AsyncSnapshot<Speed> speed) {
        return Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: speed.hasData
                  ? Row(children: [
                      Stat(
                        icon: MaterialCommunityIcons.chevron_triple_up,
                        color: Colors.teal.shade700,
                        title: "Drive Speed",
                        speed: speed.data.drive.toString(),
                      ),
                      Stat(
                        icon: MaterialCommunityIcons.rotate_right,
                        color: Colors.lime.shade700,
                        title: "Rotation Speed",
                        speed: speed.data.rotate.toString(),
                      )
                    ])
                  : SpinKitDualRing(
                      color: Theme.of(context).primaryColor, size: 100),
            ),
            speed.hasData ? brakeBtn(context) : SizedBox.shrink(),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            speed.hasData
                ? Text("Tilt to move!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.grey.shade700))
                : SizedBox.shrink()
          ],
        ));
      },
    );
  }

  Widget brakeBtn(BuildContext context) {
    ServerConnection serverConnection = GetIt.instance.get<ServerConnection>();
    return StreamBuilder(
      stream: serverConnection.serverState$,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: state.data == ServerState.BRAKE
              ? SizedBox(
                  key: ValueKey("go"),
                  width: double.infinity,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.green),
                    highlightedBorderColor: Colors.green,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () => GetIt.instance
                        .get<ServerConnection>()
                        .ws
                        ?.sink
                        ?.add(jsonEncode(Message(MessageType.TRANSITION,
                            TransitionData(ServerState.OPERATING)))),
                    child: Text(
                      "GO",
                      style: Theme.of(context).textTheme.button.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 5,
                          color: Colors.green),
                    ),
                  ),
                )
              : SizedBox(
                  key: ValueKey("brake"),
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.red,
                    disabledColor: Colors.red.shade200,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.redAccent.shade700,
                    onLongPress: () => GetIt.instance
                        .get<ServerConnection>()
                        .ws
                        ?.sink
                        ?.add(jsonEncode(Message(MessageType.TRANSITION,
                            TransitionData(ServerState.BRAKE)))),
                    onHighlightChanged: (bool b) {
                      print("highlight");
                    },
                    child: Text(
                      "BRAKE",
                      style: Theme.of(context).textTheme.button.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 5,
                          color: Colors.white),
                    ),
                  )),
        );
      },
    );
  }
}
