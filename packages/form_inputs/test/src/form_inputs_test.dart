// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:form_inputs/src/confirmed_password.dart';

void main() {
  group('FormInputs', () {
    test('email with correct format', () {
      const emailAddress = 'testing@gmail.com';
      const email = Email.pure();
      expect(email.validator(emailAddress), isNull);
    });

    test('email with incorrect format', () {
      const emailAddress = 'testing.com';
      const email = Email.pure();

      expect(email.validator(emailAddress), EmailValidationError.invalid);
    });

    test('password minimum 8 characters, 1 letter and 1 number', () {
      const input = 't2345678';
      const passwordValidator = Password.pure();

      expect(passwordValidator.validator(input), isNull);
    });
    test('Incorrect password', () {
      const input = 'TestingLogin';
      const passwordValidator = Password.pure();

      expect(
        passwordValidator.validator(input),
        PasswordValidationError.invalid,
      );
    });
    test('password confirmation', () {
      const input = 't2345678';
      const passwordValidator = Password.pure();
      const passwordConfirmed = ConfirmedPassword.dirty(password: input);

      expect(passwordValidator.validator(input), isNull);
      expect(passwordConfirmed.validator(input), isNull);
    });
    test('incorrect password confirmation', () {
      const input = 't2345678';
      const incorrectInput = 't2345677';
      const passwordValidator = Password.pure();
      const passwordConfirmed = ConfirmedPassword.dirty(password: input);

      expect(passwordValidator.validator(input), isNull);
      expect(
        passwordConfirmed.validator(incorrectInput),
        ConfirmedPasswordValidationError.invalid,
      );
    });
  });
}
