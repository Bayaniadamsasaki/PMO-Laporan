// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/medis/medis_datasources.dart';

import 'package:laporan_masyarakat/model/response/laporan/medis_response_model.dart';

part 'medis_event.dart';
part 'medis_state.dart';

class MedisBloc extends Bloc<MedisEvent, MedisState> {
  final MedisDatasources medisDataSources;
  MedisBloc(
    this.medisDataSources,
  ) : super(MedisInitial()) {
    on<FetchMedisData>((event, emit) async {
      emit(MedisLoading());
      final result = await medisDataSources.getMedis();
      result.fold(
        (l) => emit(MedisError(message: l)),
        (r) => emit(MedisLoaded(model: r)),
      );
    });

    on<SaveMedisEvent>((event, emit) async {
      emit(MedisLoading());
      final result = await medisDataSources.createMedis(event.request);
      // print(result);
      result.fold(
        (l) => emit(MedisError(message: l)),
        (r) => emit(MedisLoaded(model: [r])),
      );
    });
  }
}
