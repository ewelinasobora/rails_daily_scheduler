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

    $ rails db:migrate

### Running app

    $ bin/dev

Local Development over HTTPS using a Self-Signed SSL Certificate
The -b options binds the server to a specific IP. Restarting the server with a binding:

    $ rails s -b 'ssl://localhost:3000?key=localhost.key&cert=localhost.crt'

At this point you can visit https://localhost:3000
