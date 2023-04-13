Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index" })

  # Routes for the Experience resource:

  # CREATE
  post("/insert_experience", { :controller => "experiences", :action => "create" })
          
  # READ
  get("/profiles", { :controller => "experiences", :action => "index" })
  
  get("/profiles/:path_id", { :controller => "experiences", :action => "show" })
  
  # UPDATE
  
  post("/modify_profile/:path_id", { :controller => "experiences", :action => "update" })
  
  # DELETE
  get("/delete_profile/:path_id", { :controller => "experiences", :action => "destroy" })

  #------------------------------

  # Routes for the Resume resource:

  # CREATE
  post("/insert_resume", { :controller => "resumes", :action => "create" })
          
  # READ
  get("/resumes", { :controller => "resumes", :action => "index" })
  
  get("/resumes/:path_id", { :controller => "resumes", :action => "show" })
  
  # UPDATE
  
  post("/modify_resume/:path_id", { :controller => "resumes", :action => "update" })
  
  # DELETE
  get("/delete_resume/:path_id", { :controller => "resumes", :action => "destroy" })

  #------------------------------

  # Routes for the Employer resource:

  # CREATE
  post("/insert_employer", { :controller => "employers", :action => "create" })
          
  # READ
  get("/employers", { :controller => "employers", :action => "index" })
  
  get("/employers/:path_id", { :controller => "employers", :action => "show" })
  
  # UPDATE
  
  post("/modify_employer/:path_id", { :controller => "employers", :action => "update" })
  
  # DELETE
  get("/delete_employer/:path_id", { :controller => "employers", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })
          
  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  
  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })
  
  # UPDATE
  
  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })
  
  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })

  #------------------------------

end
