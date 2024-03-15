import 'package:flutter/material.dart';
import 'package:pokebook/core/widgets/tab_header_widget.dart';
import 'package:pokebook/features/model/pokemon/Pokemon.dart';
import 'package:pokebook/features/screens/pokemon_details/widgets/tab%20details/about_widget.dart';
import 'package:pokebook/features/screens/pokemon_details/widgets/tab%20details/stats_widget.dart';

import 'tab details/similar_widget.dart';

class PokemonDetailWidget extends StatefulWidget {
  final Pokemon detail;
  final List<Pokemon>? allPokemons;
  const PokemonDetailWidget({Key? key, required this.detail, this.allPokemons})
      : super(key: key);

  @override
  State<PokemonDetailWidget> createState() => _PokemonDetailWidgetState();
}

class _PokemonDetailWidgetState extends State<PokemonDetailWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final double realHeigth;
  late final double realWeigth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AboutWidget(detail: widget.detail),
                StatsWidget(
                  stats: widget.detail.stats!,
                  color: widget.detail.getColor(),
                ),
                ListView.builder(
                  itemCount: widget.allPokemons!.length,
                  itemBuilder: (context, index) {
                    return Container(
                        color: const Color(0xffF1F1F1),
                        child:
                            SimilarWidget(pokemon: widget.allPokemons![index]));
                  },
                ),
              ],
            ),
          ),
          Container(
            height: kToolbarHeight - 10.0,
            decoration: const BoxDecoration(
              color: Color(0xffE9E9E9),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.yellow,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(7.0),
                dividerColor: Colors.transparent,
                indicatorWeight: 3.0,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                tabs: const [
                  TabHeaderWidget(
                      title: 'About', color: Colors.black),
                  TabHeaderWidget(
                      title: 'Stats', color: Colors.black),
                  TabHeaderWidget(
                      title: 'Similar', color:  Colors.black),
                ]),
          ),
        ],
      ),
    );
  }
}
