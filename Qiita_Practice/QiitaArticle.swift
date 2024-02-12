//
//  QiitaArticle.swift
//  Qiita_Practice
//
//  Created by gadgelogger on 2024/02/11.
//
//Step1モデルを作成。コレはタイトルとサブとURLを取得
import Foundation

struct QiitaArticle: Codable {
    let title: String
    let url: String
    let user: QiitaUser // ⓵
}
