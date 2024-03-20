# Food GPT: Nutritional Analysis App

## Food GPT App Demo


https://github.com/Krunal-375/food_gpt/assets/72144846/cc8acfdd-f8ad-47f6-bc65-af5a3dec5f78



## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Support](#support)

## Introduction

Food GPT is a Flutter-based application designed to provide users with detailed nutritional analysis of food items. By integrating with the OpenAI API, Food GPT offers a unique way to understand the nutritional content of various foods, including items, fats, proteins, carbs, and calories.

## Features

- **Dark Theme**: A sleek dark theme for a comfortable viewing experience.
- **User-Friendly Interface**: Easy-to-navigate UI that makes it simple to input food items and view their nutritional analysis.
- **Real-Time Analysis**: Seamless integration with the OpenAI API for real-time nutritional analysis.
- **Detailed Information**: Provides comprehensive information on items, fats, proteins, carbs, and calories.

## Installation

1. Clone the repository:
```Shell
git clone https://github.com/Krunal-375/food_gpt.git
```
2. Navigate to the project directory:
```Shell
cd food_gpt
```
3. Install dependencies:
```Shell
flutter pub get
```
4. **Configure API Key and GPT Model Name**: Before running the app, you need to replace the placeholder `apiKey` and `gptModel` with your actual OpenAI API key and the name of the GPT model you're using.
   - Locate the `apiKey` and `gptModel` variables.
   - Replace the placeholder values with your actual API key and GPT model name.
```dart
const apiKey = "your-api-key";
const gptModel = "for-example-gpt-3.5-turbo-0613";
```
5. Run the app:
```Shell
flutter run
```

## Usage

1. Launch the app.
2. Enter a food item in the text box.
3. Click the "Send" button.
4. The app will display the nutritional analysis of the entered food item.

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Support

If you find this project helpful, please consider giving it a star ⭐ on GitHub. Your support helps in maintaining and improving the project.
