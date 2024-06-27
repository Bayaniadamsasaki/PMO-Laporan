part of 'medis_bloc.dart';

sealed class MedisEvent {}

final class FetchMedisData extends MedisEvent {}

final class DeleteMedisEvent extends MedisEvent {
  final String id;

  DeleteMedisEvent({
    required this.id,
  });
}

final class UpdateMedisEvent extends MedisEvent {
  final MedisResponseModel request;

  UpdateMedisEvent({
    required this.request,
  });
}

final class SaveMedisEvent extends MedisEvent {
  final MedisResponseModel request;

  SaveMedisEvent({
    required this.request,
  });
}
