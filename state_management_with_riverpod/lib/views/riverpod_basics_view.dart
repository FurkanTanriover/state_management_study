import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_with_riverpod/all_providers.dart';

class RiverpodBasicsView extends StatelessWidget {
  const RiverpodBasicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            var title = ref.watch(titleProvider);
            return Text(title);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 250),
            MyText(),
            MyCounterText(),
          ],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bu şekilde ya da...
    // var text = ref.watch(textProvider);
    // return Text(text);

    //bu şekilde değerimizi alabiliriz
    return Text(ref.watch(textProvider));
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sayac = ref.watch(sayacStateProvider);
    return Text(
      sayac.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(sayacStateProvider.state).state++;
      },
      child: const Icon(Icons.add),
    );
  }
}
