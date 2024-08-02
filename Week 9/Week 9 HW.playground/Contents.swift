import Foundation

struct Fact: Codable {
  let fact: String
  let length: Int
}

struct FactAsyncIterator: AsyncIteratorProtocol {
  var currentCount = 0
  
  mutating func next() async throws -> Fact? {
    let url = URL(string: "https://catfact.ninja/fact")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let fact = try JSONDecoder().decode(Fact.self, from: data)
    return fact
  }
}

struct FactAsyncSequence: AsyncSequence {
  typealias Element = Fact
  
  func makeAsyncIterator() -> FactAsyncIterator {
    return FactAsyncIterator(currentCount: 0)
  }
}

func fetchFacts(count: Int) async {
  var iterator = FactAsyncSequence().makeAsyncIterator()
  var fetchedCount = 0
  while fetchedCount < count {
    if let fact = try? await iterator.next() {
      print(fact.fact)
      fetchedCount += 1
    }
  }
}

Task {
  await fetchFacts(count: 10)
}
