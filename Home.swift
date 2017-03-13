//
//  Home.swift
//  UserLogin
//
//  Created by Mitosis on 09/02/17.
//  Copyright © 2017 Mitosis. All rights reserved.
//

import UIKit

class Home: BaseViewController{
    
   
   
 
    
    var Label = ["","Shop by Category","Offers","Speciality stores","Image Gallery","Products"]
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.addSlideMenuButton()
        self.title="Home"
        //Image Loop
                
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension Home: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
  return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       if(indexPath.section == 0){
          let cell1 = tableView.dequeueReusableCell(withIdentifier: "viewcell", for: indexPath) as! TableViewCell
            return cell1
        }
            
        else{
          let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableCell
        return cell2
    }
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 160
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
   return Label[section]
    }
}

