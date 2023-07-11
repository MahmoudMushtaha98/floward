class UserModel{
  final String country;
  final String site;
  final String warehouse;
  final String location;
  final String username;
  final String password;

  UserModel(
      {required this.country,
      required this.site,
      required this.warehouse,
      required this.location,
      required this.username,
      required this.password});
}