# MovieAlike

A Flutter application for discovering and managing movies and TV shows.

## Features

- Browse popular and upcoming movies
- Search for movies and TV shows
- Movie recommendations
- Watchlist management
- YouTube trailer integration
- Multi-language support

## Development Setup

This project requires API keys for TMDB and YouTube APIs. The keys are configured via `.env` files with obfuscation for security.

### Quick Setup:

1. Copy `env_template` to `.env`
2. Fill in your actual API keys in the `.env` file
3. Generate the env configuration: `flutter pub run build_runner build`
4. Run the app normally: `flutter run`

### Security Features:

- API keys are obfuscated at compile time
- Keys are not stored in source code
- `.env` file is ignored by git
- Production builds are secure

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
