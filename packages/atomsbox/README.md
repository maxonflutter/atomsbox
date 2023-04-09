<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

<p align="right">


<p align="center">
<img src="https://raw.githubusercontent.com/maxonflutter/atomsbox/main/packages/atomsbox/screenshots/atomsbox.png?token=GHSAT0AAAAAABVFB3LITLEONBOCSCP5AHJGZBSXIFQ" height="100" alt="Flutter atomsbox Package" />
</p>

<p align="center">
<a href="https://pub.dev/packages/flutter_bloc"><img src="https://img.shields.io/pub/v/flutter_bloc.svg" alt="Pub"></a>
<a href="https://flutter.dev/docs/development/data-and-backend/state-mgmt/options#bloc--rx"><img src="https://img.shields.io/badge/flutter-website-deepskyblue.svg" alt="Flutter Website"></a>
<a href="https://github.com/felangel/bloc"><img src="https://tinyurl.com/bloc-library" alt="Bloc Library"></a>
</p>

---


A curated library of pre-styled, reusable Flutter widgets organized based on Atomic Design principles to build apps at scale.

**Learn more at [atomsbox.com](https://atomsbox.com)!**

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Installation

In your `pubspec.yaml` file within your Flutter Project: 

```yaml
dependencies:
  atomsbox: <latest_version>
```

## Usage

```dart
import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentMode,
      home: const HomeScreen(),
    );
  }
}
```
| Category  	| Component                    	| Example              	|   	|   	|
|-----------	|------------------------------	|----------------------	|---	|---	|
| atoms     	| App Text                     	| https://atomsbox.com 	|   	|   	|
| atoms     	| App Image                    	|                      	|   	|   	|
| atoms     	| App Icon Button              	|                      	|   	|   	|
| atoms     	| App Text Button              	|                      	|   	|   	|
| atoms     	| App Elevated Button          	|                      	|   	|   	|
| atoms     	| App Filled Button            	|                      	|   	|   	|
| atoms     	| App Outlined Button          	|                      	|   	|   	|
| atoms     	| App Card                     	|                      	|   	|   	|
| atoms     	| App Glass                    	|                      	|   	|   	|
| atoms     	| App Gradient Background      	|                      	|   	|   	|
| atoms     	| App Slider                   	|                      	|   	|   	|
| atoms     	| App Text Form Field          	|                      	|   	|   	|
| atoms     	| App Gradient Text            	|                      	|   	|   	|
| atoms     	| App Label                    	|                      	|   	|   	|
| molecules 	| App Expansion Tile           	|                      	|   	|   	|
| molecules 	| App Segmented Button         	|                      	|   	|   	|
| molecules 	| App List Tile                	|                      	|   	|   	|
| molecules 	| App Default Card             	|                      	|   	|   	|
| molecules 	| App User Card                	|                      	|   	|   	|
| molecules 	| App Product Card             	|                      	|   	|   	|
| molecules 	| App Search With Autocomplete 	|                      	|   	|   	|
| organisms 	| App Form                     	|                      	|   	|   	|
| organisms 	| App Grid                     	|                      	|   	|   	|
| organisms 	| App List                     	|                      	|   	|   	|
| organisms 	| App Drawer                   	|                      	|   	|   	|
| organisms 	| App Bottom Nav Bar           	|                      	|   	|   	|
| organisms 	| App Carousel                 	|                      	|   	|   	|
| organisms 	| App Tab                      	|                      	|   	|   	|
| organisms 	| App Audio Player             	|                      	|   	|   	|

## Gallery 

<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://verygood.ventures">
                <img src="https://raw.githubusercontent.com/maxonflutter/atomsbox/main/packages/atomsbox/screenshots/app_extension_tile_example_light.png?token=GHSAT0AAAAAABVFB3LJRIPZ5BMVTZ4TFXOSZBSXOXQ" height="500" alt="atomsbox pre-styled extension tile"/>
                </a>
            </td>           
            <td align="center" style="background-color: white">
                <a href="https://verygood.ventures">
                <img src="https://raw.githubusercontent.com/maxonflutter/atomsbox/main/packages/atomsbox/screenshots/app_form_example_light.png?token=GHSAT0AAAAAABVFB3LJ4UXL64B3RSHLOWNWZBSXO2A" height="500" alt="atomsbox pre-styled form" />
                </a>
            </td>
            <td align="center" style="background-color: white">
                <a href="https://verygood.ventures">
<img src="https://raw.githubusercontent.com/maxonflutter/atomsbox/main/packages/atomsbox/screenshots/app_grid_example_light.png?token=GHSAT0AAAAAABVFB3LJV7P22UN7OGEDKVL4ZBSXO3Q" height="500" alt="atomsbox pre-styled grid" />
                </a>
            </td>
        </tr>
    </tbody>
</table>




## Examples
- [Music App](https://bloclibrary.dev/#/fluttercountertutorial) - an example of how to build a music app UI with atomsbox
- [News App](https://github.com/felangel/bloc/tree/master/examples/flutter_form_validation) - an example of how to build a news app UI with atomsboxform validation.

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
