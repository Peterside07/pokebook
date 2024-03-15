import 'package:flutter/material.dart';

import 'package:pokebook/core/widgets/text_pair_widget.dart';
import 'package:pokebook/features/model/pokemon/Pokemon.dart';

class AboutWidget extends StatelessWidget {
  final Pokemon detail;
  const AboutWidget({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final realHeigth = (detail.height ?? 1) * 10;
    final realWeigth = (detail.weight ?? 1) / 10.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      child: ListView(
        children: [
        
          Divider(
            color: Colors.grey.shade400,
            thickness: 0,
          ),
          Container(
              height: 30,
              color: Colors.white,
              child: const Center(child: Text('About'))),

          //   ),

          Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.9),
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 2,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
                color: const Color(0xffF1F1F1),
              ),
              child: Column(
                children: [
                  TextPairWidget(name: 'Height', value: '$realHeigth cm'),
                  TextPairWidget(name: 'Weight', value: '$realWeigth kg'),
                  TextPairWidget(
                      name: 'Abilities',
                      value: (detail.abilitiesToString ?? ''))
                ],
              )),

          // Divider(
          //   color: Colors.grey,
          // ),
        ],
      ),
    );
  }
}


