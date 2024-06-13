import 'package:flutter/material.dart';

class ProjectRadioButton extends StatelessWidget {
  const ProjectRadioButton({
    required this.project,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String project;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);

    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: const Color(0xFFD3C7FF),
              width: 2,
            ),
            color: isSelected ? const Color(0xFFD3C7FF) : Colors.transparent,
          ),
          child: Row(
            children: [
              Text(project, style: const TextStyle(color: Color(0xFF241263))),
              const Spacer(),
              AnimatedContainer(
                duration: kThemeAnimationDuration,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF241263)
                        : const Color(0xFFD3C7FF),
                    width: 2,
                  ),
                ),
                child: AnimatedContainer(
                  duration: kThemeAnimationDuration,
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? const Color(0xFF241263)
                        : Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
