# Bookify - Your Ultimate Book Discovery App

📚 Discover, Explore, and Enjoy Books Like Never Before!

Bookify is a Flutter-based mobile application designed for book enthusiasts who want a seamless way to browse, search, and manage their reading journey. Whether you're looking for the latest bestsellers, top authors,Bookify delivers a smooth and engaging experience.
 
## Features

### 1. Splash Screen & Onboarding
- Displays an splash screen followed by an onboarding process to introduce users to key features.
 
### 2. User Authentication
- Sign Up & Login & Password Reset using Firebase Authentication
- after registration, users select their reading preferences(preferred language -preferred genres - fav authors).

### 3. Home Screen
- **newest Books**: Fetches newly released books from an external API with pagination .
- **Top Authors**: Displays a list of top authors to explore their works
- **Recently Viewed Books**: Displays the recent books that user has interacted with managed with firebase

### 4. Search Functionality
- Enables users to search for books by **title, author, or category**.
- **Filtering options** allow refining search results by language, book type, or sorting order (newest or most relevant).
- **Recent Searches**: Stores and displays previously searched terms for quick access, managed with Firebase.

### 5. Book Details
- Comprehensive book details, including title, author, description, ratings,pages number ,supported languages.
- Suggests **related books** and includes a **preview** button for an enhanced user experience.

### 6. User Profile Management
- Users can view and update their profile details, including modifying their profile picture (managed via subabase) and resetting their password.

##  Technical Implementation

### Architecture
- **MVVM** architecture ensures separation of concerns, facilitating maintainability and testability.
- **Cubit** is used for efficient  state management.
- **Repository Pattern** abstracts data sourcesfor a cleaner architecture.
- **Either** to efficiently handel errors.

### Data Handling & Integration
- **API Integration**: Books data is fetched using external APIs with pagination 
- **Firebase**: Used for authentication,Firestore for user data and browsing history
- **Supabase**: Manages profile picture storage
##
 - **Pagination** 
- **Dependency Injection** 
- **Responsive Design**

