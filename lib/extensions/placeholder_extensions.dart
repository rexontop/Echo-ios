class EchoExtension {
  final String name;
  final Function action;

  EchoExtension({required this.name, required this.action});
}

List<EchoExtension> sampleExtensions = [
  EchoExtension(
      name: "Sample Extension",
      action: () {
        print("Extension triggered!");
      }),
];
