import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/theme.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 15, 15, 10),
            child: Text(
              'Recent Order',
              style: TextStyle(
                fontFamily: 'MontserratSemiBold',
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: gridBook(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class gridBook extends StatefulWidget {
  const gridBook({super.key});

  @override
  State<gridBook> createState() => _gridBookState();
}

class _gridBookState extends State<gridBook> {
  //buat looping statusnya
  final List<Map<String, dynamic>> listBook = [
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok, Smoothing"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok, Smoothing"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok, Smoothing"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok, Smoothing"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok, Smoothing"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok, Smoothing"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok"
    },
    {
      "Id": "BOOKING 301312",
      "tanggal": "2024-05-17",
      "treatment": "Potong Cuci Catok"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listBook.length,
      itemBuilder: (_, index) {
        final booking = listBook[index];
        return GestureDetector(
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsets.only(left: 8),
        child: Text(
          booking["Id"],
          style: Theme.of(context).textTheme.subtitle1!.merge(
                const TextStyle(
                  fontFamily: 'InterSemiBold',
                  color: Color(0xFF944E63),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
      Padding(padding: EdgeInsets.only(left:8),
        child: Text(
          booking["tanggal"],
          style: Theme.of(context).textTheme.subtitle2!.merge(
                TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left:8 ),
        child: Text(
          booking["treatment"],
          style: Theme.of(context).textTheme.subtitle2!.merge(
                TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
        ),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Divider(
        color: Color(0xFFCA9BA9),
        thickness: 0.5,
        height: 10.0,
      ),
    ],
  ),
),
          ),
        );
      },
    );
  }
}
