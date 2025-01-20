import 'package:flutter/material.dart';

class LayoutHomeScreen extends StatelessWidget {
  const LayoutHomeScreen({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: LayoutBuilder(
    //     builder: (context, constraints) {
    //       double maxWidth = constraints.maxWidth;
    //       double componentWidth = maxWidth > 600 ? 600 : maxWidth * 0.9;

    //       return Container(
    //         width: componentWidth,
    //         padding: EdgeInsets.all(16),
    //         child: child,
    //       );
    //     },
    //   ),
    // );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
          minHeight: MediaQuery.sizeOf(context).height ,
        ),
        child: child,
      ),
    );
  }
}
