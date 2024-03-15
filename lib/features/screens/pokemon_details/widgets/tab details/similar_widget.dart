import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/features/model/pokemon/Pokemon.dart';

class SimilarWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon>? allPokemons;

  const SimilarWidget({
    required this.pokemon,
    this.allPokemons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      padding: const EdgeInsets.all(20),
      height: 300,
      child: Stack(
        
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ), // Border added here
              ),
            ),
          ),
          Positioned.fill(
            top: 30,
            left: 18,
            right: 18,
            bottom: 90,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: SvgPicture.network(
              pokemon.image ?? "",
              height: 100,
              width: 100,
              fit: BoxFit.contain,
              placeholderBuilder: (context) {
                return Container();
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  pokemon.name,
                  style: GoogleFonts.sofiaSans(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}

