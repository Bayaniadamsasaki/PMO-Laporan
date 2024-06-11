import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/bloc/login/login_bloc.dart';
import 'package:laporan_masyarakat/core.dart';
// import 'Screen/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc(ApiService())),
        BlocProvider(create: (context) => LoginBloc(ApiService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Laporan Masyarakat',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: const SelamatDatang(),
      ),
    );
  }
}
