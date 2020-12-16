import 'package:flutter/material.dart';
import 'package:templateproject/src/bloc_helpers/bloc_provider.dart';
import 'package:templateproject/src/blocs/authentication/auth_bloc.dart';
import 'package:templateproject/src/blocs/authentication/auth_event.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        bloc.emitEvent(AuthenticationEventLogout());
      },
    );
  }
}