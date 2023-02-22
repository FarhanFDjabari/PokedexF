part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashStart extends SplashEvent {}

class SplashEnd extends SplashEvent {}
