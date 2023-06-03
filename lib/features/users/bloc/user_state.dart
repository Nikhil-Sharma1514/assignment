part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> userList;

  UserLoaded(this.userList);
}

class UserError extends UserState {
  final String errorMessage;

  UserError(this.errorMessage);
}
