import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/config/Asset.dart';

class TittleMedis extends StatelessWidget {
  const TittleMedis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: const BoxDecoration(
        color: Asset.colorMedis,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Laporan Medis",
              style: Asset.poppins.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
