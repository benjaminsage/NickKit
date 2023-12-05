# NickKit

## Overview
`NickKit` is a SwiftUI package that encapsulates a range of common styles and UI components, designed in collaboration with Nick Sarath. It aims to provide an efficient way to implement consistent and appealing UI elements across your SwiftUI applications.

## Features
- **CapsuleButtonStyle**: A customizable button style with various design options, including foreground/background colors, spacing, height, and font adjustments.
- **Color Extensions**: Predefined color palette with easy-to-use color extensions like `lightGray`, `blurple`, `logoutRed`, etc.
- **Font Extensions**: A set of custom fonts and font sizes, including `lab`, `zapf`, and various standardized sizes for consistent typography across your app.
- **LoadingView**: A SwiftUI view for displaying a loading animation, perfect for asynchronous tasks or data fetching.

## Installation
### Swift Package Manager
Add `NickKit` to your project via Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/[YourGitHubUsername]/NickKit.git", from: "1.0.0")
]
```

## Usage
To use `NickKit` in your SwiftUI project, simply import the package and start incorporating the components:

```swift
import SwiftUI
import NickKit

struct ContentView: View {
    var body: some View {
        Button("Tap Me") {
        	// action here
        }
        .buttonStyle(CapsuleButtonStyle(loading: .constant(false)))
    }
}
```

## Documentation
For more detailed information on how to use each component, please refer to our [Documentation](#).

## Contributing
Contributions to `NickKit` are welcome! Please read our [Contributing Guidelines](#) for more information on how to submit pull requests, report bugs, and suggest enhancements.

## License
`NickKit` is distributed under the Creative Commons Attribution-NonCommercial 4.0 International Public License. For more details, see the [LICENSE.txt](LICENSE.txt) file in the repository.

This license allows for non-commercial use and adaptation with proper attribution, aligning with the unique design contributions of Nick Sarath and the desire to retain certain rights while sharing the package with the wider community.

## Acknowledgments
Special thanks to Nick Sarath for his invaluable contributions to the design aspects of this package.
