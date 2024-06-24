import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laporan_masyarakat/config/Asset.dart';

class FormCostum extends StatelessWidget {
  const FormCostum({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              Asset.outlineInfo,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "Mohon jangan berikan laporan palsu",
              style: Asset.poppins.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
