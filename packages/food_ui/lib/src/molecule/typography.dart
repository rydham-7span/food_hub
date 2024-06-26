import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/food_ui.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.paragraph,
    required this.title,
  });

  factory AppTypographyData.regular() => const AppTypographyData(
        title: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontFamily: AppUtils.sofiaSansFont,
          // package: packageName,
        ),
        paragraph: TextStyle(
          fontSize: 20,
          fontFamily: AppUtils.sofiaSansFont,
          // package: packageName,
        ),
      );

  static const packageName = 'food_ui';

  final TextStyle title;
  final TextStyle paragraph;

  @override
  List<Object?> get props => [title, paragraph];
}
