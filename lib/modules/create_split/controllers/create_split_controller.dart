class CreateSplitController {
  String eventName = '';

  bool enabledNavigateButton() {
    return eventName.isNotEmpty;
  }

  void setEventName(String value) {
    eventName = value;
  }
}
