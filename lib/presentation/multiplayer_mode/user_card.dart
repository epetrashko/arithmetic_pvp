import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../../data/models/user.dart';

class UserCard extends StatelessWidget {
  final Profile profile;

  const UserCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SafeArea(
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CachedNetworkImage(
                    height: 48,
                    width: 48,
                    imageUrl: profile.assetUrl ?? "",
                    placeholder: (context, url) => Center(
                      child: JumpingText(
                        '···',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: ListTile(
                      title: Text(profile.user.username),
                      subtitle: const Text('Joined', style: TextStyle(color: Colors.green),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      elevation: 3,
      margin: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
    );
  }
}