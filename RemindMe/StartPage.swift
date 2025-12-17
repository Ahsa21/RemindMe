//
//  StartPage.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-07.
//
import SwiftUI

struct StartPage: View {

    @State var root = roots()
    @Binding var paths: NavigationPath

    @State private var isEditing = false
    @State private var selectedNotes = Set<String>()   // 🔑 autoIds

    var body: some View {
        VStack {

            TopBar(
                isEditing: $isEditing,
                onRemove: {
                    for id in selectedNotes {
                        root.RemoveNote(noteId: id)
                        root.personLi.removeValue(forKey: id)
                    }
                    selectedNotes.removeAll()
                    isEditing = false
                }
            )

            ScrollView {
                LazyVStack(spacing: 8) {

                    ForEach(root.personLi.keys.sorted(), id: \.self) { key in
                        let isSelected = selectedNotes.contains(key)

                        Button {
                            if isEditing {
                                // 🔄 toggle selection
                                if isSelected {
                                    selectedNotes.remove(key)
                                } else {
                                    selectedNotes.insert(key)
                                }
                            } else if let theItem = root.personLi[key] {
                                paths.append(appRoute.NewReminder(theitem: theItem))
                            }
                        } label: {
                            HStack(spacing: 12) {

                                // ⭕ Selection circle (only in edit mode)
                                if isEditing {
                                    Image(systemName: isSelected
                                          ? "checkmark.circle.fill"
                                          : "circle")
                                        .foregroundColor(isSelected ? .green : .gray)
                                        .padding(.leading)
                                        .font(.system(size: 20))
                                }

                                BottonStyle(name: root.personLi[key]?.itemName ?? "")

                                Spacer()
                            }
                        }
                        .contentShape(Rectangle())
                    }
                }
                .padding(.vertical)
            }
        }
        .task {
            await root.loadData()
        }
    }
}


#Preview {
    StartPage(paths: .constant(NavigationPath()))
}
