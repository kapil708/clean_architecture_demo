import 'package:clean_architecture_demo/domain/entities/number_trivia.dart';
import 'package:clean_architecture_demo/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_demo/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const int tNumber = 1;
  const NumberTrivia tNumberTrivia = NumberTrivia(text: '1 text', number: 1);

  test(
    'should get trivia from the number from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(1)).thenAnswer((_) async => const Right(tNumberTrivia));

      // act
      final result = await useCase(const Params(number: tNumber));

      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
