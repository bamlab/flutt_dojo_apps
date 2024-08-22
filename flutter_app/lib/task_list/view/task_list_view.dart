import 'dart:ui';

import 'package:flutter/material.dart';
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
  final listKey = GlobalKey<AnimatedListState>();
  List<TodoObject> todos = [
    TodoObject(name: 'Task 1'),
  ];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sizes = theme.sizes;

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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizes.s),
                    child: AnimatedList(
                      key: listKey,
                      controller: _scrollController,
                      initialItemCount: todos.length,
                      itemBuilder: (context, index, animation) => Padding(
                        padding: EdgeInsets.only(bottom: sizes.xs),
                        child: SlideTransition(
                          position: CurvedAnimation(
                            curve: Curves.easeOut,
                            parent: animation,
                          ).drive(
                            Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: Offset.zero,
                            ),
                          ),
                          child: Dismissible(
                            key: ValueKey(todos[index]),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (_) {
                              setState(() {
                                todos.removeAt(index);
                                listKey.currentState?.removeItem(
                                  index,
                                  (context, animation) => const SizedBox(),
                                );
                              });
                            },
                            child: TodoBox(
                              name: todos[index].name,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const AppGap.xs(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AddTaskButton(
                    onPressed: () {
                      setState(() {
                        todos.add(TodoObject(name: 'New Task'));
                        listKey.currentState?.insertItem(
                          todos.length - 1,
                        );
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: kThemeAnimationDuration,
                            curve: Curves.easeOut,
                          );
                        });
                      });
                    },
                  ),
                ),
                const AppGap.xs(),
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
  const TodoBox({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return LightCard(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      hasBorder: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(name)),
            const Icon(
              Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    return ClipRRect(
      borderRadius: radius,
      child: Material(
        color: const Color(0xFFF1EDFF),
        child: InkWell(
          onTap: onPressed,
          borderRadius: radius,
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
        ),
      ),
    );
  }
}
