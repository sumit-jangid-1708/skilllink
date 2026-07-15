import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        final bool isActive = index <= currentStep;
        final bool isLast = index == steps.length - 1;

        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isActive ? colorScheme.primary : colorScheme.surfaceVariant,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        steps[index].icon,
                        color: isActive ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      steps[index].title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (steps[index].time != "-") ...[
                      const SizedBox(height: 4),
                      Text(
                        steps[index].time,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    width: 20,
                    height: 2,
                    color: index < currentStep ? colorScheme.primary : colorScheme.outlineVariant,
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
