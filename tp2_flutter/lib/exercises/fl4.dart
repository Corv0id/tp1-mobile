import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ---------------------------------------------------------------------------
// Exercice FL4 — Découvrir Cubit / BLoC
// CounterCubit : logique + état numérique ; emit() publie un nouvel état ;
// BlocProvider fournit l'instance ; BlocBuilder reconstruit la partie UI.
// Retour : BackButton dans l'AppBar.
// ---------------------------------------------------------------------------

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

   void increment() => emit(state + 1);
   void decrement() => emit(state - 1);
}

class Fl4Screen extends StatelessWidget {
  const Fl4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider fourni au sous-arbre ; BlocBuilder consomme l'état
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter Cubit'), leading: BackButton()),
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Text(
                '$count',
                style: const TextStyle(fontSize: 42),
                 );
             },
           ),
         ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'minus',
              onPressed: () => context.read<CounterCubit>().decrement(),
              child: const Icon(Icons.remove),
             ),
            const SizedBox(width: 12),
            FloatingActionButton(
              heroTag: 'plus',
              onPressed: () => context.read<CounterCubit>().increment(),
              child: const Icon(Icons.add),
             ),
           ],
         ),
       ),
     );
   }
}
