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

    /// Première ligne de la localisation (adresse sans les coordonnées)
    var adresse: String {
        localisation.components(separatedBy: "\n").first ?? localisation
    }

    // Deux œuvres sont égales si elles ont le même identifiant
    static func == (lhs: Lieu, rhs: Lieu) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }

    static let streetArts : [Lieu] = [
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
            auteur: "Invader",
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

/// Types d'art utilisés pour le filtrage (V2)
enum TypeFilter: String, CaseIterable {
    case Tous = "Tous"
    case Invaders = "Invaders"
    case Mosaique = "Mosaique"
    case Mural = "Mural"
    case Stencil = "Stencil"
    case Calligraphie = "Calligraphie"

    static var allFilters: [TypeFilter] { allCases }

    /// Retourne les œuvres correspondant au filtre
    func appliquer(sur oeuvres: [Lieu]) -> [Lieu] {
        if self == .Tous {
            return oeuvres
        }
        return oeuvres.filter { $0.type == rawValue }
    }
}

/// Bascule Liste / Carte (V3)
enum ModeAffichage: String, CaseIterable {
    case liste = "Liste"
    case carte = "Carte"
}

/// Répertoire des auteur·ices (V4)
struct Artiste: Identifiable {
    let id = UUID()
    let nom: String
    let image: ImageResource?      // nil = pas de photo → image de substitution
    let age: String
    let origines: String
    let style: String              // type d'art de prédilection

    static let artiste: [Artiste] = [
        Artiste(nom: "KAN DMV", image: .kan, age: "49 ans", origines: "France", style: "Pointillisme / Mosaïque"),
        Artiste(nom: "Kitsune Jolene", image: .kitsuneJolene, age: "34 ans", origines: "Belgique", style: "Mural"),
        Artiste(nom: "Aero", image: .aero, age: "NC", origines: "France", style: "Aérographe"),
        Artiste(nom: "Seth GLOBEPAINTER", image: .sethGlobepainter, age: "54 ans", origines: "France", style: "Mural"),
        Artiste(nom: "JDL", image: .jdl, age: "30 ans", origines: "Pays-Bas", style: "Mural"),
        Artiste(nom: "Shepard Fairey", image: .shepardFairey, age: "56 ans", origines: "USA", style: "Mural / Affiche"),
        // Auteur·ices des œuvres de la liste, sans photo : une image de substitution est affichée
        Artiste(nom: "El Seed", image: nil, age: "45 ans", origines: "France / Tunisie", style: "Calligraphie"),
        Artiste(nom: "Invader", image: nil, age: "57 ans", origines: "France", style: "Invaders (mosaïque)"),
        Artiste(nom: "Jef Aérosol", image: nil, age: "69 ans", origines: "France", style: "Stencil"),
        Artiste(nom: "Manyoly", image: nil, age: "NC", origines: "France", style: "Mural"),
        Artiste(nom: "Gorg One", image: nil, age: "NC", origines: "La Réunion", style: "Mural")
    ]
}

/// Génération automatique d'une mission (V5)
enum Mission {

    /// Génère une sélection de 3 à 5 œuvres qui respecte les règles :
    /// 1. pas deux fois la même œuvre ;
    /// 2. éviter deux fois le/la même auteur·ice ;
    /// 3. au moins 2 types d'art différents.
    static func generer(depuis oeuvres: [Lieu]) -> [Lieu] {
        guard oeuvres.count > 3 else { return oeuvres.shuffled() }

        let taille = Int.random(in: 3...min(5, oeuvres.count))

        // On fait plusieurs tirages au hasard jusqu'à trouver une sélection qui respecte toutes les règles
        for _ in 0..<100 {
            let selection = tirage(oeuvres, taille: taille)
            if respecteLesRegles(selection) {
                return selection
            }
        }
        // S'il n'y a pas assez d'auteur·ices différent·es, on garde au moins la règle des 2 types
        for _ in 0..<100 {
            let selection = tirage(oeuvres, taille: taille)
            if nombreDeTypes(selection) >= 2 {
                return selection
            }
        }
        return tirage(oeuvres, taille: taille)
    }

    /// Tire des œuvres au hasard, en privilégiant des auteur·ices différent·es
    private static func tirage(_ oeuvres: [Lieu], taille: Int) -> [Lieu] {
        let melange = oeuvres.shuffled()
        var selection: [Lieu] = []
        var auteurs: Set<String> = []

        for oeuvre in melange where selection.count < taille && !auteurs.contains(oeuvre.auteur) {
            selection.append(oeuvre)
            auteurs.insert(oeuvre.auteur)
        }
        // On complète seulement si on manque d'auteur·ices différent·es
        for oeuvre in melange where selection.count < taille && !selection.contains(oeuvre) {
            selection.append(oeuvre)
        }
        return selection
    }

    static func respecteLesRegles(_ selection: [Lieu]) -> Bool {
        let oeuvresUniques = Set(selection.map { $0.id }).count == selection.count
        let auteursUniques = Set(selection.map { $0.auteur }).count == selection.count
        return oeuvresUniques && auteursUniques && nombreDeTypes(selection) >= 2
    }

    static func nombreDeTypes(_ selection: [Lieu]) -> Int {
        Set(selection.map { $0.type }).count
    }
}
