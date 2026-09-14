import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'domain/usecases/settings_usecase.dart';
import 'presentation/providers/settings_provider.dart';

void main() {
  final repository = SettingsRepositoryImpl();
  final useCase = SettingsUseCase(repository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider(useCase),
      child: const LabActivityMasterApp(),
    ),
  );
}
