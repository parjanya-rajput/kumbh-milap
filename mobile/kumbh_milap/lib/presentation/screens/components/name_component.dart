import 'package:flutter/material.dart';
import 'package:kumbh_milap/app_theme.dart';

class ProfileName extends StatelessWidget {
  final String name;
  final int? age;

  const ProfileName({
    Key? key,
    required this.name,
    this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Text(
          '$name, ${age ?? ''}',
          style: Theme.of(context)
              .textTheme
              .displayMedium?.copyWith(color: AppTheme.black),
        ),
      ),
    );
  }
}