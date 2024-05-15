import 'package:flutter/material.dart';

class SuksesNotif extends StatelessWidget {
  const SuksesNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  _errorMessage(BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 156, 45, 45),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: const Row(children: [
          Icon(Icons.error_outline, color: Color.fromARGB(255, 255, 249, 220), size: 40),
          SizedBox(width: 20),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Opps.. Error", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 249, 220), fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Ahahahahhahaha ERROR......", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 249, 220)), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ))
        ],),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      )
    );
  }

  _successMessage(BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 57, 164, 62),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: const Row(children: [
          Icon(Icons.check_circle, color: Color.fromARGB(255, 255, 249, 220), size: 40),
          SizedBox(width: 20),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Success", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 249, 220), fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Custom Flutter SnackBar Success Message ......", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 249, 220)), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ))
        ],),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      )
    );
  }
}