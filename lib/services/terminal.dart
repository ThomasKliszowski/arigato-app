import 'backend.dart';
import 'secureStorage.dart';

class TerminalService {
  static Future<void> ensureTerminalCreated(BackendService backend) async {
    if (!await isTerminalCreated()) {
      final terminal = await backend.terminal.create();
      if (terminal.id == null || terminal.token == null) {
        throw Exception(
            'Something went wrong while registring a new terminal.');
      } else {
        await Future.wait([
          SecureStorage.setTerminalId(terminal.id),
          SecureStorage.setTerminalToken(terminal.token),
        ]);
      }
    }
  }

  static Future<bool> isTerminalCreated() async {
    final terminalInfos = await Future.wait([
      SecureStorage.getTerminalId(),
      SecureStorage.getTerminalToken(),
    ]);
    return terminalInfos.every((v) => v != null);
  }
}
