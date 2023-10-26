# Open AI in Flutter

Open AI
    sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI yang disediakan oleh OpenAI.
    Library ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, web, dan mobile

> Keuntungan dari OpenAI
    1. Gratis
    2. Mudah Dipasang
    3. Dapat digunakan di berbagai perangkat
    4. Jumlah parameter 175 Miliar

> Project Example
    1. MEndapatkan API Key dari Open AI. Mengisi nama API key
    2. MElakukan instalasii package
    3. Melakukan konfigurasi file .env
    4. File Konfigurasi
        import 'package:envied/envied.dart';

        part 'env.g.dart';

            @Envied(path: '.env')
            abstract class Env {
            @EnviedField(varName: 'OPENAI_API_KEY')
            static String apiKey = _Env.apiKey;
        }
    
    5. Melakukan generate code melalui flutetr pub run build_runner build

    6. Membuat variable menyimpan API Key

            
        import 'package:open_ai/env/env.dart';

        String apiKey = Env.apiKey;

    7. Membuat Data Model 

    class ApiModel {
  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;

  ApiModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}

class Choice {
  int index;
  Message message;
  String finishReason;

  Choice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json["index"],
        message: Message.fromJson(json["message"]),
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "finish_reason": finishReason,
      };
}

class Message {
  String role;
  String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}

class Usage {
  int promptTokens;
  int completionTokens;
  int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
