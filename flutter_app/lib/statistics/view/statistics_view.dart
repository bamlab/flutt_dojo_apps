import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/statistics/widgets/time_graph.dart';
import 'package:flutter_dojo_apps/statistics/widgets/time_of_task.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    // const totalTime = Duration(hours: 40, minutes: 56);
    final theme = Theme.of(context);

    const timeOfTasks = [
      Duration(hours: 17, minutes: 47),
      Duration(hours: 9, minutes: 23),
      Duration(hours: 8, minutes: 12),
      Duration(hours: 2, minutes: 36),
      Duration(hours: 1, minutes: 30),
    ];

    // print(timeOfTasks[1].inMinutes * 100 ~/ totalTime.inMinutes);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const AppText.titleLarge('Total de la semaine'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Center(
              child: Text(
                '40h56',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontFamily: 'ZillaSlab',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
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
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 2,
                      child: TimeOfTaskWidget(timeOfTask: timeOfTasks[0]),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 2,
                      child: TimeOfTaskWidget(timeOfTask: timeOfTasks[1]),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: TimeOfTaskWidget(timeOfTask: timeOfTasks[2]),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: TimeOfTaskWidget(timeOfTask: timeOfTasks[3]),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: TimeOfTaskWidget(timeOfTask: timeOfTasks[4]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const AppGap.xxxl(
            isSliver: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: theme.sizes.xl),
            sliver: const SliverToBoxAdapter(
              child: AppText.titleLarge('Temps de la semaine'),
            ),
          ),
          const AppGap.m(isSliver: true),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: theme.sizes.xl),
            sliver: const SliverToBoxAdapter(
              child: TimeGraph(
                timeOfTasks: timeOfTasks,
              ),
            ),
          ),
          const AppGap.m(isSliver: true),
        ],
      ),
    );
  }
}
