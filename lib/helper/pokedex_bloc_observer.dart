import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class PokedexBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint("onCreate BLoC --> ${bloc.runtimeType}");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("onChange BLoC type --> ${bloc.runtimeType}");
    debugPrint("onChange BLoC currentState --> ${change.currentState}");
    debugPrint("onChange BLoC nextState --> ${change.nextState}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint("onError BLoC --> ${bloc.runtimeType}, $error");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint("onClose BLoC --> ${bloc.runtimeType}");
  }
}
