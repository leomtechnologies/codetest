#### ``Bishop's Interview Task```
I was able to implement the task in the following way

I selected the onboarding and signup screens, and added an additional generic homepage.

When the user first opens the app, the user is first greeted with the onboarding screen. T user is then required to sign up and on sign up, the user is taken to the homescreen.

I implemented the shared preferences functionality in the following way;
- When the user opens the app for the first time he goes through the onboarding and then signs up. On sign up the user name and email is saved to shared preferences.
- The user is then greeted with the home page which shows the users name and email and two log out buttons (the log out closes the app).
- With the first log out button (Log out and keep data), once clicked the user exits the app, and once the user opens it again, he is taken straight to the homr page (because of the stored data).
- With the second log out button (Log out and clear data), once clicked the user exits the app, and on reopening, the user is greeted with the onboarding screen (because the shared preference stored information has been cleared) and can then resign up.

Below is the live testing link.

https://appetize.io/app/0u0p423yj7z4vzn6br30hdmqyw
