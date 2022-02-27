import 'package:bitanic/constants.dart';
import 'package:bitanic/screens/Login/components/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Placemark> placemarks =
      await placemarkFromCoordinates(52.2165157, 6.9437819);

  final prefs = await SharedPreferences.getInstance();
  final showLogin = prefs.getBool('showLogin') ?? false;

  runApp(MyApp(showLogin: showLogin));
}

class MyApp extends StatefulWidget {
  final bool showLogin;

  const MyApp({
    Key? key, 
    required this.showLogin,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    // getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kSemiColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: widget.showLogin ? const loginPage() : const onboardPage(),
    );
  } 
  
  // getLoc() async {
  //   Location location = Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationData = await location.getLocation();
  // }
}



class onboardPage extends StatefulWidget {
  const onboardPage({ Key? key }) : super(key: key);

  @override
  _onboardState createState() => _onboardState();
}

class _onboardState extends State<onboardPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose(){
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: PageView(
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          controller: controller,
          children: const [
            onboardpage(
              image: "assets/images/svg/onboard_screen1.svg",
              icon: "assets/images/svg/Brocolli.svg",
              title: "Selamat datang\ndi Bitanic!",
              description: "Jual beli sayuran segar & higienis.",
            ),
            onboardpage(  
              image: "assets/images/svg/onboard_screen2.svg",
              icon: "assets/images/svg/Onion.svg",
              title: "Jual Beli\nSayuran!",
              description: "Proses Jual beli lebih mudah.",
            ),
            onboardpage(
              image: "assets/images/svg/onboard_screen3.svg",
              icon: "assets/images/svg/Carrot.svg",
              title: "Kualitas\nTerjamin!",
              description: "Dipilih dari sayuran terbaik.",
            ),
          ],
        ),
      bottomSheet: isLastPage 
      ? Container(
        color: kSemiColor,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.22,
            ),
            SmoothPageIndicator(
              controller: controller, 
              count: 3,
              effect: const ScrollingDotsEffect(
                activeDotColor: kWhiteAccent,
                dotColor: kDarkColor,
                dotWidth: 10,
                dotHeight: 10,
              ),
              onDotClicked: (index) => controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),),
            TextButton(
              child: Text("Get Started", style: descriptionText),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showLogin', true);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const loginPage()),
                );
              }
            )
        ]),
      )
      :
      Container(
        color: kSemiColor,
        height: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: Text("Skip", style: descriptionText),
            onPressed: () {controller.jumpToPage(2);}
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller, 
              count: 3,
              effect: const ScrollingDotsEffect(
                activeDotColor: kWhiteAccent,
                dotColor: kDarkColor,
                dotWidth: 10,
                dotHeight: 10,
              ),
              onDotClicked: (index) => controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
            )
          ),
          TextButton(
            child: Text("Next", style: descriptionText),
            onPressed: () {controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);}
          ),
        ]),
      ),
    );
  }
}

class onboardpage extends StatelessWidget {
  const onboardpage({
    Key? key, required this.image, required this.icon, required this.title, required this.description,
  }) : super(key: key);

  final String image, icon, title, description;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: kSemiColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(image, fit: BoxFit.cover, width: size.width * 0.5,),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(icon, fit: BoxFit.cover, width: size.width * 0.1),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(title ,textAlign: TextAlign.center,style: titleText),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(description, textAlign: TextAlign.center, style: descriptionText),
          ),
        ],
      ),
    );
  }
}