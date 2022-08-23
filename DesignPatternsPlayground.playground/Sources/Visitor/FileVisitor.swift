import Foundation

public protocol FileVisitor {
    func visit(_ file: PDFFile)
    func visit(_ file: WordFile)
    func visit(_ file: PhotoshopFile)
}


public struct ExportVisitor: FileVisitor {
    
    public init() {}
    
    public func visit(_ file: PDFFile) {
        print("Exporting ...")
        print("Exported PDF file \(file.name)")
    }
    
    public func visit(_ file: WordFile) {
        print("Exporting ...")
        print("Exported Word file \(file.name) with \(file.pageCount)")
    }
    
    public func visit(_ file: PhotoshopFile) {
        print("Exporting ...")
        print("Exported PS file \(file.name)")
    }
  
}

public struct SupportOSVisitor: FileVisitor {
    
    public init() {}
    
    public func visit(_ file: PDFFile) {
        print("MAC supported")
        print("Win supported")
        print("Linux supported")
    }
    
    public func visit(_ file: WordFile) {
        print("MAC supported")
        print("Win supported")
        print("Linux supported")
    }
    
    public func visit(_ file: PhotoshopFile) {
        print("MAC supported")
        print("Win supported")
        print("Linux NOT supported")
    }
  
}

public protocol FileVisitable {
    func accept(_ visitor: FileVisitor)
}

public struct PDFFile {
    let name: String
    let data: String
    let quality: Double
    
    public init(name: String, data: String, quality: Double) {
        self.name = name
        self.data = data
        self.quality = quality
    }
}


public struct WordFile {
    let name: String
    let data: String
    let pageCount: Int
    
    public init(name: String, data: String, pageCount: Int) {
        self.name = name
        self.data = data
        self.pageCount = pageCount
    }
}

public struct PhotoshopFile {
    let name: String
    let image: Data
    
    public init(name: String, image: Data) {
        self.name = name
        self.image = image
    }
}


extension PDFFile: FileVisitable {
    public func accept(_ visitor: FileVisitor) {
        visitor.visit(self)
    }
}

extension WordFile: FileVisitable {
    public func accept(_ visitor: FileVisitor) {
        visitor.visit(self)
    }
}

extension PhotoshopFile: FileVisitable {
    public func accept(_ visitor: FileVisitor) {
        visitor.visit(self)
    }
}
