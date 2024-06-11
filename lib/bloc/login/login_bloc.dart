import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/core.dart';
import 'package:laporan_masyarakat/localstorage/auth_local_storage.dart';
import 'package:laporan_masyarakat/model/reuqest/login_model.dart';
import 'package:laporan_masyarakat/model/response/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService authDatasource;
  LoginBloc(
    this.authDatasource,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDatasource.login(event.loginModel);
        await AuthLocalStorage().saveToken(result.accessToken);
        print('Token disimpan: ${result.accessToken}');
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        print('Error: $e');
        emit(LoginError(message: 'Network problem'));
      }
    });
  }
}

