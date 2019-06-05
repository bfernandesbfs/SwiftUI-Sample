//
//  DetailView.swift
//  Swfit Ui Sample
//
//  Created by b.fernandes.santos on 05/06/19.
//  Copyright © 2019 bls. All rights reserved.
//

import SwiftUI

struct DetailView : View {

    var place: Place
    @State private var zoomed = false

    var body: some View {
        ZStack {
            Image(place.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .tapAction {
                    withAnimation {
                        self.zoomed.toggle()
                    }
            }
        }
        .navigationBarTitle(Text(place.name), displayMode: .inline)
    }
}

#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        DetailView(place: Place.load("landmarkData.json")[0])
    }
}
#endif
