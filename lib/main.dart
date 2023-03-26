import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/app.dart';
import 'package:pokedex_f/helper/pokedex_bloc_observer.dart';
import 'package:pokedex_f/injection.dart';
import 'package:leak_tracker/leak_tracker.dart';

void main() async {
  Bloc.observer = PokedexBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  if (kDebugMode || kProfileMode) {
    enableLeakTracking(
        config: const LeakTrackingConfiguration(
            stdoutLeaks: true,
            notifyDevTools: true,
            stackTraceCollectionConfig:
                StackTraceCollectionConfig(collectStackTraceOnDisposal: true)));
    MemoryAllocations.instance
        .addListener((event) => dispatchObjectEvent(event.toMap()));
  }

  runApp(const PokedexApp());
}
