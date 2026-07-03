# iOS application startup

- when the application starts, it reads the contents of Info.plist
- it find the name of main storyboard file in the Info.plist (Main.storyboard)
- it loads the main storyboard file and starts creating the user interface (view controller(s)) configured in the storyboard
- it creates the object(s) of respective view controller classes and attach them to the view controller UI
  - the process of loading view controllers from storyboard is known as unarchiving the storybaord file (which is similar to inflating xml file in android)

# launch a view controller

- using segue
  - using the interface builder to define the navigation in terms of UINavigationSeguae
- using code
  - using present-dismiss
    - to present a view controller

    ```swift
    let storyboard = UIStoryboard(named: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
    present(vc, animated: true)
    ```

    - to dismiss the current view controller

    ```swift
    dismiss(animated: true)
    ```

  - using NavigationController
    - UINavigationController is a subclass of UIViewController used to add navigation in iOS application
    - set the UINavigationController as initial view controller in the application
