import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/features/screens/bloc/pokemon_bloc.dart';
import 'package:pokebook/features/screens/home/widgets/pokebook_appbar.dart';
import 'package:pokebook/features/screens/theme/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/theme_data.dart';
import '../../repositories/pokemon_repository.dart';
import '../home/widgets/pokebook_card.dart';

@RoutePage()
class PokeBookHome extends StatefulWidget {
  const PokeBookHome({Key? key}) : super(key: key);

  @override
  State<PokeBookHome> createState() => _PokeBookHomeState();
}

class _PokeBookHomeState extends State<PokeBookHome> {
  final _bloc = PokemonBloc();
  int currentPage = 1;
  int totalPages = 5;

  @override
  void initState() {
    super.initState();
    _bloc.repository = Provider.of<Repository>(context, listen: false);
    _bloc.add(PokemonLoadEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            context: context,
            onTap: () {
              showThemeColorModal(context);
            },
            circleColor: state.themeMode == ThemeMode.light
                ? darkTheme.primaryColor
                : lightTheme.primaryColor,
          ),
          body: Stack(
            children: [
              // Background Image
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              // Blue Overlay
              Container(
                color: Colors.white.withOpacity(0.9),
              ),

              // Main content
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: BlocProvider(
                    create: (_) => _bloc,
                    child: BlocListener<PokemonBloc, PokemonState>(
                      listener: (_, state) {
                        if (state is PokemonLoadedFailedState &&
                            state.pokemonLength > 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to load pokemons',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 16, color: Colors.black),
                              ),
                              duration: const Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<PokemonBloc, PokemonState>(
                        builder: (context, state) {
                          return Stack(children: [
                       
                            if (state is PokemonLoadedFailedState &&
                                state.pokemonLength == 0)
                              Center(
                                  child: Text(
                                'Failed to load Pokemon',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sofiaSans(
                                    fontSize: 16, color: Colors.black),
                              )),
                            if (state is PokemonLoadingState &&
                                state.pokemonLength == 0)
                              const Center(child: CircularProgressIndicator()),
                            if (state is PokemonLoadedState)
                              ListView.builder(
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 16),
                                itemBuilder: (_, index) {
                                  return PokeBookCard(
                                      allPokemons: state.pokemon,
                                      pokemon: state.pokemon[index]);
                                },
                                itemCount: state.pokemon.length,
                              ),
                            if (state is PokemonLoadingState &&
                                state.pokemonLength > 0)
                              const LinearProgressIndicator(),

                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      _bloc.previousPage();
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      _bloc.nextPage();
                                    },
                                  ),
                                ],
                              ),
                            )
                          ]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void showThemeColorModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text(
          'Choose Theme ',
          textAlign: TextAlign.center,
        ),
        children: [
          SizedBox(
            height: 150,
            child: Center(
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...ThemeMode.values.map((themeMode) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeBloc>()
                                .add(ThemeModeSwitched(themeMode: themeMode));
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: themeMode == ThemeMode.dark
                                ? const Color(0xff39BADF)
                                : const Color(0xffDE527F),
                            radius: 30,
                          ),
                        );
                      }).toList()
                    ],
                  );
                },
              ),
            ),
          )
        ],
      );
    },
  );
}
