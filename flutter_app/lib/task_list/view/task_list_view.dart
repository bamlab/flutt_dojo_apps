import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/statistics/widgets/light_card.dart';
import 'package:flutter_dojo_apps/task_list/widgets/task_list_header.dart';
import 'package:flutter_dojo_apps/task_list/widgets/task_list_switcher.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  TodoState todoState = TodoState.todo;
  List<TodoObject> todos = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                const AppGap.xl(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SwipeNoticeBox(),
                ),
                const AppGap.xs(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TodoBox(),
                ),
                const AppGap.xs(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AddTaskButton(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) => Dismissible(
                      key: Key(index.toString()),
                      onDismissed: (_) => setState(() {
                        // todos[index].setToDone();
                        todos.removeAt(index);
                      }),
                      child: TodoCard(
                        todo: todos[index],
                      ),
                    ),
                  ),
                ),
                // Dismissible(
                //   key: const Key('add'),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         todos.add(TodoObject(name: 'New task'));
                //       });
                //     },
                //     child: const Text('Ajouter une tâche'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard({required this.todo, super.key});
  final TodoObject todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(todo.name),
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class TodoObject {
  TodoObject({required this.name}) : done = false;
  final String name;
  bool done;

  void setToDone() {
    done = true;
  }
}

class SwipeNoticeBox extends StatelessWidget {
  const SwipeNoticeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFFFBA9D),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline,
              size: 24,
              color: Color(0xFF660D55),
            ),
            AppGap.xs(),
            Flexible(
              child: Text(
                'Balayer à droite pour compléter la tâche',
                style: TextStyle(color: Color(0xFF660D55), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoBox extends StatelessWidget {
  const TodoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const LightCard(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      hasBorder: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('blablabla')),
            Icon(
              Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF1EDFF),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.titleMedium(
              'Ajouter une tâche',
              color: Color(0xFF241263),
            ),
            AppGap.xs(),
            Icon(
              size: 24,
              Icons.add,
              color: Color(0xFF241263),
            ),
          ],
        ),
      ),
    );
  }
}
