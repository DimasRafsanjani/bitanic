import 'package:bitanic/screens/ForgotPassword/components/forgotpassword_success.dart';
import 'package:bitanic/screens/Login/components/loginsuccess_screen.dart';
import 'package:flutter/material.dart';
import 'package:bitanic/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class forgotPasswordNewPage extends StatefulWidget {
  const forgotPasswordNewPage({ Key? key }) : super(key: key);

  @override
  _forgotPasswordNewPageState createState() => _forgotPasswordNewPageState();
}

class _forgotPasswordNewPageState extends State<forgotPasswordNewPage> {
  final GlobalKey<FormState>? globalFormKey = GlobalKey();
  bool _obscureText = true;
  bool _obscure1Text = true;
  bool _obscure2Text = true;
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var repeatNewPasswordController = TextEditingController();

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
                      height: size.height * 1.9,
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
                                      Text("Masukan Password Baru,",
                                          textAlign: TextAlign.start,
                                          style: titleText.copyWith(
                                              fontSize: 0.05 * size.width)),
                                      Text(
                                        "Pastikan untuk mengingat password baru ini!",
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
                              key: globalFormKey,
                              child: Container(
                                width: size.width * 0.85,
                                height: size.height * 0.35,
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(10.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kSemiColor,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kDarkColor,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kRedAccent,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kRedAccent,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: buttonText
                                                      .copyWith(
                                                    color: kRedAccent,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11,
                                                  ),
                                                  hintText:
                                                      'Masukan kata sandi lama',
                                                  hintStyle: descriptionText
                                                      .copyWith(
                                                          color: kLightColor),
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
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 3),
                                                              child: SvgPicture
                                                                  .asset(
                                                                _obscureText
                                                                    ? 'assets/icons/EyeOff.svg'
                                                                    : 'assets/icons/EyeOn.svg',
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              ))))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Password tidak boleh kosong!';
                                                } else if (value.length < 6) {
                                                  return 'Password kurang dari 6!';
                                                }
                                                return null;
                                              },
                                              obscureText: _obscureText,
                                              keyboardType: TextInputType.text,
                                              controller: oldPasswordController,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          10.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kSemiColor,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kDarkColor,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kRedAccent,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kRedAccent,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: buttonText
                                                      .copyWith(
                                                    color: kRedAccent,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11,
                                                  ),
                                                  hintText:
                                                      'Masukan kata sandi lama',
                                                  hintStyle: descriptionText
                                                      .copyWith(
                                                          color: kLightColor),
                                                  suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _obscure1Text =
                                                              !_obscure1Text;
                                                        });
                                                      },
                                                      child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 3),
                                                              child: SvgPicture
                                                                  .asset(
                                                                _obscure1Text
                                                                    ? 'assets/icons/EyeOff.svg'
                                                                    : 'assets/icons/EyeOn.svg',
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              ))))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Password tidak boleh kosong!';
                                                } else if (value.length < 6) {
                                                  return 'Password kurang dari 6!';
                                                }
                                                return null;
                                              },
                                              obscureText: _obscure1Text,
                                              keyboardType: TextInputType.text,
                                              controller: newPasswordController,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          10.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kSemiColor,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kDarkColor,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kRedAccent,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: kRedAccent,
                                                            width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: buttonText
                                                      .copyWith(
                                                    color: kRedAccent,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11,
                                                  ),
                                                  hintText:
                                                      'Masukan kata sandi lama',
                                                  hintStyle: descriptionText
                                                      .copyWith(
                                                          color: kLightColor),
                                                  suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _obscure2Text =
                                                              !_obscure2Text;
                                                        });
                                                      },
                                                      child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Container(
                                                              width: 24,
                                                              height: 24,
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 3),
                                                              child: SvgPicture
                                                                  .asset(
                                                                _obscure2Text
                                                                    ? 'assets/icons/EyeOff.svg'
                                                                    : 'assets/icons/EyeOn.svg',
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              ))))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Password tidak boleh kosong!';
                                                } else if (value.length < 6) {
                                                  return 'Password kurang dari 6!';
                                                } else if (value != newPasswordController.text){
                                                  return 'Password baru tidak cocok!';
                                                }
                                                return null;
                                              },
                                              obscureText: _obscure2Text,
                                              keyboardType: TextInputType.text,
                                              controller: repeatNewPasswordController,
                                            ),
                                          ),
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
                                              child: Text('Minta Kode',
                                                  style: buttonText.copyWith(
                                                      color: kWhiteAccent)),
                                              onPressed: () {
                                                if (validateAndSave()) {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const forgotPasswordSuccessPage()),
                                                  );
                                                }
                                              },
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ))),
            ),
          ]),
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey!.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }
    
    return false;
  }

  Future<void> login() async {
    if (repeatNewPasswordController.text.isNotEmpty) {
      var response =
          await http.post(Uri.parse('http://116.193.190.75/api/login'),
              body: ({
                'password': repeatNewPasswordController.text,
              }));
      if (response.statusCode == 200) {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //       builder: (context) => const loginsuccessPage()),
        // );
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Internal Server Error!")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email atau No. HP tidak terdaftar!")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Field tidak boleh kosong!")));
    }
  }
}