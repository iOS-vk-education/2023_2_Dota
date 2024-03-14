//
//  MatchModel.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 13.03.2024.
//

import Foundation

struct MatchModel: Decodable {
    let match_id: Int
    let barracks_status_dire: Int
    let barracks_status_radiant: Int
    let cluster: Int
    let dire_score: Int //Dire kills
    let radiant_score: Int //Radiant kills
    let draft_timings: [DraftTimings]?
    let duration: Int
    let engine: Int
    let first_blood_time: Int
    let game_mode: Int
    let human_players: Int
    let leagueid: Int
    let lobby_type: Int
    let match_seq_num: Int
    let negative_votes: Int?
    let positive_votes: Int?
    let picks_bans: [PicksBans]
    let radiant_gold_adv: [Double]?
    let radiant_win: Bool?
    let radiant_xp_adv: [Double]?
    let start_time: Int
    let tower_status_dire: Int
    let tower_status_radiant: Int
    let skill: Int?
    let players: [Players] //Доделать массив игроков
    let patch: Int
    let region: Int
    let `throw`: Int?
    let comeback: Int?
    let loss: Int?
    let win: Int?
    let replay_url: URL?
    
    //let series_type: Int
    //let series_id: Int
    //let replay_salt: Int
    //let version: Int
    
    //Тут хз что с обьектами
    //let all_word_counts
    //let my_word_counts
    //let league тоже хз
    //let dire_team тоже хз какой обьект
    //let radiant_team тоже хз какой обьект
    //let objectives понять какая структура у обьекта потому что очевидного ответа в доке нет
    //let teamfights с этой тоже нужно понять какую структуру хочет получить эта херня
}


struct DraftTimings: Decodable {
    let order: Int
    let pick: Bool
    let active_team: Int
    let hero_id: Int
    let player_slot: Int?
    let extra_time: Int
    let total_time_taken: Int
}


struct PicksBans: Decodable {
    let is_pick: Bool
    let hero_id: Int
    let team: Int
    let order: Int
}


struct Players: Decodable {
    let match_id: Int?
    let player_slot: Int?
    let ability_upgrades_arr: [Int]
    let account_id: Int?
    let assists: Int
    let backpack_0: Int
    let backpack_1: Int
    let backpack_2: Int
    let buyback_log: [BuybackLog]?
    let camps_stacked: Int?
    let connection_log: [ConnectionLog]?
    let creeps_stacked: Int?
    let deaths: Int
    let denies: Int
    let dn_t: [Int]?
    let gold: Int
    let gold_per_min: Int
    let gold_spent: Int
    let gold_t: [Int]?
    let hero_damage: Int
    let hero_healing: Int
    let hero_id: Int
    let item_0: Int
    let item_1: Int
    let item_2: Int
    let item_3: Int
    let item_4: Int
    let item_5: Int
    let kills: Int
    let kills_log: [KillsLog]?
    let last_hits: Int
    let leaver_status: Int
    let level: Int
    let lh_t: [Int]?
    let obs_placed: Int?
    let party_id: Int?
    let pings: Int?
    let purchase_log: [PurchaseLog]?
    let rune_pickups: Int?
    let runes_log: [RunesLog]?
    let sen_placed: Int?
    let stuns: Double?
    let times: [Int]?
    let tower_damage: Int
    let xp_per_min: Int
    let xp_t: [Int]?
    let personaname: String?
    let name: String?
    let last_login: String? //string or null <date-time>
    let radiant_win: Bool?
    let start_time: Int
    let duration: Int
    let cluster: Int
    let lobby_type: Int
    let game_mode: Int
    let patch: Int
    let region: Int
    let isRadiant: Bool
    let win: Int
    let lose: Int
    let total_gold: Int
    let total_xp: Int
    let kills_per_min: Double
    let kda: Double
    let abandons: Int
    let neutral_kills: Int?
    let tower_kills: Int?
    let courier_kills: Int?
    let lane_kills: Int?
    let hero_kills: Int?
    let observer_kills: Int?
    let sentry_kills: Int?
    let roshan_kills: Int?
    let necronomicon_kills: Int?
    let ancient_kills: Int?
    let buyback_count: Int?
    let observer_uses: Int?
    let sentry_uses: Int?
    let lane_efficiency: Double?
    let lane_efficiency_pct: Double?
    let lane: Int?
    let lane_role: Int?
    let is_roaming: Bool?
    let purchase_tpscroll: Int?
    let actions_per_min: Int?
    let life_state_dead: Int?
    
    //хз что делать с этими обьектами
    //let cosmetics
    //let benchmarks
    //let purchase_time
    //let first_purchase_time
    //let item_win
    //let item_usage
    //let xp_reasons
    //let sen_log
    //let sen_left_log
    //let sen
    //let runes
    //let purchase
    //let permanent_buffs
    //let obs_log
    //let obs_left_log
    //let obs
    //let multi_kills
    //let max_hero_hit
    //let life_state
    //let lane_pos
    //let killed_by
    //let killed
    //let kill_streaks
    //let item_uses
    //let hero_hits
    //let gold_reasons
    //let damage_taken
    //let damage_inflictor_received
    //let damage_inflictor
    //let damage
    //let ability_uses
    //let ability_targets
    //let damage_targets
    //let actions
    //let additional_units
}


struct BuybackLog: Decodable{
    let time: Int
    let slot: Int
    let player_slot: Int
}


struct ConnectionLog: Decodable {
    let time: Int
    let event: String
    let player_slot: Int?
}


struct KillsLog: Decodable {
    let time: Int
    let key: String
}


struct PurchaseLog: Decodable {
    let time: Int
    let key: String
    let charges: Int
}


struct RunesLog: Decodable {
    let time: Int
    let key: Int
}
