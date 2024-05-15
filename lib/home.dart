import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/detailtreat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Perbaikan syntax dari key

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<String> ImagePath=[
  "assets/images/carousel1.jpg",
  "assets/images/carousel2.jpg",
  "assets/images/carousel3.jpg",
  "assets/images/carousel4.jpg",
  "assets/images/carousel5.jpg"
];

late List<Widget> _pages;
int _activePage = 0;
final PageController _pageController =PageController(initialPage: 0);
Timer? _timer;

class _HomeScreenState extends State<HomeScreen> 
  with SingleTickerProviderStateMixin{
  // late TabController _tabController;
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) { 
      if (_pageController.page == ImagePath.length - 1) {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.linear);
  }else {
    _pageController.nextPage( duration: Duration(milliseconds: 300),curve: Curves.linear);
  }});
   
  }
  @override
  void initState(){
    super.initState();
    _pages = List.generate(ImagePath.length, (index) => 
    imageBanner(ImagePath: ImagePath[index],));
    // startTimer();
    // _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height /4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: ImagePath.length,
                    onPageChanged: (value){
                      setState(() {
                        _activePage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _pages[index];
                    },
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                        List <Widget>.generate(_pages.length, (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: InkWell(
                            onTap: (){
                              _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
                            },
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: _activePage == index? Color(0xFFB9798C):Colors.grey,
                            ),
                          ),
                        ))
                      ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Pilihan Treatment',
                  style: TextStyle(
                    fontSize: 22,                    fontWeight: FontWeight.bold,
                    fontFamily: 'MontserratBold',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 18, 12, 20),
              child: GridB(onTap: () {  },),
            )
          ],
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  final void Function()? onTap;

  const GridB({Key? key, required this.onTap }) : 
  super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    },
    {
      "title": "Potong",
      "price": "\Rp 200.000",
      "images":
          "https://asset.kompas.com/crops/YjO4-jE4mD7v-79EUP1KngvTJxw=/0x1:500x334/750x500/data/photo/2020/05/18/5ec2666b44aea.jpg",
    }
  ];

void navigateDetailTreat(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TreatmentScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 240,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => navigateDetailTreat(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Color(0xFFECDFDF),
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
                    "${gridMap.elementAt(index)['images']}",
                    height: 160,
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
                        "${gridMap.elementAt(index)['title']}",
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontFamily: 'PoppinsRegular',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "${gridMap.elementAt(index)['price']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontSize: 20,
                                color: Color(0xFF944E63),
                              ),
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
    );  
  }
}



class imageBanner extends StatelessWidget {
  final String? ImagePath;

  const imageBanner({super.key, this.ImagePath} );

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath!,
      fit: BoxFit.cover,
    );
  }
}