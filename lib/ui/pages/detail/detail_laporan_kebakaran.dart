import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';

class DetailLaporanKebakaran extends StatelessWidget {
  final KebakaranResponseModel laporan;

  const DetailLaporanKebakaran({Key? key, required this.laporan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Laporan Kebakaran",
          style: Asset.poppins.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jenis Laporan: ${laporan.jenis}", style: Asset.poppins),
            const SizedBox(height: 10),
            Text("Nama Pelapor: ${laporan.nama}", style: Asset.poppins),
            const SizedBox(height: 10),
            Text("Telepon Pelapor: ${laporan.telepon}", style: Asset.poppins),
            const SizedBox(height: 10),
            Text("Lokasi Kejadian: ${laporan.lokasi}", style: Asset.poppins),
            const SizedBox(height: 10),
            Text("Tanggal Kejadian: ${laporan.tanggal}", style: Asset.poppins),
            const SizedBox(height: 10),
            Text("Deskripsi Kejadian: ${laporan.isi}", style: Asset.poppins),
            const SizedBox(height: 10),
            _buildFotoWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildFotoWidget() {
    if (laporan.foto != null) {
      return Image.network(
        laporan.foto!,
        errorBuilder: (context, error, stackTrace) {
          return Text(
            'Gagal memuat gambar',
            style: Asset.poppins.copyWith(color: Colors.red),
          );
        },
      );
    } else {
      return const SizedBox.shrink(); // jika tidak ada foto, tampilkan widget kosong
    }
  }
}
