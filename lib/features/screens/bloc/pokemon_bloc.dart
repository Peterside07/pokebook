import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokebook/features/model/pokemon/Pokemon.dart';
import 'package:pokebook/features/repositories/pokemon_repository.dart';

part 'pokemon_state.dart';
part 'pokemon_event.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  late Repository repository;
  final int limit = 10;
  int _currentPage = 1;
  final int _totalPokemons = 0;

  PokemonBloc() : super(const PokemonLoadingState([])) {
    on<PokemonEvent>((event, emit) async {
      if (event is PokemonLoadEvent) {
         emit(const PokemonLoadingState([]));
        try {
          final newPokemons = await repository.getPokemons(
            limit: limit,
            offset: (_currentPage - 1) * limit,
          );
          emit(PokemonLoadedState(newPokemons));
        } catch (e) {
          emit(const PokemonLoadedFailedState([]));
        }
      }
    });
  }

  void nextPage() {
    _currentPage++;
    add(PokemonLoadEvent());
  }

  void previousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      add(PokemonLoadEvent());
    }
  }

  void goToPage(int page) {
    if (page > 0 && page <= totalPages) {
      _currentPage = page;
      add(PokemonLoadEvent());
    }
  }

  int get totalPages {
    return (_totalPokemons / limit).ceil();
  }
}

