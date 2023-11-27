import 'package:flutter/material.dart';
import 'welcome.dart';
import 'main.dart';
import 'location.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Travel Safe'),
      centerTitle: true,
    ),
      body:
    Container( decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/beirut.jpg"))),
      child :Center(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>const Welcome())
              );
            }, child: const Icon(Icons.home, size: 50))
          ],
        ),
      ),
    ),
    );
  }
}
