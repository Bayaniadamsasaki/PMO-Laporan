// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/admin/riwayat/Riwayat_Laporan_admin.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/ui/pages/report/Laporan_Bencana.dart';
import 'package:laporan_masyarakat/ui/pages/report/Laporan_Kebakaran.dart';
import 'package:laporan_masyarakat/ui/pages/report/Laporan_Medis.dart';
import 'package:laporan_masyarakat/ui/profile/profile_page.dart';

class HomePageAdmin extends StatelessWidget {
  const HomePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            Asset.info,
            width: 10.0,
            height: 10.0,
          ),
        ),
        title: Row(
          children: [
            const SizedBox(
              width: 15.0,
            ),
            Text(
              "Pengaduan Masyarakat",
              style: Asset.poppins.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePages()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    Asset.personUser,
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white, // Sesuaikan dengan tema aplikasi Anda
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Laporan jika terjadi keadaan darurat, instansi \n terdekat akan segera sampai di sana.",
                      style: Asset.poppins.copyWith(
                          fontSize: 13.0, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LaporanKebakaran()),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 140.0,
                        child: Stack(
                          children: [
                            Image.asset(
                              Asset.kebakaran,
                              height: 140.0,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              left: 20,
                              top: 40,
                              child: Text(
                                'Laporan\nKebakaran',
                                style: Asset.poppins.copyWith(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LaporanMedis()),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 140.0,
                        child: Stack(
                          children: [
                            Image.asset(
                              Asset.medis,
                              height: 140.0,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              left: 20,
                              top: 40,
                              child: Text(
                                'Laporan\nMedis',
                                style: Asset.poppins.copyWith(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LaporanBencana()),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 140.0,
                        child: Stack(
                          children: [
                            Image.asset(
                              Asset.bencanaAlam,
                              height: 140.0,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              left: 20,
                              top: 40,
                              child: Text(
                                'Laporan\nBencaan Alam',
                                style: Asset.poppins.copyWith(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RiwayatLaporanAdmin()),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 140.0,
                        child: Stack(
                          children: [
                            Image.asset(
                              Asset.riwayat,
                              height: 140.0,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              left: 20,
                              top: 40,
                              child: Text(
                                'Riwayat\nLaporan',
                                style: Asset.poppins.copyWith(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
