import 'package:flutter/material.dart';
import 'package:graphni_organish/logic/graphql_config.dart';

import 'core/app.dart';

void main() {
  final client = GraphqlConfig.initiliazeClient();
  runApp(MainApp(
    client: client,
  ));
}
