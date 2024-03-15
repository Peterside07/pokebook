import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pokebook/core/routes/app_router.dart';
import 'package:pokebook/core/themes/theme_data.dart';
import 'package:pokebook/features/screens/bloc/pokemon_bloc.dart';
import 'package:provider/provider.dart';

import 'package:path_provider/path_provider.dart';

import 'features/repositories/pokemon_repository.dart';
import 'features/screens/theme/bloc/theme_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        Provider.value(value: Repository()),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<PokemonBloc>(
          create: (BuildContext context) => PokemonBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        final themeMode = state.themeMode;
        return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(375, 825),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'PokeBook',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                routerConfig: appRouter.config(),
              );
            });
      }),
    );
  }
}
