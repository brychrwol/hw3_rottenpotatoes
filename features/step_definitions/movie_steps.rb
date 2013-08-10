# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.'
		if Movie.find_all_by_title(movie[:title]) == []
			Movie.create!(movie)
		end
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see movies sorted alphabetically/ do
	presorted_movies = ["2001: A Space Odyssey", "Aladdin", "Amelie", "Chicken Run", "Chocolat", "Raiders of the Lost Ark", "The Help", "The Incredibles", "The Terminator", "When Harry Met Sally"]
	#failbody = "<tr>\n<td>2001: A Space Odyssey</td>\n<td>G</td>\n<td>1968-04-06 00:00:00 UTC</td>\n<td><a href=\"/movies/7\">More about 2001: A Space Odyssey</a></td>\n</tr>\n<tr>\n<td>Aladdin</td>\n<td>G</td>\n<td>1992-11-25 00:00:00 UTC</td>\n<td><a href=\"/movies/1\">More about Aladdin</a></td>\n</tr>\n<tr>\n<td>Amelie</td>\n<td>R</td>\n<td>2001-04-25 00:00:00 UTC</td>\n<td><a href=\"/movies/6\">More about Amelie</a></td>\n</tr>\n<tr>\n<td>Chicken Run</td>\n<td>G</td>\n<td>2000-06-21 00:00:00 UTC</td>\n<td><a href=\"/movies/10\">More about Chicken Run</a></td>\n</tr>\n<tr>\n<td>Chocolat</td>\n<td>PG-13</td>\n<td>2001-01-05 00:00:00 UTC</td>\n<td><a href=\"/movies/5\">More about Chocolat</a></td>\n</tr>\n<tr>\n<td>Raiders of the Lost Ark</td>\n<td>PG</td>\n<td>1981-06-12 00:00:00 UTC</td>\n<td><a href=\"/movies/9\">More about Raiders of the Lost Ark</a></td>\n</tr>\n<tr>\n<td>The Help</td>\n<td>PG-13</td>\n<td>2011-08-10 00:00:00 UTC</td>\n<td><a href=\"/movies/4\">More about The Help</a></td>\n</tr>\n<tr>\n<td>The Incredibles</td>\n<td>PG</td>\n<td>2004-11-05 00:00:00 UTC</td>\n<td><a href=\"/movies/8\">More about The Incredibles</a></td>\n</tr>\n<tr>\n<td>When Harry Met Sally</td>\n<td>R</td>\n<td>1989-07-21 00:00:00 UTC</td>\n<td><a href=\"/movies/3\">More about When Harry Met Sally</a></td>\n</tr>\n<tr>\n<td>The Terminator</td>\n<td>R</td>\n<td>1984-10-26 00:00:00 UTC</td>\n<td><a href=\"/movies/2\">More about The Terminator</a></td>\n</tr>"
	#debugger
	(0..(presorted_movies.length - 2)).each do |i|
		#p "I should see \"#{alpha_sorted_titles[i]}\" before \"#{alpha_sorted_titles[i+1]}\""
		#body_parts = failbody.split("<td>#{alpha_sorted_titles[i]}")
		#p not(body_parts[0].include? alpha_sorted_titles[i+1])

		step "I should see \"#{presorted_movies[i]}\" before \"#{presorted_movies[i+1]}\""
	end
end

Then /I should see movies sorted chronologically/ do
	presorted_movies = ["1968-04-06", "1981-06-12", "1984-10-26", "1989-07-21", "1992-11-25", "2000-06-21", "2001-01-05", "2001-04-25", "2004-11-05", "2011-08-10"]
	(0..(presorted_movies.length - 2)).each do |i|
		step "I should see \"#{presorted_movies[i]}\" before \"#{presorted_movies[i+1]}\""
	end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
	#step "show me the page"
	
	#failbody = "<tr>\n<td>2001: A Space Odyssey</td>\n<td>G</td>\n<td>1968-04-06 00:00:00 UTC</td>\n<td><a href=\"/movies/7\">More about 2001: A Space Odyssey</a></td>\n</tr>\n<tr>\n<td>Aladdin</td>\n<td>G</td>\n<td>1992-11-25 00:00:00 UTC</td>\n<td><a href=\"/movies/1\">More about Aladdin</a></td>\n</tr>\n<tr>\n<td>Amelie</td>\n<td>R</td>\n<td>2001-04-25 00:00:00 UTC</td>\n<td><a href=\"/movies/6\">More about Amelie</a></td>\n</tr>\n<tr>\n<td>Chicken Run</td>\n<td>G</td>\n<td>2000-06-21 00:00:00 UTC</td>\n<td><a href=\"/movies/10\">More about Chicken Run</a></td>\n</tr>\n<tr>\n<td>Chocolat</td>\n<td>PG-13</td>\n<td>2001-01-05 00:00:00 UTC</td>\n<td><a href=\"/movies/5\">More about Chocolat</a></td>\n</tr>\n<tr>\n<td>Raiders of the Lost Ark</td>\n<td>PG</td>\n<td>1981-06-12 00:00:00 UTC</td>\n<td><a href=\"/movies/9\">More about Raiders of the Lost Ark</a></td>\n</tr>\n<tr>\n<td>The Help</td>\n<td>PG-13</td>\n<td>2011-08-10 00:00:00 UTC</td>\n<td><a href=\"/movies/4\">More about The Help</a></td>\n</tr>\n<tr>\n<td>The Incredibles</td>\n<td>PG</td>\n<td>2004-11-05 00:00:00 UTC</td>\n<td><a href=\"/movies/8\">More about The Incredibles</a></td>\n</tr>\n<tr>\n<td>When Harry Met Sally</td>\n<td>R</td>\n<td>1989-07-21 00:00:00 UTC</td>\n<td><a href=\"/movies/3\">More about When Harry Met Sally</a></td>\n</tr>\n<tr>\n<td>The Terminator</td>\n<td>R</td>\n<td>1984-10-26 00:00:00 UTC</td>\n<td><a href=\"/movies/2\">More about The Terminator</a></td>\n</tr>"
	#assert (failbody.include? e1) and (failbody.include? e2)
	#body_parts = failbody.split("<td>"+e1)
  #assert not(body_parts[0].include? e2)
	assert (page.body.include? e1) and (page.body.include? e2)
	assert not(page.body.split("<td>"+e1)[0].include? e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
	rating_list.split(", ").each do |field|
		if uncheck
			step "I uncheck \"ratings_#{field}\""
		else
			step "I check \"ratings_#{field}\""
		end
	end
end


Then /I should see all of the movies/ do
  Movie.all.each do |movie|
		step "I should see \"#{movie[:title]}\""
  end
end
