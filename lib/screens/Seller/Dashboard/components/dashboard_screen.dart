import 'dart:convert';
import 'package:bitanic/main.dart';
import 'package:bitanic/model/storage_item.dart';
import 'package:bitanic/model/weather.dart';
import 'package:bitanic/screens/Login/components/loginemail_screen.dart';
import 'package:bitanic/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bitanic/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class dashboardsellerPage extends StatefulWidget {
  const dashboardsellerPage({Key? key}) : super(key: key);

  @override
  _dashboardsellerPageState createState() => _dashboardsellerPageState();
}

class Products {
  final String name;
  final int price;
  final int stock;
  final String image;

  const Products(
      {required this.name, required this.price, required this.stock, required this.image});

  factory Products.fromJSON(Map<String, dynamic> json) {
    return Products(
      name: json['nama'],
      price: json['harga'],
      stock: json['stok'],
      image: json['foto'],
    );
  }
}

class _dashboardsellerPageState extends State<dashboardsellerPage> {
  late Future<List<Products>>? futureData;
  final storage = new FlutterSecureStorage();
  String? token;

  Future<List<Products>> fetchData(Future<String?> token) async {
    debugPrint('Tokennnnnnnnnnnnnnnnn : ${await token}');
    var url = kUrl;
    final response = await http
        .get(Uri.parse(url + '/marketplace/all'), headers: {
      'Content-Type': "application/json",
      'Accept': 'application/json',
      'Authorization': "Bearer ${await token}",
    });
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map['data'];
      return data.map((data) => new Products.fromJSON(data)).toList();
    } else if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else if (response.statusCode == 404) {
      throw Exception('Data not found!');
    } else if (response.statusCode == 403) {
      throw Exception('Access Denied');
    } else if (response.statusCode == 405) {
      throw Exception('Method Not Allowed');
    } else if (response.statusCode == 400) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Error');
    }
  }

  Future<String?> getSetList() async {
    token = await storage.read(key: 'token');
    debugPrint('token :' + token.toString());
    return token;
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchData(getSetList());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DateTime preBackpress = DateTime.now();

    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          CarouselSlider(
            items: [
              Container(
                  width: size.width,
                  child: ClipRRect(
                      child: Image.asset('assets/images/jpg/Image 1.jpg',
                          fit: BoxFit.fitHeight))),
              Container(
                  width: size.width,
                  child: ClipRRect(
                      child: Image.asset('assets/images/jpg/Image 2.jpg',
                          fit: BoxFit.fitHeight))),
              Container(
                  width: size.width,
                  child: ClipRRect(
                      child: Image.asset('assets/images/jpg/Image 3.jpg',
                          fit: BoxFit.fitHeight))),
              Container(
                  width: size.width,
                  child: ClipRRect(
                      child: Image.asset('assets/images/jpg/Image 4.jpg',
                          fit: BoxFit.fitHeight))),
            ],
            options: CarouselOptions(
                height: size.height * 0.17,
                autoPlay: true,
                viewportFraction: 1.0),
          ),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: kWhiteAccent,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Transaksi",
                          style: descriptionText.copyWith(fontSize: 16)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Selengkapnya",
                            style: buttonText,
                          ))
                    ],
                  ),
                  Row(children: <Widget>[
                    Transaksi_Buttons(
                      size: size,
                      icon: 'assets/icons/Wallet.svg',
                      text: 'Belum Dibayar',
                    ),
                    SizedBox(width: 15),
                    Transaksi_Buttons(
                        size: size,
                        icon: 'assets/icons/PackageFill.svg',
                        text: 'Dikemas'),
                    SizedBox(width: 15),
                    Transaksi_Buttons(
                        size: size,
                        icon: 'assets/icons/Shipping.svg',
                        text: 'Dikirim'),
                    SizedBox(width: 15),
                    Transaksi_Buttons(
                        size: size,
                        icon: 'assets/icons/Done.svg',
                        text: 'Selesai')
                  ])
                ],
              )),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: kWhiteAccent,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Statistik",
                        style: descriptionText.copyWith(fontSize: 16)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Selengkapnya",
                          style: buttonText,
                        ))
                  ],
                ),
                Row(children: <Widget>[
                  Statistik_Buttons(
                    size: size,
                    icon: 'assets/icons/graph-in.svg',
                    text: 'Pemasukan',
                  ),
                  SizedBox(width: 15),
                  Statistik_Buttons(
                      size: size,
                      icon: 'assets/icons/graph-out.svg',
                      text: 'Pengeluaran'),
                ]),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: kWhiteAccent,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Produk",
                        style: descriptionText.copyWith(fontSize: 16)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Selengkapnya",
                          style: buttonText,
                        ))
                  ],
                ),
                FutureBuilder<List<Products>>(
                  future: futureData,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      List<Products>? products = snapshot.data;
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: products?.length,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 80,
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  color: kWhiteAccent,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(kUrl + products![index].image),
                                    Text('${products![index].name}', style: titleText.copyWith(fontSize: 15, color: kDarkColor)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text('Rp. ${products[index].price}', style: descriptionText),
                                      Text('${products[index].stock}', style: descriptionText.copyWith(color: kGreyAccent))
                                    ],),
                                  ],
                                ));
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class Transaksi_Buttons extends StatelessWidget {
  const Transaksi_Buttons({
    Key? key,
    required this.size,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: size.height * 0.1,
          decoration: BoxDecoration(
              color: kWhiteAccent,
              boxShadow: [
                BoxShadow(
                    color: kDarkAccent.withOpacity(0.08),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2)),
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: () {},
            child: Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(icon),
                      SizedBox(height: 5),
                      Text(text,
                          style: descriptionText.copyWith(
                              fontSize: 12, overflow: TextOverflow.clip),
                          textAlign: TextAlign.center),
                    ]),
              ),
            ),
          ),
        ));
  }
}

class Statistik_Buttons extends StatelessWidget {
  const Statistik_Buttons({
    Key? key,
    required this.size,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: size.height * 0.1,
          decoration: BoxDecoration(
              color: kWhiteAccent,
              boxShadow: [
                BoxShadow(
                    color: kDarkAccent.withOpacity(0.08),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2)),
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.only(right: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset(icon),
                    Text(text,
                        style: descriptionText.copyWith(fontSize: 12),
                        textAlign: TextAlign.start),
                  ]),
            ),
          ),
        ));
  }
}
