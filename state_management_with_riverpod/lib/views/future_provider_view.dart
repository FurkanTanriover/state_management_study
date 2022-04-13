import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_with_riverpod/all_providers.dart';
import 'package:state_management_with_riverpod/model/bina_model.dart';

class FutureProviderView extends ConsumerWidget {
  const FutureProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _liste = ref.watch(catFactsProvider(const {
      'limit': 5,
      'max_length': 30,
    }));
    return Scaffold(
      appBar: AppBar(title: const Text("future provider")),
      body: SafeArea(
          child: _liste.when(
              data: (liste) {
                return ListView.builder(
                  itemCount: liste.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        liste[index].fact,
                        style: const TextStyle(fontSize: 20),
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    );
                  },
                );
              },
              error: (err, stack) {
                return Center(
                  child: Text("hata ${err.toString()}"),
                );
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
