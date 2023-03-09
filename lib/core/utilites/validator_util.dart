import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ValidatorUtil {
  static AutovalidateMode get validateMode =>
      AutovalidateMode.onUserInteraction;
  static get required => FormBuilderValidators.required();
  static get email => FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]);
  static get name => FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(2),
      ]);
  static get phone => FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(10),
        // FormBuilderValidators.maxLength(12),
      ]);
  static get password => FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(8),
      ]);
}
