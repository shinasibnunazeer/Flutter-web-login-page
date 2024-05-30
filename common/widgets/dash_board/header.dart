import 'package:admin_panel/common/widgets/buttons/auth/log_out_button.dart';
import 'package:admin_panel/common/widgets/text_filed/search/search.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    this.isShowSearch = true,
    super.key,
  });
  final bool isShowSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //serch bar
        isShowSearch ? const Search() : Container(),
        const Spacer(),
        const ALogoutButton()
      ],
    );
  }
}
