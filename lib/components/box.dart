import "package:flutter/material.dart";
import "../theme.dart";

class InsdBox extends StatelessWidget {
  final Widget child;

  const InsdBox({super.key, this.child = const Placeholder()});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: colors.boxForeground2,
          border: Border.all(color: colors.boxBorder2, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child);
  }
}
