import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../bloc/user_bloc.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        log(state.runtimeType.toString());
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoaded) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                final user = state.userList[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        // backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage(userProfileImages[index % 4]),
                        radius: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.username,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is UserError) {
          return Center(
            child: Text('Error: ${state.errorMessage}'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
