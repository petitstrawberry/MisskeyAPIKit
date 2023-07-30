# MisskeyAPIKit

Misskey API client for Swift

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/petitstrawberry/MisskeyAPIKit", from: "0.1.0")
  ],
```

## Usage

### Initialize

```swift
let misskey = MisskeyAPI(
    baseURL: "https://mi.example.com",
    credentials: .init(accessToken: "access_token")
)
```

### Create a note

```swift
let createdNote = try await misskey.notes.create(.init(text: "Hello, world!"))
```

### Get timeline

```swift
let notes: [Note] = try await client.notes.getTimeline(.init(limit: 10))
```
