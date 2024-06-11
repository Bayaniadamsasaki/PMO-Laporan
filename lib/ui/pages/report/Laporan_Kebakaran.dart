// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laporan_masyarakat/config/Asset.dart';
import 'package:laporan_masyarakat/core.dart';
import 'package:laporan_masyarakat/ui/widget/form_info.dart';

class LaporanKebakaran extends StatefulWidget {
  const LaporanKebakaran({super.key});

  @override
  State<LaporanKebakaran> createState() => _LaporanKebakaranState();
}

class _LaporanKebakaranState extends State<LaporanKebakaran> {
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
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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
          "Laporan Kebakaran",
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
                                      'Tap to select an image',
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
                      // Lanjutkan dengan field-field lain yang ada pada kode Anda
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
                          initialValue: 'Kebakaran',
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
                          onChanged: (value) {},
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
                          initialValue: 'Adam',
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
                          onChanged: (value) {},
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
                          initialValue: '085xxxxxx',
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
                          onChanged: (value) {},
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
                          initialValue: 'Watumas, Jawa Tengah',
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
                          onChanged: (value) {},
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
                              borderSide: const BorderSide(
                                color: Asset.colorPrimary,
                              ),
                            ),
                            labelText: 'Isi kejadian',
                            hintStyle: Asset.poppins.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 72,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(9.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Asset.colorPrimary,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Kirim Laporan",
                              style: Asset.poppins.copyWith(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
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
