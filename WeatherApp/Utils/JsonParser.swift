//
//  JsonParser.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

public enum JsonParser {
 
    public enum Errors: Error {
        case fileNotFound
        case invalidJson
    }
}

public extension JsonParser {
    
    static func decode<T: Decodable>(json: String, to type: T.Type, decodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil) throws -> T {
        guard let data = json.data(using: .utf8) else {
            throw Errors.invalidJson
        }
        return try decode(data: data, to: type, decodingStrategy: decodingStrategy)
    }
    
    static func decode<T: Decodable>(data: Data, to type: T.Type, decodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil) throws -> T {
        return try sharedDecoder(decodingStrategy: decodingStrategy).decode(type, from: data)
    }
    
    private static func sharedDecoder(decodingStrategy: JSONDecoder.KeyDecodingStrategy? ) -> JSONDecoder {
        let decoder: JSONDecoder = JSONDecoder()
        if let strategy: JSONDecoder.KeyDecodingStrategy = decodingStrategy {
            decoder.keyDecodingStrategy = strategy
        }
        return decoder
    }
}

public extension JsonParser {
    
    static func encode<T: Encodable>(_ model: T, encodingStrategy: JSONEncoder.KeyEncodingStrategy? = nil) throws -> Data {
        return try sharedEncoder(encodingStrategy: encodingStrategy).encode(model)
    }
    
    private static func sharedEncoder(encodingStrategy: JSONEncoder.KeyEncodingStrategy? ) -> JSONEncoder {
        let encoder: JSONEncoder = JSONEncoder()
        if let strategy: JSONEncoder.KeyEncodingStrategy = encodingStrategy {
            encoder.keyEncodingStrategy = strategy
        }
        return encoder
    }
}
