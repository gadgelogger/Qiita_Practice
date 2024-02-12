//
//  QiitaUser.swift
//  Qiita_Practice
//
//  Created by gadgelogger on 2024/02/11.
//
//Step1まずはモデルを作成する
//これは画像を取得するためのモデル
import Foundation

struct QiitaUser: Codable {
    let id: String
    let imageUrl: String // ①

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "profile_image_url" // ②
    }
}
