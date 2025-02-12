import 'package:flutter/material.dart';

class LocationBadge extends StatelessWidget {
  final String location;

  const LocationBadge({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.home, color: Colors.white, size: 18),
          SizedBox(width: 5),
          Text(location, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
