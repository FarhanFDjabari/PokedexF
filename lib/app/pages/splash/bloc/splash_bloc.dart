import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStart>((event, emit) {
      emit(SplashLoading());
    });
    on<SplashEnd>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(SplashFinished());
    });
  }
}
