import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/task_list/widgets/task_list_header.dart';
import 'package:flutter_dojo_apps/task_list/widgets/task_list_switcher.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  TodoState todoState = TodoState.todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF623CEA),
              image: DecorationImage(
                image: AssetImage('assets/Background.png'),
              ),
            ),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: SafeArea(
                child: Column(
                  children: [
                    const TaskListHeader(
                      projects: [
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                        AssetImage('assets/logo.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TaskListSwitcher(
                        selectedState: todoState,
                        onSelectedState: (selectedState) {
                          setState(() {
                            todoState = selectedState.first;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
