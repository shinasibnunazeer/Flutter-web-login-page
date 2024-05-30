import 'package:admin_panel/common/styles/container/circular_container.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:flutter/material.dart';

class APrimaryColouredConatiner extends StatelessWidget {
  const APrimaryColouredConatiner({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding 0
      padding: const EdgeInsets.only(bottom: 0),

      color: AColors.primaryColor,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -250,
            child: ACircularContainer(
              backgroundColor: AColors.continerWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            right: -300,
            child: ACircularContainer(
              backgroundColor: AColors.continerWhite.withOpacity(0.1),
            ),
          ),
          child
        ],
      ),
    );
  }
}
