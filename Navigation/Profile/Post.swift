//
//  Post.swift
//  Navigation
//
//  Created by book on 29.11.2023.
//

import UIKit

struct Post{
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    let title: String
}

extension Post {
    
    static func make() -> [Post] {
        [
            Post(author: "Dzen",
                 description: "Toyota обновила модель, которой почти 40 лет",
                 image: "222_c1f",
                 likes: 637,
                 views: 2041,
                 title: "Пост"
                ),
            Post(author: "Dzen",
                 description: "Новая бета-версия iOS 17.3 привела к поломке iPhone",
                 image: "ios17_3_new_build",
                 likes: 4564,
                 views: 7896,
                 title: "Пост"
                ),
            Post(author: "Igromania",
                 description: "Nvidia сделала бету технологии RTX Remix доступной всем желающим",
                 image: "Nvidia",
                 likes: 980,
                 views: 4352,
                 title: "Пост"
                ),
            Post(author: "Playground",
                 description: "Разработка The Witcher 4 вступит в стадию производства в этом году",
                 image: "Witcher",
                 likes: 4644,
                 views: 23111,
                 title: "Пост"
                ),
        ]
        
    }
}
