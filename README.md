# Morse
## Introduction
Morse is a Swift program that converts English text to Morse code and Morse code to English.

It demonstrates Swift's dictionary, array and switch features. It also includes input validation.

The program accepts input, either in English or Morse code, and converts that to the opposite form (in this context, the opposite of English is Morse and vice versa).

## Examples
### English to Morse code example
```
Menu (Response must be either 1 or 2):
Enter 1 to encrypt English text to Morse code
Enter 2 to decrypt Morse code to English text
1

You have selected to encrypt English text to Morse code
Please enter the message in (English language) that will be converted to morse: 

Secret message from me

English -> Morse message translation: ... . -.-. .-. . -  -- . ... ... .- --. .  ..-. .-. --- --  -- .
```

### Morse code to English example
```
Menu (Response must be either 1 or 2): 
Enter 1 to encrypt English text to Morse code
Enter 2 to decrypt Morse code to English text
2

You have selected to decrypt Morse code to English text
Please enter the morse message that will be converted to English: 

... . -.-. .-. . -  -- . ... ... .- --. .  ..-. .-. --- --  -- .

Morse -> English message translation: SECRET MESSAGE FROM ME
```