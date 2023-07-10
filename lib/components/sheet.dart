import 'package:flutter/material.dart';
import 'package:insd_passport/theme.dart';

double defaultHeight(double viewHeight) {
  return 0.0;
}

void showInsdSheet(
    {Widget child = const Placeholder(),
    double Function(double height) height = defaultHeight,
    required BuildContext context}) {
  final colors = Theme.of(context).extension<InsdSemanticColors>()!;

  final media = MediaQuery.of(context);
  final viewHeight = media.size.height - media.padding.top;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.boxForeground1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 24.0,
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 2,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: colors.textPassive3,
                          borderRadius: BorderRadius.circular(1.0)))),
            ),
            height(viewHeight) > 0.0
                ? SizedBox(height: height(viewHeight - 24.0), child: child)
                : child,
          ],
        );
      });
}
