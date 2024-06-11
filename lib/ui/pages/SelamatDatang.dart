// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/core.dart';

class SelamatDatang extends StatelessWidget {
  const SelamatDatang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 132),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Asset.bannerWelcome, width: 217, height: 212),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                "Selamat Datang",
                style: Asset.poppins
                    .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Aplikasi laporan masyarakat adalah perangkat lunak yang memungkinkan warga untuk melaporkan masalah atau kejadian penting kepada instansi melalui platform digital.",
                style: Asset.poppins.copyWith(
                  fontSize: 13.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26.0,
              ),
              Container(
                height: 72,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(9.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF85D6FF),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const SignIn();
                    }));
                  },
                  child: Text(
                    "Masuk",
                    style: Asset.poppins.copyWith(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                height: 72,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(9.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF85D6FF),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }));
                  },
                  child: Text(
                    "Daftar",
                    style: Asset.poppins.copyWith(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
