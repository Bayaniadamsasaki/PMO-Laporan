import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';
import 'package:laporan_masyarakat/ui/widget/tittle/tittle_kebakaran.dart';

class RiwayatLaporanKebakaran extends StatelessWidget {
  final List<KebakaranResponseModel> data;

  const RiwayatLaporanKebakaran({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        var item = data[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index > 0) const SizedBox(height: 20.0),
            const TittleKebakaran(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nama ?? '',
                    style: Asset.poppins
                        .copyWith(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    item.telepon ?? '',
                    style: Asset.poppins
                        .copyWith(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    item.tanggal?.toIso8601String() ?? '',
                    style: Asset.poppins
                        .copyWith(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    item.lokasi ?? '',
                    style: Asset.poppins
                        .copyWith(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
