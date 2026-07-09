// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-cache open source project
//
// Copyright (c) 2025 Coen ten Thije Boonkkamp and the swift-cache project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

import Testing

@testable import Cache_Primitives

// MARK: - Test Error

private struct TestError: Swift.Error, Sendable, Equatable {
    let code: Int
}

// MARK: - Tests

@Suite
struct `Cache.Compute Tests` {

    @Test
    func `effect stores key as arguments`() {
        let effect = Cache<String, Int>.Compute<TestError>(key: "test-key")

        #expect(effect.key == "test-key")
        #expect(effect.arguments == "test-key")
    }

    @Test
    func `effect with different key types`() {
        let stringEffect = Cache<String, Int>.Compute<TestError>(key: "key")
        #expect(stringEffect.key == "key")

        let intEffect = Cache<Int, String>.Compute<TestError>(key: 42)
        #expect(intEffect.key == 42)

        struct CustomKey: Hashable, Sendable {
            let id: Int
            let name: String
        }
        let customEffect = Cache<CustomKey, Bool>.Compute<TestError>(
            key: CustomKey(id: 1, name: "test")
        )
        #expect(customEffect.key == CustomKey(id: 1, name: "test"))
    }

    @Test
    func `effect conforms to Effect.Protocol`() {
        let effect = Cache<String, Int>.Compute<TestError>(key: "key")

        // Verify associated types
        let _: String = effect.arguments
        let _: Cache<String, Int>.Compute<TestError>.Value.Type = Int.self
        let _: Cache<String, Int>.Compute<TestError>.Failure.Type = TestError.self
    }
}
