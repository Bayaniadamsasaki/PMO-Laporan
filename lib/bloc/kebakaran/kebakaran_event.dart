part of 'kebakaran_bloc.dart';

sealed class KebakaranEvent {}

final class SaveKebakaranEvent extends KebakaranEvent {
  final KebakaranModel request;

  SaveKebakaranEvent({
    required this.request,
  });
}
