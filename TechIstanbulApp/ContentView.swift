//
//  ContentView.swift
//  TechIstanbulApp
//
//  Created by Ali Duman on 29.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTastTitle = ""
    var body: some View {
        VStack {
            HStack{
                TextField("Yeni bir görev girin",text: $newTastTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    guard !newTastTitle.isEmpty else { return }
                    
                    viewModel.addItem(title: newTastTitle)
                    newTastTitle = ""
                    
                } label: {
                    Text("Ekle")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.padding()
                Spacer()
            List{
                ForEach(viewModel.items){ item in
                    HStack{
                        if(!item.isCompleted){
                            Text(item.title)
                        } else{
                            Text(item.title).strikethrough().opacity(0.3)
                        }
                        Spacer()
                        Button{
                            viewModel.taskComplete(for: item)
                        }label: {
                            Image(systemName: item.isCompleted ? "checkmark.square":"square")
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
    }
}

#Preview {
    ContentView()
}
