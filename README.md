# Smart Ahwa Manager ☕

A **Flutter mobile application** that helps a traditional Cairo coffee shop owner manage orders in a simple and modern way.  
The app simulates a small-scale point-of-sale system where the owner can add, track, and complete orders while also generating useful reports.  

Unlike a typical demo app, this project highlights **object-oriented design**, **SOLID principles**, and a **reactive UI flow**.  

---

## ✨ Core Features  

- **Order Management**  
  - Add new orders with customer name, drink choice, and special instructions.  
  - View all **pending** and **completed** orders in separate screens.  
  - Mark orders as *Completed* with one tap.  

- **Reporting**  
  - Shows **total number of orders** for the day.  
  - Highlights the **most popular drink** ordered.  

- **User-Friendly Dashboard**  
  - Clean cards for Pending & Completed orders.  
  - Floating action button to add a new order instantly.  

---

## 🏛 Design & Architecture  

### 1. **Drink Hierarchy**  
- We defined an abstract `Drink` class (with fields like `name` and `price`).  
- Concrete drinks such as **Shai**, **Turkish Coffee**, and **Hibiscus Tea** extend this base class.  

👉 This demonstrates the **Open-Closed Principle (OCP)**:  
You don’t need to modify existing code to add a new drink; just extend the `Drink` class and the system automatically supports it.  

### 2. **Order & OrderManager**  
- `Order` holds details (customer, drink, notes, status).  
- `OrderManager` is a singleton service that manages a `ValueNotifier<List<Order>>`.  
- UI screens listen to changes with `ValueListenableBuilder` → whenever orders are added/updated, all screens reflect changes instantly.  

👉 This supports **Separation of Concerns**:  
- Data layer (models & services)  
- UI layer (screens & widgets)  

### 3. **Reports**  
- Report logic is separate from order logic.  
- Adding new report types (e.g., revenue per day, busiest hours) won’t require touching order management.  

---

## 🧩 SOLID Principles in Action  

- **SRP (Single Responsibility Principle)**  
  - `Order` only stores data.  
  - `OrderManager` manages business logic.  
  - UI just displays.  

- **OCP (Open-Closed Principle)**  
  - New drinks can be added without touching the existing order logic.  
  - Reports can be extended in the same way.  

- **LSP (Liskov Substitution Principle)**  
  - Any subclass of `Drink` can replace the base type `Drink` in an `Order` without breaking code.  

- **DIP (Dependency Inversion Principle)**  
  - UI doesn’t depend on concrete lists, but on the abstraction (`ValueNotifier<List<Order>>`).  

---

## 🚀 How to Run
git clone https://github.com/mazenanter/Ahwa-Manager.git
cd smart_ahwa_manager
## Install dependencies
flutter pub get
## Run the app on an emulator or real device
flutter run

