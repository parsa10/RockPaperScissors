import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_database_repository/hive_database_repository.dart';
import 'app.dart';
import 'bloc_observer.dart';

void main() async {
  const hiveRepository = HiveDatabaseRepository();
  await hiveRepository.initHive();
  Bloc.observer = AppBlocObserver();
  runApp(
    const App(
      hiveDatabaseRepository: hiveRepository,
    ),
  );
}
