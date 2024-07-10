# CustomAirbnb
SwiftUI CustomAirbnb - MVVM, Core Data, Combine and Api Requests. This playground & portfolio app is designed to test my learnings from previous projects and new challenges.
<br/>
<br/>
⚠️⚠️ The project was updated on 06/14/2024 to handle the JSON response from the new version of <a href="https://public.opendatasoft.com/explore/dataset/air-bnb-listings/api/?disjunctive.neighbourhood&disjunctive.column_10&disjunctive.city">OpenDataSoft's API</a>. Check the "newApi" branch for further details and review the commits before merging it to main. ⚠️⚠️
<br/>
<br/>
Video presentation available here: https://shorturl.at/prnAB

##
<p align="center">
<img src="CustomAirbnb/CustomAirbnb/Assets.xcassets/AppIcon.appiconset/customAppLogo.png" alt="App icon" title="App icon" width="150" height="150">
</p>

## This app features 
<ul>
<li><b>MVVM Architecture</b> & Home ViewModel as Environment Object for the whole app</li>
<li><b>API requests using Combine</b></li>
<br/>
<li>Reusable Network Manager</li>
<li>Reusable Local FileManager, to store downloaded images from the API</li>
<li>Reusable SearchBarView that binds to strings and filters results using Combine</li>
<li>Reusable views:</li>
  <ul>
    <li>Circle Button (Animation & View)</li>
    <li>Confirmation Rectangle</li>
    <li>Continue Button</li>
    <li>Dismiss Button</li>
    <li>Divider</li>
    <li>TopBarLeading Arrow</li>
  </ul>
<br/>
<li>Specific modules for downloaded images: Views, ViewModel & DataService</li>
  <li>ViewModifiers extracted to improve modularity</li>
<br/>
  
### HomeView
<li>Shows a list of apartments & user's favorites within the same view, using a transition effect</li>
<li>Displays an empty view if the user hasn't favorited any listing</li>
<li>Sorts the list of apartments with six different criteria, defined in an enum</li>
<li>Filters the list of apartments with five different criteria (FiltersView) + text of SearchBar</li>
<li>Updates the API call with the city selected when the user changes the destination</li>
<li><b>FiltersView</b> for refining the results according to five criteria that the apartment has to meet (guests, beds, bedrooms, bathrooms, price)</li>

<br/>

### InfoView & UploadView
<li><b>InfoView</b> presents info about the app's project</li>
<li><b>UploadView</b> for listing a new apartment in three steps, replicating and improving some of Wallapop's upload screens</li>
  <ul>
    <li>UploadFirstView for selecting the city, includes an animation made with Timer</li>
    <li>UploadSecondView for selecting the neighbourhood of the previously selected city</li>
    <li>UploadThirdView for uploading pictures from device's gallery or taking pictures with device's camera, also for inputing listing's title, description, price, currency, number of guests, beds, bedrooms and bathrooms</li>
  </ul>
<li>Both sheets presented using @ViewBuilder & switch statement</li>
  <br/>
  
### DetailView
<li>Replicates Wallapop's DetailView, including an improved Image Carousel</li>
<li><b>ReportView</b> for reporting listings, notifies DetailView to display a gratitude message to the user</li>
<li><b>BookView</b> for simulating a booking request for the listing, featuring a DatePicker and days & price calculation</li>
<li>Both sheets presented using @ViewBuilder & switch statement</li>
<br/>

### LaunchView
  <li>Includes an animation created with Vortex library</li>
  <br/>
  
### Favorites UX
<li>User can favorite / unfavorite listings with a swipe action in list's row.</li> 
  <li>Alternatively, user can tap a button in the DetailView's toolbar, then a Lottie animation is played to enhance the interaction</li>
<li><b>Core Data</b> to manage listings favorited by user, including a DataService</li>
<br/>

### Custom Navigation View
<li>Custom Header with animated icons and titles</li>
<li>Overrode navigationBarTitles to use Color Theme</li>
<br/>

### Extensions
<li>Binding (Integers to Floats and vice versa)</li>
<li>Double (Converting to a rounded String)</li>
<li>Preview Provider (Object model mocks)</li>
<li>String (Check if number, as String, is greater than zero)</li>
<li>UIApplication (Dismiss keyboard)</li>
<li>View (Overlay's stroke color)</li>
<br/>  

### Additional Features
<li><b>ImageType protocol</b> to handle an array of UIImage & Image</li>
<li><b>ImagePicker UIViewControllerRepresentable</b> to select multiple pictures from gallery</li>
<li><b>ImagePickerCamera UIViewControllerRepresentable</b> to take photos with device's camera
<li>City & ReportReason models with Stub</li>
<li>Dummy data and images are used to handle changes in the JSON response from the new version of OpenDataSoft's API</li>
<li><b>External libraries</b> used in the project: <a href="https://github.com/airbnb/lottie-ios">Lottie</a> and <a href="https://github.com/twostraws/Vortex">Vortex</a></li>
<li>Custom app icon made with Canva & Photopea</li>


## Color Reference

| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| AirRed Color | ![#FF5A60](https://via.placeholder.com/10/ff5a60?text=+) #FF5A60 |
| Secondary Text Color Light Mode | ![373737](https://via.placeholder.com/10/373737?text=+) #373737 |
| Secondary Text Color Dark Mode | ![EBEBEB](https://via.placeholder.com/10/EBEBEB?text=+) #EBEBEB |

## License

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/) [MIT](https://choosealicense.com/licenses/mit/) 

## Screenshots
<div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
    <img src="images/Screenshot 2024-03-05 at 18.43.48.png" alt="Home View" title="Home View" width="200">
    <img src="images/Screenshot 2024-03-05 at 18.44.25.png" alt="Favorites View" title="Favorites View" width="200">
     <img src="images/Screenshot 2024-06-17 at 19.03.27.png" alt="Filters View" title="Filters View" width="200">
  <img src="images/Screenshot 2024-03-05 at 18.48.46.png" alt="Info View" title="Info View " width="200">
</div>   
<div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
  <img src="images/Screenshot 2024-03-05 at 18.45.47.png" alt="Detail View" title="Detail View 1/2" width="200">
    <img src="images/Screenshot 2024-03-05 at 18.46.07.png" alt="Detail View" title="Detail View 2/2" width="200">
    <img src="images/Screenshot 2024-03-05 at 18.46.27.png" alt="Book View" title="Book View" width="200">
    <img src="images/Screenshot 2024-03-05 at 18.59.12.png" alt="Report View" title="Report View" width="200">
 </div> 
 <div style="display: flex; flex-wrap: wrap; justify-content: space-around;">   
    <img src="images/Screenshot 2024-03-05 at 18.47.22.png" alt="Upload View" title="Upload View 1" width="200">
    <img src="images/Screenshot 2024-03-05 at 18.47.34.png" alt="Upload View" title="Upload View 2" width="200">
   <img src="images/Screenshot 2024-06-17 at 19.02.39.png" alt="Upload View" title="Upload View 3.1" width="200">
    <img src="images/Screenshot 2024-03-05 at 18.48.29.png" alt="Upload View" title="Upload View 3.2" width="200">  
 </div>     
