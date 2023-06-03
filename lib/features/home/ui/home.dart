import 'dart:developer';

import 'package:assignment/constants.dart';
import 'package:assignment/features/recent_transactions/ui/recent_transactions.dart';
import 'package:assignment/features/users/bloc/user_bloc.dart';
import 'package:assignment/features/users/ui/user_list_view.dart';
import 'package:assignment/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../users/repository.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService apiService = ApiService();
  // final UserRepository userRepository = UserRepository();
  final HomeBloc homeBloc = HomeBloc();
  // UserBloc userBloc = UserBloc(UserRepository());
  dynamic users;

  @override
  void initState() {
    // users = getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeNavigateToRecentTransactions) {
          log('Navigating');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RecentTransactions()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: size.height * .4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: kPrimaryColor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: AppBar(
                          backgroundColor: kPrimaryColor,
                          elevation: 0,
                          title: const ListTile(
                            title: Text(
                              'Hola, Michael',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Te tenemos excelentes noticias para ti',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          actions: [
                            IconButton(
                              icon: Image.asset(
                                'assets/bell@2x.png',
                                height: 18,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/toa-heftiba-O3ymvT7Wf9U-unsplash@2x.png',
                                height: 18,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '\$56,271.68',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '+\$9,736',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                // height: 1.5,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/arrow up.png',
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '2.3%',
                                  style: TextStyle(
                                    fontSize: 16,
                                    // height: 1.5,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'ACCOUNT BALANCE',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Following',
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.grey.shade600,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    '36',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Transactions',
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.grey.shade600,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Bills',
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('PERFORMANCE CHART',
                              style: kHeadingTextStyle),
                          Image.asset(
                            'assets/SUCCESS!@2x.png',
                            height: 30,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/chart@2x.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('TOP USERS FROM YOUR COMMUNITY',
                          style: kHeadingTextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      UserListView()
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('RECENT TRANSACTIONS',
                              style: kHeadingTextStyle),
                          MaterialButton(
                            onPressed: () {
                              homeBloc.add(NavigateToRecentTransactions());
                            },
                            padding: EdgeInsets.zero,
                            child: Image.asset(
                              'assets/SUCCESS!@2x.png',
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < 4; i++)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/Group 16126@2x.png',
                            height: 35,
                          ),
                          title: const Text('John Doe'),
                          subtitle: const Text('United Kingdom'),
                          trailing: SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '80,000 AED',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '11 Aug 2021',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 13),
                                    Image.asset(
                                      i == 0
                                          ? 'assets/in-progress@2x.png'
                                          : 'assets/check-circle-fill@2x.png',
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('FINANCIAL GOALS', style: kHeadingTextStyle),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'XX of total XX',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        color: Colors.blue.shade600,
                        backgroundColor: Colors.grey,
                        value: .3,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'XX of total XX',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LinearProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.grey,
                        value: .65,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'XX of total XX',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LinearProgressIndicator(
                        color: Colors.tealAccent,
                        backgroundColor: Colors.grey,
                        value: .6,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getUsers() async {
    try {
      List users = await apiService.getUsers();
      // log(users.toString());
      return users;
    } catch (e) {
      log('error: $e');
    }
  }
}
