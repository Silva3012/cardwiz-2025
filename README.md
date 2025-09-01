
# CardWiz - 2025

## Overview

This Flutter mobile application allows admins to submit credit card numbers for validation. The system captures, validates, and stores credit card details locally while preventing duplicates. Additionally, it supports credit card scanning for faster input.

## Features

* **Submit Credit Card Details**

  * Card Number
  * Card Type (auto-inferred from card number if possible)
  * CVV
  * Issuing Country
* **Validation & Restrictions**

  * Detect and reject cards from banned countries
  * Configurable list of banned countries
  * Prevent duplicate card submissions
* **Storage & Display**

  * Store validated cards in local storage
  * Display all captured cards during the session
* **Credit Card Scanning**

  * Scan a physical credit card to pre-populate card number and infer card type

## Getting Started

### Prerequisites

* Flutter SDK
* Android Studio / Xcode (for Android/iOS development)
* Device or emulator to run the application

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Silva3012/cardwiz-2025.git
   ```
2. Navigate to the project folder:

   ```bash
   cd cardwiz-2025
   ```
3. Install dependencies:

   ```bash
   flutter pub get
   ```
4. Run the application:

   ```bash
   flutter run
   ```

## Usage

1. Open the app on your device/emulator.
2. Submit a credit card manually or use the card scanner (if you have a physical device).
3. Ensure the issuing country is not on the banned list.
4. View the list of all captured credit cards.

[![Watch Demo](https://img.youtube.com/vi/nHwIoIL7tLU/0.jpg)](https://youtu.be/nHwIoIL7tLU)


## Configuration

* Banned countries can be updated in the app.

## Notes
* The app avoids capturing the same card more than once in a session.


## Author

* \[Ntsika Silvano]

---
