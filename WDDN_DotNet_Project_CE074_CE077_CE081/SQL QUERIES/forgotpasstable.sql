create table ForgotPass
(
Id nvarchar(500) not null ,
Uid int null,
requestdatetime datetime null,
constraint [FK_ForgotPass_users] Foreign key ([Uid]) references [users]([Uid])

)