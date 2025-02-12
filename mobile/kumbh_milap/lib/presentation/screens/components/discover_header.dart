import 'package:flutter/material.dart';
import 'location_badge.dart';

class DiscoverHeader extends StatelessWidget {
  final String profilePhoto;
  final String location;

  const DiscoverHeader({
    Key? key,
    required this.profilePhoto,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            image: DecorationImage(
              image: NetworkImage(profilePhoto), // Use the actual profile photo
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: LocationBadge(location: location),
        ),
      ],
    );
  }
}
