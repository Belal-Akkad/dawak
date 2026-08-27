class ProfileEntity {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String phone;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}