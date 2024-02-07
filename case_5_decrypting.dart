import 'dart:convert';

String decodeEmoji(String text, Map<String, String> emojiMapping) {
  RegExp emojiPattern = RegExp(
    "["
    "\u{1F300}-\u{1F5FF}" // symbols & pictographs
    "\u{1F600}-\u{1F64F}" // emoticons
    "\u{1F680}-\u{1F6FF}" // transport & map symbols
    "\u{1F700}-\u{1F77F}" // alchemical symbols
    "\u{1F780}-\u{1F7FF}" // Geometric Shapes Extended
    "\u{1F800}-\u{1F8FF}" // Supplemental Arrows-C
    "\u{1F900}-\u{1F9FF}" // Supplemental Symbols and Pictographs
    "\u{1FA00}-\u{1FA6F}" // Chess Symbols
    "\u{1FA70}-\u{1FAFF}" // Symbols and Pictographs Extended-A
    "\u{2702}-\u{27B0}" // Dingbats
    "\u{24C2}-\u{1F251}" 
    "]+",
    unicode: true,
  );

  List<String> emojis = emojiPattern.allMatches(text).map((match) => match.group(0)!).toList();
  
  for (String emoji in emojis) {
    if (emojiMapping.containsKey(emoji)) {
      text = text.replaceAll(emoji, emojiMapping[emoji]!);
    }
  }
  
  return text;
}

void main() {
  String inputText = "I'm feeling 🤔 about the upcoming ✈️ trip. Will we see 🗺 landmarks?";
  
  Map<String, String> emojiMappingBasic = {
    "🤔": "thinking",
    "✈️": "airplane",
    "🗺": "map",
  };
  
  String decodedTextBasic = decodeEmoji(inputText, emojiMappingBasic);
  print("Decoded text (basic): $decodedTextBasic");
  
  String inputTextAdvance = "🥷! 🎊 for the 🥷 birthday surprise! ☄️ to the party place!";
  
  Map<String, String> emojiMappingAdvanced = {
    "🥷": "Keep it secret",
    "🎊": "celebration",
    "☄️": "Blast off",
  };
  
  String decodedTextAdvanced = decodeEmoji(inputTextAdvance, emojiMappingAdvanced);
  print("Decoded text (advanced): $decodedTextAdvanced");
}
