import 'package:flutter/material.dart';
import 'package:templateproject/src/bloc_helpers/bloc_event_state_builder.dart';
import 'package:templateproject/src/bloc_helpers/bloc_provider.dart';
import 'package:templateproject/src/blocs/authentication/auth_bloc.dart';
import 'package:templateproject/src/blocs/authentication/auth_event.dart';
import 'package:templateproject/src/blocs/authentication/auth_state.dart';

class AuthenticationPage extends StatelessWidget {
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Authentication Page'),
            leading: Container(),
          ),
          body: Container(
            child:
                BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: bloc,
              builder: (context, state) {
                if (state.isAuthenticating) {
                  // return PendingAction();
                  return Container();
                }

                if (state.isAuthenticating) {
                  return Container();
                }

                final child = <Widget>[];

                child.add(
                  ListTile(
                    title: RaisedButton(
                      child: Text('Log in (success)'),
                      onPressed: () {
                        bloc.emitEvent(
                            AuthenticationEventLogin(name: 'Didier'));
                      },
                    ),
                  ),
                );

                child.add(
                  ListTile(
                    title: RaisedButton(
                      child: Text('Log in (failure)'),
                      onPressed: () {
                        bloc.emitEvent(
                            AuthenticationEventLogin(name: 'failure'));
                      },
                    ),
                  ),
                );

                if (state.hasFailed) {
                  child.add(
                    Text('Authentication failure'),
                  );
                }

                return Column(
                  children: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
