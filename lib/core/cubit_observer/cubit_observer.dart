import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/view_model/home_viewmodel/home_viewmodel.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('BlocObserver: onCreate -- ${bloc.runtimeType}');
    GetIt.I.registerSingleton<HomeViewModel>(bloc as HomeViewModel);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('BlocObserver: onClose -- ${bloc.runtimeType}');
    GetIt.I.unregister<HomeViewModel>();
    super.onClose(bloc);
  }
}
