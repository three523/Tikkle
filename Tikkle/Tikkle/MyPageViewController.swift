//
//  MyPageViewController.swift
//  Tikkle
//
//  Created by 김도현 on 2023/08/15.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var MyPageCountTableView: UITableView!
    
    var countName: [String] = ["진행중 티끌판", "완료된 티끌판"]
    var count: [String] = ["2", "5"]
    
    @IBOutlet weak var MyPageMenuTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MyPageCountTableView.dataSource = self
        MyPageMenuTableView.dataSource = self
    }
    
}

//MARK: - MyPage TableView Setting
extension MyPageViewController: UITableViewDataSource {
    //TableView 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countName.count
    }
    
    //TableView Cell의 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCountTableViewCell", for: indexPath) as? MyPageCountTableViewCell else {
            return UITableViewCell()
        }
        
        cell.MyPageCountName.text = countName[indexPath.row]
        cell.MyPageCount.text = ("\(count[indexPath.row])개")
        return cell
    }
}
