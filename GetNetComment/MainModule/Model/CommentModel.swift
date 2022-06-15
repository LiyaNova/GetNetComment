//
//  CommentModel.swift
//  GetNetComment
//
//  Created by Юлия Филимонова on 13.06.2022.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
