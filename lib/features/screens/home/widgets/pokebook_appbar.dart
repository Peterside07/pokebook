// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final Color circleColor;
  final BuildContext context; 
   Widget? leading;

  CustomAppBar({
    Key? key,
    required this.onTap,
    required this.circleColor,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
       backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SvgPicture.asset(
            Theme.of(context).brightness == Brightness.light
                ? "assets/images/landinglogo.svg"
                : "assets/images/logo_blue.svg",
            width: 114,
            height: 74,
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            Theme.of(context).brightness == Brightness.light
                ? 'assets/images/poke_book.svg'
                : 'assets/images/pokebook_blue.svg',
            width: 50,
            height: 16,
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
          ),
        ),
      ],
    );
  }
  
 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
