import 'dart:ui';

import 'package:client/ctrls/app_state.dart';
import 'package:client/ctrls/ctrls.dart';
import 'package:get_it/get_it.dart';
import 'package:sensors/sensors.dart';

double gravity = 9.81;

class TiltReader {
  TiltReader() {
    accelerometerEvents
        .where((e) => appState$.value == AppLifecycleState.resumed)
        .distinct((e1, e2) {
          return ((e1.x >= e2.x - 0.5 && e1.x <= e2.x + 0.5) &&
              (e1.y >= e2.y - 0.5 && e1.y <= e2.y + 0.5) &&
              (e1.z >= e2.z - 0.5 && e1.z <= e2.z + 0.5));
        })
        .map((e) => [
              double.parse(((e.z / gravity) * 10).toStringAsFixed(5)).round(),
              double.parse(((-e.x / gravity) * 10).toStringAsFixed(5)).round()
            ])
        .distinct((e1, e2) => (e1[0] == e2[0] && e1[1] == e2[1]))
        //.throttleTime(Duration(milliseconds: 250))
        .listen((event) {
          GetIt.instance.get<ServerConnection>().setSpeed(event);
        });
  }
}
