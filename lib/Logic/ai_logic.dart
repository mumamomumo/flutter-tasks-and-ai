import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_and_ai/backend/ai_service.dart';
import 'package:uuid/uuid.dart';

class AiLogic extends Cubit<Map<String, String>> {
  AI ai = AI();
  AiLogic() : super(<String, String>{});

  void sendMessage(String message) async {
    emit({...state, "User ${const Uuid().v4()}": message});
    var response = await ai.getResponse(message);
    emit({...state, "AI ${const Uuid().v1()}": response["message"]});
  }

  void clearHistory() {
    ai.clearHistory();
    emit(<String, String>{});
  }
}
