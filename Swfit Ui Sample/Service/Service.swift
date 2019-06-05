//
//  Service.swift
//  Swfit Ui Sample
//
//  Created by b.fernandes.santos on 05/06/19.
//  Copyright © 2019 bls. All rights reserved.
//

import SwiftUI
import Combine

public class Service: BindableObject {

    public var places: [Place] {
        didSet {
            didChange.send(())
        }
    }

    public var didChange = PassthroughSubject<Void, Never>()

    init() {
        self.places = Place.load("landmarkData.json")
    }

}
