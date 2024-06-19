import 'dart:convert';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/book.dart';
import 'package:flutter_application_lilyannsalon/home.dart';
import 'package:flutter_application_lilyannsalon/login.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:flutter_application_lilyannsalon/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sideBar extends StatefulWidget {
  // final int page;
  const sideBar({super.key});

  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  int pageIndex = 0;
  List<Widget> profile = const [ProfileScreen()];

  String ID = "";
  String EMAIL = "";
  String NAMA = "";

  //init
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  //panggil data
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');

    if (userDataString != null) {
      final userData = UserData.fromJson(json.decode(userDataString));
      // print(userData.id);
      // ID = userData.id.toString();
      NAMA = userData.name;
      EMAIL = userData.email;

      setState(() {});
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data'); // Hapus data pengguna yang tersimpan
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LogInScreen())); // Ganti ke halaman login atau halaman awal aplikasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Image.asset("assets/images/logoAppBar.png"),
        toolbarHeight: 65,
        // title: const Text ('Cbak home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(NAMA),
              accountEmail: Text(EMAIL),
              decoration: BoxDecoration(
                color:
                    Color(0xFFB9798C), // Change the background color to B9798C
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Color(0xFFB9798C), // Change the color to pink
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Color(0xFFB9798C), // Ganti warna teks menjadi biru
                  fontFamily: 'MontserratBold', // Atur gaya font menjadi bold
                  fontSize: 16, // Atur ukuran font menjadi 16
                ),
              ),
              onTap: () {
                setState(() {
                  pageIndex = 0;
                  
                });             
                Navigator.pop(context); 
                },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month_outlined,
                color: Color(0xFFB9798C), // Change the color to pink
              ),
              title: Text(
                'Book',
                style: TextStyle(
                  color: Color(0xFFB9798C), // Ganti warna teks menjadi biru
                  fontFamily: 'MontserratBold', // Atur gaya font menjadi bold
                  fontSize: 16, // Atur ukuran font menjadi 16
                ),
              ),
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });             
                Navigator.pop(context);
                },
            ),
            ListTile(
              leading: Icon(
                Icons.person_2_outlined,
                color: Color(0xFFB9798C), // Change the color to pink
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFFB9798C), // Ganti warna teks menjadi biru
                  fontFamily: 'MontserratBold', // Atur gaya font menjadi bold
                  fontSize: 16, // Atur ukuran font menjadi 16
                ),
              ),
              onTap: () {
                setState(() {
                  pageIndex = 2;
                
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Color(0xFFB9798C), // Change the color to pink
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFFB9798C), // Ganti warna teks menjadi biru
                  fontFamily: 'MontserratBold', // Atur gaya font menjadi bold
                  fontSize: 16, // Atur ukuran font menjadi 16
                ),
              ),
              onTap: () {
                logout();
              },
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Color(0xFFB9798C),
      //   unselectedItemColor: Colors.black,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 45),label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.book_outlined, size: 45), label: 'Book'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person_outlined  , size: 45), label: 'Profile')
      //     ],),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xFF944E63),
        color: Color(0xFF944E63),
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.newspaper, color: Colors.white),
            label: 'Book',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: profile,
      ),
    );
  }
}