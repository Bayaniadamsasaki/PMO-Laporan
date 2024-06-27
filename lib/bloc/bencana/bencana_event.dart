part of 'bencana_bloc.dart';

sealed class BencanaEvent {}

final class FetchBencanaData extends BencanaEvent {}

final class DeleteBencanaEvent extends BencanaEvent {
  final String id;

  DeleteBencanaEvent({
    required this.id,
  });
}

final class UpdateBencanaEvent extends BencanaEvent {
  final BencanaResponseModel request;

  UpdateBencanaEvent({
    required this.request,
  });
}

final class SaveBencanaEvent extends BencanaEvent {
  final BencanaResponseModel request;

  SaveBencanaEvent({
    required this.request,
  });
}
