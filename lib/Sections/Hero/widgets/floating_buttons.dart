// import 'package:flutter/material.dart';
// import 'package:mnwr_portfolio/constants.dart';

// class FloatingButtons extends StatelessWidget {
//   const FloatingButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: isMobile(context) ? 20 : 40,
//       right: isMobile(context) ? 20 : 40,
//       child: Column(
//         children: [
//           _buildFloatingButton(Icons.light_mode, 'Toggle Theme'),
//           const SizedBox(height: 15),
//           _buildFloatingButton(Icons.code, 'GitHub'),
//           const SizedBox(height: 15),
//           _buildFloatingButton(Icons.business_center, 'LinkedIn'),
//           const SizedBox(height: 15),
//           _buildFloatingButton(Icons.email, 'Email'),
//         ],
//       ),
//     );
//   }

//   Widget _buildFloatingButton(IconData icon, String tooltip) {
//     return Tooltip(
//       message: tooltip,
//       child: Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.white.withOpacity(0.2)),
//         ),
//         child: IconButton(
//           icon: Icon(
//             icon,
//             color: Colors.white.withOpacity(0.8),
//             size: 24,
//           ),
//           onPressed: () {
//             // Add functionality here
//           },
//         ),
//       ),
//     );
//   }
// }
