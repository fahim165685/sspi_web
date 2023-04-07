import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget{
  final double blur;
  final double opacity;
  final Widget child;
  final double borderRadius;

  const GlassMorphism({Key? key, required this.blur,
    required this.opacity,
    required this.child,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: blur,sigmaX: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius) ),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.5),
            )
          ),
          child: child,
        ),
      ),
    );
  }
}
