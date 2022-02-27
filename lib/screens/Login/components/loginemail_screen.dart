import 'dart:convert';
import 'dart:developer';

import 'package:bitanic/constants.dart';
import 'package:bitanic/model/storage_item.dart';
import '../../ForgotPassword/components/forgotpassword_screen.dart';
// import 'pacage:bitanic/screens/ForgotPassword/components/forgotpassword_screen.dart';
import 'package:bitanic/screens/Login/components/loginsuccess_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class Token {
  final String token;

  Token({required this.token});

  factory Token.fromJSON(Map<String, dynamic> json) {
    return Token(
      token: json['access_token'],
    );
  }  
}

class loginemailPage extends StatefulWidget {
  const loginemailPage({Key? key}) : super(key: key);

  @override
  State<loginemailPage> createState() => _loginemailPageState();
}

class _loginemailPageState extends State<loginemailPage> {
  final storage = new FlutterSecureStorage();
  final GlobalKey<FormState>? globalFormKey = GlobalKey();
  bool _obscureText = true;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? token;

  _data(String data) async{
    await storage.write(key: "token", value: data);
  }

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
                      height: size.height,
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
                                        "Pastikan email anda sudah terdaftar.",
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
                                width: size.width * 0.8,
                                height: size.height * 0.25,
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                fontSize: 11),
                                            hintText: 'Masukan email',
                                            prefixIcon: SvgPicture.asset(
                                                'assets/icons/Envelope.svg',
                                                width: 4,
                                                height: 4,
                                                fit: BoxFit.scaleDown),
                                            hintStyle: descriptionText.copyWith(
                                                color: kLightColor),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Email tidak boleh kosong!';
                                            } else if (!value.contains('@')) {
                                              return 'Format email salah!';
                                            }
                                            return null;
                                          },
                                          controller: emailController,
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
                                                  fontSize: 11,
                                                  ),
                                              hintText: 'Masukan kata sandi',
                                              hintStyle: descriptionText
                                                  .copyWith(color: kLightColor),
                                              prefixIcon: SvgPicture.asset(
                                                  'assets/icons/Lock.svg',
                                                  width: 4,
                                                  height: 4,
                                                  fit: BoxFit.scaleDown),
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
                                                          child:
                                                              SvgPicture.asset(
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
                                          controller: passwordController,
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
                                                if(validateAndSave()){
                                                  login();
                                                }
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

  bool validateAndSave() {
    final form = globalFormKey!.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> login() async {

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('http://116.193.190.75/api/login'),
          body: ({
            'email': emailController.text,
            'password': passwordController.text
          })).then((response) async {
            var body = json.decode(response.body);
            inspect(body['access_token']);
            var access_token = body['access_token'];
            if (response.statusCode == 200) {
              // final String value = access_token;

              //  final StorageItem storageItem = StorageItem.('token', value);
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // await prefs.setString('token', access_token);
              _data(access_token);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => loginsuccessPage(token: access_token)),
              );
            } else if (response.statusCode == 500) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Internal Server Error!")));
            } else if (response.statusCode == 404){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Email tidak ditemukan!")));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Email atau password salah!")));
            }
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Field tidak boleh kosong!")));
    }
  }
}
