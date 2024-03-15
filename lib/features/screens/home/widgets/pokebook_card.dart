import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/core/routes/app_router.gr.dart';

import '../../../model/pokemon/Pokemon.dart';

class PokeBookCard extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon>? allPokemons;

  const PokeBookCard({
    required this.pokemon,
    this.allPokemons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () async {
        
        AutoRouter.of(context).push(PokemonDetailsRoute(
          allPokemons: allPokemons ?? [],
          detail: pokemon,
        
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, top: 20),
        height: 300,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              top: 100,
              bottom: 10,
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
              top: -40,
              left: 0,
              right: 0,
              child: SvgPicture.network(
                pokemon.image ?? "",
                height: 200,
                width: 200,
                fit: BoxFit.contain,
                placeholderBuilder: (context) {
                  return Container();
                },
              ),
            ),
            Positioned(
              bottom: 40,
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
            Positioned(
              left: 0,
              bottom: 20,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pokemon.types!
                    .map(
                      (tag) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5), 
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
          ],
        ),
      ),
    );
  }
}
