# Clean Architecture Blog App

This Flutter application demonstrates the implementation of Clean Architecture principles and the BLoC pattern for state management. It's a simple blog app that allows users to view, add, and delete blog posts.

## Project Structure

The project follows the Clean Architecture pattern, divided into three main layers:

1. Domain Layer
2. Data Layer
3. Presentation Layer

### Domain Layer

Located in `lib/domain/`, this layer contains:

- Entities: Core business objects (`lib/domain/entities/`)
- Repositories: Abstract classes defining data operations (`lib/domain/repositories/`)
- Use Cases: Application-specific business rules (`lib/domain/usecases/`)

### Data Layer

Located in `lib/data/`, this layer contains:

- Models: Data models that extend entities (`lib/data/models/`)
- Repositories: Concrete implementations of repository interfaces (`lib/data/repositories/`)
- Data Sources: Classes that interact with external data sources (`lib/data/datasources/`)

### Presentation Layer

Located in `lib/presentation/`, this layer contains:

- Pages: UI screens (`lib/presentation/pages/`)
- Widgets: Reusable UI components (`lib/presentation/widgets/`)
- BLoC: Business Logic Components for state management (`lib/presentation/bloc/`)

## Key Features

1. View a list of blog posts
2. Add new blog posts
3. Delete existing blog posts with confirmation dialog

## Dependencies

- flutter_bloc: For implementing the BLoC pattern
- get_it: For dependency injection
- intl: For date formatting

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run the app using `flutter run`

## Future Enhancements

- Implement blog post editing functionality
- Add data persistence using a local database or cloud storage
- Implement user authentication

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).