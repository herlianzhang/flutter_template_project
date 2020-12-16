import 'package:flutter/material.dart';
import 'package:templateproject/src/bloc_helpers/bloc_event_state_builder.dart';
import 'package:templateproject/src/blocs/application_initialization/app_init_event.dart';
import 'package:templateproject/src/blocs/application_initialization/app_init_state.dart';
import '../blocs/application_initialization/app_init_bloc.dart';

class Initializationpage extends StatefulWidget {
  @override
  _InitializationpageState createState() => _InitializationpageState();
}

class _InitializationpageState extends State<Initializationpage> {
  ApplicationInitializationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ApplicationInitializationBloc();
    bloc.emitEvent(ApplicationInitializationEvent());
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.red,
        ),
      ),
      body: Center(
        child: BlocEventStateBuilder<ApplicationInitializationEvent,
            ApplicationInitializationState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.isInitialized) {
              print('complete');
            }
            return (state.isInitialized)
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.red,
                  )
                : Text('Initialization in progress... ${state.progress}%');
          },
        ),
      ),
    );
  }
}
