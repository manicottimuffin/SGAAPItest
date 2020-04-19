CREATE TABLE [Users] (
	User_ID varchar(255) NOT NULL,
	Name varchar(255) NOT NULL,
	Description varchar(255) NOT NULL,
  CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED
  (
  [User_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Roles] (
	Role_ID int NOT NULL,
	RoleName varchar(255) NOT NULL,
  CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED
  (
  [Role_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Cross_Users_Roles] (
	User_ID varchar(255) NOT NULL,
	Role_ID int NOT NULL
)
GO
CREATE TABLE [Permissions] (
	Perm_ID int NOT NULL,
	Code_name varchar(255) NOT NULL,
	Pretty_name varchar(255) NOT NULL,
	Description varchar(255) NOT NULL,
  CONSTRAINT [PK_PERMISSIONS] PRIMARY KEY CLUSTERED
  (
  [Perm_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Cross_Role_Perm] (
	Role_ID int NOT NULL,
	Perm_ID int NOT NULL
)
GO
CREATE TABLE [Prop_Type] (
	Prop_ID int NOT NULL,
	Type int NOT NULL,
	Content varchar(1000) NOT NULL,
	Status int NOT NULL,
  CONSTRAINT [PK_PROP_TYPE] PRIMARY KEY CLUSTERED
  (
  [Prop_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Attendance] (
	User_ID varchar(255) NOT NULL,
	Meeting_ID int NOT NULL,
	EntryTime datetime NOT NULL
)
GO
CREATE TABLE [Announcements] (
	User_ID varchar(255) NOT NULL,
	Title varchar(255) NOT NULL,
	subject varchar(255) NOT NULL,
	body varchar(255) NOT NULL,
	Date datetime NOT NULL,
  CONSTRAINT [PK_ANNOUNCEMENTS] PRIMARY KEY CLUSTERED
  (
  [User_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Meeting] (
	Meeting_ID int NOT NULL,
	MeetingTime datetime NOT NULL,
	Lattitude decimal NOT NULL DEFAULT '35.677278',
	Longitude decimal NOT NULL DEFAULT '-88.860602',
	MeetingNum int NOT NULL,
	Minutes text NOT NULL,
  CONSTRAINT [PK_MEETING] PRIMARY KEY CLUSTERED
  (
  [Meeting_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Submitter] (
	Prop_ID int NOT NULL,
	User_ID varchar(255) NOT NULL,
	Type int NOT NULL,
  CONSTRAINT [PK_SUBMITTER] PRIMARY KEY CLUSTERED
  (
  [Prop_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Approver] (
	Prop_ID int NOT NULL,
	User_ID varchar(255) NOT NULL,
	Type int NOT NULL,
  CONSTRAINT [PK_APPROVER] PRIMARY KEY CLUSTERED
  (
  [Prop_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Voting] (
	User_ID varchar(255) NOT NULL,
	VoteChoice int NOT NULL,
	VoteDate datetime NOT NULL,
  CONSTRAINT [PK_VOTING] PRIMARY KEY CLUSTERED
  (
  [User_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO


ALTER TABLE [Cross_Users_Roles] WITH CHECK ADD CONSTRAINT [Cross_Users_Roles_fk0] FOREIGN KEY ([User_ID]) REFERENCES [Users]([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Cross_Users_Roles] CHECK CONSTRAINT [Cross_Users_Roles_fk0]
GO
ALTER TABLE [Cross_Users_Roles] WITH CHECK ADD CONSTRAINT [Cross_Users_Roles_fk1] FOREIGN KEY ([Role_ID]) REFERENCES [Roles]([Role_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Cross_Users_Roles] CHECK CONSTRAINT [Cross_Users_Roles_fk1]
GO


ALTER TABLE [Cross_Role_Perm] WITH CHECK ADD CONSTRAINT [Cross_Role_Perm_fk0] FOREIGN KEY ([Role_ID]) REFERENCES [Roles]([Role_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Cross_Role_Perm] CHECK CONSTRAINT [Cross_Role_Perm_fk0]
GO
ALTER TABLE [Cross_Role_Perm] WITH CHECK ADD CONSTRAINT [Cross_Role_Perm_fk1] FOREIGN KEY ([Perm_ID]) REFERENCES [Permissions]([Perm_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Cross_Role_Perm] CHECK CONSTRAINT [Cross_Role_Perm_fk1]
GO


ALTER TABLE [Attendance] WITH CHECK ADD CONSTRAINT [Attendance_fk0] FOREIGN KEY ([User_ID]) REFERENCES [Users]([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Attendance] CHECK CONSTRAINT [Attendance_fk0]
GO
ALTER TABLE [Attendance] WITH CHECK ADD CONSTRAINT [Attendance_fk1] FOREIGN KEY ([Meeting_ID]) REFERENCES [Meeting]([Meeting_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Attendance] CHECK CONSTRAINT [Attendance_fk1]
GO

ALTER TABLE [Announcements] WITH CHECK ADD CONSTRAINT [Announcements_fk0] FOREIGN KEY ([User_ID]) REFERENCES [Users]([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Announcements] CHECK CONSTRAINT [Announcements_fk0]
GO


ALTER TABLE [Submitter] WITH CHECK ADD CONSTRAINT [Submitter_fk0] FOREIGN KEY ([Prop_ID]) REFERENCES [Prop_Type]([Prop_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Submitter] CHECK CONSTRAINT [Submitter_fk0]
GO
ALTER TABLE [Submitter] WITH CHECK ADD CONSTRAINT [Submitter_fk1] FOREIGN KEY ([User_ID]) REFERENCES [Users]([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Submitter] CHECK CONSTRAINT [Submitter_fk1]
GO

ALTER TABLE [Approver] WITH CHECK ADD CONSTRAINT [Approver_fk0] FOREIGN KEY ([Prop_ID]) REFERENCES [Prop_Type]([Prop_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Approver] CHECK CONSTRAINT [Approver_fk0]
GO
ALTER TABLE [Approver] WITH CHECK ADD CONSTRAINT [Approver_fk1] FOREIGN KEY ([User_ID]) REFERENCES [Users]([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Approver] CHECK CONSTRAINT [Approver_fk1]
GO

ALTER TABLE [Voting] WITH CHECK ADD CONSTRAINT [Voting_fk0] FOREIGN KEY ([User_ID]) REFERENCES [Users]([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Voting] CHECK CONSTRAINT [Voting_fk0]
GO

