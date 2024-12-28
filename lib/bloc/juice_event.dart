
import 'package:equatable/equatable.dart';

sealed class JuiceEvent extends Equatable {
  const JuiceEvent();

  @override
  List<Object> get props => [];
}

class LoadJuices extends JuiceEvent{}