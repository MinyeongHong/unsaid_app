import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final double height;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextLeadingDistribution? leadingDistribution;

  const NormalText({
    Key? key,
    this.margin,
    required this.title,
    this.fontWeight = FontWeight.normal,
    required this.fontSize,
    required this.color,
    this.height = 1.5,
    this.fontFamily,
    this.decoration,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.leadingDistribution = TextLeadingDistribution.even,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          height: height,
          fontFamily: fontFamily,
          decoration: decoration,
          leadingDistribution: leadingDistribution,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String title;
  final double fontSize;
  final double? spacing;
  final Color color;
  final double height;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextLeadingDistribution? leadingDistribution;

  const MediumText({
    Key? key,
    this.margin,
    required this.title,
    required this.fontSize,
    this.spacing = 0.0,
    required this.color,
    this.height = 1.5,
    this.fontFamily,
    this.decoration,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.leadingDistribution = TextLeadingDistribution.even,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        style: TextStyle(
          letterSpacing: spacing,
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
          color: color,
          height: height,
          fontFamily: fontFamily,
          decoration: decoration,
          leadingDistribution: leadingDistribution,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String title;
  final double fontSize;
  final Color color;
  final double height;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextLeadingDistribution leadingDistribution;

  const BoldText({
    Key? key,
    this.margin,
    required this.title,
    required this.fontSize,
    required this.color,
    this.height = 1.5,
    this.fontFamily,
    this.decoration,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.leadingDistribution = TextLeadingDistribution.even,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: color,
          height: height,
          fontFamily: fontFamily,
          decoration: decoration,
          leadingDistribution: leadingDistribution,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

class UnderlineText extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final double height;
  final String? fontFamily;
  final Color? borderColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextLeadingDistribution? leadingDistribution;

  const UnderlineText({
    Key? key,
    this.margin,
    required this.title,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    this.height = 1.5,
    this.fontFamily,
    this.borderColor,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.leadingDistribution = TextLeadingDistribution.even,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor ?? color,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          height: height,
          fontFamily: fontFamily,
          leadingDistribution: leadingDistribution,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final void Function()? onTap;
  final EdgeInsetsGeometry margin;
  final List<String> texts;
  final List<FontWeight> fontWeights;
  final List<double> fontSizes;
  final List<Color> colors;
  final List<TextDecoration> decorations;
  final double height;
  final int? tapIndex;

  const CustomRichText({
    super.key,
    this.onTap,
    required this.margin,
    required this.texts,
    required this.fontWeights,
    required this.fontSizes,
    required this.colors,
    this.decorations = const [
      TextDecoration.none,
    ],
    this.height = 1.5,
    this.tapIndex,
  }) : assert(texts.length > 0, 'texts.length > 0'),
       assert(texts.length < 5, 'texts.length < 5'),
       assert(fontWeights.length > 0, 'fontWeights.length > 0'),
       assert(fontSizes.length > 0, 'fontSizes.length > 0'),
       assert(colors.length > 0, 'colors.length > 0'),
       assert(decorations.length > 0, 'decorations.length > 0');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text.rich(
        TextSpan(
          recognizer: onTap != null
              ? (TapGestureRecognizer()
                  ..onTap = () {
                    if (tapIndex != null && tapIndex != 0) return;
                    onTap!();
                  })
              : null,
          text: texts[0],
          style: TextStyle(
            fontWeight: fontWeights[0],
            fontSize: fontSizes[0],
            color: colors[0],
            decorationColor: colors[0],
            decoration: decorations[0],
            height: height,
          ),
          children: texts
              .skip(1)
              .toList()
              .asMap()
              .map(
                (index, text) {
                  final List<FontWeight> skipFontWeights = fontWeights.skip(1).toList();
                  final List<double> skipFontSizes = fontSizes.skip(1).toList();
                  final List<Color> skipColors = colors.skip(1).toList();
                  final List<TextDecoration> skipDecorations = decorations.skip(1).toList();

                  FontWeight fontWeight = fontWeights[0];
                  double fontSize = fontSizes[0];
                  Color color = colors[0];
                  TextDecoration decoration = decorations[0];

                  if (skipFontWeights.length > index) {
                    fontWeight = skipFontWeights[index];
                  }

                  if (skipFontSizes.length > index) {
                    fontSize = skipFontSizes[index];
                  }

                  if (skipColors.length > index) {
                    color = skipColors[index];
                  }

                  if (skipDecorations.length > index) {
                    decoration = skipDecorations[index];
                  }

                  return MapEntry(
                    index,
                    TextSpan(
                      recognizer: onTap != null
                          ? (TapGestureRecognizer()
                              ..onTap = () {
                                if (tapIndex != null && tapIndex != index + 1) return;
                                onTap!();
                              })
                          : null,
                      text: text,
                      style: TextStyle(
                        fontWeight: fontWeight,
                        fontSize: fontSize,
                        color: color,
                        decorationColor: color,
                        decoration: decoration,
                      ),
                    ),
                  );
                },
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}

// class CustomDefaultTextStyle extends StatelessWidget {
//   final Widget child;

//   const CustomDefaultTextStyle({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: TextStyle(
//         color: Colors.black,
//       ),
//       textHeightBehavior: TextHeightBehavior(
//         leadingDistribution: TextLeadingDistribution.even,
//       ),
//       child: child,
//     );
//   }
// }
