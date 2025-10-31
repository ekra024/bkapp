<!--
Repository: bkapp
Purpose: Guidance for AI coding agents working on this Flutter app.
-->

# Copilot / AI agent instructions — bkapp

Quick, action-oriented notes to help an AI be productive editing this Flutter app.

- Entry point: `lib/main.dart` — app uses `ProviderScope` (flutter_riverpod) and sets `home: WelcomeScreen()`.
- UI structure: `lib/screens/*` contains top-level screens (e.g. `welcome_screen.dart`, `category_screen.dart`). Widgets are mostly Stateless/Stateful UI in `lib/` and `widgets/`.
- State & DI: project uses `flutter_riverpod` (see `pubspec.yaml`). Use `ProviderScope` and Riverpod providers; prefer Riverpod patterns over classic Provider.
- Data & persistence:
  - HTTP network calls use the `http` package (see `pubspec.yaml`). Look under `lib/services` or `lib/repository` for request logic.
  - Local persistence uses `shared_preferences` — check for keys and initialization before changing storage behaviour.
- Assets: images live under `assets/images/` and are declared in `pubspec.yaml`. Example usage: `Image.asset('assets/images/Exam1.png')` in `lib/screens/welcome_screen.dart`.

Important patterns & conventions (discoverable in code):

- Navigation: uses `Navigator.push(context, MaterialPageRoute(...))` for screen transitions (see `welcome_screen.dart`). Keep routes simple unless adding named routes — follow existing inline MaterialPageRoute style.
- File layout: `lib/models/` for data models, `lib/repository/` for data access, `lib/services/` for HTTP or platform integrations, `lib/screens/` and `lib/widgets/` for UI. Follow these boundaries when adding features.
- Riverpod use: add providers in `lib/providers` or next to feature files. Tests and widgets expect providers to be wrapped by `ProviderScope` during app startup.

Build / run / test workflows (PowerShell / cross-platform):

- Fetch deps: `flutter pub get`
- Run on connected device: `flutter run`
- Run specific device: `flutter run -d <device-id>`
- Hot reload/hot restart: use IDE or `r` / `R` in `flutter run` console.
- Tests: `flutter test` (there is `test/widget_test.dart`).
- Android build artifacts: `android/` and `build/` are present — use `flutter build apk` for release.

Integration points to watch:

- Native platform code exists under `android/`, `ios/`, `windows/`. Avoid changing Gradle or Xcode configs unless necessary.
- Shared preferences keys and stored shapes — changing them may require migration logic.
- Network endpoints are in `lib/services` or `lib/repository` — keep API changes isolated there.

Editing guidance for AI agents:

- Make minimal, local edits that respect file boundaries (UI vs services vs models).
- Preserve Riverpod provider signatures and initialization. If adding a new provider, register it near related feature files and keep tests updated.
- When changing assets, update `pubspec.yaml` only when adding new files/paths. Ensure paths are exact (e.g. `assets/images/Exam1.png`).
- Avoid editing `pubspec.yaml` package versions unless necessary; do not remove `publish_to: 'none'` unless the maintainer intends to publish.

Examples to reference in code:

- Entrypoint and provider scope: `lib/main.dart`
- Welcome UI + navigation: `lib/screens/welcome_screen.dart` (uses `Image.asset` and `Navigator.push`)
- Dependencies listed: `pubspec.yaml` (flutter_riverpod, shared_preferences, http)

If unsure or missing context, ask the maintainer for:

- API base URLs and any API keys (not present in repo). Do not invent secrets.
- Whether to add named routes vs inline MaterialPageRoute (current code uses inline routes).

Finish: create concise changes and run `flutter test` and `flutter run` locally to validate UI/provider integration.

---

If you'd like, I can adjust tone/length or include short examples for adding a Riverpod provider and a simple test.
