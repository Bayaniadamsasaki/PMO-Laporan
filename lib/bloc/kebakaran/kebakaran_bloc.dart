// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/kebakaran/kebakaran_datasources.dart';
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';

part 'kebakaran_event.dart';
part 'kebakaran_state.dart';

class KebakaranBloc extends Bloc<KebakaranEvent, KebakaranState> {
  final KebakaranDataSources kebakaranDataSources;

  KebakaranBloc(this.kebakaranDataSources) : super(KebakaranInitial()) {
    on<FetchKebakaranData>((event, emit) async {
      emit(KebakaranLoading());
      final result = await kebakaranDataSources.getKebakaran();
      result.fold(
        (l) => emit(KebakaranError(message: l)),
        (r) => emit(KebakaranLoaded(model: r)),
      );
    });

    on<SaveKebakaranEvent>((event, emit) async {
      emit(KebakaranLoading());
      final result = await kebakaranDataSources.createKebakaran(event.request);
      result.fold(
        (l) => emit(KebakaranError(message: l)),
        (r) {
          // Handling single model response
          emit(KebakaranLoaded(model: [r]));
        },
      );
    });

    on<DeleteKebakaranEvent>((event, emit) async {
      emit(KebakaranLoading());
      final result = await kebakaranDataSources.deleteKebakaran(event.id);
      result.fold(
        (l) => emit(KebakaranError(message: l)),
        (_) => add(FetchKebakaranData()), // Refresh data after successful deletion
      );
    });

    on<UpdateKebakaranEvent>((event, emit) async {
      emit(KebakaranLoading());
      final result = await kebakaranDataSources.updateKebakaran(event.request);
      result.fold(
        (l) => emit(KebakaranError(message: l)),
        (_) => emit(KebakaranLoaded(model: [])), // Emit a specific event for update success
      );
    });
  }
  
  Future<Either<String, String>> deleteKebakaran(String id) async {
    return kebakaranDataSources.deleteKebakaran(id);
  }
}
