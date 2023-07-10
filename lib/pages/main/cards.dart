import "package:flutter/material.dart";
import "package:insd_passport/theme.dart";

// components
import '../../components/box.dart';

class HeaderCard extends StatelessWidget {
  final bool hasCard;
  final bool isActive;

  const HeaderCard({super.key, this.hasCard = false, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    final icon = hasCard
        ? isActive
            ? InsdIcons.arrow1Up
            : InsdIcons.tag
        : InsdIcons.search;

    final infoText = hasCard
        ? isActive
            ? "휴대폰의 뒷면을\n 카드 리더기에 대세요."
            : "앱을 사용하려면\n NFC를 켜 주세요."
        : "카드 정보가\n 등록되지 않았어요.";

    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Icon(icon, color: colors.textMain, size: 48.0),
          const SizedBox(height: 20.0),
          Text(
            infoText,
            style: texts.title3(colors.textMain),
            textAlign: TextAlign.center,
          ),
        ]));
  }
}

class StatusCard extends StatelessWidget {
  final bool hasCard;
  final bool isActive;

  const StatusCard({super.key, this.hasCard = false, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    final String stateText = hasCard
        ? isActive
            ? "활성"
            : "비활성"
        : "등록되지 않음";

    final Color stateColor = hasCard
        ? isActive
            ? colors.secondaryGreen
            : colors.secondaryRed
        : colors.textPassive3;

    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: InsdBox(
            child: Row(
          children: [
            Expanded(child: Text("상태", style: texts.uiBold2(colors.textMain))),
            Row(
              children: [
                Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                        color: stateColor,
                        borderRadius: BorderRadius.circular(5.0))),
                const SizedBox(width: 10.0),
                Text(stateText, style: texts.ui2(colors.textMain)),
              ],
            )
          ],
        )));
  }
}

class InfoCard extends StatelessWidget {
  final String apart;
  final String room;
  final String user;

  const InfoCard(
      {super.key, this.apart = "--", this.room = "--", this.user = "--"});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: InsdBox(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("출입증 정보", style: texts.uiBold2(colors.textMain)),
          const SizedBox(height: 16.0),
          Column(children: [
            Row(
              children: [
                SizedBox(
                    width: 80.0,
                    child: Text("아파트", style: texts.uiBold2(colors.textMain))),
                Expanded(
                    child: Text("GPT 아파트", style: texts.ui2(colors.textMain))),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                SizedBox(
                    width: 80.0,
                    child: Text("동, 호", style: texts.uiBold2(colors.textMain))),
                Expanded(
                    child:
                        Text("101동 101호", style: texts.ui2(colors.textMain))),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                SizedBox(
                    width: 80.0,
                    child: Text("사용자", style: texts.uiBold2(colors.textMain))),
                Expanded(child: Text("홍길동", style: texts.ui2(colors.textMain))),
              ],
            ),
          ])
        ],
      )),
    );
  }
}
