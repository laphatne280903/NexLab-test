import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<T> extends Cubit<T> {
  BaseBloc(super.initialState) {
    initState();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }

  void initState() {}
  void dispose() {}
}