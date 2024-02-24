# CustomAirbnb
<br/>
SwiftUI CustomAirbnb - MVVM, Core Data, Combine and Api Requests. Freestyle app to test my learnings from previous projects and new challenges.

⚠️⚠️ Project in construction ⚠️⚠️
<br/>
<br/>
This app features: 
<ul>
<li>MVVM & Environment Object for our Home VM</li>
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
  </ul>
<br/>
<li>Core Data to manage listings favorited by user, including a DataService</li>
<li>Favorites UX: User can favorite / unfavorite listings with a swipe action in list's row or a button in DetailView</li>
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
<br/>
