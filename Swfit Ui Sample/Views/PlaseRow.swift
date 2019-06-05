//
//  PlaseRow.swift
//  Swfit Ui Sample
//
//  Created by b.fernandes.santos on 05/06/19.
//  Copyright © 2019 bls. All rights reserved.
//

import SwiftUI

struct PlaseRow : View {

    var place: Place

    var body: some View {
        return NavigationButton(destination: DetailView(place: place)) {
            Image(place.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(Length(4))

            VStack(alignment: .leading) {
                Text(place.name)
                Text(place.park)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
