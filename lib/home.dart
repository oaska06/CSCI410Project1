import 'package:flutter/material.dart';
import 'package:test_2/welcome.dart';
import 'location.dart';
import 'ticket.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String totalPrice = locations.first.getServicePrice();
  Location location = locations.first;
  bool  movement = false;

  void updateLocation(Location location){
    setState(() {
      this.location = location;
      totalPrice = location.getServicePrice();
    });
  }
  void updateLuggage(int luggage){
    setState(() {
      location.luggage = luggage;
      totalPrice = location.getServicePrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lebanon Bus (From Beirut)'),
        centerTitle: true,
      ),
      body:
       Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Select location', style: TextStyle(fontSize: 25)),const SizedBox(height: 20),
            MyDropDownWidget(updateLocation: updateLocation),const SizedBox(height: 20),
            LuggageWidget(updateLuggage: updateLuggage),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Service : ', style: TextStyle(fontSize: 18)),
                Checkbox(value: movement, onChanged: (bool? value){
                  setState(() {
                    movement = value as bool;
                    location.movement = movement;
                    totalPrice = location.getServicePrice();
                  });
                }),],),
            const SizedBox(height: 10.0),
            Text('Total Price: $totalPrice', style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>const Ticket())
              );
            }, child: const Icon(Icons.done_all, size: 50)),
          ],
        ),
      ),

    );
  }
}