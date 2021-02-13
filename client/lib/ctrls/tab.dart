import 'package:client/models/app_tab.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<AppTab> tab$ = BehaviorSubject.seeded(AppTab.Control);
