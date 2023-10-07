import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/data/repositories/auth_repository.dart';
import 'package:taxi_app/ui/auth/lets_in/lets_in_screen.dart';
import 'package:taxi_app/ui/tab_box/tab_box.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthRepository>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return const LetsInScreen();
          } else {
            return
                // StorageRepository.getString(StorageKeys.pinCode).isNotEmpty
                //   ?
                const TabBox();
            // : const SetPinScreen();
          }
        },
      ),
    );
  }
}
