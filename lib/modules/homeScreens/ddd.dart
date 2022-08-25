// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:la_vie/shared/components/components.dart';
// import 'package:la_vie/shared/cubit/appCubit/cubit.dart';
// import 'package:la_vie/shared/cubit/states.dart';
//
// class SeedsScreen extends StatelessWidget {
//   const SeedsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) => AppCubit()..getDataSeeds(),
//         child: BlocConsumer<AppCubit,AppStates>(
//           listener: (BuildContext context, state) {},
//           builder: (BuildContext context, Object? state) {
//             AppCubit cubit = AppCubit.get(context);
//
//             return GridView.builder(
//               padding: const EdgeInsetsDirectional.only(
//                   start: 20, top: 60, bottom: 30, end: 20),
//               itemCount: 6,
//               clipBehavior: Clip.antiAlias,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1,
//                   mainAxisExtent: 250,
//                   mainAxisSpacing: 60,
//                   crossAxisSpacing: 40),
//               itemBuilder: (context, index) => categeoryItem(),
//             );
//           },
//         ));
//   }
// }
