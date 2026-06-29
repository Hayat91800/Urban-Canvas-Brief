//
//  Lieu.swift
//  Urban Canvas
//
//  Created by apprenant144 on 22/06/2026.
//

import SwiftUI

struct Lieu: Identifiable, Hashable {
    let id = UUID()
    let ville: String
    let nom: String
    let image: ImageResource
    let details: String
    let type: String
    let condition: String
    let date: String
    let auteur: String
    let latitude: Double
    let longitude: Double
    let localisation: String
    
    static var streetArts : [Lieu] = [
        Lieu(
            ville: "Paris",
            nom: "Liberté Egalité Fraternité",
            image: .parisLiberté,
            details: "Réalisée par l’artiste eL Seed, cette fresque monumentale met à l'honneur son style unique, le « calligraffiti », qui réinvente la calligraphie arabe au service de messages universels. Intitulée « Liberté, égalité, fraternité », cette œuvre colorée fait directement écho aux valeurs de la République française et dialogue, par-delà le boulevard, avec la célèbre Marianne de Shepard Fairey située juste en face.",
            type: "Calligraphie",
            condition: "Bonne",
            date: "Avril 2007",
            auteur: "El Seed",
            latitude: 48.8341,
            longitude: 2.3629,
            localisation: """
            128 Boulevard Vincent Auriol, 75013 Paris
            (Latitude: 48.8341, Longitude: 2.3629)
            """
        ),
            
    
        Lieu(
            ville: "Marseille",
            nom: "La Joconde de Marseille",
            image: .marseilleJoconde,
            details: "Dans le cadre de l'exposition « La Joconde, exposition immersive » au Palais de la Bourse à Marseille, coproduite par le Grand Palais Immersif et le Musée du Louvre, le MauMA : Musée des arts urbains de Marseille à donner « carte blanche » à l'artiste KAN / DMV pour la réalisation de l'oeuvre « La Joconde de Marseille ». Produite et coordonné par Méta 2, elle est la première représentation urbaine de la célèbre Monna Lisa au sein de la cité phocéene" ,
            type: "Mosaique",
            condition: "Bonne",
            date: "Mars 2022",
            auteur: "KAN DMV",
            latitude: 43.2965,
            longitude: 5.3756,
            localisation: """
            Palais de la Bourse, 13001 Marseille
            (Latitude: 43.2965, Longitude: 5.3756)
            """ ,
        ),
    
        Lieu(
            ville: "Paris",
            nom: "La maison Cécile",
            image: .parisCecile,
            details: "Née d'une rencontre touchante entre l'artiste Seth et Cécile, une commerçante historique du quartier dont la boutique a souffert de la crise du Covid, cette fresque poétique a été peinte au cœur d'une école maternelle. L'artiste y met en scène son célèbre univers enfantin pour réaliser le vœu de la commerçante : pouvoir contempler une œuvre colorée chaque matin en prenant son café.",
            type: "Mural",
            condition: "Bonne",
            date: "2020" ,
            auteur: "Seth (Julien Malland)",
            latitude: 48.8539,
            longitude: 2.3364,
            localisation: """
            Rue de Buci / Rue de l'Échaudé, 75006 Paris
            (Latitude: 48.8539, Longitude: 2.3364)
            """ ,
        ),
    
        Lieu(
            ville: "Marseille",
            nom: "Chloé",
            image: .marseilleChloe,
            details: "Peinte au cœur du vibrant quartier du Cours Julien, cette fresque monumentale de l'artiste Manyoly dévoile le portrait envoûtant et coloré d'une jeune fille prénommée Chloé. L'œuvre illustre parfaitement la signature de l'artiste, caractérisée par un travail intense sur le regard, l'utilisation de couleurs vives appliquées au couteau et une célébration de la force et de la sensibilité féminines.",
            type: "Mural",
            condition: "Bonne",
            date: "2020",
            auteur: "Manyoly" ,
            latitude: 43.2928,
            longitude: 5.3837,
            localisation: """
            Cours Julien, 13006 Marseille
            (Latitude: 43.2928, Longitude: 5.3837)
            """,
        ),
    
        Lieu(
            ville: "Paris",
            nom: "PA_278",
            image: .parisInvider,
            details: "Installée face au Centre Pompidou, cette mosaïque en pixel art est une œuvre officielle du célèbre street artiste français Invader. Référencée sous le code PA_278, elle représente l'un de ses mythiques extraterrestres inspirés du jeu vidéo Space Invaders de 1978, marquant de son empreinte pixelisée et rétro les murs de la place historique Igor Stravinsky.",
            type: "Invaders" ,
            condition: "Très bonne",
            date: "1999",
            auteur: "Invaders",
            latitude: 48.8595,
            longitude: 2.3515,
            localisation: """
            Place Igor Stravinsky, 75004 Paris
            (Latitude: 48.8595, Longitude: 2.3515)
            """,
        ),
    
        Lieu(
            ville: "Paris",
            nom: "Chuuuut...",
            image: .parisChuut,
            details: "Inaugurée en mai 2011, cette fresque monumentale au pochoir de Jef Aérosol est l'une des œuvres les plus photographiées de Paris. Situé sur la place Stravinsky, ce célèbre autoportrait en noir et blanc montre l'artiste le doigt sur les lèvres, invitant les passants et les visiteurs du Centre Pompidou à faire une pause et à écouter les murmures de la ville.",
            type: "Stencil",
            condition: "Bonne",
            date: "Mai 2011",
            auteur: "Jef Aérosol",
            latitude: 48.8594,
            longitude: 2.3512,
            localisation: """
            Place Igor Stravinsky, 75004 Paris
            (Latitude: 48.8594, Longitude: 2.3512)
            """,
        ),
    
        Lieu(
            ville: "Marseille",
            nom: "Le Tigre et la Cigale",
            image: .marseilleTigreCigale,
            details: "Créée par l'artiste réunionnais Gorg One dans le cadre du festival de street art de la ville, cette fresque colorée et dynamique orne les murs de Noailles. L'œuvre met en scène une rencontre poétique et pleine d'humour entre un tigre majestueux au style graphique aérien et une petite cigale, clin d'œil incontournable à la faune et au folklore de la cité phocéenne.",
            type: "Mural",
            condition: "Bonne",
            date: "2021" ,
            auteur: "Gorg One",
            latitude: 43.2942,
            longitude: 5.3794,
            localisation: """
            Rue de l'Arc, 13001 Marseille
            (Latitude: 43.2942, Longitude: 5.3794)
            """,
        )
]
    
}

enum TypeFilter: String {
    
    static var allFilters: [TypeFilter] {
        return [.Tous, .Invaders, .Mosaique, .Mural, .Stencil, .Calligraphie]
    }
    
    case Tous = "Tous"
    case Invaders = "Invaders"
    case Mosaique = "Mosaique"
    case Mural = "Mural"
    case Stencil = "Stencil"
    case Calligraphie = "Calligraphie"
}

enum Content: String, CaseIterable {
    case liste = "Liste"
    case carte = "Carte"
}

struct Artiste: Identifiable {
    let id = UUID()
    let nom: String
    let image: ImageResource
    let age: String
    let origines: String
    let style: String
    
    static var artiste: [Artiste] = [
        Artiste(
            nom:"KAN DMV",
            image:.kan ,
            age:"49 ans",
            origines:"France",
            style:"Pointillisme"
        ),
        Artiste(
            nom:"Kitsune Jolene",
            image:.kitsuneJolene,
            age:"34 ans",
            origines:"Belgique",
            style:"Mural"
        ),
        Artiste(
            nom:"Aero",
            image:.aero,
            age:"NC",
            origines:"France",
            style:"Aérographe"
        ),
        Artiste(
            nom:"Seth GLOBEPAINTER",
            image:.sethGlobepainter,
            age:"54 ans",
            origines:"France",
            style:"Globepainter"
        ),
        Artiste(
            nom:"JDL",
            image:.jdl,
            age:"30 ans",
            origines:"Pays-Bas",
            style:"Mural"
        ),
        Artiste(
            nom:"Shepard Fairey",
            image:.shepardFairey,
            age:"56 ans",
            origines:"USA",
            style:"Mural"
        ),
    ]
}

struct Mission: Identifiable {
    let id = UUID()
    let nom : String
    
    static var mission: [Mission] = [
        Mission (
            nom:"Mission 1"
        ),
        Mission (
            nom:"Mission 2"
        ),
        Mission (
            nom:"Mission 3"
        ),
        Mission (
            nom:"Mission 4"
        ),
        Mission (
            nom:"Mission 5"
        ),
        Mission (
            nom:"Mission 6"
        ),
        Mission (
            nom:"Mission 7"
        )
    ]
}

