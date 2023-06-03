import 'dart:developer';
import 'dart:math' as math;
import 'package:assignment/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/arrow-right@2x.png',
            height: 16,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Saved Cards',
          style: kHeadingTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/Icon material-menu@2x.png',
                height: 16,
              ))
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset('assets/Visa Card 1@2x.png'),
              Image.asset('assets/Visa Card 2@2x.png'),
            ],
            // disableGesture: false,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                  setState(() {});
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CarouselChangeIndicator(
                itemCount: 2, currentIndex: currentIndex),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  indicatorWeight: 5,
                  controller: _tabController,
                  tabs: const <Widget>[
                    Tab(
                      text: 'Menu title 1',
                    ),
                    Tab(
                      text: 'Menu title 1',
                    ),
                    Tab(
                      text: 'Menu title 1',
                    ),
                  ],
                ),
                SizedBox(
                  height: 417,
                  child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      RecentTransactionsListView(),
                      RecentTransactionsListView(),
                      RecentTransactionsListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentTransactionsListView extends StatelessWidget {
  const RecentTransactionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 10),
          child: Text(
            'Recent Transactions',
            style: kHeadingTextStyle,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => ListTile(
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
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 13),
                        Image.asset(
                          index == 1
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
          ),
        ),
      ],
    );
  }
}

class CarouselChangeIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double activeSize;
  final double inactiveSize;
  final double spacing;

  const CarouselChangeIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.activeSize = 24.0,
    this.inactiveSize = 8.0,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          width: index == currentIndex ? activeSize : inactiveSize,
          height: inactiveSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            color: index == currentIndex ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(inactiveSize / 2),
          ),
        ),
      ),
    );
  }
}
