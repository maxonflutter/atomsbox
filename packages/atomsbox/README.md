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



<p align="left">
  <a href="https://atomsbox.com">
    <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/atomsbox-logo-white.png?alt=media&token=d572973f-f913-41da-9f42-271d73cac269" height="75" alt="atomsbox"/>
  </a>
</p>

A curated library of pre-styled, reusable Flutter widgets organized based on Atomic Design principles to build apps at scale.

**Learn more at [atomsbox.com](https://atomsbox.com)!**

---



## Getting started
To use any pre-styled component from atomsbox, follow these steps:
1. Add the latest version of the package in your `pubspec.yaml`:
```yaml
dependencies:
  atomsbox: <latest_version>
```

2. To keep atomsbox design, import the package and use the pre-defined theme from the library
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

## Usage

#### Create an AppCardImageAndContentBlock pre-styled component
```dart 
AppCardImageAndContentBlock(
  margin: const EdgeInsets.only(bottom: AppConstants.sm),
  headline: AppText('This is a card'),
  subhead: sampleText,
  actions: [
    AppFilledButton(
        onPressed: () {}, child: AppText('Action 1')),
    AppFilledButton.gradient(
        onPressed: () {}, child: AppText('Action 2')),
  ],
), 
```


<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/app_card_image_and_content_bloc_example.png?alt=media&token=493c7258-878e-4eb1-8f80-9eaa13d59863" height="500" alt="atomsbox pre-styled card"/>
                </a>
            </td>  
        </tr>         
    </tbody>
</table>

#### Create an AppForm pre-styled component
```dart 
AppForm(
  title: AppText('This is a form'),
  description: AppText('This is a form description'),
  formButton: AppFilledButton(
    onPressed: () {},
    child: AppText('Submit'),
  ),
  formItemNames: const ['One', 'Two', 'Three'],
  formItems: [
    AppTextFormField(),
    AppTextFormField(),
    AppTextFormField(),
  ],
),
```


<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/app_form_example.png?alt=media&token=c3c71cb4-7b81-4bed-b4ba-92b0a0c54f76" height="500" alt="atomsbox pre-styled form" />
                </a>
            </td>
        </tr>
    </tbody>
</table>

#### Create an AppTab pre-styled component
```dart 
AppTab(
  tabs: [
    Tab(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Icon(Icons.code), AppText('Atoms')],
      ),
    ),
    Tab(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Icon(Icons.code), AppText('Molecules')],
      ),
    ),
  ],
  children: [
    Column(
      children: [
        AppCard.elevated(
          height: 300,
          width: double.infinity,
          child: Center(child: AppText('Atoms')),
        ),
      ],
    ),
    Column(
      children: [
        AppCard.elevated(
          height: 300,
          width: double.infinity,
          child: Center(child: AppText('Molecules')),
        ),
      ],
    ),
  ],
),
```


<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/app_tab_example.png?alt=media&token=7a356e82-cff1-4efc-8e23-84f2b6a320f1" height="500" alt="atomsbox pre-styled tab" />
                </a>
            </td>
        </tr>
    </tbody>
</table>


## Components & Examples
Contributions are welcome! However, you can also request new components by opening a new issue and describing the desired component: [Request a feature](https://github.com/maxonflutter/atomsbox/issues/new?assignees=&labels=enhancement&template=feature_request.md&title=)

Here is an extensive list of the currently available pre-styled components with their respective examples!

| Category  	| Component                    	|
|-----------	|------------------------------	|
| atoms     	| [App Text](https://atomsbox.com)                     	|
| atoms     	| [App Image](https://atomsbox.com)                 	|
| atoms     	| [App Icon Button](https://atomsbox.com)              	|
| atoms     	| [App Text Button](https://atomsbox.com)              	|
| atoms     	| [App Elevated Button](https://atomsbox.com)          	|
| atoms     	| [App Filled Button](https://atomsbox.com)            	|
| atoms     	| [App Outlined Button](https://atomsbox.com)          	|
| atoms     	| [App Card](https://atomsbox.com)                     	|
| atoms     	| [App Glass](https://atomsbox.com)                    	|
| atoms     	| [App Gradient Background](https://atomsbox.com)      	|
| atoms     	| [App Slider](https://atomsbox.com)                   	|
| atoms     	| [App Text Form Field](https://atomsbox.com)          	|
| atoms     	| [App Gradient Text](https://atomsbox.com)            	|
| atoms     	| [App Label](https://atomsbox.com)                    	|
| molecules 	| [App Expansion Tile](https://atomsbox.com)           	|
| molecules 	| [App Segmented Button](https://atomsbox.com)         	|
| molecules 	| [App List Tile](https://atomsbox.com)                	|
| molecules 	| [App Card With Image And Content Block](https://atomsbox.com)             	|
| molecules 	| [App User Card](https://atomsbox.com)                	|
| molecules 	| [App Product Card](https://atomsbox.com)             	|
| molecules 	| [App Search With Autocomplete](https://atomsbox.com) 	|
| organisms 	| [App Form](https://atomsbox.com)                     	|
| organisms 	| [App Grid](https://atomsbox.com)                     	|
| organisms 	| [App List](https://atomsbox.com)                     	|
| organisms 	| [App Drawer](https://atomsbox.com)                   	|
| organisms 	| [App Bottom Nav Bar](https://atomsbox.com)           	|
| organisms 	| [App Carousel](https://atomsbox.com)                 	|
| organisms 	| [App Tab](https://atomsbox.com)                      	|
| organisms 	| [App Audio Player](https://atomsbox.com)             	|





## Apps

- [Music App](https://bloclibrary.dev/#/fluttercountertutorial) - an example of how to build a music app UI with atomsbox components.

<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/music_app_home_screen.jpg?alt=media&token=4f5adb6c-8126-4b88-a813-557eb4c1b0ef" height="500" alt="atomsbox music-app"/>
                </a>
            </td>  
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/music_app_song_details_screen.jpg?alt=media&token=a1b6492a-0f9c-4caa-8461-25fb77cf74df" height="500" alt="atomsbox music-app"/>
                </a>
            </td> 
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                </a>
            </td>  
        </tr>         
    </tbody>
</table>


- [News App](https://github.com/felangel/bloc/tree/master/examples/flutter_form_validation) - an example of how to build a news app UI with atomsbox components.


<table>
    <tbody>
        <tr>
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/news_app_feed_screen.png?alt=media&token=b1b2cee7-b511-4799-bc08-94a2cea07cb1" height="500" alt="atomsbox news-app"/>
                </a>
            </td> 
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/news_app_category_screen.jpg?alt=media&token=bf25abd9-d55a-4c62-a6f4-a16bfbdbd02f" height="500" alt="atomsbox news-app"/>
                </a>
            </td> 
            <td align="center" style="background-color: white">
                <a href="https://atomsbox.com">
                <img src="https://firebasestorage.googleapis.com/v0/b/atomsbox-8d92a.appspot.com/o/news_app_details_screen.jpg?alt=media&token=27d31e4c-c4b7-4d70-9ea3-77fe1b78a84b" height="500" alt="atomsbox news-app"/>
                </a>
            </td>  
        </tr>         
    </tbody>
</table>



## Contributions
Contributions are welcome! If you find a bug, have a feature request, or would like to improve the package, go ahead and create a new issue:
* [Report a bug](https://github.com/maxonflutter/atomsbox/issues/new?assignees=&labels=bug&template=bug_report.md&title=) 
* [Improve documentation](https://github.com/maxonflutter/atomsbox/issues/new?assignees=&labels=documentation&template=documentation.md&title=docs%3A+)
* [Request a feature](https://github.com/maxonflutter/atomsbox/issues/new?assignees=&labels=enhancement&template=feature_request.md&title=)
* [Optimize the performance of existing components](https://github.com/maxonflutter/atomsbox/issues/new?assignees=&labels=enhancement&template=performance-update.md&title=perf%3A+)
* [Enhance the test suite of the package](https://github.com/maxonflutter/atomsbox/issues/new?assignees=&labels=test&template=test.md&title=test%3A+)


Feel free to get in touch to discuss more, email at: massimo@atomsbox.com