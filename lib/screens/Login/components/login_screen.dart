import 'package:bitanic/constants.dart';
import 'package:bitanic/screens/Login/components/loginemail_screen.dart';
import 'package:bitanic/screens/Login/components/loginphone_screen.dart';
import 'package:bitanic/screens/signup/components/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kSemiColor,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image.asset('assets/images/png/Paprika.png'),
                  ]),
                  const Spacer(),
                  Container(
                    color: kSemiColor,
                    child: Center(child: Text("Bitanic", style: titleText)),
                  ),
                  const Spacer(),
                  Row(children: [
                    Image.asset('assets/images/png/Chili.png'),
                  ])
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kWhiteAccent,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Column(children: [
                            Container(
                              padding: const EdgeInsets.only(left: 25, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hai,",
                                      textAlign: TextAlign.start,
                                      style: titleText.copyWith(
                                          fontSize: 0.05 * size.width)),
                                  Text(
                                    "Pilih opsi Login untuk melanjutkan.",
                                    textAlign: TextAlign.start,
                                    style: descriptionText.copyWith(
                                        fontSize: 0.035 * size.width),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: size.width * 0.7,
                        height: size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // With Email
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const loginemailPage()),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                          'assets/icons/Envelope.svg'),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Text('Login with Email',
                                          textAlign: TextAlign.center,
                                          style: buttonText),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 12)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: kDarkColor))),
                                )),

                            // With Phone
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const loginphonePage()),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                          'assets/icons/Smartphone.svg'),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Text('Login with Phone',
                                          textAlign: TextAlign.center,
                                          style: buttonText),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 12)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: kDarkColor))),
                                )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(children: [
                              Text("Belum punya akun?", style: descriptionText),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const signupPage()),
                                    );
                                  },
                                  child: Text("Daftar",
                                      style: descriptionText.copyWith(
                                          color: kDarkColor)))
                            ])),
                      ])
                    ])))
          ]),
        ));
  }
}
