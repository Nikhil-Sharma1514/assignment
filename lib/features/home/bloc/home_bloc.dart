import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToRecentTransactions>(_navigateToRecentTransactions);
  }

  FutureOr<void> _navigateToRecentTransactions(
      NavigateToRecentTransactions event, Emitter<HomeState> emit) {
    log('Navigate Event clicked');
    emit(HomeNavigateToRecentTransactions());
  }
}
