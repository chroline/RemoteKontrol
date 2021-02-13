import 'package:client/ctrls/tab.dart';
import 'package:client/models/app_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TabsController extends StatelessWidget {
  final PageController pageCtrl =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);

  void setPage(int page) {
    pageCtrl.animateToPage(page,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOutQuint);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: tab$,
      builder: (context, AsyncSnapshot<AppTab> activeTab) {
        return activeTab.hasData
            ? BottomNavigationBar(
                currentIndex: AppTab.values.indexOf(activeTab.data),
                onTap: (index) => setPage(index),
                elevation: 8,
                showUnselectedLabels: false,
                //optional, uses theme color if not specified
                items: AppTab.values
                    .map((e) => BottomNavigationBarItem(
                        title: Text(
                          e.toString().substring(7),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        icon: Icon(
                          () {
                            switch (e) {
                              case AppTab.Control:
                                return Ionicons.ios_car;
                              case AppTab.Routines:
                                return Ionicons.ios_list;
                              case AppTab.Settings:
                                return Ionicons.ios_cog;
                            }
                          }(),
                          color: activeTab.data != e
                              ? Colors.black
                              : Theme.of(context).primaryColor,
                        )))
                    .toList())
            : SizedBox.shrink();
      },
    );
  }
}
