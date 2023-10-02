import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';


class ClientRequestScreen extends StatelessWidget {
  const ClientRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(appBar: GlobalAppBar(title: "Client"),

    );
  }
}




