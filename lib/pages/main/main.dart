import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:open_settings/open_settings.dart";
import "package:insd_passport/theme.dart";
import "package:nfc_manager/nfc_manager.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:nfc_emulator/nfc_emulator.dart";
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
  bool _isActive = false;
  bool _hasCard = false;
  String _id = "";

  @override
  void initState() {
    super.initState();
    NfcManager.instance.stopSession();

    _refreshCardState();
  }

  void _refreshCardState() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("id");

    setState(() {
      _hasCard = id != null;
      _id = id ?? "";
    });

    if (id != null) {
      final isAvailable = await NfcManager.instance.isAvailable();

      setState(() {
        _isActive = isAvailable;
      });

      if (isAvailable) {
        NfcEmulator.startNfcEmulator("666B65630001", _id);
      }
    }
  }

  @override
  void dispose() {
    channel.setMethodCallHandler(null);
    NfcEmulator.stopNfcEmulator();

    super.dispose();
  }

  void showNoNFCSheetThis() => showNoNFCSheet(context);

  void moveToAddPage() =>
      Navigator.of(context).push(insdForwardRoute(context, const AddPage()));

  static const channel = MethodChannel('dev.insd.app.passport/nfcStatus');

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
            HeaderCard(hasCard: _hasCard, isActive: _isActive),
            StatusCard(hasCard: _hasCard, isActive: _isActive),
            _hasCard
                ? const InfoCard(apart: "부산 아파트", room: "101호", user: "홍길동")
                : const SizedBox(),
            _hasCard
                ? _isActive
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: InsdLinearBigButton(
                            icon: InsdIcons.reload,
                            value: "새로고침",
                            onPressed: _refreshCardState))
                    : Container(
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
                            showNoNFCSheetThis();
                            return;
                          }

                          moveToAddPage();
                        })),
            SizedBox(
                height:
                    max(20.0 + MediaQuery.of(context).padding.bottom, 40.0)),
          ])),
    );
  }
}
