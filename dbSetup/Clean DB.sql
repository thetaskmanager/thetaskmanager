
-- Drop tables for a "Clean Start"
IF object_id('dbo.Task') IS NOT NULL
BEGIN
	DROP TABLE [dbo].[Task]
END

IF object_id('dbo.Tasks') IS NOT NULL
BEGIN
	DROP TABLE [dbo].[Tasks]
END

IF object_id('dbo.TaskGroups') IS NOT NULL
BEGIN
	DROP TABLE [dbo].[TaskGroups]
END

IF object_id('dbo.TaskTypes') IS NOT NULL
BEGIN
	DROP TABLE [dbo].[TaskTypes]
END

IF object_id('dbo.User') IS NOT NULL
BEGIN
	DROP TABLE [dbo].[User]
END
	
IF object_id('dbo.Users') IS NOT NULL
BEGIN
	DROP TABLE [dbo].[Users]
END