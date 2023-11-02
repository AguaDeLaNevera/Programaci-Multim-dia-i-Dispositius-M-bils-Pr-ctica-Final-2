class Persona {
  var name;
  var surname;
  var dateOfBirth;
  var email;

  // Constructor de la classe Persona
  Persona(this.name, this.surname, this.dateOfBirth, this.email);

  // Mètode per mostrar les dades de la persona
  void displayAttributes() {
    String toBeDisplayed =
        'Nom: $name \n Cognom: $surname \n Data de naixement: $dateOfBirth \n Correu electrònic: $email';
    print(toBeDisplayed);
  }

  // Mètode per retornar les dades de la persona com una cadena de text
  String returnAttributes() {
    String toBeDisplayed =
        'Nom: $name\nCognom: $surname\nData de naixement: $dateOfBirth\nCorreu electrònic: $email';
    return toBeDisplayed;
  }
}
