## Network Movie App

# Overview
Movie App is an iOS application designed to provide users with a rich movie experience. Using The Movie Database (TMDB) API, the app showcases a variety of movies, including popular, top-rated, upcoming, and now playing titles. Users can also search for movies by name, view detailed information, and watch trailers directly from YouTube. The app leverages SwiftUI for the user interface, Kingfisher for image handling, Combine for reactive programming, AVKit for video playback, and WebKit for displaying web content.

# Features
- Popular Movies: Browse a list of popular movies.
- Top-Rated Movies: Discover highly-rated films.
- Upcoming Movies: Stay updated with upcoming releases.
- Now Playing Movies: View currently playing movies in theaters.
- Search: Find movies by name with a powerful search feature.
- Movie Details: View detailed information about each movie, including release date, rating, and synopsis.
- Trailers: Watch movie trailers embedded from YouTube.
- Smooth and responsive UI with Combine and async/await



# Screenshots
<img width="358" alt="1-Screen Shot " src="https://github.com/user-attachments/assets/14f4fce2-0360-45b5-8d22-71e5b5995485">
<img width="355" alt="2-Screen Shot" src="https://github.com/user-attachments/assets/ae53995a-94d3-4c10-ab82-7236ebd04924">
<img width="357" alt="3-Screen Shot" src="https://github.com/user-attachments/assets/d40fa2ce-a95f-45d5-99e5-259dfc15def1">
<img width="350" alt="4-Screen Shot" src="https://github.com/user-attachments/assets/1b6290f1-4313-4098-8df7-d263d42da1d7">


# Requirements
iOS 14.0+
Xcode 12.0+
Swift 5.3+


# Setup
1-Clone the repository:
<<git clone https://github.com/yourusername/MovieSearchApp.git>>
<<cd NetworkMovieApp>>
2-Open the project in Xcode:
<<open NetworkMovieApp.xcodeproj>>
3-Install dependencies:
This project uses <Kingfisher> for image loading. Ensure you have Cocoapods or Swift Package Manager set up in your project.
4-Replace the API key:
-Go to The Movie Database and create an account.
-Generate an API key.
-Replace My-API in SearchViewModel.swift with your TMDB API key.
5-Build and run the app:
<<xcodebuild -scheme NetworkMovieApp -destination 'platform=iOS Simulator,name=iPhone 12'>>


# Usage
1- Launch the App: Open the Movie App on your device or simulator.
2- Explore Movies: Navigate between tabs to view popular, top-rated, upcoming, and now playing movies.
3- Search for Movies: Use the search feature to find movies by name.
4- View Movie Details: Tap on a movie to see detailed information, including release date, rating, and synopsis.
5- Watch Trailers: Watch movie trailers embedded from YouTube directly within the app.


# Code Structure
Models :
Movie: Represents a movie object with properties such as id, title, posterPath, etc.
MovieDetail: Represents detailed information about a movie.

ViewModels :
SearchViewModel: Handles the search logic, debouncing input, and fetching movies from TMDB.

Views:
SearchView: Main view with a search bar and a list of movie results.
DetailesView: Detailed view for a selected movie.
SearchBarView: Custom search bar component.

# Utilities
JSONNull: A utility class for handling null values in JSON responses.

# Technologies
1- SwiftUI: For building the user interface.
2- Combine: For handling asynchronous data streams and reactive programming.
3- Kingfisher: For efficient image loading and caching.
4- AVKit: For video playback of movie trailers.
5- WebKit: For embedding and displaying web content such as YouTube trailers.
6- TMDB API: For fetching movie data.

# Contributing
1-Fork the repository.
2-Create a new branch (git checkout -b feature/your-feature-name).
3-Commit your changes (git commit -am 'Add some feature').
4-Push to the branch (git push origin feature/your-feature-name).
5-Create a new Pull Request.



## Finally : this is a Demo Video for how application works..


https://github.com/user-attachments/assets/9b99d762-513c-40c0-8594-7ca77e799db9



