import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {


List<dynamic> _data = []; // List to store API data
String id = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
    fetchData(); // Fetch data when the app starts
  }




  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');

    if (userDataString != null) {
      final userData = UserData.fromJson(json.decode(userDataString));
      // print(userData.id);
      id = userData.id.toString();
      
      setState(() {});
    }
  }

  Future<void> fetchData() async {
    await loadUserData();
    final response = await http.get(Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/riwayat/' + id));

    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    }

    
    else {
      throw Exception('Failed to load data');
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Order', style: TextStyle(
                      fontFamily: 'MontserratBold',
                      fontSize: 20,
                    ),),
      ),
      body: _data.isEmpty
          ? Center(
              child: Text('tidak ada data'),
            )
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final book = _data[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id Booking:  ${book['id']}', style: TextStyle(fontFamily: 'MontserratBold', fontSize: 18, color: Color(0xFF944E63)),),
                        Text('Tanggal : ${book['tanggal']}'),
                        Text('Treatment: ${book['nama_treatment']}', style: TextStyle(fontSize: 16),),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}