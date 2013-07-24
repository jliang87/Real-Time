Clio-Project
============

For Clio

1) Near-real-time AJAX status refresh feature done - Statuses update every 3 seconds.

2) Putting users into teams feature done - Used polymorphic association; users pick their teams at sign-up.

3) All integration tests done using Capybara (spec/requests/index_page_spec.rb). Coverage include testing the above two features (requires PhantomJS on system) and user sign in, sign up, and sign out. 

4) Due to that the original conversion migration won't work in PostgreSQL (Error: PG::Error: ERROR:  column "current_sign_in_ip" cannot be cast to type integer), the first thing that I've done before working on the project was to edit the migration file to make the migration successful. To test the integrity of the data, I migrated the conversion for "last_sign_in_ip" when there're data present and validated that all data are intact.  


