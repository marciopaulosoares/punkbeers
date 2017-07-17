//
//  ViewController.swift
//  PUNKBeers
//
//  Created by marcio paulo on 7/16/17.
//  Copyright © 2017 marcio paulo. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController {

    var beer:Beer!;
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSubtitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var ivBeer: UIImageView!
    @IBOutlet weak var lbTeorAlcolico: UILabel!
    @IBOutlet weak var lbAmargor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(beer != nil){
            lbName.text=beer.name
           
            lbSubtitle.text = beer.tagLine
            lbDescription.text = beer.description
            lbTeorAlcolico.text = beer.abv
            lbAmargor.text = beer.ibu
            
            if(beer.image != "beer-icon.png"){
                BeerRepository.DownloadImage(url: beer.image, onComplete: { (image:UIImage?) in
                    DispatchQueue.main.async {
                        self.ivBeer.image = image
                    }
                })
            }
            else{
                self.ivBeer.image = UIImage(named: beer.image)!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

