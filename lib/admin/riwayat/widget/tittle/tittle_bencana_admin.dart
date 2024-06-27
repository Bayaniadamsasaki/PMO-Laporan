import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/admin/riwayat/bencana/edit_laporan_bencana.dart';
import 'package:laporan_masyarakat/bloc/bencana/bencana_bloc.dart';

import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/model/response/laporan/bencana_response_model.dart';


class TittleBencanaAdmin extends StatefulWidget {
  const TittleBencanaAdmin({Key? key, required this.item}) : super(key: key);

  final BencanaResponseModel item;

  @override
  _TittleBencanaAdminState createState() => _TittleBencanaAdminState();
}

class _TittleBencanaAdminState extends State<TittleBencanaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: Asset.colorBencana,
        borderRadius: const BorderRadius.only(
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
              "Laporan Bencana",
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditLaporanBencana(item: widget.item)));
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
                                .read<BencanaBloc>()
                                .deleteBencana(widget.item.id!.toString());
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
