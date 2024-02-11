import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_com_dart/classes/viacep.dart';

// esse decorador fará com que ele
// crie uma classe com o mesmo comportamento
// da nossa classe Viacep
@GenerateMocks([MockViaCEP])
class MockViaCEP extends Mock implements ViaCep {}
