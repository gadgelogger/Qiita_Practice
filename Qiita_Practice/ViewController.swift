//
//  ViewController.swift
//  Qiita_Practice
//
//  Created by gadgelogger on 2024/02/11.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var articles: [QiitaArticle] = [] // ②取得した記事一覧を保持しておくプロパティ

    override func viewDidLoad() {
        super.viewDidLoad()
        // ➀:tableViewのdataSourceをViewController自身に設定
        tableView.dataSource = self
        tableView.delegate = self
        loadQiita() // 関数呼び出し

    }
    
    
    // loadする関数の定義
      private func loadQiita() {
          // ③Qiita APIを叩く
          AF.request("https://qiita.com/api/v2/tags/iOS/items").response { response in
              guard let data = response.data else {
                  return
              }
              let decoder = JSONDecoder()
              do {
                  // ④レスポンスを[QiitaArticle]にデコード
                  let articles: [QiitaArticle] = try decoder.decode([QiitaArticle].self, from: data)
                  // ⑤取得した記事をarticlesに代入
                  self.articles = articles
                  // ⑥tableViewを更新
                  self.tableView.reloadData()
                  print(articles)
              } catch {
                  print(error)
              }
          }
      }
    
}
//セルのデータ関連の			
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 表示するcellの数を返す
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ➂:➁で設定したIdentifierと同じ文字列で取得する。
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaTableViewCell", for: indexPath) as? QiitaTableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        // ➃:cellに情報を設定する
        cell.set(title: article.title, author: article.user.id,imageUrl: article.user.imageUrl)
        return cell
    }
}

//セルをタップした
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // UIStoryboardを生成
           // nameにはファイル名を指定する
           let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
           // storyboardからInitialViewControllerを取得
           // InitialViewControllerにWebViewControllerを指定しているのでキャストする
           let webViewController = storyboard.instantiateInitialViewController() as! WebViewController
           // navigationControllerでpush遷移させる
           navigationController?.pushViewController(webViewController, animated: true)
       }
}
