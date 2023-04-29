import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/app.dart';
import 'package:pokedex_f/helper/pokedex_bloc_observer.dart';
import 'package:pokedex_f/di/injection.dart';
import 'package:leak_tracker/leak_tracker.dart';

void main() async {
  Bloc.observer = PokedexBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await Injector.setup();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  if (kDebugMode || kProfileMode) {
    enableLeakTracking(
        config: const LeakTrackingConfiguration(
          stdoutLeaks: true,
          notifyDevTools: true,
          stackTraceCollectionConfig: StackTraceCollectionConfig(
            collectStackTraceOnDisposal: true,
            collectStackTraceOnStart: true,
          ),
        ),
        resetIfAlreadyEnabled: true);
    MemoryAllocations.instance.addListener((event) => event.toMap());
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then((_) {
    runApp(const PokedexApp());
  });
}
