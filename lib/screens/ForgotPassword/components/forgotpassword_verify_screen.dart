import 'package:bitanic/screens/ForgotPassword/components/forgotpassword_new.dart';
import 'package:bitanic/screens/signup/components/signupsuccess_screen.dart';
import 'package:flutter/material.dart';
import 'package:bitanic/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class forgotpasswordVerifyPage extends StatefulWidget {
  const forgotpasswordVerifyPage({ Key? key }) : super(key: key);

  @override
  _forgotpasswordVerifyPageState createState() => _forgotpasswordVerifyPageState();
}

class _forgotpasswordVerifyPageState extends State<forgotpasswordVerifyPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kSemiColor,
        body: SafeArea(
          child: Stack(children: <Widget>[
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/icons/Back Arrow.svg'),
                      ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: size.height * 0.89,
                  child: Container(
                      height: size.height * 1.5,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kWhiteAccent,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: ListView(
                        children: [
                          Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  width: size.width,
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Cek Kotak Masuk,",
                                          textAlign: TextAlign.start,
                                          style: titleText.copyWith(
                                              fontSize: 0.05 * size.width)),
                                      Text(
                                        "Masukan kode OTP yang sudah kami kirimkan.",
                                        textAlign: TextAlign.start,
                                        style: descriptionText.copyWith(
                                            fontSize: 0.035 * size.width),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Form(
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.2,
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            _textFieldOTP(
                                                first: true, last: false),
                                            _textFieldOTP(
                                                first: false, last: false),
                                            _textFieldOTP(
                                                first: false, last: false),
                                            _textFieldOTP(
                                                first: false, last: true),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 20),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(kSemiColor),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(kWhiteAccent),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 120,
                                                            vertical: 0)),
                                              ),
                                              child: Text('Verifikasi',
                                                  style: buttonText.copyWith(
                                                      color: kWhiteAccent)),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const forgotPasswordNewPage()),
                                                );
                                              },
                                            )))
                                  ],
                                ),
                              ),
                            ),
                            Column(children: [
                              Container(
                                  margin:
                                      const EdgeInsets.only(bottom: 0, top: 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Tidak menerima kode?",
                                            style: descriptionText),
                                        TextButton(
                                            onPressed: () {
                                              const sb = SnackBar(
                                                  content: Text(
                                                      'Kode sudah terkirim!'));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(sb);
                                            },
                                            child: Text("Kirim ulang",
                                                style: descriptionText.copyWith(
                                                    color: kDarkColor)))
                                      ])),
                            ])
                          ]),
                        ],
                      ))),
            ),
          ]),
        ));
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 90,
      width: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: buttonText.copyWith(fontSize: 20),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kLightColor),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kDarkColor),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
