// import 'dart:io';
//
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:food_app/core/presentation/widgets/image_cropper/cubit/image_cropper_cubit.dart';
// import 'package:food_app/core/presentation/widgets/image_cropper/cubit/image_cropper_state.dart';
// import 'package:food_ui/food_ui.dart';
//
// @RoutePage()
// class CustomImageCropperScreen extends StatefulWidget implements AutoRouteWrapper {
//   const CustomImageCropperScreen({required this.imageFileList, super.key});
//   final List<XFile>? imageFileList;
//
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return BlocProvider(
//       lazy: false,
//       create: (context) => CustomImageCropperCubit(),
//       child: this,
//     );
//   }
//
//   @override
//   State<CustomImageCropperScreen> createState() => _CustomImageCropperScreenState();
// }
//
// class _CustomImageCropperScreenState extends State<CustomImageCropperScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<CustomImageCropperCubit>().initialize(widget.imageFileList);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await context.read<CustomImageCropperCubit>().cropImage(context);
//             },
//             icon: const Icon(Icons.crop),
//           ),
//         ],
//         leading: IconButton(
//           onPressed: () {
//             context.maybePop();
//           },
//           icon: const Icon(Icons.arrow_back),
//           padding: const EdgeInsets.all(Insets.medium),
//           iconSize: Insets.large,
//         ),
//         title: Text(
//           'Crop Image',
//           style: context.textTheme?.paragraph.copyWith(),
//         ),
//       ),
//       body: Center(
//         child: BlocBuilder<CustomImageCropperCubit, CustomImageCropperState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: state.selectedImage != null
//                       ? Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Image.file(
//                             File(state.selectedImage!.path),
//                             fit: BoxFit.contain,
//                           ),
//                         )
//                       : Container(),
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 130,
//                       child: ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: state.imageFileList?.length ?? 0,
//                         itemBuilder: (BuildContext context, int index) {
//                           return InkWell(
//                             onTap: () {
//                               context.read<CustomImageCropperCubit>().selectImage(index);
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   width: 2,
//                                   //color: index == state.selectedIndex ? context.colorScheme.foreground : Colors.transparent,
//                                 ),
//                                 borderRadius: const BorderRadius.all(Radius.circular(4)),
//                               ),
//                               margin: const EdgeInsets.only(right: 5),
//                               padding: const EdgeInsets.all(5),
//                               child: Image.file(
//                                 File(state.imageFileList?[index].path ?? ''),
//                                 height: 200,
//                                 width: 100,
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: AppButton(
//                         text: 'Save',
//                         onPressed: () {
//                           context.read<CustomImageCropperCubit>().saveImages(context);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
