//
//  RootViewController.swift
//  MagicApp
//
//  Created by matheus.filipe.bispo on 14/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//
import CardDetailModule
import Components
import Entities
import FavoredCardsModule
import RecommendedCardsModule
import Repositories
import Resources

class RootViewController: UITabBarController {
    init(provider: DataProvider) {
        super.init(nibName: nil, bundle: nil)

        let height = CGFloat(50)

        let recommendedCards = RecommendedCardsModuleBuilder.buildRoot(provider: provider)
        let favoredCards = FavoredCardsModuleBuilder.buildRoot(provider: provider)

        recommendedCards.delegate = self
        favoredCards.delegate = self

        let textSize: CGFloat = 18
        let attributes = [
            NSAttributedString.Key.font:
                MagicDesignSystem.Font.systemBold.of(size: textSize),
            NSAttributedString.Key.foregroundColor:
                MagicDesignSystem.Colors.whiteText
        ]
        let itemOffset = UIOffset(horizontal: 0, vertical: -(height / 2) + (2 * textSize / 3))

        recommendedCards.tabBarItem = UITabBarItem(title: "Sets", image: nil, selectedImage: nil)
        recommendedCards.tabBarItem.titlePositionAdjustment = itemOffset
        recommendedCards.tabBarItem.setTitleTextAttributes(attributes, for: .normal)

        favoredCards.tabBarItem = UITabBarItem(title: "Favorites", image: nil, selectedImage: nil)
        favoredCards.tabBarItem.titlePositionAdjustment = itemOffset
        favoredCards.tabBarItem.setTitleTextAttributes(attributes, for: .normal)

        self.viewControllers = [
            recommendedCards,
            favoredCards
        ]

        tabBar.backgroundColor = MagicDesignSystem.Colors.clear
        tabBar.tintColor = MagicDesignSystem.Colors.whiteText
        tabBar.barTintColor = MagicDesignSystem.Colors.clear
        tabBar.backgroundImage = UIImage()
        tabBar.isTranslucent = true

        var lineOffset: CGFloat = 30
        tabBar.addSubview(createLines(rect:
            CGRect(x: lineOffset, y: 0, width: tabBar.frame.width - lineOffset * 2, height: 1.0)))
        lineOffset = 10
        for cont in 1..<viewControllers!.count {
            tabBar.addSubview(createLines(rect:
                CGRect(x: CGFloat(cont) * tabBar.frame.width / CGFloat(viewControllers!.count),
                       y: lineOffset,
                       width: 1.0,
                       height: tabBar.frame.height - lineOffset * 2)))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createLines(rect: CGRect) -> UIView {
        let view = UIView(frame: rect)
        view.backgroundColor = .white
        return view
    }
}

extension RootViewController: RecommendedCardsDelegate, FavoredCardsDelegate {
    func didTapCard(card: Card) {
        present(CardDetailModuleBuilder.buildRoot(card: card),
                animated: true)
    }
}

extension RootViewController: CardDetailControllerDelegate {
    func didFavoriteButtonWasTapped(card: Card) {}
}
