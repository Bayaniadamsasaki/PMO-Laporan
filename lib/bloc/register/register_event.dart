// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

sealed class RegisterEvent {}

class SaveRegisterEvent extends RegisterEvent {
  final RegisterModel request;
  SaveRegisterEvent({
    required this.request,
  });
}
