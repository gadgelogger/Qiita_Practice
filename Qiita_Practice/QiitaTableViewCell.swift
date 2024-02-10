//
//  QiitaTableViewCell.swift
//  Qiita_Practice
//
//  Created by gadgelogger on 2024/02/11.
//

import UIKit
import NukeExtensions
//TableViewと紐付けるクラスを作成
class QiitaTableViewCell: UITableViewCell {
    //タイトルとサムネイル画像とサブタイトルを紐付ける
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    //とりあえず仮データを入れるで。
    // ②引数にimageUrlを追加
       func set(title: String, author: String, imageUrl: String) {
           // ③Nukeを使用して画像を取得
           loadImage(with: URL(string: imageUrl)!, into: iconImageView)
           titleLabel.text = title
           authorLabel.text = author
       }
}
