# CustomAirbnb
<br/>
SwiftUI CustomAirbnb - MVVM, Core Data, Combine and Api Requests. Freestyle app to test my learnings from previous projects and new challenges.

⚠️ Project in construction ⚠️
<br/>
<br/>
This app features: 
<ul>
<li>MVVM & Environment Object for our Home VM</li>
<li>API request using Combine</li>
<li>Reusable Network Manager</li>
<br/>
<li>Specific modules for downloaded images: Views, ViewModel & DataService</li>
<li>Reusable Local FileManager to store downloaded images from API</li>
<br/>
<li>Reusable SearchBarView that binds to strings and filters results using Combine</li>
<li>Reusable custom Circle Button View, Circle Button Animation, Divider, Dismiss Button & Confirmation Rectangle</li>
<br/>
<li>HomeView shows a list of apartments & user's favorites within the same view, using a transition effect</li>
<li>Empty view shown if user hasn't favorited any listing</li>
<li>DestinationView, InfoView & UploadView sheets presented using @ViewBuilder & switch</li>
<br/>
<li>DetailView that replicates Wallapop's DetailView, including an Image Carousel</li>
<li>ReportView to report listings, notifies DetailView to show a gratitude message to user</li>
<li>BookView to simulate a booking request for the listing, with DatePicker and price calculation</li>
<li>ReportView & BookView sheets presented using @ViewBuilder & switch</li>
<br/>
<li>DestinationView where user chooses destination. It updates the API call with the value selected</li>
<li>InfoView shows info about the app's project</li>
<br/>
<li>Core Data to manage listings favorited by user, including a DataService</li>
<li>Favorites UX: User can favorite / unfavorite listings with a swipe action in list's row or a button in DetailView</li>
</br>
<li>Color Theme</li>
<li>Custom Header for Navigation View, with animated icons and titles</li>
<li>Overrided navigationBarTitles to use Color Theme</li>
<br/>
<li>Extensions for Double (to a rounded String), Preview Provider (Object model mocks), UIApplication (dismiss keyboard)</li>
<li>ImageType protocol to handle an array of UIImage & Image</li>
<li>ViewModifiers extracted for modularity</li>
<li>City & ReportReason models with Stub</li>
<br/>
