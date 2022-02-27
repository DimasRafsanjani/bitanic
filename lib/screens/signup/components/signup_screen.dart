import 'package:bitanic/constants.dart';
import 'package:bitanic/screens/Login/components/login_screen.dart';
import 'package:bitanic/screens/signup/components/signup_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final GlobalKey<FormState>? globalFormKey = GlobalKey();

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset('assets/icons/Back Arrow.svg',
              fit: BoxFit.scaleDown),
        ),
        backgroundColor: kWhiteAccent,
        title: Text('Daftar', style: descriptionText.copyWith(fontSize: 20)),
        elevation: 2.0,
      ),
      body: Column(children: <Widget>[
        Container(
          constraints: BoxConstraints.tightFor(
              width: size.width, height: size.height * 0.2),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/jpg/SignUp.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(alignment: Alignment.bottomRight, children: [
            Container(
              padding: const EdgeInsets.only(right: 10, bottom: 7),
              child: Text(
                'Bitanic',
                style: buttonText.copyWith(color: kWhiteAccent),
              ),
            ),
          ]),
        ),
        Align(
          alignment: Alignment.center,
          child: Form(
            key: globalFormKey,
            child: Container(
              width: double.infinity,
              height: size.height * 0.67,
              margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: size.height * 0.11,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    contentPadding: const EdgeInsets.all(15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: kSemiColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: kDarkColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: kRedAccent, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: kRedAccent, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorStyle: buttonText.copyWith(
                                        color: kRedAccent,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11),
                                    hintText: 'No. HP atau Email',
                                    hintStyle: descriptionText.copyWith(
                                      color: kLightColor,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      if (!value.contains('@')) {
                                        if (!value.startsWith('62')) {
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
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Contoh: 081234567890 atau email@email.com",
                                    style: descriptionText.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(kSemiColor),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    kWhiteAccent),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 120, vertical: 12)),
                              ),
                              child: Text('Selanjutnya',
                                  style:
                                      buttonText.copyWith(color: kWhiteAccent)),
                              onPressed: () {
                                if(validateAndSave()){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const signupverifyPage()),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(children: [
                              Text("Sudah punya akun?", style: descriptionText),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const loginPage()),
                                    );
                                  },
                                  child: Text("Masuk",
                                      style: descriptionText.copyWith(
                                          color: kDarkColor)))
                            ])),
                      ]),
                    )
                  ]),
            ),
          ),
        ),
        
      ]),
    );
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
    if (emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('http://116.193.190.75/api/register'),
          body: ({
            'email': emailController.text,
          }));
      if (response.statusCode == 201) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const signupverifyPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email atau password salah!")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Field tidak boleh kosong!")));
    }
  }
}
