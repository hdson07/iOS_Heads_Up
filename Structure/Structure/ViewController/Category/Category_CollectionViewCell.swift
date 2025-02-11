//
//  CategoryCollectionViewCell.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol UICollectionViewDelegate {
    func GetCellTitle(title : String)
    func SetFavorit (favoritTitle : String)
    func reloadCell(index : IndexPath)
    func selectFromTwoSegue(title : String)
    func DeleteCustomCatagory(title : String)
}

class Category_CollectionViewCell: UICollectionViewCell {
    var favoritContent : [String]?
    var delegate : UICollectionViewDelegate?
    var cellIndex : IndexPath?
    var cellView : UICollectionViewCell?
    @IBOutlet var favoritButton: UIButton!
    @IBOutlet var categoryTitleLabel: UILabel!
    var isOn : Bool?
    override var isSelected: Bool {
        didSet {
            
            if isSelected {
                categoryTitleLabel.textColor = UIColor.white
                delegate?.GetCellTitle(title: categoryTitleLabel.text!)
                delegate?.selectFromTwoSegue(title: categoryTitleLabel.text!)
                isOn = nil
            }
            else {
                categoryTitleLabel.textColor = UIColor.black
            }
        }
    }


    
    let deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

    func DeleteCustom(customMode : Bool){
        
        if customMode == true && categoryTitleLabel.text != "추가하기"{
            addSubview(deleteButton)
            self.backgroundColor = #colorLiteral(red: 0.9581267238, green: 0.7396259904, blue: 0.4966012239, alpha: 1)
            self.addSubview(favoritButton)
            deleteButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            deleteButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            if let image = UIImage(named: "whiteCancle") {
                deleteButton.setImage(image, for: .normal)
            }
            deleteButton.addTarget(self, action: #selector(ClickDeleCustom), for: .touchUpInside)
            
            self.addSubview(deleteButton)
        }else if categoryTitleLabel.text == "추가하기"{
            self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            deleteButton.removeFromSuperview()
            self.favoritButton!.removeFromSuperview()
        }else{
            self.backgroundColor = #colorLiteral(red: 0.9581267238, green: 0.7396259904, blue: 0.4966012239, alpha: 1)
            deleteButton.removeFromSuperview()
            self.addSubview(favoritButton)
        }
        
    }
    
   
    

    
    
    @objc func ClickDeleCustom(seder: UIButton!){
        delegate?.DeleteCustomCatagory(title: categoryTitleLabel.text!)

    }
    
    
    @IBAction func TouchFavorit(_ sender: UIButton) {
        delegate?.SetFavorit(favoritTitle: categoryTitleLabel.text!)
        if isOn == true{
            favoritButton!.setImage(UIImage(named:"yellowstar"), for: UIControl.State.normal)
        }
        else{
            favoritButton!.setImage(UIImage(named: "whitestar"), for: UIControl.State.normal)
        }
        delegate?.reloadCell(index : cellIndex!)
    }
    
    
    func CheckButtonImage(){
        if isOn == true{
            favoritButton!.setImage(UIImage(named:"yellowstar"), for: UIControl.State.normal)
        }else{
            favoritButton!.setImage(UIImage(named: "whitestar"), for: UIControl.State.normal)
        }
    }
    
    
    
    
}
