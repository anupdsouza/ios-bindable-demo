//
//  ContentView.swift
//  BindableDemo
//
//  Created by Anup D'Souza on 25/10/23.
//

import SwiftUI


struct ContentView: View {
    @Bindable private var schedule = Schedule()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(schedule.searchedEvents) { event in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(event.title)
                            .font(.title3)
                        Text("\(event.date.formatted(date: .abbreviated, time: .omitted))")
                    }
                }
                .listStyle(.inset)
            }
            .searchable(text: $schedule.searchText)
            .navigationTitle(Text("Athletics Meet"))
            .task {
                await schedule.getSchedule()
            }
        }
    }
}

#Preview {
    ContentView()
}
