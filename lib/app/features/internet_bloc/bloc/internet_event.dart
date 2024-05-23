part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

class InternetLostEvent extends InternetEvent {}

class InternetGainEvent extends InternetEvent {}
