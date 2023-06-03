import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recent_transactions_event.dart';
part 'recent_transactions_state.dart';

class RecentTransactionsBloc
    extends Bloc<RecentTransactionsEvent, RecentTransactionsState> {
  RecentTransactionsBloc() : super(RecentTransactionsInitial()) {
    on<RecentTransactionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
