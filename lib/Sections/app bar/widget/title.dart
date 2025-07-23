import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class GradientTitle extends StatefulWidget {
  final String text;
  final double fontSize;

  const GradientTitle({
    Key? key,
    required this.text,
    this.fontSize = 24.0,
  }) : super(key: key);

  @override
  State<GradientTitle> createState() => _GradientTitleState();
}

class _GradientTitleState extends State<GradientTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isMobile(context)) const SizedBox(width: 20),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.blue.shade700,
                  Colors.teal,
                  Colors.green.shade600,
                  Colors.purple.shade700,
                ],
                stops: [
                  (_animation.value - 0.3).clamp(0.0, 1.0),
                  (_animation.value - 0.1).clamp(0.0, 1.0),
                  _animation.value.clamp(0.0, 1.0),
                  (_animation.value + 0.1).clamp(0.0, 1.0),
                  (_animation.value + 0.3).clamp(0.0, 1.0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
