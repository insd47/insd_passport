import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insd_passport/theme.dart';
import 'package:insd_passport/components/button.dart';

class InsdAppBarButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;
  final double width;
  final double height;

  const InsdAppBarButton(
      {super.key,
      required this.icon,
      this.onPressed = defaultOnPressed,
      this.width = 44,
      this.height = 60});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: BoxConstraints.tight(Size(width, height)),
        icon: icon,
        iconSize: 24,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        splashRadius: 24);
  }
}

class InsdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> left;
  final List<Widget> right;

  final bool hasLine;

  const InsdAppBar(
      {super.key,
      this.title = "",
      this.left = const [],
      this.right = const [],
      this.hasLine = false});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    double height = MediaQuery.of(context).padding.top + 60.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
        ),
        child: Container(
            height: height,
            decoration: BoxDecoration(
                border: hasLine
                    ? Border(bottom: BorderSide(color: colors.boxBorder3))
                    : null),
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Container(
                padding: EdgeInsets.only(
                    left: left.isEmpty ? 24.0 : 14.0,
                    right: right.isEmpty ? 24.0 : 14.0),
                alignment: Alignment.centerLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(children: left),
                      SizedBox(width: left.isNotEmpty ? 14.0 : 0.0),
                      Expanded(
                          child: Text(title,
                              style: texts.title3(colors.textMain))),
                      SizedBox(width: right.isNotEmpty ? 14.0 : 0.0),
                      Row(children: right),
                    ]))));
  }
}
