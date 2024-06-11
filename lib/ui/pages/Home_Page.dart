// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/ui/pages/report/Laporan_Kebakaran.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    "Pengaduan Masyarakat",
                    style: Asset.poppins
                        .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Laporan jika terjadi keadaan darurat, instansi \n terdekat akan segera sampai di sana.",
                    style: Asset.poppins
                        .copyWith(fontSize: 13.0, fontWeight: FontWeight.w400),
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
                  SizedBox(
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
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
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
