// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/kebakaran/kebakaran_datasources.dart';
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';

part 'kebakaran_event.dart';
part 'kebakaran_state.dart';

class KebakaranBloc extends Bloc<KebakaranEvent, KebakaranState> {
  final KebakaranDataSources kebakaranDataSources;
  KebakaranBloc(
    this.kebakaranDataSources,
  ) : super(KebakaranInitial()) {
    on<SaveKebakaranEvent>((event, emit) async {
      emit(KebakaranLoading());
      final result = await kebakaranDataSources.createKebakaran(event.request);
      print(result);
      result.fold(
        (l) => emit(KebakaranError(message: l)),
        (r) => emit(KebakaranLoaded(model: r)),
      );
    });
  }
}
