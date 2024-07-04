import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/statistics/widgets/light_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: screenWidth,
            child: const LightCard(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text('test'),
                      SizedBox(
                        height: 200,
                        child: ColoredBox(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Center(child: Text('data')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
