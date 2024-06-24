part of 'medis_bloc.dart';

sealed class MedisState {}

final class MedisInitial extends MedisState {}

final class MedisLoading extends MedisState {}

final class MedisLoaded extends MedisState {
  final List<MedisResponseModel> model;
  MedisLoaded({
    required this.model,
  });
}

final class MedisError extends MedisState {
  final String message;
  MedisError({
    required this.message,
  });

  get error => null;
}
