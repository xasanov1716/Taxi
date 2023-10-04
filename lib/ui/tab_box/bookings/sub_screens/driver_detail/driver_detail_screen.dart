import 'package:flutter/material.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


_getFromQuarter({required int id}) async {
  fromQuarters = (await PlacesDatabase.instance.getQuarterById(id: id))
      .map((e) => e.name)
      .toList();
  fromQuarter = fromQuarters.first;
  setState(() {});
}
