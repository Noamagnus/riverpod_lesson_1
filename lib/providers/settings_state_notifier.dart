import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_riverpod/models/settings_model.dart';

final settingSNProvider = StateNotifierProvider<SettingsStateNotifier, Settings>((ref) {
  return SettingsStateNotifier();
});

class SettingsStateNotifier extends StateNotifier<Settings> {
  SettingsStateNotifier() : super(const Settings());

  void showDetails() {
    state=state.copyWith(displayDetails: !state.displayDetails);
  }
}
