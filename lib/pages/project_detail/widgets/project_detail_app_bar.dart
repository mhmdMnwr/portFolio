import 'package:flutter/material.dart';

class ProjectDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const ProjectDetailAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.95),
      elevation: 2,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
