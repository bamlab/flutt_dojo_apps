import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/home/utils/show_project_selection_bottom_sheet.dart';
import 'package:flutter_dojo_apps/home/view/widgets/display_selected_project.dart';
import 'package:flutter_dojo_apps/home/view/widgets/select_project_button.dart';

const _projectList =
    IListConst(['TF1+', 'Decathlon', 'Leroy Merlin', 'Carrefour']);

class HomeView extends StatefulWidget {
  const HomeView({
    required this.title,
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Duration _timer = Duration.zero;

  String selectedProject = '';

  void onSelectedProject(String project) {
    setState(() {
      selectedProject = project;
    });
  }

  void onUnselectProject() {
    setState(() {
      selectedProject = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (selectedProject.isNotEmpty)
                DisplaySelectedProject(
                  project: selectedProject,
                  onUnselectProject: onUnselectProject,
                )
              else
                SelectProjectButton(
                  onTap: () => showProjectSelectionBottomSheet(
                    context: context,
                    projectList: _projectList,
                    onSelectedProject: onSelectedProject,
                  ),
                ),
              Text(
                _timer.asPrettyString,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontFamily: 'ZillaSlab',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(36.5),
                  backgroundColor: const Color(0xFF241263),
                ),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 48, bottom: 16),
                    child: AppText.titleLarge(
                      'Mes dernières tâches',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  DayView(
                    duration: Duration(minutes: 45, seconds: 30),
                    title: 'TF1+',
                    icon: Icons.check_circle,
                    date: 'Lundi 20/03',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DayView(
                    duration: Duration(hours: 1, minutes: 32, seconds: 15),
                    title: 'Decathlon',
                    icon: Icons.check_circle,
                    date: 'Lundi 18/03',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DayView extends StatelessWidget {
  const DayView({
    required this.duration,
    required this.title,
    required this.icon,
    required this.date,
    super.key,
  });

  final Duration duration;
  final String title;
  final IconData icon;
  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText.bodyMedium(
          date,
          color: theme.colors.primary,
        ),
        const SizedBox(
          height: 8,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0x33FFFFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(
                  width: 16,
                ),
                AppText.bodyMedium(
                  title,
                  color: theme.colors.primary,
                  fontWeight: FontWeight.w800,
                  // style: TextStyle(
                  //   color: theme.primaryColor,
                  //   fontSize: 16,
                  //   fontFamily: "Roboto",
                  //   fontWeight: FontWeight.w800,
                  // ),
                ),
                const Spacer(),
                AppText.titleMedium(
                  duration.asPrettyString,
                  color: theme.colors.primary,
                  // style: TextStyle(
                  //   color: theme.primaryColor,
                  //   fontSize: 20,
                  //   fontFamily: "Roboto",
                  //   fontWeight: FontWeight.w600,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

extension on Duration {
  String get asPrettyString => '${inHours.toString().padLeft(2, '0')}:'
      '${inMinutes.remainder(60).toString().padLeft(2, '0')}:'
      '${inSeconds.remainder(60).toString().padLeft(2, '0')}';
}
