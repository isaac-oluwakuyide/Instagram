# Instagram-MVP

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **10** hours spent in total

## User Stories

The following functionality is implemented:

- User can sign up to create a new account using Parse authentication
- User can log in and log out of his or her account
- The current signed in user is persisted across app restarts
- User can take a photo, add a caption, and post it to "Instagram"
- User can view the last 20 posts submitted to "Instagram"
- User can pull to refresh the last 20 posts submitted to "Instagram"
- User can tap a post to view post details, including timestamp and caption

- Run your app on your phone and use the camera to take the photo
- User can use a Tab Bar to switch between a Home Feed tab (all posts) and a Profile tab (only posts published by the current user)

## Notes
### Challenges During Building
- querying Parse for posts
- refactoring code
- configuring TableViewCell headers

##Installation Instructions
To clone the Instagram GitHub repository and run the app on the iPhone 14 Pro Simulator, you can follow these steps:

1. Open Terminal on your Mac.
2. Navigate to the directory where you want to clone the repository.
3. Clone the Flixter repository 
4. Once the repository is cloned, navigate to the project directory:
5. Install the dependencies using Cocoapods. If you don't have Cocoapods installed, you can follow the installation instructions [here](https://cocoapods.org/).
   ```
   pod install
   ```
6. After the dependencies are installed, open the `Flixter.xcworkspace` file in Xcode.
7. In Xcode, select the "Flixter" scheme and choose the iPhone 14 Pro Simulator from the device menu.
8. Click on the Run button or use the shortcut `Cmd + R` to build and run the app on the simulator.


## Credits
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library




Describe any challenges encountered while building the app.
