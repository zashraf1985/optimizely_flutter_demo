import 'package:optimizely/src/config/project_config.dart';
import 'dart:io' show File;

abstract class ProjectConfigManager {
  ProjectConfig getConfig();
}

class StaticProjectConfigManager extends ProjectConfigManager {
  File datafile;
  ProjectConfig config;

  StaticProjectConfigManager(File datafile) {
    this.datafile = datafile;
  }

  @override
  ProjectConfig getConfig() {
    // TODO: implement getConfig
    throw UnimplementedError();
  }
}
