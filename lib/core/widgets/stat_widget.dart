import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokebook/core/services/size_constants.dart';
import 'package:pokebook/core/widgets/text_widget.dart';

class StatWidget extends StatelessWidget {
  final int min;
  final int max;
  final String name;
  final double value;
  final Color? color;
  const StatWidget(
      {Key? key,
      this.min = 0,
      this.max = 200,
      required this.name,
      required this.value,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: hspaceXL, right: hspaceXL),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: TextWidget(
                  name,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
              
              Expanded(
                flex: 5,
                child: LinearPercentIndicator(
                  percent: value / 200.0,
                  progressColor: color,
                
                  lineHeight: 10,
                  backgroundColor: Colors.grey[200],
                ),
          
             
              ),
          
              Expanded(
                  child: TextWidget(
                value.toStringAsFixed(0),
                color:  Colors.black,
                textAlign: TextAlign.right,
                fontWeight: fontWeightBold,
              )),
            
            ],
          ),
      Divider(color: Colors.grey.shade400,
      thickness: 0,)
        ],
      ),
    );
  }
}
