import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/bloc/register/register_bloc.dart';
// import 'package:laporan_masyarakat/data/api_service.dart';
import 'package:laporan_masyarakat/model/reuqest/register_model.dart';
import 'package:laporan_masyarakat/ui/auth/Sign_In.dart';

import '../../config/Asset.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 140),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Masuk",
                style: Asset.poppins.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 31.0,
              ),
              Image.asset(
                Asset.bannerLogin,
                width: 127,
                height: 136,
              ),
              const SizedBox(
                height: 31.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan nama Anda',
                        hintStyle: Asset.poppins.copyWith(fontSize: 13.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 19),
                      ),
                      keyboardType: TextInputType.name,
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan email Anda',
                        hintStyle: Asset.poppins.copyWith(fontSize: 13.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 19),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan kata sandi Anda',
                        hintStyle: Asset.poppins.copyWith(fontSize: 13.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 19),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 11.0,
                    ),
                    BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterLoaded) {
                          nameController!.clear();
                          emailController!.clear();
                          passwordController!.clear();
                          //navigasi
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Register success"),
                            ),
                          );
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
                              final requestModel = RegisterModel(
                                name: nameController!.text,
                                email: emailController!.text,
                                password: passwordController!.text,
                              );

                              context.read<RegisterBloc>().add(
                                    SaveRegisterEvent(request: requestModel),
                                  );
                            },
                            child: Text(
                              "Daftar",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah memiliki akun?",
                          style: Asset.poppins.copyWith(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SignIn();
                            }));
                          },
                          child: Text(
                            "Masuk",
                            style: Asset.poppins.copyWith(
                                color: Asset.colorSecondary,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
