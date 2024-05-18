import 'package:flutter/material.dart';

class ProjectRadioButton extends StatelessWidget {
  const ProjectRadioButton(
      {super.key,
      required this.project,
      required this.isSelected,
      required this.onTap});

  final String project;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
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
                Container(
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
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? const Color(0xFF241263)
                          : Colors.transparent,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
