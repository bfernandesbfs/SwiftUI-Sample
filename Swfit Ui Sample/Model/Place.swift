//
//  Place.swift
//  Swfit Ui Sample
//
//  Created by b.fernandes.santos on 04/06/19.
//  Copyright © 2019 bls. All rights reserved.
//

import SwiftUI

public struct Place: Decodable, Identifiable {
    public var id: Int
    public var name: String
    public var park: String
    public var imageName: String
}

extension Place {

    public static func load(_ filename: String) -> [Place] {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Place].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([Place].self):\n\(error)")
        }
    }

}
