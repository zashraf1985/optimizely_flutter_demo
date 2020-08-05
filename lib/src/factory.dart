import 'package:optimizely/src/client.dart';

import 'package:optimizely/src/config/config_manager.dart';

class OptimizelyFactory {
  String datafile;

  OptimizelyFactory(this.datafile);

  OptimizelyClient client() {
    OptimizelyClient client = OptimizelyClient();
    client.configManager = StaticProjectConfigManager(datafile);
    return client;
  }
}
