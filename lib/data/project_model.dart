class ProjectModel {
  final String title;
  final String imagePath;
  final String subtitle;
  final String? githubLink;
  final String? storeLink;

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.githubLink,
    this.storeLink,
  });
}
