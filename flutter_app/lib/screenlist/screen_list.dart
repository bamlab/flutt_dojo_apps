import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dojo_apps/home/view/home_view.dart';
import 'package:flutter_dojo_apps/screenlist/widgets/bottom_navigation_bar.dart';
import 'package:flutter_dojo_apps/statistics/view/statistics_view.dart';
import 'package:flutter_dojo_apps/task_list/view/task_list_view.dart';

class ScreenList extends StatefulWidget {
  const ScreenList({super.key});

  @override
  State<ScreenList> createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> {
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final page = switch (_selectedIndex) {
      // TODO: Handle this case.
      0 => const HomeView(title: 'test'),
      1 => const StatisticsView(),
      2 => const TaskListView(),
      3 => const SizedBox.shrink(),
      _ => throw UnimplementedError(),
    };

    return Stack(
      children: [
        ColoredBox(
          color: const Color(0xFF623CEA),
          child: Image.asset(
            "assets/Background.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            bottomNavigationBar: CustomNavigationBar(
              onTap: changeTab,
              currentIndex: _selectedIndex,
              navigationTabs: const <CustomNavigationBarButton>[
                (
                  label: 'Accueil',
                  icon: Icons.home_outlined,
                ),
                (
                  label: 'Analyse',
                  icon: Icons.bar_chart_outlined,
                ),
                (
                  label: 'Taches',
                  icon: Icons.fact_check_outlined,
                ),
                (
                  label: 'Profile',
                  icon: Icons.person,
                ),
              ],
            ),
            body: Stack(
              children: [
                Image.asset(
                  "assets/Background.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                SafeArea(child: page),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
