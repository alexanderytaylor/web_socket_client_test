enum Action { subscribe, unsubscribe }

extension ActionToString on Action {
  String action() {
    if (this == Action.subscribe) {
      return 'subscribe';
    } else {
      return 'unsubscribe';
    }
  }
}
