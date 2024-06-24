// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laporan_masyarakat/data/laporan%20sources/bencana/bencana_datasources.dart';

import 'package:laporan_masyarakat/model/response/laporan/bencana_response_model.dart';

part 'bencana_event.dart';
part 'bencana_state.dart';

class BencanaBloc extends Bloc<BencanaEvent, BencanaState> {
  final BencanaDatasources bencanaDatasources;
  BencanaBloc(
    this.bencanaDatasources,
  ) : super(BencanaInitial()) {
    on<FetchBencanaData>((event, emit) async {
      emit(BencanaLoading());
      final result = await bencanaDatasources.getBencana();
      result.fold(
        (l) => emit(BencanaError(message: l)),
        (r) => emit(BencanaLoaded(model: r)),
      );
    });

    on<SaveBencanaEvent>((event, emit) async {
      emit(BencanaLoading());
      final result = await bencanaDatasources.createBencana(event.request);
      // print(result);
      result.fold(
        (l) => emit(BencanaError(message: l)),
        (r) => emit(BencanaLoaded(model: [r])),
      );
    });
  }
}
