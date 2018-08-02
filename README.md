# Async
provides straight-forward, powerful functions for working with asynchronous.

---

## Table of Contents

- [Installation](#installation)
- [Features](#features)
- [License](#license)

---

## Example

```swift
let stringArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
    ]
    
let _ = stringArray.map { str -> Int? in
      sleep(1)
      return Int(str)
} // 66 seconds

let _ = stringArray.async_map { str -> Int? in
      sleep(1)
      return Int(str)
    } //18 seconds
    
```

---

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Async into your Xcode project using CocoaPods, it in your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!

source "https://github.com/MellonMellon/Specs.git"

target '<Your Target Name>' do
  pod 'Async'
end
```

Then, run the following command:

```bash
$ pod install
```

## Features

### async_map

Extension for Array. allows you to perform an asynchrone map.
iterations represent the number of thread. default is 2

```swift
let intArray = stringArray.async_map(iterations: 5) { str -> Int? in
      sleep(1)
      return Int(str)
    }  // OR stringArray.async_map { return Int($0) }
```

### async_forEach
Extension for Array. allows you to perform an asynchrone forEach.
iterations represent the number of thread. default is 2

```swift
let intArray = stringArray.async_forEach(iterations: 5) { str -> Int? in
      sleep(1)
    } // OR stringArray.async_forEach { _ in sleep(1) }
```

### async_parallel
Perform all tasks in async way. wait for all tasks to be done.
```swift
async_parallel(tasks: 
{
print("hellow task 1")
}, 
{
print("hellow task 2")
}, 
{
  print("hellow task 3")
})
```
---
## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
