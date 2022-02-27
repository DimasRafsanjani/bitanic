import 'package:bitanic/constants.dart';
import 'package:bitanic/screens/ForgotPassword/components/forgotpassword_screen.dart';
import 'package:bitanic/screens/Login/components/loginsuccess_screen.dart';
import 'package:bitanic/screens/signup/components/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginphonePage extends StatefulWidget {
  const loginphonePage({Key? key}) : super(key: key);

  @override
  State<loginphonePage> createState() => _loginphonePageState();
}

class _loginphonePageState extends State<loginphonePage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kSemiColor,
        body: SafeArea(
          child: Stack(children: <Widget>[
            Container(
              height: size.height * 0.5,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:
                              SvgPicture.asset('assets/icons/Back Arrow.svg'),
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: size.height * 0.45,
                  child: Container(
                      height: size.height * 2,
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
                                      Text("Hai,",
                                          textAlign: TextAlign.start,
                                          style: titleText.copyWith(
                                              fontSize: 0.05 * size.width)),
                                      Text(
                                        "Pastikan no. HP anda sudah terdaftar.",
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
                                height: size.height * 0.23,
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border:
                                                const UnderlineInputBorder(),
                                            contentPadding:
                                                const EdgeInsets.all(1.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: kSemiColor,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: kDarkColor,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: kRedAccent,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: kRedAccent,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorStyle: buttonText.copyWith(
                                              color: kRedAccent,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11,
                                            ),
                                            hintText: 'Masukan no. HP',
                                            prefixIcon: SvgPicture.asset(
                                                'assets/icons/Smartphone.svg',
                                                width: 4,
                                                height: 4,
                                                fit: BoxFit.scaleDown),
                                            hintStyle: descriptionText.copyWith(
                                                color: kLightColor),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty &&
                                                value.startsWith('62')) {
                                              return 'Nomor didahului dengan 62!';
                                            }
                                          },
                                          // onSaved: (value){
                                          //   requestModel.email = value;
                                          // },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(1.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: kSemiColor,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: kDarkColor,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: kRedAccent,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: kRedAccent,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorStyle: buttonText.copyWith(
                                                  color: kRedAccent,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 11),
                                              hintText: 'Masukan kata sandi',
                                              prefixIcon: SvgPicture.asset(
                                                  'assets/icons/Lock.svg',
                                                  width: 4,
                                                  height: 4,
                                                  fit: BoxFit.scaleDown),
                                              hintStyle: descriptionText
                                                  .copyWith(color: kLightColor),
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _obscureText =
                                                          !_obscureText;
                                                    });
                                                  },
                                                  child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Container(
                                                          width: 24,
                                                          height: 24,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 0,
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            _obscureText
                                                                ? 'assets/icons/EyeOff.svg'
                                                                : 'assets/icons/EyeOn.svg',
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ))))),
                                          validator: (value) {
                                            if (value!.isEmpty &&
                                                value.length <= 8) {
                                              return 'Password Salah!';
                                            }
                                          },
                                          obscureText: _obscureText,
                                          // onSaved: (value){
                                          //   requestModel.password = value;
                                          // },
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
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
                                              child: Text('Login',
                                                  style: buttonText.copyWith(
                                                      color: kWhiteAccent)),
                                              onPressed: () {
                                                // Navigator.of(context)
                                                //     .pushReplacement(
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           const loginsuccessPage()),
                                                // );
                                              },
                                            )))
                                  ],
                                ),
                              ),
                            ),
                            Column(children: [
                              Container(
                                  margin:
                                      const EdgeInsets.only(bottom: 0, top: 30),
                                  child: Column(children: [
                                    Text("Lupa kata sandi?",
                                        style: descriptionText),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const forgotpasswordPage()),
                                          );
                                        },
                                        child: Text("Reset kata sandi",
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
}
