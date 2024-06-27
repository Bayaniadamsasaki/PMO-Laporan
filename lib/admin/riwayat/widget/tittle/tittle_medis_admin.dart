import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/admin/riwayat/medis/edit_laporan_medis.dart';
import 'package:laporan_masyarakat/bloc/medis/medis_bloc.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/model/response/laporan/medis_response_model.dart';

class TittleMedisAdmin extends StatefulWidget {
  const TittleMedisAdmin({Key? key, required this.item}) : super(key: key);

  final MedisResponseModel item;

  @override
  _TittleMedisAdminState createState() => _TittleMedisAdminState();
}

class _TittleMedisAdminState extends State<TittleMedisAdmin> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Laporan Medis",
              style: Asset.poppins.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditLaporanMedis(item: widget.item)));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: widget.item.id != null
                      ? () async {
                          bool shouldDelete = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete Data'),
                                content: const Text(
                                    'Apakah Anda yakin ingin menghapus data ini?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: const Text('Tidak'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: const Text('Ya'),
                                  ),
                                ],
                              );
                            },
                          );

                          if (shouldDelete == true) {
                            final result = await context
                                .read<MedisBloc>()
                                .deleteMedis(widget.item.id!.toString());
                            if (!mounted)
                              return; // Check if the widget is still mounted
                            result.fold(
                              (l) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Gagal menghapus data: $l'),
                                  ),
                                );
                              },
                              (r) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data berhasil dihapus'),
                                  ),
                                );
                              },
                            );
                          }
                        }
                      : null,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
