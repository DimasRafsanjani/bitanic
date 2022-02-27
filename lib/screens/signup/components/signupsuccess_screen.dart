import 'package:bitanic/screens/Seller/Bottom%20Navigator/components/bottom_navigator.dart';
import 'package:bitanic/screens/Seller/Dashboard/components/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bitanic/constants.dart';

class signupsuccessPage extends StatefulWidget {
  const signupsuccessPage({Key? key}) : super(key: key);

  @override
  _signupsuccessPageState createState() => _signupsuccessPageState();
}

class _signupsuccessPageState extends State<signupsuccessPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kSemiColor,
        body: SafeArea(
          child: Stack(children: <Widget>[
            Column(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.89,
                child: Flexible(
                  flex: 1,
                  child: Container(
                      height: size.height * 1,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kWhiteAccent,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.height * 0.18,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset('assets/icons/Verify.svg'),
                                    Column(
                                      children: [
                                        
                                        Text("Sign Up Berhasil,",
                                            textAlign: TextAlign.start,
                                            style: titleText.copyWith(
                                                fontSize: 0.05 * size.width)),
                                        Text(
                                          "Mari hidup sehat!",
                                          textAlign: TextAlign.start,
                                          style: descriptionText.copyWith(
                                              fontSize: 0.035 * size.width),
                                        )
                                      ],
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(10),
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
                                            child: Text('Selanjutnya',
                                                style: buttonText.copyWith(
                                                    color: kWhiteAccent)),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const bottomNavigationBar()),
                                              );
                                            }))
                                  ],
                                ),
                              ),
                            ]),
                      )),
                ),
              ),
            ),
          ]),
        ));
  }
}
