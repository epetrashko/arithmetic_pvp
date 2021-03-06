import 'dart:developer';

import 'package:arithmetic_pvp/bloc/events/profile_events.dart';
import 'package:arithmetic_pvp/bloc/states/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsernameDialogConstants {
  UsernameDialogConstants._();

  static const double topContainerPadding = 40;
  static const double topContainerRadius = 10;

  static const double labelPadding = 20;
  static const double labelTopRadius = 30;
  static const double labelBottomRadius = 60;

  static const double bottomContainerPadding = 15;
  static const double bottomContainerRadius = 40;

  static const double buttonRadius = 10;
  static const double buttonPadding = 20;
}

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _userNameController = TextEditingController();
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
  }

  _dismissEditDialog() {
    Navigator.pop(context);
  }

  submitUserName() {
    _profileBloc.add(ProfileEventChangeUsername(_userNameController.text));
  }

  _handleState(context, state) {
    log(state.toString());
    if (state is ProfileChangeUsernameStateLoaded) {
      if (state.changeNameResponse.status) {
        _dismissEditDialog();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.success ?? "Success"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.changeNameResponse.error ??
                AppLocalizations.of(context)?.try_again_later ??
                "Error! Please try again later"),
          ),
        );
      }
    }
  }

  _contentBox(context, state) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: UsernameDialogConstants.topContainerPadding,
              top: UsernameDialogConstants.labelPadding +
                  UsernameDialogConstants.topContainerPadding,
              right: UsernameDialogConstants.topContainerPadding,
              bottom: UsernameDialogConstants.topContainerPadding),
          margin: const EdgeInsets.only(
              // top: UsernameDialogConstants.labelPadding,
              bottom: UsernameDialogConstants.buttonPadding +
                  UsernameDialogConstants.bottomContainerPadding),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(UsernameDialogConstants.topContainerRadius),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        controller: _userNameController,
                        maxLength: 30,
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText:
                              AppLocalizations.of(context)?.your_username ??
                                  'Your username',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 40,
          right: 40,
          height: 40,
          child: Container(
            // padding: const EdgeInsets.only(top:40),
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)?.changing_your_nickname ??
                  'Changing your nickname',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 100,
          right: 100,
          height: UsernameDialogConstants.buttonPadding * 2,
          child: ClipRect(
            child: ElevatedButton(
              onPressed: (state is ProfileChangeUsernameStateLoading)
                  ? null
                  : submitUserName,
              child: Text(
                AppLocalizations.of(context)?.done??'Done',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xff5da854),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(UsernameDialogConstants.buttonRadius),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer(
          bloc: _profileBloc,
          listener: (context, state) => _handleState(context, state),
          builder: (context, state) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        UsernameDialogConstants.topContainerPadding),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: _contentBox(context, state),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: _showEditDialog,
        child: Text(
          AppLocalizations.of(context)?.edit_profile??"Edit profile",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
