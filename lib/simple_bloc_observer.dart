// ignore_for_file: must_call_super

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// BlocObserver => is a base class used to observe the behavior of BLoCs.
// 6 Methods

class SimpleBlocObserver extends BlocObserver {
  //This method is triggered when a BLoC is created.
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create = $bloc');
  }

  // This method is triggered whenever a BLoC's state changes
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change = $change');
  }

  //This method is called when an error occurs in a BLoC.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  //This method is called when a BLoC is closed
  @override
  void onClose(BlocBase bloc) {
    debugPrint('close = $bloc');
  }

  //This method is called when a BLoC transitions from one state to another.
  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
