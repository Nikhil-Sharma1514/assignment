part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class FetchUserList extends UserEvent {}
