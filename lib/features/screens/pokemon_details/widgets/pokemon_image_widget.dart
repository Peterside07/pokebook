import 'package:flutter/material.dart';
import 'package:pokebook/core/widgets/svg_widget.dart';
import 'package:pokebook/features/model/pokemon/Pokemon.dart';

class PokemonImageWidget extends StatelessWidget {
  final Pokemon detail;
  const PokemonImageWidget({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgWidget(
                height: MediaQuery.of(context).size.width - 120,
                imageUrl: detail.image ?? ''),
          ),
        ],
      ),
    ]);
  }
}
