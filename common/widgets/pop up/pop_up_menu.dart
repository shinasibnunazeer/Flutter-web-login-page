import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/repositories/sub_user_repo.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APopupMenuWidgetUser extends StatelessWidget {
  const APopupMenuWidgetUser({
    super.key,
    required this.icon,
    required this.userEmail,
    required this.docId,
  });
  final IconData icon;
  final String userEmail;
  final String docId;
  @override
  Widget build(BuildContext context) {
    final controller = ASubUserController.instance;

    return PopupMenuButton<String>(
      icon: Icon(icon),
      initialValue: 'Raise a Ticket', // Set initial value
      onSelected: (String choice) {
        if (choice == "Raise a Ticket") {
          showDialog(
              context: Get.context!,
              builder: (context) => AlertDialog(
                  title:
                      Title(color: Colors.red, child: const Text("Add Ticket")),
                  // if you want to do anything on confirm button press
                  content: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextField(
                          decoration:
                              InputDecoration(labelText: 'Ticket Title'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          maxLines: 5,
                          decoration:
                              InputDecoration(labelText: 'Ticket Description'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Submit'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )));

          // Handle raising a ticket
        } else if (choice == "Show Payment History") {
          showBottomSheet(
              //bottom margin
              enableDrag: true,
              context: context,
              builder: (context) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          'Payment History $userEmail',
                          style: const TextStyle(
                              color: AColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      FutureBuilder(
                          future: controller.getPaymentHistory(docId: docId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AColors.primaryColor,
                                ),
                              );
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.paymentHistory.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  //border color
                                  shape: const Border(
                                    bottom:
                                        BorderSide(color: AColors.primaryColor),
                                  ),
                                  title: Text(
                                      'order Id ${controller.paymentHistory[index].orderId}'),
                                  subtitle: Text(
                                      'paid at : ${controller.paymentHistory[index].date}'),
                                );
                              },
                            );
                          }),
                    ],
                  ));
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Raise a Ticket',
            child: Text('Raise a Ticket'),
          ),
          const PopupMenuItem<String>(
            value: 'Show Payment History',
            child: Text('Show Payment History'),
          ),
        ];
      },
    );
  }
}
