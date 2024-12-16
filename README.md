# Proto-Germanic Dictionary 📜

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Swift](https://img.shields.io/badge/Swift-5.8-orange.svg)](https://swift.org/)

Welcome to the Proto-Germanic Dictionary app repository! This application is available on macOS, iOS, and iPadOS, bringing the language of Proto-Germanic to life. Whether you're a language enthusiast, historical linguist, or simply curious about ancient Germanic roots, this app offers a wealth of information on Proto-Germanic lemmas, directly sourced from Wiktionary.

## Features ✨

- **Extensive Word Collection**: Discover a large selection of Proto-Germanic words with English translations.
- **Flexible Search & Filter**: Search by Proto-Germanic word or translation, and filter by word type (noun, verb, adjective, etc.).
- **Detailed Word Information**: Each word includes translations, grammatical type, and other details.
- **Cross-platform**: Available on macOS, iOS, and iPadOS.

## Installation 💻

The Old Norse Dictionary app is available for download on the macOS App Store. You can download it directly from the following link:

[Download Old Norse Dictionary from the App Store]()

For developers who want to run the project locally:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Choose the desired target (macOS, iOS, iPadOS, or watchOS).
4. Press the Run button or use the `Cmd+R` shortcut to build and run the project.

## Usage 📖

The Old Norse Dictionary app is designed to be intuitive and easy to use. Here's a quick guide on how to use the app:

1. **Search**: Type a Proto-Germanic word or translation in the search bar. The app also supports search normalization, so entering "e" will find words containing "é" and similar characters.

2. **Filter**: Choose a word type (noun, verb, adjective, etc.) from the filter menu to narrow down results.

3. **View Details**: Tap on any word to see its full details, including grammatical information and translations.

Remember, the app is available on macOS, iOS, iPadOS, and watchOS, so you can explore the Old Norse language on your preferred device.

Stay tuned for more features in future updates!


## Code Structure 🏗️

The codebase is organized into several directories:

```
ProtoGermanicDictionary
│
├── ProtoGermanicDictionaryApp.swift      # Main entry point of the application
│
├── Model                                 # Contains Core Data models
│
├── Services                              # Contains networking and data management services
│   ├── DataManager.swift                  # Handles Core Data persistence and fetching logic
│   ├── NetworkManager.swift               # Manages data fetching from Wiktionary
│   └── WiktionaryParser.swift             # Parses detailed word information from Wiktionary
│
├── View                                  # SwiftUI views for the app's interface
|
├── ViewModel                             # ViewModel layer for managing view data
│
├── Resources
│   └── ProtoGermanicDictionary.xcdatamodeld # Core Data model file
│
├── Assets
│
├── ProtoGermanicDictionaryTests           # Unit test targetsr
│
└── ProtoGermanicDictionaryUITests         # UI test targets

```

## Contributing 🤝

Contributions are warmly welcomed! Here’s how you can help:

1. **Reporting Bugs**: If you find a bug, please open an issue in the GitHub repository. Be sure to include a detailed description of the bug and steps to reproduce it.

2. **Suggesting Features**: Have an idea for a new feature? Open an issue and describe your idea. Be as detailed as possible.

3. **Improving Documentation**: Good documentation makes a great project even better. If you see a place where the documentation could be improved, please open an issue or submit a pull request.

4. **Contributing Code**: If you'd like to contribute code, please fork the repository, make your changes, and submit a pull request. Please make sure your code follows the existing style for consistency.


## License 📜

This project is licensed under the [MIT License](LICENSE).

## Data Source 📚
The Proto-Germanic Dictionary app fetches data from Wiktionary, an open-content dictionary that provides Proto-Germanic lemmas and translations.

## Credits 🙏

The Proto-Germanic Dictionary app was created by [Andrey Skurlatov](https://andskur.github.io), a passionate developer with an interest in languages and history.

This project wouldn't be possible without the following resources:

- [Swift](https://swift.org/): The powerful and intuitive programming language for macOS, iOS, watchOS, and tvOS.
- [OpenAI](https://openai.com/): For providing the AI model that helped in code improvements and documentation.
- [Wiktionary](https://en.wiktionary.org/): For providing the awesome data of Proto-Germanic words.


## Contact 📬

If you have any questions, comments, or suggestions about the Proto-Germanic Dictionary app, we'd love to hear from you! Here's how you can reach us:

- **GitHub**: Open an issue in the [Old Norse Dictionary repository](https://github.com/andskur/ProtoGermanicDictionary/issues) for any bugs, feature suggestions, or questions about the code.
- **Email**: You can reach us at [a.skurlatov@gmail.com](mailto:a.skurlatov@gmail.com) for any other inquiries.

We look forward to hearing from you!
