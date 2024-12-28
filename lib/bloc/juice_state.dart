import 'package:equatable/equatable.dart';
import 'package:sample_q1/models/juice_model.dart';

sealed class JuiceState extends Equatable {
  const JuiceState();
  
  @override
  List<Object> get props => [];
}

final class JuiceInitial extends JuiceState {}

class JuiceLoading extends JuiceState {}


class JuiceLoaded extends JuiceState {
  final List<JuiceModel> juice;

  const JuiceLoaded(this.juice);

  @override
  List<Object> get props => [juice];
}

class JuiceError extends JuiceState {
  final String message;

  const JuiceError(this.message);

  @override
  List<Object> get props => [message];
}
