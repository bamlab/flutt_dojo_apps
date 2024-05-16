import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/task_list/widgets/company_logo.dart';

class TimeOfTaskWidget extends StatelessWidget {
  const TimeOfTaskWidget({super.key, required this.timeOfTask});

  final Duration timeOfTask;

  String get durationString {
    final hours = timeOfTask.inHours;
    final minutes = timeOfTask.inMinutes.remainder(60);
    return "$hours h $minutes";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CompanyLogo(imageProvider: AssetImage('assets/logo.png')),
            AppText.titleSmall(
              durationString,
              color: theme.colors.primary,
              // style: const TextStyle(
              //   fontSize: 10,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
