//
//  BookmarkView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct BookmarkView: View {
    var isBookmarked: Bool = false
    
    var body: some View {
        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 22)
            .foregroundColor(isBookmarked ? .red : .white)
    }
}

#Preview {
    BookmarkView(isBookmarked: true)
}
