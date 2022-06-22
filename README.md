# CFirebird

Modulemap to use fbclient library on linux and macOS.
The Firebird library is not provided, you have to install it yourself.

### Linking the Firbird library

#### Using linkerSettings

```swift
let package = Package(
	name: "YourLibrary",
	...
	targets: [
		.target(name: "your-target", linkerSettings: [.unsafeFlags(["-L/usr/local/lib"])])
	]
)
```
The drawback of this is that SwiftPM disable compilation for remote package dependencies that contains unsafe flags.

#### Using pkg-config

Put the following configuration to `/usr/local/lib/pkgconfig/libfbclient.pc`:

```pc
prefix=/Library/Frameworks/Firebird.framework
include_dir=${prefix}/Headers
lib_dir=${prefix}/Libraries

Name: libfbclient
Description: none
Version: <YOUR FIREBIRD VERSION>
Cflags: -I${include_dir}
Libs: -L${lib_dir}
```

Please set your Firebird version in the `Version` field of the pkgconfig file.

## Validate the installation

To ensure that the library if working, execute the tests!

```bash
$ swift test
```

## Usage

In `Package.swift`, add the following depedency

```swift
# package.swift
.package(url: "https://github.com/ugocottin/CFirebird.git", from: "0.1.0")
```

In your swift files, import the Firebird system library

```swift
import CFirebird
```

Enjoy!
