# Gemini Project Guidelines: WhisperrAuth

This document provides a set of guidelines for interacting with and modifying the WhisperrAuth codebase.

## 1. Core Technologies

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** `provider`
- **Backend:** Appwrite (for authentication and data)
- **Animations:** `flutter_animate`

## 2. Project Structure

The `lib` directory is organized as follows:

- `lib/main.dart`: Application entry point, route definitions, and theme setup.
- `lib/animations/`: Contains custom animation code.
- `lib/logics/`: Houses the business logic.
  - `auth_service.dart`: Manages user authentication state.
- `lib/screens/`: Contains the individual UI screens for the application.
- `lib/types/`: Defines custom data models and types.
- `lib/widgets/`: Holds reusable UI components used across multiple screens.

## 3. Architectural Patterns

- **Service-Based Logic:** Business logic is encapsulated in services (e.g., `AuthService`).
- **Provider for State Management:** The `provider` package is used to manage and propagate state throughout the application.
- **Route Guarding:** The `AuthGuard` widget protects routes that require user authentication.

## 4. Development Workflow

### Running the App

Use the following standard Flutter commands to run the application:

- `flutter pub get` to install dependencies.
- `flutter run` to launch the app on a connected device or emulator.

### Code Style

- Adhere to the existing code style and formatting.
- Use the linter rules defined in `analysis_options.yaml`.

### Commits

- Write clear and concise commit messages.
- Follow conventional commit standards if possible (e.g., `feat:`, `fix:`, `docs:`).
