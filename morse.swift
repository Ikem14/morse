// Dictionary of morse to alphabet values
var letterToMorse = ["A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.", "G": "--.", "H": "....", "I": "..", "J": ".---", "K": "-.-", "L": ".-..", "M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.", "S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-", "Y": "-.--", "Z": "--.."]

// Create dictionary of english alphabet to morse
var morseToLetter: [String: String] = [:]
for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}

// Error message
var invalidError: String = "Invalid input"

// Menu to select between encrypt and decrypt
var option: Int = 0
print("Menu (Response must be either 1 or 2): ")
print("Enter 1 to encrypt English text to Morse code")
print("Enter 2 to decrypt Morse code to English text")
if let input = readLine(strippingNewline: true) {
  // validate input
  if input != "1" && input != "2" {
    print(invalidError)
  } else {
    option = Int(input) ?? 0
  }
} else {
  print(invalidError)
}
switch option {
  case 1:
    print("You have selected to encrypt English text to Morse code")
    // collect user text input
    print("Please enter the message in (English language) that will be converted to morse: ")
    if let input = readLine(strippingNewline: true) {
      // validate input to ensure it is english
      if !validateTextInput(input) {
        break // will send to default case
      }
      print("English -> Morse message translation: \(encrypt(input))")
    } else {
      print(invalidError)
    }
  case 2:
    print("You have selected to decrypt Morse code to English text")
    // collect user text input
    print("Please enter the morse message that will be converted to English: ")
    if let input = readLine(strippingNewline: true) {
      // validate input to ensure it is morse
      if !validateMorseInput(input) {
        break // will send to default case
      }
      print("Morse -> English message translation: \(decrypt(input))")
    } else {
      print(invalidError)
    }
  default:
    print(invalidError)
}

// function to validate text input
func validateTextInput(_ input: String) -> Bool {
  for element in input {
    if element == " " {
      // do nothing
    } else if let _ = letterToMorse[element.uppercased()]{
      // do nothing
    } else {
      print(invalidError)
      print("Offending character: \(element)")
      return false
    }
  } 
  return true
}

// function to validate morse input
func validateMorseInput(_ input: String) -> Bool {
  var morseCodeArray: [String] = []
  var currMorse: String = ""
  for char in input {
    if char != " " {
      currMorse.append(char)
    } else {
      morseCodeArray.append(currMorse)
      // reset currMorse
      currMorse = ""
    }
  }
  print("Morse code array: \(morseCodeArray)")
  for element in morseCodeArray {
    if element == " " || element == "" {
      // do nothing
    } else if let _ = morseToLetter[element]{
      // do nothing
    } else {
      print(invalidError)
      print("Offending character: \(element)")
      return false
    }
  } 
  return true
}

// function to encrypt english to morse
func encrypt(_ englishText: String) -> String {
  var morseText: String = ""
  for element in englishText {
    if let morseChar = letterToMorse[element.uppercased()] {
      morseText.append(morseChar)
      morseText.append(" ")
    } else {
      morseText.append(" ")
    }
  }
  return morseText
}

// function to decrypt morse to english
func decrypt(_ morseCode: String) -> String {
  // decrypt morse to english
  var decodedMessage: String = ""
  var morseCodeArray: [String] = []
  var currMorse: String = ""
  for char in morseCode {
    if char != " " {
      currMorse.append(char)
    } else {
      morseCodeArray.append(currMorse)
      // reset currMorse
      currMorse = ""
    }
  }

  // complete morseCodeArray
  morseCodeArray.append(currMorse)

  // decode
  for morseValue in morseCodeArray {
    if let letterChar = morseToLetter[morseValue] {
      decodedMessage.append(letterChar)
    } else {
      decodedMessage.append(" ")
    }
  }

  return decodedMessage
}