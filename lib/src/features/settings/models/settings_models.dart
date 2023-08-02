import 'package:flutter/material.dart';
import '../controllers/set_controller.dart';
import '../services/settings_service.dart';

final settingsViewModel = SettingsViewModel(SettingsService());

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
