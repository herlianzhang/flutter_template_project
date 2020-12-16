import 'package:flutter/material.dart';
import 'package:templateproject/src/bloc_helpers/bloc_event_state_builder.dart';
import 'package:templateproject/src/bloc_helpers/bloc_provider.dart';
import 'package:templateproject/src/blocs/authentication/auth_bloc.dart';
import 'package:templateproject/src/blocs/authentication/auth_event.dart';
import 'package:templateproject/src/blocs/authentication/auth_state.dart';
import 'package:templateproject/src/pages/auth_page.dart';
import 'package:templateproject/src/pages/init_page.dart';

class DecisionPage extends StatefulWidget {
  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  AuthenticationState oldAuthenticationState;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: bloc,
      builder: (context, state) {
        if (state != oldAuthenticationState) {
          oldAuthenticationState = state;

          if (state.isAuthenticated) {
            _redirectToPage(context, Initializationpage());
          } else if (state.isAuthenticating || state.hasFailed) {
            // do nothing
          } else {
            _redirectToPage(context, AuthenticationPage());
          }
        }

        return Container();
      },
    );
  }
}

void _redirectToPage(BuildContext context, Widget page) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final newRoute = MaterialPageRoute(builder: (BuildContext context) => page);

    Navigator.of(context)
        .pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
  });
}
