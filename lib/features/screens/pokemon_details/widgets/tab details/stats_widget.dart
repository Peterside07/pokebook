import 'package:flutter/material.dart';
import 'package:pokebook/core/widgets/stat_widget.dart';
import 'package:pokebook/features/model/stats/StatSlot.dart';


class StatsWidget extends StatelessWidget {

  final List<StatSlot> stats;
  final Color? color;
  const StatsWidget({Key? key, required this.stats, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10),
      color: Colors.white,
      child: ListView(
        children: stats.map<StatWidget>((stat) {
          final doubleValue = stat.baseStat * 1.0;
          return StatWidget(
              name: stat.stat.name.toUpperCase(), value: doubleValue, 
              color: color);
        }).toList(),
      ),
    );
  }
}
