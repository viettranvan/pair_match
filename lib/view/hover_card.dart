import 'package:flutter/material.dart';
import 'package:pair_match/utils/index.dart';

class HoverCard extends StatefulWidget {
  final String path;
  const HoverCard({super.key, required this.path});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  bool get isDefault {
    return widget.path == AssetsPath.normalMode ||
        widget.path == AssetsPath.specialMode;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05))
            : (Matrix4.identity()..scale(1.0)),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isDefault ? Colors.yellow.withOpacity(0.5) : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: _isHovered
              ? [const BoxShadow(color: Colors.black26, blurRadius: 10)]
              : [],
        ),
        child: Image.asset(widget.path),
      ),
    );
  }
}
