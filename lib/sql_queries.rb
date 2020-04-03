# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT title, SUM(pledges.amount) FROM pledges LEFT OUTER JOIN projects ON projects.id = pledges.project_id GROUP BY title;"

end 

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
   #"SELECT name, age FROM users LEFT OUTER JOIN projects ON users.id = pledges.amount GROUP BY user_id;"
   "SELECT users.name,users.age,SUM(amount) FROM users, pledges ON pledges.user_id = users.id 
GROUP BY pledges.user_id ORDER BY name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
 "SELECT projects.title, SUM(amount) - projects.funding_goal AS amount_left FROM projects JOIN pledges 
ON pledges.project_id = projects.id GROUP BY projects.title HAVING amount_left > -1;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, SUM(amount) FROM pledges INNER JOIN users ON pledges.user_id = users.id 
GROUP BY users.name ORDER BY SUM(amount) ASC;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount FROM pledges LEFT JOIN projects 
ON pledges.project_id = projects.id WHERE projects.category = 'music';" 
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, SUM(amount) FROM pledges LEFT JOIN projects ON pledges.project_id = projects.id 
GROUP BY projects.category HAVING projects.category = 'books';" 
end
