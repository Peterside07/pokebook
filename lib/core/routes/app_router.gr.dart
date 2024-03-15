// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:pokebook/features/model/pokemon/Pokemon.dart' as _i6;
import 'package:pokebook/features/screens/bloc/pokebook_home.dart' as _i1;
import 'package:pokebook/features/screens/pokemon_details/Pokemon_screen.dart'
    as _i2;
import 'package:pokebook/features/screens/welcome/welcome_screen.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PokeBookHome.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PokeBookHome(),
      );
    },
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PokemonDetailsScreen(
          key: args.key,
          detail: args.detail,
          allPokemons: args.allPokemons,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.PokeBookHome]
class PokeBookHome extends _i4.PageRouteInfo<void> {
  const PokeBookHome({List<_i4.PageRouteInfo>? children})
      : super(
          PokeBookHome.name,
          initialChildren: children,
        );

  static const String name = 'PokeBookHome';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PokemonDetailsScreen]
class PokemonDetailsRoute extends _i4.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    _i5.Key? key,
    required _i6.Pokemon detail,
    required List<_i6.Pokemon> allPokemons,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            key: key,
            detail: detail,
            allPokemons: allPokemons,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static const _i4.PageInfo<PokemonDetailsRouteArgs> page =
      _i4.PageInfo<PokemonDetailsRouteArgs>(name);
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    this.key,
    required this.detail,
    required this.allPokemons,
  });

  final _i5.Key? key;

  final _i6.Pokemon detail;

  final List<_i6.Pokemon> allPokemons;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{key: $key, detail: $detail, allPokemons: $allPokemons}';
  }
}

/// generated route for
/// [_i3.WelcomePage]
class WelcomeRoute extends _i4.PageRouteInfo<void> {
  const WelcomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
