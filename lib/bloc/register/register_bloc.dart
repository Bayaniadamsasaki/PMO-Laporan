// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:laporan_masyarakat/data/auth/api_service.dart';
import 'package:laporan_masyarakat/model/response/register_response_model.dart';
import 'package:laporan_masyarakat/model/reuqest/register_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDataSources apiService;
  RegisterBloc(
    this.apiService,
  ) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await apiService.register(event.request);
      print(result);
      emit(RegisterLoaded(model: result));
    });
  }
}
