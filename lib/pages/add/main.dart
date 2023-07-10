import "dart:typed_data";

import "package:flutter/material.dart";
import "package:insd_passport/theme.dart";
import "package:nfc_manager/nfc_manager.dart";
import "package:shared_preferences/shared_preferences.dart";
import "dart:math";

// components
import '../../components/appbar.dart';
import '../../components/button.dart';

// pages
import "package:insd_passport/pages/main/main.dart";

// animations
import "package:insd_passport/animations/routes.dart";

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    final media = MediaQuery.of(context);
    final height = media.size.height - media.padding.top - media.padding.bottom;

    final bottomPadding = max(media.padding.bottom + 20.0, 40.0);

    void onComplete() {
      Navigator.pushAndRemoveUntil(context,
          insdBackwardClearRoute(context, const MainPage()), (route) => false);
    }

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final prefs = await SharedPreferences.getInstance();
      final Uint8List uid = tag.data["nfca"]["identifier"];

      await prefs.setString("id", uid.map((e) => e.toRadixString(16)).join(""));

      onComplete();
    });

    return WillPopScope(
        onWillPop: () async {
          NfcManager.instance.stopSession();
          return true;
        },
        child: Scaffold(
            backgroundColor: colors.boxBackground,
            appBar: InsdAppBar(title: "새 카드 추가", left: [
              InsdAppBarButton(
                  icon: Icon(InsdIcons.arrow1Left, color: colors.textMain),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ]),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: (height - bottomPadding) * 0.18),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(InsdIcons.duplicate,
                            size: 48.0, color: colors.textMain),
                        const SizedBox(height: 40.0),
                        Text("인식 대기 중",
                            style: texts.title2(colors.textMain),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 10.0),
                        Text("등록할 카드를 휴대폰 뒤에 대고\n잠시 기다려주세요.",
                            style: texts.ui2(colors.textPassive1),
                            textAlign: TextAlign.center),
                      ]),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InsdLinearBigButton(
                          value: "취소",
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                  SizedBox(height: bottomPadding)
                ])));
  }
}
