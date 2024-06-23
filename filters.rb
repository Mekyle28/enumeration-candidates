# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'

def find(id)
    @candidates.each do |candidate|
      if candidate[:id] == id
        return candidate
      end
  end
  nil
end
  
# have 2 or more years experience
  def experienced?(candidate)
    if (candidate[:years_of_experience] >= 2)
      return true 
    end
    false
  end
  


  # have more then 100 github points
  def github_points (candidate)
    if (candidate[:github_points] >= 100)
      return true 
    end
    false  
  end

  # applied in the last 15 days
  def applied_recently (candidate)
    fifteen_days_ago = Date.today - 15
    if (candidate[:date_applied] >= fifteen_days_ago)
      return true 
    end
    false  
  end

  # age 18+
  def age (candidate)
    if (candidate[:age] > 17)
      return true 
    end
    false  
  end

  #know at least one of: Python || ruby
  def programing_language (candidate)
    if (candidate[:languages].include?("Ruby" || "Python"))
      return true 
    end
    false  
  end

  # filter candidates: experienced, 100+ Github points, Know Ruby or Python, Applied last 15 days, are (18+)
  def qualified_candidates(candidates)
    potential_candidates = []
    candidates.each do |candidate|
      if (experienced?(candidate) && github_points(candidate) && applied_recently(candidate) && age(candidate) && programing_language(candidate))
        potential_candidates.push(candidate)
      end
    end
    puts potential_candidates
    return potential_candidates
  end


  def ordered_by_qualifications (candidates)
    ordered_candidates = candidates.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]] }
    ordered_candidates.reverse!
  end


  # testing 

  # puts ordered_by_qualifications(@candidates)
  #qualified_candidates(@candidates)

  # found_candidate = find(7)
  # found_candidate = experienced?(find(7))
  # found_candidate = applied_recently(find(7))
  #found_candidate = age(find(15))
  # found_candidate = programing_language(find(10))

  # if found_candidate
  #   pp "Candidate found: #{found_candidate}"
  # else
  #   pp "Candidate not found"
  # end