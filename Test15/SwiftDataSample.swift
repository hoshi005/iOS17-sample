//
//  SwiftDataSample.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/08.
//

import SwiftUI
import SwiftData

struct SwiftDataSample: View {
    
    /// context.
    @Environment(\.modelContext) private var context
    
    /// fetching data
    /// Core Data Fetch Requestのように、SwiftDataもSwift PredicatesとSort Descriptorsで構成されています。
    /// それらを使うことで、SwiftDataでデータをフィルタリングすることができます。
    @Query(FetchDescriptor(
        predicate: #Predicate { $0.isLiked == true },
        sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
    ), animation: .snappy) private var favourites: [Person]
    
    @Query(FetchDescriptor(
        predicate: #Predicate { $0.isLiked == false },
        sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
    ), animation: .snappy) private var normal: [Person]
    
    var body: some View {
        List {
            DisclosureGroup("Favourites") {
                ForEach(favourites) { person in
                    HStack {
                        Text(person.name)
                        Spacer()
                        Button(action: {
                            person.isLiked.toggle()
                            try? context.save()
                        }, label: {
                            Image(systemName: "suit.heart.fill")
                                .tint(person.isLiked ? .red : .gray)
                        })
                    }
                    .swipeActions {
                        Button(action: {
                            context.delete(object: person)
                            try? context.save()
                        }, label: {
                            Image(systemName: "trash.fill")
                                .tint(.red)
                        })
                    }
                }
            }
            DisclosureGroup("Normal") {
                ForEach(normal) { person in
                    HStack {
                        Text(person.name)
                        Spacer()
                        Button(action: {
                            person.isLiked.toggle()
                            try? context.save()
                        }, label: {
                            Image(systemName: "suit.heart.fill")
                                .tint(person.isLiked ? .red : .gray)
                        })
                    }
                    .swipeActions {
                        Button(action: {
                            context.delete(object: person)
                            try? context.save()
                        }, label: {
                            Image(systemName: "trash.fill")
                                .tint(.red)
                        })
                    }
                }
            }
        }
        .navigationTitle("Swift Data")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Item") {
                    let person = Person(name: "Hello User \(Date().formatted(date: .numeric, time: .omitted))")
                    context.insert(person)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        SwiftDataSample()
    }
}

/// Model
/// Swift Dataでエンティティを作成するのはとても簡単です。
/// クラスの前に@Modelを追加するだけで、それだけです。
/// このクラスは、Core Dataエディターで作成したような、私たちのエンティティモデルになります。
/// 変数の前に@Attributeを宣言するだけで、一意性などの属性を追加することができます。
@Model
class Person {
    var name: String
    var isLiked: Bool
    var createdAt: Date
    
    init(name: String, isLiked: Bool = false, createdAt: Date = .init()) {
        self.name = name
        self.isLiked = isLiked
        self.createdAt = createdAt
    }
}
