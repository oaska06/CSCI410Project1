import 'package:flutter/material.dart';


class Location{

  String place;
  int price;
  int luggage = 1;
  bool luggagechoise = true;
  bool movement = false;

  Location(this.place,this.price);

  @override
  String toString(){
    return '$place Price: $price\LL';
  }

  String getServicePrice(){
    int movementAmount = 50000;
    if(movement == true){
      return(movementAmount).toStringAsFixed(0);
    }
    return(price).toStringAsFixed(0);

  }

  String getLuggagePrice(){
    int lp = 20000;
    int luggagePrice = luggagechoise? 20000 :0;
    if(luggage == 1){
      return (price).toStringAsFixed(0);
    }
    return (price + lp).toStringAsFixed(0);

  }


}
List<Location> locations=[
  Location('Aley', 100000),
  Location('Saida', 200000),
  Location('Baalbak', 300000),
];

class MyDropDownWidget extends StatefulWidget {
  const MyDropDownWidget({required this.updateLocation,super.key});
  final Function(Location) updateLocation;

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210,
        initialSelection: locations[0],
        onSelected: (location){
          setState(() {
            widget.updateLocation(location as Location);
          });
        },
        dropdownMenuEntries:locations.map<DropdownMenuEntry<Location>>((Location location){
          return DropdownMenuEntry(value: location, label: location.toString());
        }).toList());
  }
}
class LuggageWidget extends StatefulWidget {
  const LuggageWidget({required this.updateLuggage ,super.key});
  final Function(int)updateLuggage;

  @override
  State<LuggageWidget> createState() => _LuggageWidgetState();
}

class _LuggageWidgetState extends State<LuggageWidget> {
  int _weight = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,children: [
      const Text('Luggage', style: TextStyle(fontSize: 18)),
      Radio(value: 1, groupValue: _weight, onChanged: (val){
        setState(() {
          _weight = val as int;
          widget.updateLuggage(_weight);
        });
      },
      ), const Text('2KG or below', style: TextStyle(fontSize: 18)),

      Radio(value: 3, groupValue: _weight, onChanged: (val){
        setState(() {
          _weight = val as int;
          widget.updateLuggage(_weight);
        });
      },
      ), const Text('3KG and above', style: TextStyle(fontSize: 18)),
    ],
    );
  }
}

