enum Role { forward, midfielder, defender, goalkeeper }

class Player {
  Player({required this.id, required this.name, required this.role, required this.price, required this.proj});
  final String id; final String name; final Role role; final double price; final double proj; // projected points
}
