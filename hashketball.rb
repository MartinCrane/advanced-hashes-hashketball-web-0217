
def game_hash

  game_hash = {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
      number: 4,
      shoe: 18,
      points: 10,
      rebounds: 1,
      assists: 1,
      steals: 2,
      blocks: 7,
      slam_dunks: 2
    },
    "Bismak Biyombo" => {
      number: 0,
      shoe: 16,
      points: 12,
      rebounds: 4,
      assists: 7,
      steals: 7,
      blocks: 15,
      slam_dunks: 10
    },
    "DeSagna Diop" => {
      number: 2,
      shoe: 14,
      points: 24,
      rebounds: 12,
      assists: 12,
      steals: 4,
      blocks: 5,
      slam_dunks: 5
    },
    "Ben Gordon" => {
      number: 8,
      shoe: 15,
      points: 33,
      rebounds: 3,
      assists: 2,
      steals: 1,
      blocks: 1,
      slam_dunks: 0
    },
    "Brendan Haywood" => {
      number: 33,
      shoe: 15,
      points: 6,
      rebounds: 12,
      assists: 12,
      steals: 22,
      blocks: 5,
      slam_dunks: 12
    }
    }
  }
}
end

def num_points_scored(player_name)
  if game_hash[:home][:players].keys.include? player_name
    game_hash[:home][:players][player_name][:points]
  else
    game_hash[:away][:players][player_name][:points]
  end
end

def shoe_size(player_name)
  if game_hash[:home][:players].keys.include? player_name
    game_hash[:home][:players][player_name][:shoe]
  else
    game_hash[:away][:players][player_name][:shoe]
  end
end

def team_colors(team)
  answer = ""
  game_hash.each do |home_away, team_stats|
    if team_stats[:team_name] == team
      puts "activated"
      answer = team_stats[:colors]
    end
  end
  answer
end

def team_names
  team_name_answer = []
  game_hash.each do |home_away, data|
    data.each do |cat, answers|
      if cat == :team_name

        team_name_answer.push(answers)
      end
    end
  end
team_name_answer
end

def player_numbers(xxx)
  player_numbers_answer = []
  game_hash.each do |home_away, data|
    if game_hash[home_away][:team_name] == xxx
      # puts home_away.to_s
      data.each do |bk_team_stats, answers|
        # puts bk_team_stats.to_s
        if bk_team_stats == :players
          # puts bk_team_stats.to_s
          answers.each do |player_name, player_stats|
            player_stats.each do |stat_cat, numbers|
              if stat_cat == :number
                player_numbers_answer.push(numbers)
              end
            end
          end
        end
      end
    end
  end
player_numbers_answer
end

def player_stats(xxx)
  player_stats_answer = []
  game_hash.each do |home_away, data|
      data.each do |all_team_stats, answers|
        if all_team_stats == :players
          answers.each do |player_name, player_stats|
            if player_name == xxx
              player_stats_answer = player_stats
            end
          end
        end
      end

  end

player_stats_answer
end

def big_shoe_rebounds
  shoe_sizes = 0
  final_answer = ""
  game_hash.each do |home_away, data|
      data.each do |all_team_stats, answers|
        if all_team_stats == :players
          answers.each do |player_name, player_stats|
            player_stats.each do |stat_category, stat|
              if stat_category == :shoe
                if stat > shoe_sizes
                  shoe_sizes = stat
                  puts player_name.to_s
                  final_answer = game_hash[home_away][:players][player_name][:rebounds]
                end
              end
            end
          end
        end
      end
  end

final_answer

end
