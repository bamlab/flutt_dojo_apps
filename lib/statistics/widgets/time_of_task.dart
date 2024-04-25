import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 7, 7, 7),
                shape: BoxShape.circle,
              ),
            ),
            Text(
              durationString,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
