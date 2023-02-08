import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LandinaShimmer extends StatelessWidget {
  double? width, height;
  Widget child;

  LandinaShimmer({super.key, this.width, this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: child,
      ),
    );
  }
}
