import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_q1/bloc/juice_event.dart';
import 'package:sample_q1/bloc/juice_state.dart';
import 'package:sample_q1/models/juice_model.dart';


class JuiceBloc extends Bloc<JuiceEvent, JuiceState> {
  final FirebaseFirestore _firestore;

  JuiceBloc(this._firestore) : super(JuiceInitial()) {
    on<LoadJuices>(_onLoadTransactions);
  }

  Future<void> _onLoadTransactions(
      LoadJuices event, Emitter<JuiceState> emit) async {
    emit(JuiceLoading());
    try {
      final snapshot = await _firestore
          .collection('Juice')
          .get();

      final transactions = snapshot.docs
          .map((doc) => JuiceModel.fromFirestore(doc))
          .toList();

      emit(JuiceLoaded(transactions));
    } catch (e) {
      emit(JuiceError('Error loading transactions: $e'));
    }
  }
}