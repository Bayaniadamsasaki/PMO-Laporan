// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/bloc/login/login_bloc.dart';
import 'package:laporan_masyarakat/core.dart';
import 'package:laporan_masyarakat/localstorage/auth_local_storage.dart';
import 'package:laporan_masyarakat/model/reuqest/login_model.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController? emailControler;
  TextEditingController? passwordControler;

  @override
  void initState() {
    emailControler = TextEditingController();
    passwordControler = TextEditingController();

    isLogin();
    super.initState();
  }

  void isLogin() async {
    final isTokenExist = await AuthLocalStorage().isTokenExist();
    if (isTokenExist) {
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      }
    }
  }

  @override
  void dispose() {
    emailControler!.dispose();
    passwordControler!.dispose();
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
                        hintText: 'Masukan email Anda',
                        hintStyle: Asset.poppins.copyWith(fontSize: 13.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 19),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailControler,
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
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordControler,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Lupa Kata Sandi?",
                          style: Asset.poppins.copyWith(
                              color: Asset.colorSecondary,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11.0,
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoaded) {
                          emailControler!.clear();
                          passwordControler!.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text('Success Login'),
                            ),
                          );
                          // Navigasi ke HomePage
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomePage();
                              },
                            ),
                          );
                        } else if (state is LoginError) {
                          // Cek apakah respons telah berhasil diperoleh
                          if (state.message != 'Network problem') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.blue,
                                content: Text('Success Login'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Failed Login'),
                              ),
                            );
                          }
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
                              final requestModel = LoginModel(
                                email: emailControler!.text,
                                password: passwordControler!.text,
                              );
                              context
                                  .read<LoginBloc>()
                                  .add(DoLoginEvent(loginModel: requestModel));
                            },
                            child: Text(
                              "Masuk",
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
                          "Belum punya akun?",
                          style: Asset.poppins.copyWith(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RegisterPage();
                            }));
                          },
                          child: Text(
                            "Daftar",
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
