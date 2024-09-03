class OnboardinModel {
  String? imagePath;
  String? title;
  String? discreption;
  String? imageNumberPath;
  OnboardinModel({
    required this.imagePath,
    required this.title,
    required this.discreption,
    required this.imageNumberPath,
  });
}

List<OnboardinModel> OnboardinModelList = [
  OnboardinModel(
      imagePath: "assets/images/News Images.png",
      title: " Breaking News Alerts",
      discreption: "Stay informed with real-time updates on global events",
      imageNumberPath: "assets/images/1.png"),
  OnboardinModel(
      imagePath: "assets/images/News Images (1).png",
      title: " Personalized Feed",
      discreption: "Get news tailored to your interests and preferences.",
      imageNumberPath: "assets/images/2.png"),
  OnboardinModel(
      imagePath: "assets/images/News Images (2).png",
      title: " Read Offline",
      discreption: "Save articles and read them anytime, even offline",
      imageNumberPath: "assets/images/3.png"),
];
