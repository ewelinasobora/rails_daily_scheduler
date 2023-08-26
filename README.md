# Event Scheduler

The Event Scheduler Rails App is a powerful tool designed to simplify the process of creating events in your calendar while also taking into account the weather conditions for each day. This app combines the functionality of a calendar application with real-time weather data to help you plan your events effectively.
Features

- Calendar Integration: The app seamlessly integrates with your preferred calendar service, allowing you to create, view, and manage events directly within the app.

- Automated Weather Checks: The app automatically fetches weather data for each day and location, ensuring that you can plan your events with the weather in mind.

- Event Suggestions: Based on the weather forecast, the app can provide event suggestions that align with the expected conditions. For instance, it might suggest outdoor activities on sunny days and indoor activities on rainy days.

- User-Friendly Interface: The intuitive user interface makes it easy to navigate through the app's features, allowing you to manage your events and settings with minimal effort.

- Customization Options: Tailor the app to your preferences by setting your default location.

## Installation

Follow these steps to get the Event Scheduler Rails App up and running:

### Install Dependencies:

    $ bundle install

### Database Setup:

    $ rails db:setup

### Prerequisites

Before you can run the Rails Scheduler App, please make sure you have the following:

    1. SendGrid Account: You will need to have an account on SendGrid to enable email notifications for your scheduled tasks.

    2. SendGrid API Key: Once you have a SendGrid account, generate an API Key with the necessary permissions to send emails. You'll need to set this API Key as an environment variable.

    3. WeatherAPI Account: To provide weather updates for your scheduled activities, sign up for a WeatherAPI account and obtain an API key.

The .env.sample contains empty environment variables for quick reference.. To ensure its proper functionality, refer to the instructions provided above.

Run the app by typing:

    $ bin/dev
