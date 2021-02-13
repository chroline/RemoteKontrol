import 'dart:ui';

import 'package:rxdart/rxdart.dart';

BehaviorSubject<AppLifecycleState> appState$ =
    BehaviorSubject.seeded(AppLifecycleState.resumed);
