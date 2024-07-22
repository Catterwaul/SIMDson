# SIMDson

Swift 5.0, released in early 2019, [added "Swiftiness" to a bunch of code](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0229-simd.md) from [the `simd` library](https://developer.apple.com/documentation/accelerate/simd). 

However, there hasn't been further activity that would continue to make SIMD types easier to work with. 

Most importantly, SIMD matrices are not represented in the Swift standard library at all, let alone generically, as vectors are. There are also no protocols that represent only the types that are used as scalars by `SIMD` vectors and matrices. (But sometimes you want `Double`, and sometimes you want `Float`!)

This package adds some of those missing features. And, it adds other utilities not found in Apple's code. 

[Read the documentation here. 📖](https://catterwaul.github.io/SIMDson/documentation/simdson/) 

## Dependency 

SIMDson is in the "Major Version Zero" phase, allowing for rapid development based on community feedback. 

Refer to [this semantic versioning reference](https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html#version) for the following. 

Until reaching 1.0.0…
1. ***Minor*** releases will use the rules laid out for post-1.x ***major*** releases.
2. ***Patch*** releases will use the rules laid out for post-1.x ***minor*** versions, along with standard patch rules.
 
This means you'll need to use the "Up to Next ***Minor*** Version" dependency rule if you need to avoid breaking changes.

## Note on licensing

Because software must be licensed to be practically usable, we release this package under the standard MIT license. This license was chosen for its ubiquity and perceived ease of compliance.

While you can consider this as legally valid as any other use of the MIT license, it does not indicate that we philosophically endorse the use of this license, or any software license we currently know of.
