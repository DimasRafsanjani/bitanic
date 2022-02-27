import 'package:bitanic/screens/ForgotPassword/components/forgotpassword_verify_screen.dart';
import 'package:bitanic/screens/Seller/Dashboard/components/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bitanic/constants.dart';
import 'package:http/http.dart' as http;

class forgotpasswordPage extends StatefulWidget {
  const forgotpasswordPage({Key? key}) : super(key: key);

  @override
  _forgotpasswordPageState createState() => _forgotpasswordPageState();
}

class _forgotpasswordPageState extends State<forgotpasswordPage> {
  final GlobalKey<FormState>? globalFormKey = GlobalKey();
  var fieldController = TextEditingController();

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
                                      Text("Atur Ulang Password,",
                                          textAlign: TextAlign.start,
                                          style: titleText.copyWith(
                                              fontSize: 0.05 * size.width)),
                                      Text(
                                        "Masukan email atau no. HP",
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
                                height: size.height * 0.19,
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                                border:
                                                    const UnderlineInputBorder(),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(horizontal: 10.0),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: kSemiColor,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: kDarkColor,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: kRedAccent,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: kRedAccent,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorStyle: buttonText.copyWith(
                                                    color: kRedAccent,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11),
                                                hintText:
                                                    'Masukan email atau no. HP',
                                                hintStyle:
                                                    descriptionText.copyWith(
                                                        color: kLightColor),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  if(!value.contains('@')){
                                                    if (!value.startsWith('62')){
                                                      return "Email harus diikuti tanda '@' atau Nomor harus didahului 62";
                                                    }
                                                    return 'Email harus valid!';
                                                  }
                                                  return 'Field tidak boleh kosong!';
                                                }
                                              },
                                              // onSaved: (value) {
                                              //   requestModel.email = value;
                                              // },
                                              controller: fieldController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
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
                                                if(validateAndSave()){
                                                  Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const forgotpasswordVerifyPage()),
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
    if (fieldController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('http://116.193.190.75/api/login'),
          body: ({
            'email': fieldController.text,
          }));
      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const forgotpasswordVerifyPage()),
        );
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
