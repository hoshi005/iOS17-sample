//
//  ListPage.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/17.
//

import SwiftUI
import SwiftData

struct ListPage: View {
    
    @Environment(\.modelContext) private var context
    @Query(
        FetchDescriptor(
            predicate: #Predicate { $0.isLiked == false },
            sortBy: [
                SortDescriptor(\.startDate, order: .reverse)
            ]
        ),
        animation: .snappy
    ) private var medicines: [Medicine]
    
    @State private var showRegistView = false
    
    var body: some View {
        List {
            ForEach(medicines) { medicine in
                NavigationLink(value: medicine) {
                    Text(medicine.name)
                }
            }
        }
        .navigationTitle("おくすり一覧")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    let medicine = Medicine(
                        name: Date().formatted(date: .numeric, time: .standard),
                        startDate: .init()
                    )
                    context.insert(medicine)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                } label: {
                    Text("適当に追加")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showRegistView.toggle()
                } label: {
                    Image(systemName: "plus.square")
                }
            }
        }
        .navigationDestination(for: Medicine.self) {
            Text("編集画面 \($0.name)")
        }
        .navigationDestination(isPresented: $showRegistView) {
            Text("新規画面")
        }
    }
}

#Preview {
    NavigationStack {
        ListPage()
            .modelContainer(for: [Person.self, Medicine.self], isUndoEnabled: true) // PreviewでDBいじるため
    }
}

@Model
class Medicine {
    var name: String
    var isLiked: Bool
    var startDate: Date
    
    init(name: String, isLiked: Bool = false, startDate: Date) {
        self.name = name
        self.isLiked = isLiked
        self.startDate = startDate
    }
}
