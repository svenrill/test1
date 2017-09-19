//: Playground - noun: a place where people can play

import UIKit


struct Author : Codable {
    let name: String
}
struct Book : Codable {
    let title: String
    let isbn: String
    let authors: [Author]
}
let swiftbook = Book(title: "Raspberry Pi",
                     isbn: "978-3-8362-5859-3",
                     authors: [Author(name: "Kofler"),
                               Author(name: "Kuehnast"),
                               Author(name: "Scherbeck")])
let encoder = JSONEncoder()
let jsondata = try encoder.encode(swiftbook)
if let jsonstr = String(data: jsondata, encoding: .utf8) {
    print(jsonstr)
    // Ausgabe:
    // {"title":"Raspberry Pi",
    //  "authors":[{"name":"Kofler"}, {"name":"Kuehnast"},
    //             {"name":"Scherbeck"}],
    //  "isbn":"978-3-8362-5859-3"}
}
let decoder = JSONDecoder()
let bookcopy = try decoder.decode(Book.self, from: jsondata)
print(bookcopy.title)
print(bookcopy.isbn)
