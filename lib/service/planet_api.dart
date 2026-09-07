import 'dart:convert';

import 'package:http/http.dart' as http;

class PlanetChat {
  final String apiKey = "----";
  final String url =
      "https://generativelanguage.googleapis.com/v1beta/interactions";

  String? lastInteractionId;
  String currentPlanet = "Mars";

  String buildPrompt(String planet) {
    return "You are $planet talking to a 10-year-old child who loves science. "
        "Speak in FIRST PERSON as the planet ('I am $planet!'). "
        "Be VERY excited and playful — you LOVE talking about yourself! "
        "Maximum 2 sentences per answer. Use one emoji. "
        "Use fun science comparisons kids understand. "
        "End every answer with a fun question back to the child to keep them curious. "
        "Never say you are an AI.";
  }

  Future<String> askPlanet(String childMessage) async {
    Map<String, dynamic> body = {
      "model": "gemini-3.8-flash",
      "system_instruction": buildPrompt(currentPlanet),
      "input": childMessage,
      if (lastInteractionId != null)
        "previous_interaction_id": lastInteractionId,
      "generation_config": {
        "max_output_tokens": 300,
        "temperature": 0.9,
        "thinking_level": "low",
      },
    };

    var response = await http.post(
      Uri.parse(url),
      headers: {"x-goog-api-key": apiKey, "Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      return "Oops! Try again 🛸 (${response.statusCode})";
    }

    var data = jsonDecode(response.body);
    lastInteractionId = data["id"];
    return data["steps"][1]["content"][0]["text"].toString();
  }

  void switchPlanet(String planet) {
    currentPlanet = planet;
    lastInteractionId = null;
  }
}

void main() async {
  var chat = PlanetChat();

  print("Q1: How big are you?");
  print(await chat.askPlanet("How big are you?"));

  print("\nQ2: And do you have moons?");
  print(await chat.askPlanet("And do you have moons?"));

  chat.switchPlanet("Jupiter");
  print("\nQ3 (Jupiter): Do you have moons too?");
  print(await chat.askPlanet("Do you have moons too?"));
}
