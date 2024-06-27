// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/admin/riwayat/widget/riwayat%20card/riwayat_laporan_bencana_admin.dart';
import 'package:laporan_masyarakat/admin/riwayat/widget/riwayat%20card/riwayat_laporan_kebakaran_admin.dart';
import 'package:laporan_masyarakat/admin/riwayat/widget/riwayat%20card/riwayat_laporan_medis_admin.dart';
import 'package:laporan_masyarakat/bloc/bencana/bencana_bloc.dart';
import 'package:laporan_masyarakat/bloc/kebakaran/kebakaran_bloc.dart';
import 'package:laporan_masyarakat/bloc/medis/medis_bloc.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/bencana/bencana_datasources.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/kebakaran/kebakaran_datasources.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/medis/medis_datasources.dart';

class RiwayatLaporanAdmin extends StatefulWidget {
  const RiwayatLaporanAdmin({Key? key}) : super(key: key);

  @override
  State<RiwayatLaporanAdmin> createState() => _RiwayatLaporanAdminState();
}

class _RiwayatLaporanAdminState extends State<RiwayatLaporanAdmin> {
  late KebakaranBloc _kebakaranBloc;
  late MedisBloc _medisBloc;
  late BencanaBloc _bencanaBloc;

  @override
  void initState() {
    super.initState();
    _kebakaranBloc = KebakaranBloc(KebakaranDataSources());
    _medisBloc = MedisBloc(MedisDatasources());
    _bencanaBloc = BencanaBloc(BencanaDatasources());
    _kebakaranBloc.add(FetchKebakaranData());
    _medisBloc.add(FetchMedisData());
    _bencanaBloc.add(FetchBencanaData());
  }

  @override
  void dispose() {
    _kebakaranBloc.close();
    _medisBloc.close();
    _bencanaBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Admin Riwayat Laporan",
              style: Asset.poppins
                  .copyWith(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<KebakaranBloc>.value(value: _kebakaranBloc),
            BlocProvider<MedisBloc>.value(value: _medisBloc),
            BlocProvider<BencanaBloc>.value(value: _bencanaBloc),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<KebakaranBloc, KebakaranState>(
                builder: (context, kebakaranState) {
                  if (kebakaranState is KebakaranLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (kebakaranState is KebakaranLoaded) {
                    return RiwayatLaporanKebakaranAdmin(
                        data: kebakaranState.model);
                  } else if (kebakaranState is KebakaranError) {
                    return Text(kebakaranState.message);
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<MedisBloc, MedisState>(
                builder: (context, medisState) {
                  if (medisState is MedisLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (medisState is MedisLoaded) {
                    return RiwayatLaporanMedisAdmin(data: medisState.model);
                  } else if (medisState is MedisError) {
                    return Text(medisState.message);
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<BencanaBloc, BencanaState>(
                builder: (context, bencanaState) {
                  if (bencanaState is BencanaLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (bencanaState is BencanaLoaded) {
                    return RiwayatLaporanBencanaAdmin(data: bencanaState.model);
                  } else if (bencanaState is BencanaError) {
                    return Text(bencanaState.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
