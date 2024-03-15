// ignore_for_file: unnecessary_import, file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/features/model/pokemon/Pokemon.dart';
import 'package:pokebook/features/screens/bloc/pokemon_bloc.dart';
import 'package:pokebook/features/screens/pokemon_details/widgets/pokemon_detail_widget.dart';
import 'package:pokebook/features/screens/pokemon_details/widgets/pokemon_image_widget.dart';

@RoutePage()
class PokemonDetailsScreen extends StatefulWidget {
  final Pokemon detail;
  final List<Pokemon> allPokemons;

  List<Pokemon> getSimilarPokemons() {
    final List<String> typeNames =
        detail.types!.map((tag) => tag.type.name).toList();

    return allPokemons
        .where((p) => p.types!.any((t) => typeNames.contains(t.type.name)))
        .toList();
  }

  const PokemonDetailsScreen(
      {Key? key, required this.detail, required this.allPokemons})
      : super(key: key);

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  late final PokemonBloc pokemonBloc;
  late Pokemon pokemon;

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: widget.detail.getColor(),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Positioned(
              top: 50,
              right: 10,
              left: 10,
              bottom: 0,
              child: PokemonImageWidget(detail: widget.detail)),
          Positioned(
            top: 10,
            bottom: 140,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  widget.detail.name,
                  style: GoogleFonts.sofiaSans(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 50,
            right: 10,
            bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.detail.types!
                  .map(
                    (tag) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          tag.type.name,
                          style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45, // Adjust as needed
            left: 0,
            right: 0,
            bottom: 0,
            child: PokemonDetailWidget(
                detail: widget.detail,
                allPokemons: widget.getSimilarPokemons()),
          ),
          //  PokemonDetailWidget(detail: widget.detail)
        ],
      ),
    ));
  }
}
