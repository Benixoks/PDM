import 'dart:io';
import 'package:flutter/material.dart';
import '../models/item.model.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  HeroDialogRoute({required this.builder});

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;
}

// class DetailsPage extends StatelessWidget {
//   final Item item;

//   const DetailsPage({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.baseline,
//               textBaseline: TextBaseline.alphabetic,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: Image(
//                       fit: BoxFit.cover,
//                       image: AssetImage(item.url),
//                       width: double.infinity),
//                   // child: Image.file(
//                   //   fit: BoxFit.cover,
//                   //   width: double.infinity,
//                   //   File('lib/assets/images/camisa1.jpg'),
//                   // ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Text(
//               item.description,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
