import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laporan_masyarakat/admin/riwayat/Riwayat_Laporan_admin.dart';
import 'package:laporan_masyarakat/bloc/bencana/bencana_bloc.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/model/response/laporan/bencana_response_model.dart';
import 'package:laporan_masyarakat/ui/widget/tittle/form_info.dart';

class EditLaporanBencana extends StatefulWidget {
  final BencanaResponseModel item;

  const EditLaporanBencana({Key? key, required this.item}) : super(key: key);

  @override
  State<EditLaporanBencana> createState() => _EditLaporanBencanaState();
}

class _EditLaporanBencanaState extends State<EditLaporanBencana> {
  late TextEditingController foto;
  late TextEditingController jenis;
  late TextEditingController nama;
  late TextEditingController telepon;
  late TextEditingController lokasi;
  late TextEditingController tanggal;
  late TextEditingController isi;

  @override
  void initState() {
    super.initState();
    foto = TextEditingController(
        text: widget.item.foto); // Initialize with existing data
    jenis = TextEditingController(text: widget.item.jenis);
    nama = TextEditingController(text: widget.item.nama);
    telepon = TextEditingController(text: widget.item.telepon);
    lokasi = TextEditingController(text: widget.item.lokasi);
    tanggal = TextEditingController(
        text: widget.item.tanggal != null
            ? '${widget.item.tanggal!.day}/${widget.item.tanggal!.month}/${widget.item.tanggal!.year}'
            : ''); // Format the date if it exists
    isi = TextEditingController(text: widget.item.isi);
  }

  @override
  void dispose() {
    foto.dispose();
    jenis.dispose();
    nama.dispose();
    telepon.dispose();
    lokasi.dispose();
    tanggal.dispose();
    isi.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  File? _imageFile;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

        tanggal.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Laporan Bencana",
          style: Asset.poppins.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const FormCostum(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text(
                              "Unggah Bukti Foto Laporan",
                              style: Asset.poppins.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            width: double.infinity,
                            height: 127,
                            decoration: BoxDecoration(
                              color: Asset.colorTertiary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _imageFile == null
                                ? Center(
                                    child: Text(
                                      'Tap untuk memilih gambar',
                                      style: Asset.poppins.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  )
                                : Image.file(
                                    _imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Jenis Laporan',
                              style: Asset.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Asset.colorPrimary,
                                width: 1,
                              ),
                            ),
                          ),
                          controller: jenis,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Nama Pelapor',
                              style: Asset.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Asset.colorPrimary,
                                width: 1,
                              ),
                            ),
                          ),
                          controller: nama,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Telepon Pelapor',
                              style: Asset.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Asset.colorPrimary,
                                width: 1,
                              ),
                            ),
                          ),
                          controller: telepon,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Lokasi Kejadian',
                              style: Asset.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelStyle: Asset.poppins.copyWith(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Asset.colorPrimary,
                                width: 1,
                              ),
                            ),
                          ),
                          controller: lokasi,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Tanggal Kejadian',
                              style: Asset.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          decoration: InputDecoration(
                            hintText: _selectedDate == null
                                ? 'Pilih tanggal'
                                : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                            labelStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Asset.colorPrimary,
                                width: 1,
                              ),
                            ),
                          ),
                          controller: tanggal,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Deskripsi Kejadian',
                              style: Asset.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          minLines: 3,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Asset.colorPrimary),
                            ),
                            labelText: 'Isi kejadian',
                            hintStyle: Asset.poppins.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller: isi,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      BlocConsumer<BencanaBloc, BencanaState>(
                        listener: (context, state) {
                          if (state is BencanaLoaded) {
                            foto.clear();
                            jenis.clear();
                            nama.clear();
                            telepon.clear();
                            lokasi.clear();
                            tanggal.clear();
                            isi.clear();
                            //navigasi
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Asset.colorBencana,
                                content: Text("Laporan Sukses"),
                              ),
                            );

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RiwayatLaporanAdmin()));
                          }
                        },
                        builder: (context, state) {
                          return Container(
                            height: 72,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(9.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Asset.colorPrimary,
                              ),
                              onPressed: () {
                                final requestModel = BencanaResponseModel(
                                  foto: _imageFile != null
                                      ? _imageFile!.path
                                      : widget.item.foto,
                                  jenis: jenis.text,
                                  nama: nama.text,
                                  telepon: telepon.text,
                                  lokasi: lokasi.text,
                                  tanggal: _selectedDate ?? widget.item.tanggal,
                                  isi: isi.text,
                                  id: widget.item.id,
                                );
                                context.read<BencanaBloc>().add(
                                      UpdateBencanaEvent(
                                          request: requestModel),
                                    );
                              },
                              child: Text(
                                "Simpan Perubahan",
                                style: Asset.poppins.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
