import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/bloc/bencana/bencana_bloc.dart';
import 'package:laporan_masyarakat/bloc/kebakaran/kebakaran_bloc.dart';
import 'package:laporan_masyarakat/bloc/login/login_bloc.dart';
import 'package:laporan_masyarakat/bloc/logout/logout_bloc.dart';
import 'package:laporan_masyarakat/bloc/medis/medis_bloc.dart';
import 'package:laporan_masyarakat/core.dart';
import 'package:laporan_masyarakat/data/laporan sources/bencana/bencana_datasources.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/kebakaran/kebakaran_datasources.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/medis/medis_datasources.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc(AuthDataSources())),
        BlocProvider(create: (context) => LoginBloc(AuthDataSources())),
        BlocProvider(
            create: (context) => KebakaranBloc(KebakaranDataSources())),
        BlocProvider(create: (context) => MedisBloc(MedisDatasources())),
        BlocProvider(create: (context) => BencanaBloc(BencanaDatasources())),
        BlocProvider(create: (context) => LogoutBloc()),
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
