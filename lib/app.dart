import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_database_repository/hive_database_repository.dart';
import 'package:rock_paper_scissors/game/game.dart';
import 'package:rock_paper_scissors/home/home.dart';

import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.hiveDatabaseRepository,
  }) : super(key: key);

  final HiveDatabaseRepository hiveDatabaseRepository;

  @override
  Widget build(BuildContext context) {
    // Providing repository and bloc to the AppView Class
    return RepositoryProvider.value(
      value: hiveDatabaseRepository,
      child: BlocProvider(
        lazy: false,
        create: (context) =>
            ThemeCubit(hiveDatabaseRepository: hiveDatabaseRepository)
              ..getTheme(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late GoRouter router;
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  @override
  void initState() {
    // Defining the routes to able the user navigate between pages
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
            name: 'root',
            path: '/',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                name: 'theGame',
                path: 'game',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  key: ValueKey('story'),
                  child: TheGame(),
                ),
              ),
            ]),
      ],
      errorBuilder: (context, state) {
        return Container();
      },
      redirect: (context, redirectState) {
        return null;
      },
      debugLogDiagnostics: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (themeContext, themeMode) {
        return MaterialApp.router(
          title: "RockPaperScissors",
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }

  redirectRoutes(context, redirectState) {}

  @override
  void dispose() {
    super.dispose();
  }
}

// Create a CheckTheme functionality extension on BuildContext
extension DarkMode on BuildContext {
  bool get isDarkMode {
    if (read<ThemeCubit>().state == ThemeMode.system) {
      return MediaQuery.of(this).platformBrightness == Brightness.dark;
    } else {
      return read<ThemeCubit>().state == ThemeMode.dark;
    }
  }
}
