// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/core/domain/bloc/connectivity_cubit.dart';
// import 'package:food_app/core/domain/bloc/connectivity_state.dart';
// import 'package:food_ui/food_ui.dart';
//
// class OfflineCubitWidget extends StatelessWidget {
//   const OfflineCubitWidget({required this.syncToServerCallback, super.key});
//   final VoidCallback? syncToServerCallback;
//
//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: AppColors.m3White,
//       child: BlocSelector<ConnectivityCubit, ConnectivityState, ConnectivityState>(
//         selector: (state) => state,
//         builder: (_, state) => (state.isOffline || state.isYetToSync)
//             ? OfflineModeBanner(
//                 isForWarning: state.isYetToSync,
//                 syncToServerCallback: syncToServerCallback,
//               )
//             : const SizedBox.shrink(),
//       ),
//     );
//   }
// }
