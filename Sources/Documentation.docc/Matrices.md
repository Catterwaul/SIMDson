# Matrices

## Overview

The only matrix types provided by Apple use `Double` and `Float` as scalars. Notably absent is `Float16`.

Apple does not provide matrices as generic structures, or even any related protocols. All of the types here are protocols, which each abstract the two possibilities provided by the scalars. So, for example, `Matrix3x3<Float>` is a *constrained protocol*, not a concrete type like `SIMD3<Float>` is.

However, [the floating point types](doc:FloatingPointScalar) refer to their corresponding matrices as associated types. So, instead, you use the spelling 
```swift
Float.Matrix3x3
``` 
as an alias to the concrete type `float3x3`. While yes, that *looks* more like Swift, the primary purpose of structuring things this way is to be able to use the same generic code for all potential scalar types. 

## Topics

Matrix types names use the "**`C`**`x`**`R`**" suffix, with **C**olumn count coming before **R**ow count.

- ``Matrix``
- ``SquareMatrix``
- ``Matrix2x2``
- ``Matrix3``
- ``Matrix3x2``
- ``Matrix3x3``
