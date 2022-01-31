//
//  BookResponse.swift
//  booklist
//
//  Created by 김선우 on 2022/01/27.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let error: String
    let total: String
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let title: String
    let subtitle: String
    let isbn13: String
    let price: String
    let image: String
    let url: String
}
