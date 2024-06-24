part of 'bencana_bloc.dart';

sealed class BencanaEvent {}

final class FetchBencanaData extends BencanaEvent {}

final class SaveBencanaEvent extends BencanaEvent {
  final BencanaResponseModel request;

  SaveBencanaEvent({
    required this.request,
  });
}
