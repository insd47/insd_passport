import 'package:flutter/material.dart';
import "../theme.dart";

void defaultOnPressed() {}

class InsdLinearBigButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdLinearBigButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      borderColor: colors.boxBorder1,
      backgroundColor: colors.boxForeground3,
      textColor: colors.textMain,
      splashColor: colors.boxFilled2,
      highlightColor: colors.boxFilled2,
      height: 50.0,
      padding: 27.0,
    );
  }
}

class InsdLinearMediumButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdLinearMediumButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      borderColor: colors.boxBorder1,
      backgroundColor: colors.boxForeground3,
      textColor: colors.textMain,
      splashColor: colors.boxFilled2,
      highlightColor: colors.boxFilled2,
      height: 42.0,
      padding: 18.0,
    );
  }
}

class InsdLinearSmallButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdLinearSmallButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      borderColor: colors.boxBorder1,
      backgroundColor: colors.boxForeground3,
      textColor: colors.textMain,
      splashColor: colors.boxFilled2,
      highlightColor: colors.boxFilled2,
      height: 34.0,
      padding: 12.0,
    );
  }
}

class InsdFilledBigButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdFilledBigButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final InsdAbsoluteColors absolute =
        Theme.of(context).extension<InsdAbsoluteColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      noBorder: true,
      backgroundColor: colors.textMain,
      textColor: colors.boxBackground,
      splashColor: absolute.alphaInverse(10),
      highlightColor: absolute.alphaInverse(30),
      height: 50.0,
      padding: 27.0,
    );
  }
}

class InsdFilledMediumButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdFilledMediumButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final InsdAbsoluteColors absolute =
        Theme.of(context).extension<InsdAbsoluteColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      noBorder: true,
      backgroundColor: colors.textMain,
      textColor: colors.boxBackground,
      splashColor: absolute.alphaInverse(10),
      highlightColor: absolute.alphaInverse(30),
      height: 42.0,
      padding: 18.0,
    );
  }
}

class InsdFilledSmallButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdFilledSmallButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final InsdAbsoluteColors absolute =
        Theme.of(context).extension<InsdAbsoluteColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      noBorder: true,
      backgroundColor: colors.textMain,
      textColor: colors.boxBackground,
      splashColor: absolute.alphaInverse(10),
      highlightColor: absolute.alphaInverse(30),
      height: 34.0,
      padding: 12.0,
    );
  }
}

class InsdWarnBigButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdWarnBigButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      noBorder: true,
      backgroundColor: colors.secondaryRed,
      textColor: Colors.white,
      splashColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.3),
      height: 50.0,
      padding: 27.0,
    );
  }
}

class InsdWarnMediumButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdWarnMediumButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      noBorder: true,
      backgroundColor: colors.secondaryRed,
      textColor: Colors.white,
      splashColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.3),
      height: 42.0,
      padding: 18.0,
    );
  }
}

class InsdWarnSmallButton extends StatelessWidget {
  final void Function() onPressed;

  final String value;
  final IconData? icon;

  const InsdWarnSmallButton(
      {super.key,
      this.onPressed = defaultOnPressed,
      this.value = "",
      this.icon});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return _InsdButton(
      onPressed: onPressed,
      value: value,
      icon: icon,
      noBorder: true,
      backgroundColor: colors.secondaryRed,
      textColor: Colors.white,
      splashColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.3),
      height: 34.0,
      padding: 12.0,
    );
  }
}

class _InsdButton extends StatefulWidget {
  final void Function() onPressed;
  final String value;
  final IconData? icon;

  // styles
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color splashColor;
  final Color highlightColor;
  final double height;
  final double padding;
  final bool noBorder;

  const _InsdButton({
    super.key,
    this.onPressed = defaultOnPressed,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    this.splashColor = const Color.fromARGB(48, 127, 127, 127),
    this.highlightColor = const Color.fromARGB(48, 127, 127, 127),
    this.height = 50.0,
    this.padding = 20.0,
    this.noBorder = false,
    this.value = "",
    this.icon,
  });

  @override
  State<_InsdButton> createState() => __InsdButtonState();
}

class __InsdButtonState extends State<_InsdButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      value: 1.0,
      lowerBound: 0.97,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 70),
    );
  }

  @override
  Widget build(BuildContext context) {
    final texts = InsdTexts();

    final value = widget.value;
    final icon = widget.icon;
    final onPressed = widget.onPressed;
    final borderColor = widget.borderColor;
    final backgroundColor = widget.backgroundColor;
    final textColor = widget.textColor;
    final splashColor = widget.splashColor;
    final highlightColor = widget.highlightColor;
    final height = widget.height;
    final padding = widget.padding;
    final noBorder = widget.noBorder;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? _) {
          return Transform.scale(
              scale: _animationController.value,
              child: Container(
                  height: height,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: noBorder
                          ? null
                          : Border.all(color: borderColor, width: 1.0)),
                  child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                      child: InkWell(
                          onTapDown: (details) =>
                              _animationController.reverse(),
                          onTapCancel: () => _animationController.forward(),
                          onTap: () {
                            _animationController.forward();
                            onPressed();
                          },
                          splashFactory: InkRipple.splashFactory,
                          splashColor: splashColor,
                          highlightColor: highlightColor,
                          borderRadius: BorderRadius.circular(9.0),
                          child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    icon != null
                                        ? Container(
                                            margin: const EdgeInsets.only(
                                                right: 6.0),
                                            child: Icon(icon,
                                                color: textColor, size: 18.0))
                                        : const SizedBox(),
                                    Text(value, style: texts.ui2(textColor)),
                                  ]))))));
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
