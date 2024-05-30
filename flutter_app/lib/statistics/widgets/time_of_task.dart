import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/statistics/widgets/light_card.dart';
import 'package:flutter_dojo_apps/task_list/widgets/company_logo.dart';

class TimeOfTaskWidget extends StatelessWidget {
  const TimeOfTaskWidget({
    required this.timeOfTask,
    super.key,
  });

  final Duration timeOfTask;

  String get durationString {
    final hours = timeOfTask.inHours;
    final minutes = timeOfTask.inMinutes.remainder(60);
    return '$hours h $minutes';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LightCard(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CompanyLogo(imageProvider: AssetImage('assets/logo.png')),
            AppText.titleSmall(
              durationString,
              color: theme.colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
