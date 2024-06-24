// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kebakaran_bloc.dart';

sealed class KebakaranState {}

final class KebakaranInitial extends KebakaranState {}

final class KebakaranLoading extends KebakaranState {}

final class KebakaranLoaded extends KebakaranState {
  final List<KebakaranResponseModel> model;
  KebakaranLoaded({
    required this.model,
  });
}

final class KebakaranError extends KebakaranState {
  final String message;
  KebakaranError({
    required this.message,
  });

  get error => null;
}
