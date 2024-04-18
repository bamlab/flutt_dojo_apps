import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/statistics/widgets/time_of_task.dart';

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
      Duration(hours: 1, minutes: 30),
      Duration(hours: 9, minutes: 23),
      Duration(hours: 8, minutes: 12),
      Duration(hours: 2, minutes: 36),
    ];

    print(timeOfTasks[1].inMinutes * 100 ~/ totalTime.inMinutes);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "Total de la semaine",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: CustomScrollView(
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
                child: Row(
              children: [
                Flexible(
                  flex: timeOfTasks[0].inMinutes * 100 ~/ totalTime.inMinutes,
                  child: TimeOfTaskWidget(timeOfTask: timeOfTasks[0]),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: timeOfTasks[0].inMinutes * 100 ~/ totalTime.inMinutes,
                  child: TimeOfTaskWidget(timeOfTask: timeOfTasks[1]),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
