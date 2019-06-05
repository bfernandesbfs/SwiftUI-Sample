//
//  ListView.swift
//  Swfit Ui Sample
//
//  Created by b.fernandes.santos on 04/06/19.
//  Copyright © 2019 bls. All rights reserved.
//

import SwiftUI

struct ListView : View {
    @ObjectBinding var service: Service

    var body: some View {

        NavigationView {
            List {

                Section {
                    Button(action: addPlace) {
                        Text("Add Place")
                    }
                }

                Section {
                    ForEach(service.places) { place in
                        PlaseRow(place: place)
                    }
                    .onDelete(perform: deletePlace)
                    .onMove(perform: movePlace)
                }

            }
            .listStyle(.grouped)
            .navigationBarTitle(Text("Places"), displayMode: .large)
            .navigationBarItems(trailing: EditButton())
        }
        
    }

    func addPlace() {
        service.places.insert(Place(id: 2000 * service.places.count,
                                    name: "New Your",
                                    park: "Central Park NY",
                                    imageName: "central_park"),
                              at: 0)
    }

    func deletePlace(at offset: IndexSet) {
        service.places.remove(at: offset.last!)
    }

    func movePlace(from source: IndexSet, to destination: Int) {
        //service.places.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView(service: Service())
    }
}
#endif
