//
//  DetailMapCell.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import UIKit
import MapKit

class DetailMapCell: UITableViewCell {

    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        return mapView
    }()

    var address: String? {
        didSet {
            guard mapView.annotations.count == 0 else {
                return
            }
            guard let address = address else {
                return
            }
            CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
                if let marks = placemarks {
                    if marks.count > 0 {
                        let placemark = marks.first
                        if let coordinate = placemark?.location?.coordinate {
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = coordinate
                            annotation.title = address
                            self.mapView.showAnnotations([annotation], animated: true)
                        }
                    }
                }
            })
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func openMapNavigation(toPoint coordinate: CLLocationCoordinate2D) {
        let fromLocation = MKMapItem.forCurrentLocation()
        let placemark = MKPlacemark(coordinate: coordinate)
        let toLocation = MKMapItem(placemark: placemark)

        MKMapItem.openMaps(with: [fromLocation, toLocation], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit, MKLaunchOptionsShowsTrafficKey: true])
    }
    
}

extension DetailMapCell: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        guard let coordinate = view.annotation?.coordinate else { return }
        UIApplication.shared.keyWindow?.rootViewController?.alert(title: "是否使用导航", message: nil, cancelTitle: "取消", otherTitles: ["确定"], completionHandler: { [weak self] (index) in
            if index == 1 {
                self?.openMapNavigation(toPoint: coordinate)
            }
        })
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "ID")
        annotationView.image = UIImage(named: "default_location")
        return annotationView
    }
}
