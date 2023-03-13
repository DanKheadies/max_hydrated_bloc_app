import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

// part 'brightness_state.dart';

class BrightnessCubit extends HydratedCubit<Brightness> {
  BrightnessCubit() : super(Brightness.light);

  void toggleBrightness() {
    emit(state == Brightness.light ? Brightness.dark : Brightness.light);
  }

  @override
  Brightness? fromJson(Map<String, dynamic> json) {
    print(json['brightness']);
    return Brightness.values[json['brightness'] as int];
  }

  @override
  Map<String, dynamic>? toJson(Brightness state) {
    print({'brightness': state.index});
    return <String, int>{'brightness': state.index};
  }
}
