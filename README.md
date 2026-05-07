# dotti

A native macOS (and Windows) desktop application for guided breathing meditation, built with Flutter.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Building for Release](#building-for-release)
  - [Flutter Release Build](#flutter-release-build)
  - [macOS — Creating a DMG Installer](#macos--creating-a-dmg-installer)
- [Design System](#design-system)

---

## Overview

**dotti** is a desktop-first guided breathing meditation app. It offers three breathing techniques, each with synchronized Lottie animations and ambient audio. The app targets macOS and Windows, and is designed for mouse/keyboard interaction with a resizable window.

---

## Features

- Three guided breathing techniques:
  - **4-7-8** — Calms the nervous system and regulates blood pressure
  - **Box Breathing** — Reduces cortisol and lowers heart rate
  - **4-6** — Regulates the nervous system response
- Synchronized Lottie animations and ambient audio via `just_audio`
- Custom pixel-perfect progress slider built with `CustomPaint`
- Animated splash screen with fade transition
- Completion overlay with Lottie celebration animation
- Audio toggle (mute/unmute) during sessions
- Global state management with Riverpod
- Navigation with GoRouter
- The app opens centered at **1024×680 px** with a minimum size of **800×560 px**, enforced via `window_manager`.

---

## Requirements

| Tool       | Version                                     |
| ---------- | ------------------------------------------- |
| Flutter    | 3.x (SDK `^3.11.4`)                         |
| Dart       | `^3.11.4`                                   |
| Xcode      | 15.0 or later (macOS builds)                |
| macOS      | 13.0 Ventura or later (development machine) |
| create-dmg | 1.2.x or later (macOS packaging)            |

> **Note:** iOS and Android targets are not supported. The project is configured exclusively for desktop platforms (macOS and Windows).

---

## Getting Started

### 1. Install dependencies

```bash
flutter pub get
```

### 2. Verify Flutter desktop setup

```bash
flutter doctor
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop
```

### 5. Run in development

```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows
```

### 6. Generating app icons

Icons are configured in `pubspec.yaml` under `flutter_launcher_icons`. To regenerate after changing `assets/icons/logo.png`:

```bash
dart run flutter_launcher_icons
```

This produces the macOS `.icns` icon set inside `macos/Runner/Assets.xcassets/`.

---

## Project Structure

```
lib/
├── main.dart                        # Entry point, window setup, ProviderScope
├── core/
│   └── theme/
│       ├── app_colors.dart          # Brand color palette
│       ├── app_typography.dart      # Poppins-based text styles
│       └── app_theme.dart           # Global MaterialApp ThemeData
├── models/
│   └── meditation.dart              # Meditation model + catalog (3 techniques)
├── providers/
│   └── meditation_provider.dart     # Riverpod: selected meditation state
├── router/
│   └── app_router.dart              # GoRouter: /splash → / → /meditation
├── views/
│   ├── splash_screen.dart           # Animated splash with Lottie + audio
│   ├── home.dart                    # Card grid of available meditations
│   └── meditation_page.dart         # Session page: animation, audio, controls
└── widgets/
    ├── animation_area.dart          # Lottie player with rounded corners
    ├── completion_overlay.dart      # Post-session modal with check animation
    ├── meditation_card.dart         # Home page card (image, title, CTA)
    ├── play_pause_button.dart       # Circular play/pause icon button
    ├── progress_slider.dart         # Custom-painted read-only progress bar
    └── top_bar.dart                 # Session header: back button, title, audio toggle
```

---

## Building for Release

### Flutter Release Build

#### macOS

```bash
flutter build macos --release
```

Output:

```
build/macos/Build/Products/Release/dotti.app
```

#### Windows

```bash
flutter build windows --release
```

Output:

```
build/windows/x64/runner/Release/
```

---

### macOS — Creating a DMG Installer

This project uses [`create-dmg`](https://github.com/create-dmg/create-dmg) to package the macOS release into a distributable DMG.

#### Install create-dmg

```bash
brew install create-dmg
```

#### Build the DMG

Run from the project root after the Flutter release build:

```bash
create-dmg \
  --volname "dotti" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --icon "dotti.app" 175 190 \
  --hide-extension "dotti.app" \
  --app-drop-link 425 190 \
  "build/dotti-macos.dmg" \
  "build/macos/Build/Products/Release/"
```

The output `build/dotti-macos.dmg` is ready to distribute or notarize.

---

## Design System

### Colors (`app_colors.dart`)

| Token           | Hex       | Usage                                 |
| --------------- | --------- | ------------------------------------- |
| `background`    | `#F2F2F2` | App scaffold background               |
| `surface`       | `#FFFFFF` | Cards, buttons, icon containers       |
| `primary`       | `#7C88FF` | Accent, active progress, hover state  |
| `primarySoft`   | `#B2B9FB` | Default button fill, splash gradient  |
| `accent`        | `#FFAE88` | Completion overlay gradient highlight |
| `textPrimary`   | `#3C3C3C` | All body and heading text             |
| `textOnPrimary` | `#FFFFFF` | Text on colored buttons               |

### Typography (`app_typography.dart`)

All text uses the **Poppins** font family, declared in `pubspec.yaml` and applied globally via `AppTheme`. No platform-specific font references exist in widget code.

| Style        | Size | Weight         | Usage                           |
| ------------ | ---- | -------------- | ------------------------------- |
| `heading1`   | 36   | Bold (700)     | Session title (`TopBar`)        |
| `subHeading` | 24   | Medium (500)   | Card titles, completion overlay |
| `body`       | 16   | Regular (400)  | Descriptions, timestamps        |
| `button`     | 16   | SemiBold (600) | Button labels                   |

### Custom Widgets

- **`ProgressSlider`** — Built with `CustomPaint`. Features a 5px track, pill-shaped white thumb with drop shadow, and a lavender-blue (`#7C88FF`) active fill. Display-only (no scrubbing).
- **`PlayPauseButton`** — Circular white button with shadow, toggles `play_arrow_outlined` / `pause` icons.
- **`TopBar`** — Row with circular icon buttons (back, audio toggle) flanking the session title. Does not use Material `AppBar`.
- **`CompletionOverlay`** — Full-screen dimmed modal with a floating card, gradient title, and Lottie checkmark animation.
- **`AnimationArea`** — `LottieBuilder.asset` wrapped in a `ClipRRect` with 12px radius, driven by the session `AnimationController`.
