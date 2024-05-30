import 'package:admin_panel/common/styles/container/primary_colored_continer.dart';
import 'package:admin_panel/test.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: APrimaryColouredConatiner(
            child: Center(
      child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AColors.light,
            borderRadius: BorderRadius.circular(10),
          ),
          //text form field
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //admin icon
              const Icon(
                IconsaxBold.security_user,
                size: 100,
                color: AColors.primaryColor,
              ),

              TextFormField(
                cursorColor: AColors.primaryColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(IconsaxBold.user),
                  hintText: 'Enter your Admin email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                //suffic icon
                obscureText: true,

                cursorColor: AColors.primaryColor,
                decoration: const InputDecoration(
                  //suffix icon
                  prefixIcon: Icon(IconsaxBold.security),
                  hintText: 'Enter your Admin Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    LocalDatabase.saveData('admin', 'admin');
                  },
                  child: const Text('Login'),
                ),
              )
            ],
          )),
    )));
  }
}
