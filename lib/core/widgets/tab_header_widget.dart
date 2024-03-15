import 'package:flutter/material.dart';
import 'package:pokebook/core/services/size_constants.dart';
import 'package:pokebook/core/widgets/text_widget.dart';


class TabHeaderWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const TabHeaderWidget({Key? key, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: vspaceM, horizontal: 0),
      child: TextWidget(
        title,
        fontSize: fontSizeL,
        color: color,
      ),
    );
  }
}
