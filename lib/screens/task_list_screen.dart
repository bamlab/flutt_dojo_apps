import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/widgets/task_list_header.dart';
import 'package:flutter_dojo_apps/widgets/task_list_switcher.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
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
                image: AssetImage('assets/logo.png'),
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
                    TaskListSwitcher(
                      selectedState: todoState,
                      onSelectedState: (selectedState) {
                        setState(() {
                          todoState = selectedState.first;
                        });
                      },
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
