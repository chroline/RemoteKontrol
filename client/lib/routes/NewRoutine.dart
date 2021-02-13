import 'package:client/widgets/drive_station/drive_station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class NewRoutine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'New Routine',
              style: GoogleFonts.getFont("Space Mono")
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          body: Center(
              child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5.0),
                      labelText: 'Routine Name',
                      labelStyle: TextStyle(fontSize: 15)),
                  keyboardType: TextInputType.text,
                ),
                Expanded(
                  child: Center(
                    child: DriveStation(),
                  ),
                )
              ],
            ),
          )),
          floatingActionButton: FloatingActionButton(
            splashColor: Colors.greenAccent.withAlpha(100),
            backgroundColor: Colors.greenAccent.shade700,
            foregroundColor: Colors.white,
            onPressed: () {},
            child: Icon(MaterialCommunityIcons.play),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 4.0,
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    splashColor: Colors.red.withAlpha(100),
                    onPressed: () {
                      print("hey");
                    },
                    child: Text("CANCEL",
                        style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2)),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
