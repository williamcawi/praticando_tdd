import 'package:praticar_1/tdd_intermediario/user_repository.dart';

class AuthService {
  final UserRepository _userRepository;

  AuthService({required UserRepository userRepository})
    : _userRepository = userRepository;

  bool isAdult({required String userId}) {
    try {
      final int age = _userRepository.userAge(userId: userId);
      return age >= 18;
    } catch (e) {
      return false;
    }
  }
}
