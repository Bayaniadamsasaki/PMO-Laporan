part of 'medis_bloc.dart';

sealed class MedisEvent {}

final class FetchMedisData extends MedisEvent {}

final class SaveMedisEvent extends MedisEvent {
  final MedisResponseModel request;

  SaveMedisEvent({
    required this.request,
  });
}
