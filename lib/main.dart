import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:max_hydrated_bloc_app/blocs/blocs.dart';
import 'package:max_hydrated_bloc_app/cubit/cubits.dart';
import 'package:max_hydrated_bloc_app/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrightnessCubit(),
      child: BlocBuilder<BrightnessCubit, Brightness>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: state,
            ),
            home: BlocProvider(
              create: (context) => CounterBloc()..add(CounterStarted()),
              child: const CounterScreen(),
            ),
          );
        },
      ),
    );
  }
}
