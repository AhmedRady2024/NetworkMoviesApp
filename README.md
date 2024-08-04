## Network Movie App

# Overview
The Movie Search App is a SwiftUI-based application that allows users to search for movies..
using the TMDB (The Movie Database) API. Users can view movie details, including the title, release date, rating, overview, and more..
The app features a responsive search bar and a detailed view for each movie.


# Features
- Search for movies by name
- View detailed information about each movie
- Display movie posters using Kingfisher
- Watch movie trailers using AVKit and WebKit
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
1-Launch the app on your iOS device or simulator.
2-Use the search bar to type in a movie name.
3-Select a movie from the search results to view its details.
4-Watch trailers by selecting the trailer Link in the detailed view.



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

# Dependencies
Kingfisher: Used for downloading and caching images.
Combine: Used for handling asynchronous events.
AVKit: Used for video playback.
WebKit: Used for displaying web content.


# Contributing
1-Fork the repository.
2-Create a new branch (git checkout -b feature/your-feature-name).
3-Commit your changes (git commit -am 'Add some feature').
4-Push to the branch (git push origin feature/your-feature-name).
5-Create a new Pull Request.

# Acknowledgements
1-TMDB : for providing the movie data API.
2-Kingfisher : for the image downloading and caching library.
3-Combine for asynchronous event handling.
4-AVKit for video playback.
5-WebKit for displaying web content.

## Finally : this is a Demo Video for how application works..


https://github.com/user-attachments/assets/9b99d762-513c-40c0-8594-7ca77e799db9



