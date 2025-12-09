//
//  BottonStyle.swift
//  RemindMe
//
//  Created by Ahmad Saloukha on 2025-12-07.
//

import SwiftUI

struct BottonStyle: View {
    var name: String

    var body: some View {
        HStack {
            Text(name)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 20)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.8))
                .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.13, green: 0.60, blue: 0.34),
                    Color(red: 0.10, green: 0.50, blue: 0.28)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)
        .padding(.horizontal)
    }
}

#Preview {
    BottonStyle(name: "Example")
}
