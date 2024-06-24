part of 'kebakaran_bloc.dart';

sealed class KebakaranEvent {}

final class FetchKebakaranData extends KebakaranEvent {}

final class SaveKebakaranEvent extends KebakaranEvent {
  final KebakaranResponseModel request;

  SaveKebakaranEvent({
    required this.request,
  });
}
