//
//  PostsTableViewController.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import MBProgressHUD

class PostsTableViewController: UITableViewController {

    private let viewModel = PostViewModel()
    private var actualSegment = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 67.0
        tableView.rowHeight = UITableViewAutomaticDimension
        configBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoading()
        viewModel.loadPosts()
    }

    @IBAction func refreshAction(_ sender: Any) {
        viewModel.loadPosts(forceUpdate: true)
    }
    func configBindings() {
        viewModel.onDidLoadPosts = {
            self.hideLoading()
            self.tableView.reloadSections(IndexSet(integer: 1), with: .fade)
        }
        viewModel.onDidFailLoad = {
            
        }
    }
    
    func dataSource() -> [Post] {
        return actualSegment == 0 ? viewModel.posts : viewModel.favorites
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return dataSource().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SegmentedControlTableViewCell.identifier) as! SegmentedControlTableViewCell
            cell.selectionStyle = .none
            cell.onSegmentedControlChange = { (index) in
                self.actualSegment = index
                if index == 0 {
                    self.viewModel.loadPosts()
                } else {
                    self.viewModel.loadFavorites()
                }
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        cell.configure(With: dataSource()[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        if let viewController = PostDetailViewController.fromStoryboard("Main") {
            let post = dataSource()[indexPath.row]
            viewModel.markAsRead(post: post)
            viewController.post = post
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    @IBAction func deleteAllAction(_ sender: Any) {
        viewModel.deleteAll()
        tableView.reloadSections(IndexSet(integer: 1), with: .fade)
    }
}

extension PostsTableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        return
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.section == 0 {
            return []
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.viewModel.delete(post: self.dataSource()[indexPath.row])
            self.tableView.deleteRows(at: [indexPath], with: .right)
        }
        
        return [deleteAction]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
    }
}
