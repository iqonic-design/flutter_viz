import 'dart:collection';

import 'package:flutter_viz/model/widget_model.dart';

class ChangeStack {
  Queue<List<WidgetModel>> undos = new ListQueue();
  Queue<List<WidgetModel>> redos = new ListQueue();

  int? max;

  bool get canRedo => redos.isNotEmpty;

  bool get canUndo => undos.isNotEmpty;

  ChangeStack({this.max});

  void clear() {
    undos.clear();
    redos.clear();
  }

  void redo() {
    if (canRedo) {
      var change = redos.removeFirst();
      undos.addLast(change);
    }
  }

  void undo() {
    if (canUndo) {
      var change = undos.removeLast();
      redos.addFirst(change);
    }
  }
}
