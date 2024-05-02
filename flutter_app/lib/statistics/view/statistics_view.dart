import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/statistics/widgets/time_of_task.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    const totalTime = Duration(hours: 40, minutes: 56);

    const timeOfTasks = [
      Duration(hours: 17, minutes: 47),
      Duration(hours: 9, minutes: 23),
      Duration(hours: 8, minutes: 12),
      Duration(hours: 2, minutes: 36),
      Duration(hours: 1, minutes: 30),
    ];

    print(timeOfTasks[1].inMinutes * 100 ~/ totalTime.inMinutes);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
            child: Center(
                child: Text(
          "40h56",
          style: TextStyle(fontSize: 70, color: Colors.white),
        ))),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 800),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                primary: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                scrollDirection: Axis.vertical,
                itemCount: timeOfTasks.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height *
                          timeOfTasks[index].inMinutes /
                          totalTime.inMinutes,
                      child: TimeOfTaskWidget(timeOfTask: timeOfTasks[index]));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
