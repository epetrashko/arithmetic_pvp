import 'package:arithmetic_pvp/presentation/profile/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _dismissDialog() {
      Navigator.pop(context);
    }

    _showMaterialDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            title: Text(AppLocalizations.of(context)?.settings ?? 'Settings',
                textAlign: TextAlign.center),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)?.switch_mode ?? 'Switch Mode',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 5,
                ),
                ThemeToggle(),
              ],
            ),
            actions: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  onPressed: _dismissDialog,
                  child: Text(AppLocalizations.of(context)?.done ?? "Done"),
                ),
              ),
            ],
          );
        },
      );
    }

    return IconButton(
      onPressed: _showMaterialDialog,
      icon: const Icon(Icons.settings),
    );
  }
}
