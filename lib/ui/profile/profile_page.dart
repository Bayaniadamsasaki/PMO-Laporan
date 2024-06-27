import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/bloc/logout/logout_bloc.dart';
import 'package:laporan_masyarakat/core.dart';
import 'package:laporan_masyarakat/localstorage/auth_local_storage.dart';// Import your login screen widget here

class ProfilePages extends StatefulWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  Future<String?>? _userNameFuture;

  @override
  void initState() {
    super.initState();
    _userNameFuture = AuthLocalStorage().getName();
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await AuthDataSources().logout(); // Call logout function from service
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Logout success"),
          backgroundColor: Asset.colorPrimary,
        ),
      );
      Navigator.of(context).pushReplacement( // Use pushReplacement to replace current page
        MaterialPageRoute(
          builder: (context) => const SignIn(), // Replace LoginScreen with your actual login screen widget
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to logout: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Asset.colorSecondary,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Profile",
            style: Asset.poppins.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          actions: [
            BlocListener<LogoutBloc, LogoutState>(
              listener: (context, state) {
                if (state is LogoutFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error.toString()),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: IconButton(
                onPressed: () => _logout(context), // Call _logout method with context
                icon: const Icon(
                  Icons.logout,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              FutureBuilder<String?>(
                future: _userNameFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    String userName = snapshot.data ?? 'Unknown';
                    return Container(
                      constraints: const BoxConstraints(
                        maxHeight: 110.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      color: Asset.colorSecondary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716046071/lav8q7oo72hn1kdbtggm.png"),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: Colors.blueGrey[900],
                              child: const Icon(
                                Icons.edit,
                                size: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
