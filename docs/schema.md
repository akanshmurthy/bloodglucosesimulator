# Schema Information

## foods
column name      | data type | details
-----------------|-----------|-----------------------
id               | integer   | not null, primary key
name             | string    | not null
glycemic_index   | integer   | 

## exercises
column name      | data type | details
-----------------|-----------|-----------------------
id               | integer   | not null, primary key
name             | string    | not null
exercise_index   | integer   | 

## events
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
event_type      | string    | not null
index           | integer   | not null
