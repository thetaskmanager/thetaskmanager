
-- Create Users table first, as it has no foreign keys
CREATE TABLE [dbo].[Users]
(
	[id] TINYINT NOT NULL PRIMARY KEY, 
    [fname] VARCHAR(100) NOT NULL, 
    [lname] VARCHAR(100) NOT NULL 
)

-- Create TaskGroups and TaskTypes after Users is created
CREATE TABLE [dbo].[TaskGroups]
(
	[id] TINYINT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(100) NOT NULL, 
    [description] VARCHAR(250) NOT NULL, 
    [userID] TINYINT NOT NULL, 
    CONSTRAINT [FK_TaskGroups_Users] FOREIGN KEY ([userID]) REFERENCES [Users]([id])
)

-- Create TaskTypes and TaskGroups after Users is created
CREATE TABLE [dbo].[TaskTypes]
(
	[id] TINYINT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(100) NOT NULL, 
    [description] VARCHAR(250) NOT NULL, 
    [userID] TINYINT NOT NULL, 
    CONSTRAINT [FK_TaskTypes_Users] FOREIGN KEY ([userID]) REFERENCES [Users]([id])
)

-- Create Tasks table last, as it has Foreign Keys in all other tables
CREATE TABLE [dbo].[Tasks]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [userID] TINYINT NOT NULL, 
    [name] VARCHAR(100) NOT NULL, 
    [description] VARCHAR(250) NOT NULL, 
    [groupID] TINYINT NOT NULL, 
    [typeID] TINYINT NOT NULL, 
    [date] DATETIME NOT NULL, 
    CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([userID]) REFERENCES [Users]([id]), 
    CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([typeID]) REFERENCES [TaskTypes]([id]), 
    CONSTRAINT [FK_Tasks_TaskGroups] FOREIGN KEY ([groupID]) REFERENCES [TaskGroups]([id])
)