# ![Adivery](https://www.adivery.com/wp-content/uploads/2021/06/logo3.svg) GodotAdiveryPlugin
 Adivery plugin for Godot Game Engine.

## Table of Contents
   - [Features](#features)
   - [Requirements](#requirements)
   - [Installation](#installation)
   - [Usage](#usage)

## Features
   - Support rewarded ads.
   - Support interstitial ads.
   - Support app open ads.
   - Can be used both as Node in editor or in code.
   - It is fully documented.

## Requirements
   - Godot Engine v4.0.3 +.
   - Install Android Bulid Template.
   - Adivery app id.
   - Adivery ad placement id.

## Installation
   1. Download latest version on [release](https://github.com/DexterFstone/GodotAdiveryPlugin/releases/tag/v1.0.0) page.
   2. Extract zip file.
   3. Copy the android and adivery folder to the project directory.
   4. Create a new scene and add new Node, add Adivery Node as child of root. <br>![Add Adivery](images/image%2001.jpg)
   5. In Inspector tab, in Adivery category, fill Configure App ID with yours and check Enable box to configure the Adivery when project is start. <br>![add configure](images/image%2002.jpg)
   6. To show ad you need to check enable box one of following ads in Inspector.
       - Rewarded AD
       - Interstitial AD
       - App Open AD
    ![check ads](images/image%2003.jpg)

   7. Save scene Global and add it to autoload. <br>![autoload](images/image%2004.jpg)

## Usage
   1. Show rewarded ad or interstitial ad
  ```gdscript
  func _on_button_pressed():
      Global.adivery.show_ad([Placement ID])
  ```
  2. Show app open ad
  ```gdscript
  func _on_button_pressed():
      Globla.adivery.show_app_open_ad([Placement ID])
  ```