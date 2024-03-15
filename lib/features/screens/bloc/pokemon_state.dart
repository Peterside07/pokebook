part of 'pokemon_bloc.dart';

sealed class PokemonState extends Equatable {
  const PokemonState();
  
  @override
  List<Object> get props => [];
}


class PokemonLoadingState extends PokemonLoadedState {
  final List<Pokemon> pokemons;
  int get pokemonLength => pokemons.length;

  const PokemonLoadingState(this.pokemons): super(pokemons);
}

class PokemonLoadedState extends PokemonState {
  final List<Pokemon> pokemon;

  const PokemonLoadedState(this.pokemon);
}

class PokemonLoadedFailedState extends PokemonLoadedState {
  final List<Pokemon> pokemons;
 int get pokemonLength => pokemons.length;

  const PokemonLoadedFailedState(this.pokemons): super(pokemons);
}
