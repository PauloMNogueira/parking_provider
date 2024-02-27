import 'package:super_module/services/event.service.dart';

class ObservableEventService extends EventService {
  final Map<String, List<Future<void> Function(Object? data)>> _events = {};

  @override
  void listen(String eventName, Future<void> Function(Object? data) invoke) {
    if (!_events.containsKey(eventName)) {
      _events[eventName] = [invoke];
    } else {
      _events[eventName]!.add(invoke);
    }
  }

  @override
  void emit(String eventName, {Object? data}) {
    if (_events.containsKey(eventName)) {
      for (var eventListener in _events[eventName]!) {
        try {
          eventListener(data);
        } catch (e) {
          // TODO LOG WARNING
          // pass
        }
      }
    }
  }
}
