//
//  PlanetsViewController.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 10/06/2022.
//

///Author: Sajid Hasan
///



import UIKit

class PlanetsViewController: UIViewController {
    
    @IBOutlet weak var planetsTableView: UITableView!
    
    //MARK: Stored Properties
    let spinnerView = SpinnerViewController()
    var planetViewModel = PlanetsViewModel()
    
    //MARK: Data Variables
    var planetsData: Planets?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSpinner()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if (InternetConnectionManager.isConnectedToNetwork()){
            showSpinner()
            planetViewModel.fetchPlanetsData { planets, error in
                if let planets = planets {
                    self.planetsData = planets
                }
                if let error = error {
                    print(error.localizedDescription)
                }
                
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.planetsTableView.reloadData()
                }
            }
        }
        
        else{
            showInternetConnectionAlert()
            hideSpinner()
        }
    }
    
    
    // utilizing the reachability functions to check internet connection
    func showInternetConnectionAlert(){
        let alert = UIAlertController(title: "No Internet Connection", message: "Please enable internet connection!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func configureSpinner(){
        addChild(spinnerView)
        spinnerView.view.center = CGPoint(x: view.frame.size.width  / 2, y: view.frame.size.height / 2)
        view.addSubview(spinnerView.view)
    }
    
    func showSpinner(){
        spinnerView.didMove(toParent: self)
    }
    
    func hideSpinner(){
        spinnerView.willMove(toParent: nil)
        spinnerView.view.removeFromSuperview()
        spinnerView.removeFromParent()
    }
    

}


extension PlanetsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let planetsData = planetsData{
            return planetsData.results.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = planetsTableView.dequeueReusableCell(withIdentifier: "PlanetsTableViewCell", for: indexPath) as! PlanetsTableViewCell
        
        
        //cell.accessoryView = UIImageView(image: UIImage(systemName: "chevron.right"))
        //cell.accessoryView?.tintColor = .yellow
        
        if let planets = planetsData {
            cell.planetNameLabel.text = planets.results[indexPath.row].name
        }
        return cell
    }
}

