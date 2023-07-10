import 'package:flutter/material.dart';
import 'package:insd_passport/theme.dart';
import "package:open_settings/open_settings.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:math';

// components
import 'package:insd_passport/components/button.dart';
import 'package:insd_passport/components/sheet.dart';

// pages
import 'package:insd_passport/pages/info/main.dart';
import 'package:insd_passport/pages/main/main.dart';

// animations
import 'package:insd_passport/animations/routes.dart';

void showAddCardSheet(BuildContext context) {
  final colors = Theme.of(context).extension<InsdSemanticColors>()!;

  showInsdSheet(
      height: (height) => max(height * 0.5, 360.0),
      context: context,
      child: Column(children: [
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(InsdIcons.duplicate, color: colors.textMain, size: 48.0),
                const SizedBox(height: 20.0),
                Text(
                  "등록할 카드를\n 휴대폰의 뒷면에 대세요.",
                  style: InsdTexts().title3(colors.textMain),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InsdLinearBigButton(
            value: "취소하기",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(
            height: max(20.0 + MediaQuery.of(context).padding.bottom, 40.0)),
      ]));
}

void showMenuSheet(BuildContext context) {
  final colors = Theme.of(context).extension<InsdSemanticColors>()!;
  final height = max(20.0 + MediaQuery.of(context).padding.bottom, 40.0);

  showInsdSheet(
      context: context,
      child: Column(children: [
        FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) => snapshot.data?.get("id") != null
              ? MenuItem(
                  icon: InsdIcons.exit,
                  value: "데이터 지우기",
                  color: colors.secondaryRed,
                  onPressed: () {
                    showDeleteAlertSheet(context);
                  })
              : const SizedBox(),
        ),
        MenuItem(
            icon: InsdIcons.bulb,
            value: "어플리케이션 정보",
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(insdForwardRoute(context, const InfoPage()));
            }),
        SizedBox(
          height: height,
        )
      ]));
}

void defaultPressed() {}

class MenuItem extends StatelessWidget {
  final void Function() onPressed;
  final String value;
  final IconData icon;
  final Color? color;

  const MenuItem(
      {super.key,
      this.onPressed = defaultPressed,
      this.value = "",
      this.icon = InsdIcons.exit,
      this.color});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<InsdSemanticColors>()!;

    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: colors.boxFilled2,
            highlightColor: colors.boxFilled2,
            splashFactory: InkRipple.splashFactory,
            onTap: onPressed,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                height: 52.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon, color: color ?? colors.textMain, size: 20.0),
                      const SizedBox(width: 12.0),
                      Text(value,
                          style: InsdTexts().ui2(color ?? colors.textMain)),
                    ]))));
  }
}

void showNoNFCSheet(BuildContext context) {
  final colors = Theme.of(context).extension<InsdSemanticColors>()!;

  showInsdSheet(
      context: context,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(InsdIcons.tag, color: colors.textMain, size: 36.0),
                const SizedBox(height: 20.0),
                Text(
                  "카드를 등록하려면\nNFC를 기본 모드로 설정해 주세요.",
                  style: InsdTexts().uiBold1(colors.textMain),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InsdFilledBigButton(
            icon: InsdIcons.tag,
            value: "NFC 설정",
            onPressed: () {
              Navigator.of(context).pop();
              OpenSettings.openNFCSetting();
            },
          ),
        ),
        SizedBox(
            height: max(20.0 + MediaQuery.of(context).padding.bottom, 40.0)),
      ]));
}

void showDeleteAlertSheet(BuildContext context) {
  final colors = Theme.of(context).extension<InsdSemanticColors>()!;

  showInsdSheet(
      context: context,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(InsdIcons.warn, color: colors.secondaryRed, size: 36.0),
                const SizedBox(height: 20.0),
                Text(
                  "카드를 삭제하면 복구할 수 없어요.\n정말 삭제하시겠어요?",
                  style: InsdTexts().uiBold1(colors.textMain),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: InsdLinearBigButton(
                    value: "취소",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                    child: FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder: (context, snapshot) => InsdWarnBigButton(
                    value: "삭제",
                    onPressed: () {
                      final prefs = snapshot.data as SharedPreferences;
                      prefs.remove("id");
                      Navigator.pop(context);

                      Future.delayed(const Duration(milliseconds: 160), () {
                        Navigator.of(context).pushAndRemoveUntil(
                            insdClearRoute(context, const MainPage()),
                            (Route<dynamic> route) => false);
                        Fluttertoast.showToast(
                            msg: "카드를 삭제했어요.", fontSize: 14.0);
                      });
                    },
                  ),
                )),
              ],
            )),
        SizedBox(
            height: max(20.0 + MediaQuery.of(context).padding.bottom, 40.0)),
      ]));
}
