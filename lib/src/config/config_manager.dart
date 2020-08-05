import 'package:optimizely/src/config/datafile_project_config.dart';
import 'package:optimizely/src/config/project_config.dart';

abstract class ProjectConfigManager {
  ProjectConfig getConfig();
}

class StaticProjectConfigManager extends ProjectConfigManager {
  String datafile;
  ProjectConfig config;

  StaticProjectConfigManager(String datafile) {
    this.datafile = datafile;
    this.config = DatafileProjectConfig.fromDatafile(datafile);
  }

  @override
  ProjectConfig getConfig() {
    return this.config;
  }
}
