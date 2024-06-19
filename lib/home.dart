import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/detailtreat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchData = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/menu'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                'assets/images/carousel1.jpg',
                'assets/images/carousel2.jpg',
                'assets/images/carousel3.jpg',
                'assets/images/carousel4.jpg',
                'assets/images/carousel5.jpg',
              ].map((String imagePath) {
                return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity, // ensures the image fills the width
                        ),
                      );
                    },
                  );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: Text(
                'Pilihan Treatment',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<dynamic>>(
              future: _fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return GridB(data: snapshot.data!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  final List<dynamic> data;

  const GridB({Key? key, required this.data}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding di sisi kiri dan kanan
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 240,
        ),
        itemCount: widget.data.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => navigateDetailTreat(context, widget.data[index]),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xFFECDFDF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.network(
                      "https://2f90-203-29-27-130.ngrok-free.app/websem4/lilyansalon/public/${widget.data[index]['image']}",
                      height: 130,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.data[index]['nama_treatment']}",
                          style: const TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          "${widget.data[index]['harga']}",
                          style: const TextStyle(
                            fontFamily: 'PoppinsSemiBold',
                            fontSize: 20,
                            color: Color(0xFF944E63),
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateDetailTreat(BuildContext context, dynamic treatmentData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TreatmentScreen(treatmentData: treatmentData),
      ),
    );
  }
}