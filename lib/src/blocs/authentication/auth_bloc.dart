import 'package:templateproject/src/bloc_helpers/bloc_event_state_base.dart';
import 'package:templateproject/src/blocs/authentication/auth_event.dart';
import 'package:templateproject/src/blocs/authentication/auth_state.dart';

class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.notAuthenticated(),
        );

  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AuthenticationEventLogin) {
      yield AuthenticationState.authenticating();

      await Future.delayed(const Duration(seconds: 2));

      if (event.name == "failure") {
        yield AuthenticationState.failure();
      } else {
        yield AuthenticationState.authenticated(event.name);
      }
    }

    if (event is AuthenticationEventLogout) {
      yield AuthenticationState.notAuthenticated();
    }
  }
}
