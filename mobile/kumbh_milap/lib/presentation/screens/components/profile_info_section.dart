import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final Map<String, String?> information;

  const InfoSection({
    Key? key,
    required this.title,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredInformation = information.entries
        .where((entry) => entry.value != null && entry.value!.isNotEmpty)
        .toList();

    if (filteredInformation.isEmpty) {
      return SizedBox
          .shrink(); // Return an empty widget if no information is available
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          color: Theme.of(context).secondaryHeaderColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: filteredInformation
                  .map((entry) =>
                      _buildInfoRow(context, entry.key, entry.value!))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppTheme.black)),
          ),
          Expanded(
            flex: 3,
            child: Text(value,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppTheme.black)),
          ),
        ],
      ),
    );
  }
}
