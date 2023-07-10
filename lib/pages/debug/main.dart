import "dart:typed_data";

import "package:flutter/material.dart";
import "package:insd_passport/theme.dart";
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// components
import '../../components/appbar.dart';
import '../../components/box.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  String _uid = "아직 인식하지 않았습니다.";

  @override
  void initState() {
    super.initState();

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      setState(() {
        final Uint8List uid = tag.data["nfca"]["identifier"];

        _uid = uid.map((e) => e.toRadixString(16)).join("");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    return WillPopScope(
        onWillPop: () async {
          NfcManager.instance.stopSession();
          return true;
        },
        child: Scaffold(
            backgroundColor: colors.boxBackground,
            appBar: InsdAppBar(title: "디버그 메뉴", left: [
              InsdAppBarButton(
                  icon: Icon(InsdIcons.arrow1Left, color: colors.textMain),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ]),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  FutureBuilder(
                      future: SharedPreferences.getInstance(),
                      builder: (context, snapshot) => InsdBox(
                              child: Row(
                            children: [
                              Text("등록된 UID",
                                  style: texts.uiBold2(colors.textMain)),
                              const Spacer(),
                              Text(snapshot.data?.getString("id") ?? "",
                                  style: texts.ui2(colors.textMain)),
                            ],
                          ))),
                  const SizedBox(height: 20.0),
                  InsdBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        Text("인식된 카드의 정보",
                            style: texts.uiBold2(colors.textMain)),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Text("카드의 UID",
                                style: texts.uiBold2(colors.textMain)),
                            const Spacer(),
                            Text(_uid, style: texts.ui2(colors.textMain)),
                          ],
                        )
                      ]))
                ])));
  }
}
