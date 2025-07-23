import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/Sections/app%20bar/widget/actions.dart';
import 'package:mnwr_portfolio/Sections/app%20bar/widget/title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onNavigate;

  CustomAppBar({super.key, this.onNavigate});

  List<Map<String, dynamic>> get _menuItems => [
        {'title': 'Home', 'function': () => onNavigate?.call('Home')},
        {'title': 'About', 'function': () => onNavigate?.call('About')},
        {'title': 'Skills', 'function': () => onNavigate?.call('Skills')},
        {'title': 'Projects', 'function': () => onNavigate?.call('Projects')},
        {'title': 'Contact', 'function': () => onNavigate?.call('Contact')},
      ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;

    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.95),
      elevation: 2,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GradientTitle(
            text: 'DevPortfolio',
            fontSize: 22.0,
          ),
          if (isDesktop) ...[
            SizedBox(width: (screenWidth - 900) / 2),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _menuItems
                    .map((item) => AppBarActions(
                          function: item['function'],
                          title: item['title'],
                        ))
                    .toList(),
              ),
            ),
          ] else ...[
            const Spacer(),
            _buildDropdownMenu(),
          ],
        ],
      ),
    );
  }

  Widget _buildDropdownMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
      color: Colors.black45,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onSelected: (String value) {
        final selectedItem = _menuItems.firstWhere(
          (item) => item['title'] == value,
        );
        selectedItem['function']?.call();
      },
      itemBuilder: (BuildContext context) {
        return _menuItems.map((item) {
          return PopupMenuItem<String>(
            value: item['title'],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
