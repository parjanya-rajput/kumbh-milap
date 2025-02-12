import 'package:flutter/material.dart';
import 'package:kumbh_milap/core/model/profile_model.dart';
import '../components/discover_header';
import '../components/name_component';
import '../components/profile_additional_info.dart';
import '../components/profile_info_section.dart';

class DetailPage extends StatelessWidget {
  final ProfileModel profileModel;

  const DetailPage({Key? key, required this.profileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileName(
                name: profileModel.name ?? 'Unknown', age: profileModel.age),
            DiscoverHeader(
              profilePhoto:
                  profileModel.profilePictureUrl ?? '/placeholder.jpg',
              location: profileModel.home ?? 'N/A',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoSection(
                    title: 'Personal Information',
                    information: {
                      'Age': profileModel.age?.toString(),
                      'Gender': profileModel.gender,
                      'Location': profileModel.home,
                      'Occupation': profileModel.occupation,
                      'Education': profileModel.education,
                    },
                  ),
                  const SizedBox(height: 20),
                  InfoSection(
                    title: 'Additional Information',
                    information: {
                      'Looking For': profileModel.lookingFor,
                      'Advice': profileModel.advice,
                      'Meaning of Life': profileModel.meaningOfLife,
                      'Achievements': profileModel.achievements,
                      'Challenges': profileModel.challenges,
                    },
                  ),
                  const SizedBox(height: 20),
                  InterestsSection(
                    interests: profileModel.interests ?? [],
                    languages: profileModel.languages ?? [],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
