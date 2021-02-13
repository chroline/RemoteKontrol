import 'package:client/widgets/drive_station/drive_station.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Control extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, // Color for Android
    ));
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
              ),
              Container(
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Remote Kontrol",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w600)
                            .merge(GoogleFonts.getFont("Space Mono")),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text("by Cole Gawin",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1)
                    ]),
              ),
              Expanded(
                  child: Center(
                //heightFactor: double.infinity,
                child: DriveStation(),
              )),
            ]));
  }
}
