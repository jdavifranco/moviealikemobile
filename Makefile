build_runner:
	dart run build_runner build --delete-conflicting-outputs
clean:
	flutter clean && flutter pub get
intl_gen:
	flutter gen-l10n

format:
	dart format --line-length=120 lib test

analyze:
	flutter analyze --no-pub .

