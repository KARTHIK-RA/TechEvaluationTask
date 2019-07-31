//
//  NewsFeedViewController.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit




class NewsFeedViewController: BaseViewController {

    @IBOutlet weak var m_FeedListTableView: UITableView!
    
    var viewModel: FeedViewModel =  FeedViewModel()
     let refreshcontrol = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        m_FeedListTableView.delegate = self
        m_FeedListTableView.dataSource = self
        m_FeedListTableView.tableFooterView = UIView(frame: CGRect.zero)
        m_FeedListTableView.rowHeight = UITableView.automaticDimension
        m_FeedListTableView.estimatedRowHeight = 44
        
        self.navigationItem.title = "FeedList".localized()
        
       

        addRefreshControl()
        DispatchQueue.main.async {
            self.viewModel.getFeedList()
        }
    }
    func addRefreshControl()  {
        m_FeedListTableView.addSubview(refreshcontrol)
        refreshcontrol.addTarget(self, action: #selector(refresh) , for: .valueChanged)
    }
    
    @objc func refresh(sender : UIRefreshControl)  {
        DispatchQueue.main.async {
            self.viewModel.reset()
        }
    }
    
    
    @IBAction func act_Logout(_ sender: UIBarButtonItem) {
       self.logout()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsFeedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        if let feed = viewModel.getItemByIntex(intex: indexPath.row) {
            cell.feed = feed
        }
        return cell
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.getFeedCount()
    }
}


extension NewsFeedViewController : FeedListProtocol {
    func reloadData() {
        m_FeedListTableView.reloadData()
        refreshcontrol.endRefreshing()
    }
    func didReset() {
        m_FeedListTableView.reloadData()
    }
}
