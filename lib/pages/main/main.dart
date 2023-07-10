import "dart:async";

import "package:flutter/material.dart";
import "package:open_settings/open_settings.dart";
import "package:insd_passport/theme.dart";
import "package:nfc_manager/nfc_manager.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'package:receive_intent/receive_intent.dart';
import "dart:math";

// Components
import '../../components/appbar.dart';
import '../../components/button.dart';

// Page Elements
import './cards.dart';
import './sheets.dart';

// Pages
import "package:insd_passport/pages/add/main.dart";

// Animations
import "package:insd_passport/animations/routes.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _state = "none";

  void _changeState(String state) {
    setState(() {
      _state = state;
    });
  }

  @override
  void initState() {
    super.initState();

    startService();
    _startReceiveIntent();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void startService() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("id");

    if (id != null) {
      final isAvailable = await NfcManager.instance.isAvailable();
      _changeState(isAvailable ? "active" : "inactive");
    }
  }

  StreamSubscription? _sub;

  void _startReceiveIntent() async {
    print("started sub");
    _sub = ReceiveIntent.receivedIntentStream.listen((intent) async {
      print("Action Name:");
      print(intent?.action);
      if (intent?.action == "android.nfc.action.ADAPTER_STATE_CHANGED") {
        startService();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    return Scaffold(
      backgroundColor: colors.boxBackground,
      appBar: InsdAppBar(title: "Passport", right: [
        InsdAppBarButton(
          icon: Icon(InsdIcons.more, color: colors.textMain),
          onPressed: () {
            showMenuSheet(context);
          },
        ),
      ]),
      body: Container(
          alignment: Alignment.topCenter,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            HeaderCard(state: _state),
            StatusCard(state: _state),
            _state != "none"
                ? const InfoCard(apart: "부산 아파트", room: "101호", user: "홍길동")
                : const SizedBox(),
            _state == "active"
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InsdLinearBigButton(
                        icon: InsdIcons.reload,
                        value: "새로고침",
                        onPressed: () => startService()))
                : _state == "inactive"
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: InsdFilledBigButton(
                          icon: InsdIcons.tag,
                          value: "NFC 설정",
                          onPressed: () {
                            OpenSettings.openNFCSetting();
                          },
                        ))
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: InsdFilledBigButton(
                            icon: InsdIcons.plus,
                            value: "새 카드 추가",
                            onPressed: () async {
                              bool isAvailable =
                                  await NfcManager.instance.isAvailable();

                              if (isAvailable == false) {
                                // ignore: use_build_context_synchronously
                                showNoNFCSheet(context);
                                return;
                              }

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                  // ignore: use_build_context_synchronously
                                  insdForwardRoute(context, const AddPage()));
                            })),
            SizedBox(
                height:
                    max(20.0 + MediaQuery.of(context).padding.bottom, 40.0)),
          ])),
    );
  }
}
