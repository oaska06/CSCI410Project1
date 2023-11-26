import 'package:flutter/material.dart';
import 'home.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Welcome to Beirut Transportation'),
    centerTitle: true,
    ),
      body: Center(child: Column(children: [
        const SizedBox(height: 100),
        const Text('Welcome To Lebanon Transport From Beirut', style: TextStyle(fontSize: 30 , color: Colors.black,),textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        const Text('Please press the below button to continue', style: TextStyle(fontSize: 20, color: Colors.black),),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Home())
          );
        },
            child: const Icon(Icons.directions_bus_filled,size: 50))
      ]),
      ),
    );

  }
}