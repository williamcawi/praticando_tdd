String validatePassword(String senha) {
  if (senha.length > 8) {
    return 'A senha tem mais de 8 caracteres!';
  }
  if (senha.length == 8) {
    return 'A senha tem 8 caractares!';
  }
  return 'a senha tem pelo menos de 8 caracteres!';
}
