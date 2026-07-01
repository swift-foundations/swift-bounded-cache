# ``Cache_Primitives``

@Metadata {
    @DisplayName("Cache Primitives")
    @TitleHeading("Swift Primitives")
}

`Cache<Key, Value>` — a thread-safe, compute-if-absent async cache. `value(for:compute:)`
returns a cached value or runs the async compute closure on a miss; concurrent callers for
the same missing key coalesce onto a single in-flight computation.

## Topics
