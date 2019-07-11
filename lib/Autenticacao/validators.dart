enum FormType{ login, register}

class EmailValidator{
  static String validate (String value){
    return value.isEmpty ? "Email vazio" : null;
  }
}
class PasswordValidator{
  static String validate (String value){
    return value.isEmpty ? "Senha vazia" : null;
  }
}