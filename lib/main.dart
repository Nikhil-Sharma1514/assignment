import 'dart:developer';

import 'package:assignment/features/home/ui/home.dart';
import 'package:assignment/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/bloc/home_bloc.dart';
import 'features/users/bloc/user_bloc.dart';
import 'features/users/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    UserBloc userBloc = UserBloc(UserRepository());
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => homeBloc,
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => userBloc,
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
