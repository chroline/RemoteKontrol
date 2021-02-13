import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'ctrls/app_state.dart';
import 'ctrls/server_connection.dart';
import 'ctrls/tilt_reader.dart';
import 'routes/Home.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initState();
  startApp();
}

void initState() {
  GetIt.instance.registerSingleton<AppTheme>(AppTheme());
  GetIt.instance.registerSingleton<ServerConnection>(ServerConnection());
}

void startApp() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(App());
    GetIt.instance.registerSingleton<TiltReader>(TiltReader());
  });
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      appState$.add(state);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Remote Kontrol',
      theme: GetIt.instance.get<AppTheme>().theme,
      home: Home(),
    );
  }
}
