import 'package:flutter/material.dart';
import 'bloc_event_state_base.dart';

typedef Widget AsyncBlocEventStateBuilder<BlocState>(
    BuildContext context, BlocState state);

class BlocEventStateBuilder<Event extends BlocEvent, State extends BlocState>
    extends StatelessWidget {
  const BlocEventStateBuilder({
    Key key,
    @required this.builder,
    @required this.bloc,
  })  : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  final BlocEventStateBase<Event, State> bloc;
  final AsyncBlocEventStateBuilder<State> builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<State>(
      stream: bloc.state,
      initialData: bloc.initialState,
      builder: (context, snapshot) => builder(context, snapshot.data),
    );
  }
}
