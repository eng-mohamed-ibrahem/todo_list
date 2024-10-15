import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/cubit_observer/cubit_observer.dart';
import 'package:todo/core/services/cache/shared_pref_service.dart';
import 'package:todo/root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CubitObserver();
  await SharedPrefService().initService();
  runApp(const RootApp());
}
