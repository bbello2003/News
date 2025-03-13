//
//  HomePresenter.swift
//  News
//
//  Created by Pasika Pongsawaluk on 13/3/2568 BE.
//  Copyright (c) 2568 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
    func presentSomething(response: Home.Something.Response)
    func presentHome(response: NewsResponse)
}

class HomePresenter: HomePresentationLogic
{
    weak var viewController: HomeDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Home.Something.Response)
    {
        let viewModel = Home.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func presentHome(response: NewsResponse){
        let news = response.articles
     
        var viewModels: [NewsTableViewCellViewModel] = []
        news.forEach { new in
            
            let imageUrl = (new.urlToImage?.isEmpty ?? true) ? "defaultImageUrl" : new.urlToImage ?? ""
            
            viewModels.append(NewsTableViewCellViewModel(
                imageUrl: imageUrl,
                name: new.title ?? "",
                description: new.description ?? ""
            ))
        }
        print("ถึงนี่ละ")
        viewController?.displayHome(news: viewModels)
    }
}
