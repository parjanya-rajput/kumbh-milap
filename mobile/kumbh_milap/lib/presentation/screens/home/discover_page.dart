import 'package:flutter/material.dart';
import 'package:kumbh_milap/presentation/screens/components/name_component';
import 'package:provider/provider.dart';
import 'package:kumbh_milap/presentation/providers/discover_provider.dart';
import '../components/discover_header';
import '../components/profile_additional_info.dart';
import '../components/profile_button.dart';
import '../components/profile_info_section.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DiscoverProvider()..fetchProfiles(context),
        child: Builder(builder: (context) {
          final discoverProvider = Provider.of<DiscoverProvider>(context);

          if (discoverProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (discoverProvider.errorMessage != null) {
            return Center(child: Text(discoverProvider.errorMessage!));
          }

          final profiles = discoverProvider.profiles;
          print(profiles);

          return PageView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileName(
                        name: profile.name ?? "Unkknown",
                        age: profile.age,
                      ),
                      DiscoverHeader(
                        profilePhoto: profile.profilePictureUrl ??
                            'https://www.piclumen.com/wp-content/uploads/2024/10/piclumen-upscale-after.webp',
                        location: profile.home ?? "N/A",
                      ),
                      const SizedBox(height: 20),
                      InfoSection(
                        title: AppLocalizations.of(context)!.personalInfo,
                        information: {
                          AppLocalizations.of(context)!.gender: profile.gender,
                          AppLocalizations.of(context)!.occupation:
                              profile.occupation,
                          AppLocalizations.of(context)!.education:
                              profile.education,
                        },
                      ),
                      const SizedBox(height: 20),
                      InfoSection(
                        title: AppLocalizations.of(context)!.additionInfo,
                        information: {
                          AppLocalizations.of(context)!.lookingFor:
                              profile.lookingFor,
                          AppLocalizations.of(context)!.advice: profile.advice,
                          AppLocalizations.of(context)!.meaningOfLife:
                              profile.meaningOfLife,
                          AppLocalizations.of(context)!.achievements:
                              profile.achievements,
                          AppLocalizations.of(context)!.challenges:
                              profile.challenges,
                        },
                      ),
                      const SizedBox(height: 20),
                      InterestsSection(
                        interests: profile.interests ?? [],
                        languages: profile.languages ?? [],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            onPressed: () {
                              discoverProvider.swipeLeft(profile.user_id);
                            },
                            label: AppLocalizations.of(context)!.swipeLeft,
                          ),
                          SizedBox(width: 10),
                          ProfileButton(
                            onPressed: () {
                              discoverProvider.swipeRight(profile.user_id);
                            },
                            label: AppLocalizations.of(context)!.swipeRight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }));
  }
}
