class User {
  final int id;
  final String nom;
  final String prenom;
  final String mail;
  final String imagePath;
  final bool isDarkMode;

  const User({
    required this.id,
    required this.imagePath,
    required this.isDarkMode,
    required this.mail,
    required this.nom,
    required this.prenom,
  });
}
