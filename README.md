# README

## NOT NULL ##

  ## users table ##

   # email(string*, ユニーク制約)
   # encrypted_password(string)*
   # name(string)*
   # profile(text)*
   # occupation(text)*
   # position(text)*

  ## prototypes table ##
  
   # title(string)
   # catch_copy(text)
   # concept(text)
   # user(references, 外部キー)

  ## comments (user_prototype) table ##

   # content(text)
   # prototype(references, 外部キー)
   # user(references, 外部キー)