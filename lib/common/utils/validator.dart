class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"((\ *)[wáéíóúñ]+(/ *)+)+");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }

    if (value != null && condition.hasMatch(value)) {
      return "Nome inválido. Digite um nome válido";
    }

    //debugPrint(value);
    return null;
  }

  //Criar Regex
  static String? validatePassword(String? value) {
    final condition = RegExp(r"\b([A-ZÀ-ỹ][-,a-z. ']+[ ]*)+");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }

    if (value != null && !condition.hasMatch(value)) {
      return 'Senha inválida.';
    }

    //debugPrint(value);
    return null;
  }

  //Criar Regex
  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return 'As senhas devem ser iguais.';
    }

    //debugPrint(value);
    return null;
  }
}
