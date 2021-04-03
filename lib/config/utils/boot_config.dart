Future<bool> handleBoot() async {
  return Future.delayed(Duration(seconds: 2), () {
    return true;
  });
}
