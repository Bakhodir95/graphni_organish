import 'package:flutter/material.dart';
import 'package:graphni_organish/core/utils/constants/graphql_constants.dart';
import 'package:graphni_organish/core/utils/constants/graphql_mutations.dart';
import 'package:graphni_organish/logic/graphql_config.dart';
import 'package:graphni_organish/models/product.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductController extends ChangeNotifier {
  final client = GraphqlConfig.initiliazeClient();

  add(Product product) async {
    await client.value.mutate(
      MutationOptions(
        document: gql(GraphqlMutations().createProduct),
        variables: product.toMap(),
      ),
    );
    notifyListeners();
  }

  get() {
    return QueryOptions(document: gql(GraphqlConstants.fetchProducts));
  }

  update(Product product) async {
    await client.value.mutate(
      MutationOptions(
        document: gql(GraphqlMutations.updateProduct),
        variables: product.toMap(),
      ),
    );
    notifyListeners();
  }

  delete(String productId) async {
    await client.value.mutate(
      MutationOptions(
        document: gql(GraphqlMutations.deleteProduct),
        variables: {
          "id": productId,
        },
      ),
    );
    notifyListeners();
  }
}
