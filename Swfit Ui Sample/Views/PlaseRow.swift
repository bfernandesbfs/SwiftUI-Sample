//
//  PlaseRow.swift
//  Swfit Ui Sample
//
//  Created by b.fernandes.santos on 05/06/19.
//  Copyright © 2019 bls. All rights reserved.
//

import SwiftUI

struct PlaseRow : View {
    @State var openSheet: Bool = false
    var place: Place

    var body: some View {

        NavigationButton(destination: DetailView(place: place)) {
            Image(place.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(Length(4))
                .presentation(openActionSheet())
                .tapAction {
                    self.openSheet.toggle()
            }

            VStack(alignment: .leading) {
                Text(place.name)
                Text(place.park)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }

    func openActionSheet() -> ActionSheet? {

        let action = ActionSheet(title: Text(place.name),
                                 message: Text(place.park),
                                 buttons: [ActionSheet.Button.default(Text("Open")) {
                                    print("Aqui")
                                    }, ActionSheet.Button.cancel()])

        return openSheet ? action : nil
    }
}
