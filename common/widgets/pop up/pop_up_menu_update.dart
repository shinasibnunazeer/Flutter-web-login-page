import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/repositories/sub_user_repo.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class APopupMenuWidgetPlan extends StatelessWidget {
  const APopupMenuWidgetPlan({
    super.key,
    required this.icon,
    required this.userUid,
  });
  final IconData icon;
  final String userUid;
  @override
  Widget build(BuildContext context) {
    final controller = ASubUserController.instance;
    final List<Map<String, String>> planChoices = [
      {'label': 'Daily', 'key': 'update'},
      {'label': 'Yearly', 'key': 'update'},
      {'label': 'Monthly', 'key': 'update'},
      {'label': '-Daily', 'key': 'lower'},
      {'label': '-Yearly', 'key': 'lower'},
      {'label': '-Monthly', 'key': 'lower'},
    ];
    return PopupMenuButton<String>(
      icon: Icon(icon), // Set initial value
      onSelected: (String choice) {
        final Map<String, String> selectedChoice =
            planChoices.firstWhere((element) => element['label'] == choice);
        String updatedPlan = selectedChoice['label']!;
        if (updatedPlan.startsWith('-')) {
          updatedPlan = updatedPlan.substring(1); // Remove leading '-'
        }
        controller.updatePlan(
          userUid: userUid,
          updatedPlan: updatedPlan,
          key: selectedChoice['key']!,
        );
      },
      itemBuilder: (BuildContext context) {
        return planChoices.map((choice) {
          return PopupMenuItem<String>(
            value: choice['label'],
            child: Text(choice['label']!),
          );
        }).toList();
      },
    );
  }
}
