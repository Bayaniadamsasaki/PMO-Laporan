part of 'kebakaran_bloc.dart';

sealed class KebakaranEvent {}

final class FetchKebakaranData extends KebakaranEvent {}

final class DeleteKebakaranEvent extends KebakaranEvent {
  final String id;

  DeleteKebakaranEvent({
    required this.id,
  });
}

final class UpdateKebakaranEvent extends KebakaranEvent {
  final KebakaranResponseModel request;

  UpdateKebakaranEvent({
    required this.request,
  });
}

final class SaveKebakaranEvent extends KebakaranEvent {
  final KebakaranResponseModel request;

  SaveKebakaranEvent({
    required this.request,
  });
}
