import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String speed;

  const Stat({
    Key key,
    this.title,
    this.icon,
    this.speed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconDisplay(),
              Padding(padding: EdgeInsets.all(5)),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: color, fontWeight: FontWeight.w500)),
              Padding(padding: EdgeInsets.all(5)),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Text(speed,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget iconDisplay() {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Icon(
        icon,
        size: 30.0,
        color: color,
      ),
    );
  }
}
