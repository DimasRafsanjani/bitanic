import 'package:bitanic/constants.dart';
import 'package:bitanic/main.dart';
import 'package:bitanic/model/weather.dart';
import 'package:bitanic/screens/Seller/Dashboard/components/dashboard_screen.dart';
import 'package:bitanic/screens/Seller/Products/components/products_screen.dart';
import 'package:bitanic/screens/Seller/Profile/components/profile_screen.dart';
import 'package:bitanic/screens/Seller/Transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({ Key? key}) : super(key: key);

  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {

  int pageIndex = 0;

  final pages = [
    const dashboardsellerPage(),
    const productsScreenPage(),
    const transactionScreenPage(),
    const profileScreenPage(),
  ];

  bool click = true;
  String ProductIcon = 'assets/icons/PackageOutline.svg';
  String HomeIcon = 'assets/icons/HomeOutline.svg';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DateTime pre_backpress = DateTime.now();

    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpress = DateTime.now();

        if (cantExit) {
          final snack = SnackBar(
            content: Text("Tekan kembali sekali lagi untuk Keluar"),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: kWhiteAccent,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const onboardPage()),
                        );
                      },
                      icon: SvgPicture.asset('assets/icons/Chat.svg')),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const onboardPage()),
                        );
                      },
                      icon: SvgPicture.asset('assets/icons/Notifications.svg')),
                ],
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          title: (
          Row(
            children: [
              // Image.network('https:{Weather.icon}'),
              Text('Pagi, ', style: descriptionText),
              Text('Dimas!', style: descriptionText.copyWith( color: kDarkColor))
            ],
          )
          )
        ),
        body: pages[pageIndex],
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: kWhiteAccent
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                }, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset((pageIndex == 0 ? 'assets/icons/HomeFill.svg' : 'assets/icons/HomeOutline.svg')),
                    Text('Beranda', style: descriptionText.copyWith(color: kDarkColor),
                    )],
              )),
              TextButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                }, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset((pageIndex == 1 ? 'assets/icons/PackageFillNav.svg' : 'assets/icons/PackageOutline.svg')),
                    Text('Produk', style: descriptionText.copyWith(color: kDarkColor),
                    )],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                }, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset((pageIndex == 2 ? 'assets/icons/DocumentFill.svg' : 'assets/icons/DocumentOutline.svg')),
                    Text('Transaksi', style: descriptionText.copyWith(color: kDarkColor),
                    )],
              )),
              TextButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                }, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset((pageIndex == 3 ? 'assets/icons/ProfileFill.svg' : 'assets/icons/ProfileOutline.svg')),
                    Text('Profil', style: descriptionText.copyWith(color: kDarkColor),
                    )],
              )),
            ],
          ),
        ),
      ),
    );
  }
}