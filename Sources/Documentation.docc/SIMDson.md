# ``SIMDson``

Utilities for working with `SIMD` types, especially in generic contexts.

## Overview

Swift 5.0, released in early 2019, [added "Swiftiness" to a bunch of code](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0229-simd.md) from [the `simd` library](https://developer.apple.com/documentation/accelerate/simd). 

However, there hasn't been further activity that would continue to make SIMD types easier to work with. 

Most importantly, SIMD matrices are not represented in the Swift standard library at all, let alone generically, as vectors are. There are also no protocols that represent only the types that are used as scalars by `SIMD` vectors and matrices. (But sometimes you want `Double`, and sometimes you want `Float`!)

This package adds some of those missing features. And, it adds other utilities not found in Apple's code.

##### Usage Examples

You've got the source code, so aside from reading this documentation, see the **Tests** folder for example usage! 😺

## Topics

- <doc:Vectors>
- <doc:Matrices>
- <doc:Orthotopes>
