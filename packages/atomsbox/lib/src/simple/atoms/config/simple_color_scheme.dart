import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

const Color primarySeedColor = Color(0xFF192256);
const Color secondarySeedColor = Color(0xFF9C254D);

final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tones: FlexTones.vivid(Brightness.light),
);

final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tones: FlexTones.vivid(Brightness.dark),
);

final simpleColorSchemeLight = schemeLight;

final simpleColorSchemeDark = schemeDark;


// ColorScheme.fromSeed(
//   seedColor: const Color(0xFF304FFE),
//   brightness: Brightness.light,
// );

// ColorScheme.fromSeed(
//   seedColor: const Color(0xFF304FFE),
//   brightness: Brightness.dark,
// );