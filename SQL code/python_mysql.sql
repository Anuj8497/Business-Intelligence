# create a database

Create database if not exists predicted_outputs;

Create table predicted_outputs
(
   reason_1 Bit Not Null,
   reason_2 Bit Not Null,
   reason_3 Bit Not Null,
   reason_4 Bit Not Null,
   month_value int not null,
   transportation_expense int not null,
   age int not null,
   body_mass_index int not null,
   education int not null,
   children int not null,
   pets int not null,
   probability float not null,
   prediction bit not null
);

Select * from predicted_outputs;

