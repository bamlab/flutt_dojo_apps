import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/home/view/home_view.dart';
import 'package:flutter_dojo_apps/statistics/view/statistics_view.dart';
import 'package:flutter_dojo_apps/task_list/view/task_list_view.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

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
    final theme = Theme.of(context);
    final page = switch (_selectedIndex) {
      // TODO: Handle this case.
      0 => const HomeView(title: 'test'),
      1 => const StatisticsView(),
      2 => const TaskListView(),
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
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: ResponsiveNavigationBar(
            backgroundColor: Colors.white,
            animationDuration: const Duration(milliseconds: 200),
            // activeButtonFlexFactor: 60,
            inactiveButtonsFlexFactor: 100,
            padding: const EdgeInsets.all(0),
            selectedIndex: _selectedIndex,
            onTabChange: changeTab,
            // showActiveButtonText: false,
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),

            navigationBarButtons: <NavigationBarButton>[
              NavigationBarButton(
                text: 'Accueil',
                icon: Icons.home_outlined,
                backgroundColor: theme.colors.primary,
              ),
              NavigationBarButton(
                text: 'Analyse',
                icon: Icons.bar_chart_outlined,
                backgroundColor: theme.colors.primary,
              ),
              NavigationBarButton(
                text: 'Taches',
                icon: Icons.fact_check_outlined,
                backgroundColor: theme.colors.primary,
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
      ],
    );
  }
}
