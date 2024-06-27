import 'dart:ffi';
import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
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
  List<TodoObject> todos = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SafeArea(
            child: Column(
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
                Dismissible(
                  key: Key("add"),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todos.add(TodoObject(name: "New task"));
                        });
                      },
                      child: Text("Ajouter une tâche")),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TodoCard extends StatelessWidget {
  final TodoObject todo;

  const TodoCard({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(todo.name),
      trailing: Icon(Icons.keyboard_arrow_down),
    );
  }
}

class TodoObject {
  final String name;
  bool done;

  TodoObject({required this.name}) : done = false;

  void setToDone() {
    this.done = true;
  }
}
