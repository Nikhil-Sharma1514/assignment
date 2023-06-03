import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../repository.dart';

part 'user_event.dart';
part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial()) {
//     on<UserEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUserList>(_onFetchUserList);
    add(FetchUserList());
  }

  Future<void> _onFetchUserList(
      FetchUserList event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      List<User> userList = await userRepository.fetchUserList();
      emit(UserLoaded(userList));
    } catch (e) {
      emit(UserError('Failed to fetch users'));
    }
  }
}
