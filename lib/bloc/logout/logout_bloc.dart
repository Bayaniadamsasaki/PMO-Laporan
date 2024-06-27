import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laporan_masyarakat/localstorage/auth_local_storage.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial());

  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is PerformLogout) {
      yield LogoutLoading();
      try {
        await AuthManager.logout(); // Using AuthManager to perform logout
        yield LogoutSuccess();
      } catch (e) {
        yield LogoutFailure(error: e.toString());
      }
    }
  }
}
