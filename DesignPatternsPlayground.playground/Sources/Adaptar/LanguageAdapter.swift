import Foundation

public struct AlbumPlayer {
    
    let songNameLoader: SongNameLoader
    
    public init(songNameLoader: SongNameLoader) {
        self.songNameLoader = songNameLoader
    }
    
    
    public func play() async {
        do {
            let songsInAlbum = try await songNameLoader.load()
            print("💿 Album Songs: \n \(songsInAlbum)")
            if let song  = songsInAlbum.first {
                print("▶️ Now Playing: \(song)")
            }
        } catch let (e) {
            print("Error in player, \(e.localizedDescription)")
        }
    }
}

public protocol SongNameLoader {
    func load() async throws -> [String]
}

public struct SongNameLoaderAdapter: SongNameLoader {
    private let loader = LegacySongNameLoader()
    
    public init() {}
    
    public func load() async throws -> [String] {
        try await withCheckedThrowingContinuation { continuation in
            loader.load { result in
                switch result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    
}

public struct LegacySongNameLoader {
    func load(complition: @escaping (Result<[String], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            complition(.success(["Wake Up", "Winning", "The Passenger"]))
        }
    }
}
