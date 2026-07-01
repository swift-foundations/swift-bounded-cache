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

extension Cache {
    /// Internal synchronized state.
    @usableFromInline
    struct State {
        @usableFromInline
        var entries: [Key: Entry]

        @inlinable
        init() {
            self.entries = [:]
        }
    }
}
