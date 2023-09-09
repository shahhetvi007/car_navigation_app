import 'package:bloc/bloc.dart';

// Define your events and states here
abstract class MapEvent {}

abstract class MapState {}

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(super.initialState);
  // Implement your BLoC logic here
}
