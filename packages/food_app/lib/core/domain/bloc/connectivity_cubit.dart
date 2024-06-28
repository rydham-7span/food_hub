import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/app/config/app_constants.dart';
import 'package:food_app/app/helpers/injection.dart';
import 'package:food_app/app/routes/app_router.dart';
import 'package:food_app/core/domain/bloc/connectivity_state.dart';
import 'package:food_client/food_client.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit()
      : super(const ConnectivityState(
            isOffline: false, isYetToSync: false, isOfflineAvailable: false)) {
    _checkConnectivity();
  }

  final _connectivity = Connectivity();
  bool isOffline = false;
  bool firstInitialization = true;
  bool isOfflineAvailable = false;

  Unit _checkConnectivity() {
    _connectivity.onConnectivityChanged.listen(_checkConnection);
    return unit;
  }

  Future<Unit> _checkConnection(List<ConnectivityResult> event) async {
    await Future.delayed(const Duration(milliseconds: 800)).then((value) async {
      final result = await _connectivity.checkConnectivity();
      if (result.first == ConnectivityResult.none) {
        isOffline = true;
        emit(
          state.copyWith(
            isOffline: isOffline,
            isYetToSync: false,
          ),
        );
      } else {
        isOffline = false;
      }
    });
    if (firstInitialization) {
      firstInitialization = false;
    }
    // if(getIt<AppRouter>().currentPath.split('/').last != 'scanner'){
    //   if (AppConstants.qrViewController != null) {
    //     try{
    //        await Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
    //          if(getIt<AppRouter>().currentPath.split('/').last != 'scanner'){
    //            await AppConstants.qrViewController?.pauseCamera();
    //          }
    //        });
    //     }
    //     catch (e){
    //       log('Camera Exception');
    //     }
    //   }
    // }
    return unit;
  }
}
