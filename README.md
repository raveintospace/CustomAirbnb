# CustomAirbnb
<br/>
SwiftUI CustomAirbnb - MVVM, Core Data, Combine and Api Requests. Playground app to test my learnings from previous projects and new challenges.
<br/>
<br/>
⚠️⚠️ Project under construction ⚠️⚠️
<br/>

## This app features 
<ul>
<li>MVVM Architechture & Home ViewModel as Environment Object for the whole app</li>
<li>API request using Combine</li>
<li>Reusable Network Manager</li>
<br/>
<li>Specific modules for downloaded images: Views, ViewModel & DataService</li>
<li>Reusable Local FileManager, to store downloaded images from the API</li>
<br/>
<li>Reusable SearchBarView that binds to strings and filters results using Combine</li>
<li>Reusable views: Circle Button (Animation & View), Confirmation Rectangle, Continue Button, Dismiss Button, Divider & TopBarLeading Arrow</li>
<br/>
<li>HomeView shows a list of apartments & user's favorites within the same view, using a transition effect</li>
<li>An empty view is displayed if the user hasn't favorited any listing</li>
<li>InfoView & UploadView sheets presented using @ViewBuilder & switch</li>
<li>The list of apartments can be sorted with six different criteria, defined in an enum</li>
<li>The list of apartments can be filtered with five different criteria (FiltersView) + text of SearchBar</li>
<li>When the user changes the destination, the API call is updated with the city selected</li>
<br/>
<li>DetailView that replicates Wallapop's DetailView, including an Image Carousel</li>
<li>ReportView for reporting listings, notifies DetailView to display a gratitude message to the user</li>
<li>BookView for simulating a booking request for the listing, featuring a DatePicker and days & price calculation</li>
<li>ReportView & BookView sheets presented using @ViewBuilder & switch</li>
<br/>
<li>FiltersView for refining the results according to five criterias that the apartment has to meet (guests, beds, bedrooms, bathrooms, price)</li>
<li>InfoView presents info about the app's project</li>
<br/>
<li>UploadView for listing a new apartment in three steps, replicating some of Wallapop's upload screens</li>
  <ul>
    <li>UploadFirstView for selecting the city, includes an animation made with Timer</li>
    <li>UploadSecondView for selecting the neighbourhood of the city previously selected</li>
    <li>UploadThirdView for uploading pictures from device's gallery or taking pictures with device's camera, also for inputing listing's title, description, price, currency, number of guests, beds, bedrooms and bathrooms</li>
  </ul>
<br/>
<li>LaunchView that includes an animation created with Vortex library</li>
<li>Core Data to manage listings favorited by user, including a DataService</li>
<li>Favorites UX: User can favorite / unfavorite listings with a swipe action in list's row. Alternatively, user can tap a button in the DetailView's toolbar, then a Lottie animation is played to enhance the interaction</li>
</br>
<li>Color Theme</li>
<li>Custom Header for Navigation View, with animated icons and titles</li>
<li>Overrode navigationBarTitles to use Color Theme</li>
<br/>
<li>Extensions</li>
  <ul>
    <li>Binding (Integers to Floats and vice versa)</li>
    <li>Double (Converting to a rounded String)</li>
    <li>Preview Provider (Object model mocks)</li>
    <li>UIApplication (Dismiss keyboard)</li>
    <li>View (Overlay's stroke color)</li>
  </ul>
<br>  
<li>ImageType protocol to handle an array of UIImage & Image</li>
<li>ViewModifiers extracted for improved modularity</li>
<li>City & ReportReason models with Stub</li>
<li>External libraries used in the project: Lottie and Vortex</li>
</ul>

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
    <img src="images/Screenshot 2024-03-05 at 18.43.48.png" alt="Home View" title="Home View" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.44.25.png" alt="Favorites View" title="Favorites View" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.45.47.png" alt="Detail View" title="Detail View 1/2" width="300">
</div>   
<div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
    <img src="images/Screenshot 2024-03-05 at 18.46.07.png" alt="Detail View" title="Detail View 2/2" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.46.27.png" alt="Book View" title="Book View" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.59.12.png" alt="Report View" title="Report View" width="300">
 </div> 
 <div style="display: flex; flex-wrap: wrap; justify-content: space-around;">   
    <img src="images/Screenshot 2024-03-05 at 18.47.22.png" alt="Upload View" title="Upload View 1" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.47.34.png" alt="Upload View" title="Upload View 2" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.48.29.png" alt="Upload View" title="Upload View 3" width="300">
    <img src="images/Screenshot 2024-03-05 at 18.48.46.png" alt="Info View" title="Info View " width="300">
 </div>     
