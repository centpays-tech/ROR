Rails.application.routes.draw do
  root 'users#servertest'
  #------------------- Users -----------------#
  post '/signup', to: 'users#signup'
  get '/signup', to: 'users#getUsers'
  #------------------- Sessions -----------------#
  post '/login', to: 'sessions#login'
  patch '/updateuser', to: 'sessions#updateUsers'
  get '/userdetails', to: 'sessions#userDetails'
  post '/sendotp', to: 'sessions#send_otp_by_email'
  patch '/resetpassword', to: 'sessions#resetPassword'
  #------------------- Acquirers -----------------#
  post '/acquirers', to: 'acquirers#createAcquirer'
  get '/acquirers', to: 'acquirers#getAcquirer'
  #------------------- Business Subcategory -----------------#
  post '/businesssubcategories', to: 'business_subcategories#createBusinesSubcategory'
  get '/businesssubcategories', to: 'business_subcategories#getBusinessSubcategory'
  get '/searchbusinesssubcategories', to:'business_subcategories#searchBusinessSubcategory'
  delete '/deletebusinesssubcategory', to: 'business_subcategories#deleteBusinessSubcategory'
  patch '/updatebusinesssubcategory', to: 'business_subcategories#updateBusinessSubcategory'
  #------------------- Business Type -----------------#
  post '/businesstypes', to: 'businesstypes#createBusinessType'
  get '/businesstypes', to: 'businesstypes#getBusinessType'
  get '/searchbusinesstypes', to: 'businesstypes#searchBusinessType'
  delete '/deletebusinesstypes', to: 'businesstypes#deleteBusinessType'
  patch 'updatebusinesstype', to: 'businesstypes#updateBusinessType'
  #------------------- Category -----------------#
  post '/categories', to: 'categories#createCategory'
  get '/categories', to: 'categories#getCategory'
  delete '/deletecategories', to: 'categories#deleteCategory'
  patch '/updatecategories', to: 'categories#updateCategory'
  #------------------- Clients -----------------#
  post '/clients', to: 'clients#createClient'
  get '/clients', to: 'clients#getClient'
  patch '/updateclients', to: 'clients#updateClient'
  #------------------- Clients -----------------#
  post '/banks', to: 'banks#createBank'
  get '/banks', to: 'banks#getBank'
  delete '/deletebank', to: 'banks#deleteBank'
  patch '/updatebank', to: 'banks#updateBank'
  #------------------- Currency -----------------#
  post '/currencies', to: 'currencies#createCurrency'
  get '/currencies', to: 'currencies#getCurrency'
  delete '/deletecurrency', to: 'currencies#deleteCurrency'
  patch '/updatecurrency', to: 'currencies#updateCurrency'
  #------------------- Document category -----------------#
  post '/documentcategories', to: 'documentcategories#createDocumentcategory'
  get '/documentcategories', to: 'documentcategories#getDocumentcategories'
  delete '/deletedocumentcategories', to: 'documentcategories#deleteDocumentcategory'
  patch '/updatedocumentcategories', to: 'documentcategories#updateDocumentcategory'
  #------------------- Document types -----------------#
  post '/documenttypes', to: 'documenttypes#createDocumenttype'
  get '/documenttypes', to: 'documenttypes#getDocumenttypes'
  delete '/deletedocumenttype', to: 'documenttypes#deleteDocumenttype'
  patch '/updatedocumenttypes', to: 'documenttypes#updateDocumenttype'
  #------------------- Document types -----------------#
  get '/getlivedate', to: 'live_transaction_tables#get_livedata'
end