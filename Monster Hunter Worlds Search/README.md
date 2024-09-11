# **Monster Hunter Worlds Search App**

---

### **Project Proposal:**

Do you or anyone you know enjoy playing *Monster Hunter World*? If so, this is the perfect app for you! Welcome to **Monster Hunter Worlds Hunters**. In this app, you can search for any type of monster, location, weapon, and skill, making it a vital companion during your hunts. You can easily search for information while riding your *Palamutes* to track down your next monster.

<h4>Offline Functionality</h4>  
One of the best features of this app is that it works offline. Even if you're in a location without internet access, you can still open this app and search for the gear or equipment you need to make sure you're ready for the next hunt.

<h4>Disclaimer</h4>  
First-time users will need to be connected to the internet in order to download data from the APIs. After the initial download, the app works offline seamlessly.

---

### **Project Insights:**  

During the creation of this app, I was able to hone my UI and networking skills. Working with APIs that return complex objects forced me to reconsider some of my design decisions. Despite the challenges, I successfully implemented multiple network requests without causing any failures, making the app resilient and reliable. The overall experience of building this app has significantly enhanced my technical capabilities.

---

### **Functionality**

The **Monster Hunter Worlds Search App** offers several key features that showcase a variety of SwiftUI concepts from different points in the curriculum.

### Key Features

**Splash Screen**: A visually appealing splash screen welcomes users to the app.  
**Onboarding Screen**: Guides new users and handles the initial data download.  
**Custom App Icon**: A unique app icon tailored for this project.  
**Animations**: At least one animation to enhance the user experience.  
**Scrollable Lists**: Lists and grid views to display monster, weapon, location, and skill data.  
**Navigation**: The app employs `NavigationStack` and `TabView` to handle navigation between different views.  
**Network Calls**: The app makes one or more network calls to download data related to the core functionalities of the app.  
**Offline Mode**: After the initial data download, the app stores data on the device using one or more methods covered (UserDefaults, plist, CoreData, or SwiftData), enabling offline use.  
**Concurrency**: Utilizes modern Swift concurrency to handle multiple tasks effectively.  
**Error Handling**: All network errors are handled appropriately, ensuring smooth app performance.  
**MVVM Architecture**: The app follows the Model-View-ViewModel (MVVM) architectural pattern for clean and scalable code.

#### Concepts Used from Curriculum:

| **Concept** | **Usage** |
| ----------- | --------- |
| **Week 2: Navigation** | The app uses `NavigationStack` to manage the navigation between views, such as Monster List, Location List, and details. |
| **Week 3: Lists** | Displaying monsters, locations, weapons, and skills using List and Grid views. |
| **Week 5: Networking** | Fetching data from APIs and handling responses using URLSession and async/await. |
| **Week 7: Data Persistence** | Storing data locally using CoreData, plist files, and UserDefaults to ensure offline functionality. |
| **Week 9: Swift Modern Concurrency** | Proper use of async/await to ensure smooth and non-blocking network calls. |
| **Week 10: Error Handling** | Network-related errors are handled properly with appropriate alerts for the user. |

---

### Technology Stack

The following iOS frameworks and tools were used in building this app:

#### iOS Frameworks & Tools:

- **SwiftUI**: For building a modern and responsive user interface.
- **Combine**: For managing state and handling asynchronous data streams.
- **Swift Concurrency (async/await)**: For handling network calls and asynchronous tasks.
- **CoreData**: For persistent local storage of downloaded data.
- **Property Lists (Plist)**: For lightweight data storage.
- **UserDefaults**: To store simple key-value data.
- **URLSession**: For making network requests to the APIs.
- **MVVM Architecture**: Ensuring a clean separation of concerns for easy scalability and maintenance.


---

### **APIs Used**

The app integrates with multiple APIs to fetch real-time data for the monsters, locations, weapons, and skills:

<ul>
  <li><b>Monsters API</b>: <a href="https://mhw-db.com/monsters">https://mhw-db.com/monsters</a></li>
  <li><b>Locations API</b>: <a href="https://mhw-db.com/locations">https://mhw-db.com/locations</a></li>
  <li><b>Weapons API</b>: <a href="https://mhw-db.com/weapons">https://mhw-db.com/weapons</a></li>
  <li><b>Skills API</b>: <a href="https://mhw-db.com/skills">https://mhw-db.com/skills</a></li>
</ul>

---

### **Important Notes**
**No Third-Party Libraries**: This app is built without the use of any third-party libraries or frameworks, relying solely on iOS native frameworks to ensure compatibility and maintainability.

---

### **App Preview**

Here is a quick preview of what the app offers:

#### **Monsters Search View**
- Quickly search and filter monsters based on their names, species, and more.

#### **Location Finder**
- Browse and search for various locations, complete with zone counts and camp locations.

#### **Weapon Database**
- Get detailed information about each weapon, including damage, rarity, and attributes.

#### **Skill Lookup**
- Find specific skills and their associated modifiers and effects.
---

By developing this **Monster Hunter Worlds Search App**, I have applied a wide range of concepts and practices from the curriculum, ensuring that the app is functional, efficient, and ready for future updates. I hope this app provides an excellent resource for all Monster Hunter fans out there!
