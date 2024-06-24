part of 'bencana_bloc.dart';

sealed class BencanaState {}

final class BencanaInitial extends BencanaState {}

final class BencanaLoading extends BencanaState {}

final class BencanaLoaded extends BencanaState {
  final List<BencanaResponseModel> model;
  BencanaLoaded({
    required this.model,
  });
}

final class BencanaError extends BencanaState {
  final String message;
  BencanaError({
    required this.message,
  });

  get error => null;
}