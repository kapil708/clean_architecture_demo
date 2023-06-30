import 'package:clean_architecture_demo/domain/entities/number_trivia.dart';
import 'package:clean_architecture_demo/injection_container.dart';
import 'package:clean_architecture_demo/presentation/logic/bloc/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberTriviaBloc>(
      create: (context) => locator.get<NumberTriviaBloc>(),
      child: const NumberTriviaView(),
    );
  }
}

class NumberTriviaView extends StatelessWidget {
  const NumberTriviaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Number Trivia")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
            builder: (context, state) {
              return Text("Home Screen $state");
            },
          ),

          /*BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
            builder: (context, state) {
              return const MessageDisplay(message: "Start searching");

              if (state is Error) {
                return MessageDisplay(message: state.message);
              } else if (state is Loading) {
                return const LoadingWidget();
              } else if (state is Loaded) {
                return TriviaDisplay(numberTrivia: state.trivia);
              } else {
                return const MessageDisplay(message: "Start searching");
              }
            },
          ),*/
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
          ),
          const SizedBox(height: 20),
          const Column(
            children: [
              Placeholder(fallbackHeight: 40),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Placeholder(fallbackHeight: 40)),
                  SizedBox(width: 20),
                  Expanded(child: Placeholder(fallbackHeight: 40)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class TriviaDisplay extends StatelessWidget {
  final NumberTrivia numberTrivia;

  const TriviaDisplay({super.key, required this.numberTrivia});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Text(
            "${numberTrivia.number}",
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  numberTrivia.text,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
