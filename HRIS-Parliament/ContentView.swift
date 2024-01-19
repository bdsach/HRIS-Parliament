//
//  ContentView.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var members: [Member] = []
    @State var isOneColumn = true
    @State var showDetail = false
    @State var search = ""
    
    var twoColumns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.size.width / 2)),
        GridItem(.adaptive(minimum: UIScreen.main.bounds.size.width / 2))
    ]
    
    var oneColumn = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.size.width))
    ]
    @Namespace var namespace
    @State private var selectedElement: Member?
    
    var filteredMembers: [Member] {
        if search.isEmpty {
            return members
        } else {
            return members.filter{ $0.name.contains(search) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    LazyVGrid(columns: isOneColumn ? oneColumn : twoColumns,
                              spacing: 10) {
                        ForEach(filteredMembers) { member in
                            ListRow(isOneColumn: $isOneColumn, selected: $selectedElement, member: member, namespace: namespace)
                        }
                        .tint(.black)
                    }
                    .padding()
                }
                .zIndex(1)
                .navigationTitle("สมาชิกสภาผู้แทนราษฎร")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            withAnimation {
                                isOneColumn.toggle()
                            }
                        }, label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .tint(.black)
                                .font(.title)
                        })
                    }
                }
                
                if let selected = selectedElement {
                    DetailMemberView(member: selected, selectedElement: $selectedElement, namespace: namespace)
                        .zIndex(2)
                }
            }
        }
        .searchable(text: $search)
        .task(priority: .background) {
            do {
                let response = try await fetchData()
                self.members = response
            } catch let error {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
