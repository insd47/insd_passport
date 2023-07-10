import "package:flutter/material.dart";
import "package:insd_passport/theme.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "dart:math";

// components
import '../../components/appbar.dart';
import '../../components/button.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final InsdSemanticColors colors =
        Theme.of(context).extension<InsdSemanticColors>()!;

    final texts = InsdTexts();

    final brightness = Theme.of(context).brightness;

    final media = MediaQuery.of(context);
    final height = media.size.height - media.padding.top - media.padding.bottom;

    return Scaffold(
        backgroundColor: colors.boxBackground,
        appBar: InsdAppBar(title: "정보", left: [
          InsdAppBarButton(
              icon: Icon(InsdIcons.arrow1Left, color: colors.textMain),
              onPressed: () {
                Navigator.pop(context);
              }),
        ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.35 - 130.0),
            Column(
              children: [
                Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: brightness == Brightness.dark
                            ? Border.all(color: colors.boxBorder2)
                            : null,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: SvgPicture.asset(
                      "assets/logo.svg",
                    )),
                const SizedBox(height: 20.0),
                Text("Passport", style: texts.title3(colors.textMain)),
                const SizedBox(height: 4.0),
                Text("1.0.0", style: texts.ui2(colors.textPassive1)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "반드시 본인의 카드만 등록하여 사용하세요.\n부적절한 용도로 이 앱을 사용하여 발생하는\n모든 법적 책임은 사용자에게 있습니다.",
                  style: texts.ui2(colors.textPassive1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InsdLinearMediumButton(
                    icon: InsdIcons.link,
                    value: "개발자 홈페이지",
                    onPressed: () {
                      _launchHomepage();
                    },
                  )
                ])
              ],
            ),
            SizedBox(height: max(media.padding.bottom + 30.0, 100.0))
          ],
        ));
  }
}

final Uri _myHomepage = Uri(
    scheme: "https",
    host: "insd.dev",
    path: "/",
    queryParameters: {"utm_source": "PassportApp", "utm_medium": "app"});

Future<void> _launchHomepage() async {
  if (!await launchUrl(_myHomepage, mode: LaunchMode.externalApplication)) {
    throw Exception("사이트를 열 수 없습니다.");
  }
}
