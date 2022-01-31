function migrate() {
  local message="Test ENV too? "
  read "reply?$message"
  if [[ "$reply" =~ ^[Yy]$ ]]
  then
    dbmigrate && dbmigrate RAILS_ENV=test;
  else
    dbmigrate;
  fi
}

function rollback() {
  local message="Test ENV too? "
  read "reply?$message"
  if [[ "$reply" =~ ^[Yy]$ ]]
  then
    dbrollback && dbrollback RAILS_ENV=test;
  else
    dbrollback;
  fi
}
