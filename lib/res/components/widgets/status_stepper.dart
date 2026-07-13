import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class StatusStepper extends StatelessWidget {
  final List<StepData> steps;
  final int currentStep;

  const StatusStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        bool isActive = index <= currentStep;
        bool isLast = index == steps.length - 1;

        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isActive ? AppColor.primary : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        steps[index].icon,
                        color: isActive ? Colors.white : Colors.grey.shade500,
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      steps[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? AppColor.textPrimary : AppColor.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      steps[index].time,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 7,
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: 25, // Fixed width for the line between steps
                    height: 2,
                    color: index < currentStep ? AppColor.primary : Colors.grey.shade300,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}

class StepData {
  final String title;
  final String time;
  final IconData icon;

  StepData({
    required this.title,
    required this.time,
    required this.icon,
  });
}
