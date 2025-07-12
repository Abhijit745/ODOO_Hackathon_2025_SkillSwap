USE [master]
GO
/****** Object:  Database [SkillSwap]    Script Date: 12-07-2025 12:34:25 PM ******/
CREATE DATABASE [SkillSwap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkillSwap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SkillSwap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkillSwap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SkillSwap_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SkillSwap] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkillSwap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkillSwap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkillSwap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkillSwap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkillSwap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkillSwap] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkillSwap] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SkillSwap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkillSwap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkillSwap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkillSwap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkillSwap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkillSwap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkillSwap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkillSwap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkillSwap] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SkillSwap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkillSwap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkillSwap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkillSwap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkillSwap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkillSwap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkillSwap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkillSwap] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkillSwap] SET  MULTI_USER 
GO
ALTER DATABASE [SkillSwap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkillSwap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkillSwap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkillSwap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkillSwap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkillSwap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SkillSwap] SET QUERY_STORE = ON
GO
ALTER DATABASE [SkillSwap] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SkillSwap]
GO
/****** Object:  Table [dbo].[OfferedSkillMapping]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferedSkillMapping](
	[ID] [uniqueidentifier] NULL,
	[UserID] [nvarchar](50) NULL,
	[OfferedSkillID] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [uniqueidentifier] NULL,
	[GivenUserID] [nvarchar](50) NULL,
	[ReceiverUserID] [nvarchar](50) NULL,
	[RatingScore] [nvarchar](20) NULL,
	[FeedbackContent] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[ID] [int] NULL,
	[UserType] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillMaster]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillMaster](
	[SkillID] [int] NULL,
	[SkillName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SwapActivity]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwapActivity](
	[ID] [uniqueidentifier] NULL,
	[RequestUserID] [nvarchar](50) NULL,
	[TargetUserID] [nvarchar](50) NULL,
	[OfferedSkillID] [nvarchar](50) NULL,
	[WantededSkillID] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[ActivityStatus] [nvarchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[ID] [uniqueidentifier] NULL,
	[RoleID] [int] NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[ProfilePhoto] [nvarchar](max) NULL,
	[UserLocation] [nvarchar](50) NULL,
	[UserAvailability] [nvarchar](50) NULL,
	[ProfileStatus] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WantededSkillMapping]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WantededSkillMapping](
	[ID] [uniqueidentifier] NULL,
	[UserID] [nvarchar](50) NULL,
	[WantededSkillID] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[RoleMaster] ([ID], [UserType]) VALUES (1, N'User')
GO
INSERT [dbo].[RoleMaster] ([ID], [UserType]) VALUES (2, N'Admin')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (1, N'Web Development (HTML/CSS/JS)')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (2, N'Angular')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (3, N'React.js')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (4, N'Node.js')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (5, N'Python')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (6, N'Java')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (7, N'C#')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (8, N'Flutter')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (9, N'ASP.NET Core')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (10, N'SQL / MySQL / PostgreSQL')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (11, N'MongoDB / NoSQL')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (12, N'RESTful APIs')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (13, N'Git / GitHub / GitLab')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (14, N'Docker & Kubernetes')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (15, N'AWS / Azure / GCP')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (16, N'CI/CD Pipelines')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (17, N'DevOps')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (18, N'Cybersecurity Basics')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (19, N'UI/UX Design (Figma / Adobe XD)')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (20, N'Machine Learning')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (21, N'Data Science')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (22, N'AI Prompt Engineering')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (23, N'TensorFlow / PyTorch')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (24, N'Blockchain Development')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (25, N'Chatbot Development')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (26, N'Game Development (Unity/Unreal)')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (27, N'Software Testing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (28, N'Selenium / Cypress')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (29, N'Power BI / Tableau')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (30, N'Agile / Scrum')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (31, N'Critical Thinking')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (32, N'Problem Solving')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (33, N'Decision Making')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (34, N'Emotional Intelligence')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (35, N'Business Analysis')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (36, N'Strategic Thinking')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (37, N'Leadership')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (38, N'Negotiation Skills')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (39, N'Risk Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (40, N'Project Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (41, N'Design Thinking')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (42, N'Time Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (43, N'Change Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (44, N'Sales Strategy')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (45, N'Product Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (46, N'Public Speaking')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (47, N'Verbal Communication')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (48, N'Presentation Skills')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (49, N'Conflict Resolution')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (50, N'Empathy')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (51, N'Active Listening')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (52, N'Collaboration')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (53, N'Team Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (54, N'Customer Service')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (55, N'Multilingual Communication')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (56, N'Digital Marketing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (57, N'SEO / SEM')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (58, N'Content Marketing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (59, N'Social Media Management')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (60, N'Branding')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (61, N'Influencer Marketing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (62, N'Copywriting')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (63, N'Email Marketing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (64, N'Google Analytics')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (65, N'Affiliate Marketing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (66, N'Graphic Design')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (67, N'Video Editing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (68, N'Motion Graphics')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (69, N'Photography')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (70, N'Animation')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (71, N'Interior Designing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (72, N'Fashion Designing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (73, N'Voice Acting')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (74, N'Music Production')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (75, N'Songwriting')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (76, N'Cooking')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (77, N'Baking & Confectionery')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (78, N'Dancing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (79, N'Yoga')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (80, N'Meditation')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (81, N'Makeup & Beauty Skills')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (82, N'Gardening')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (83, N'Creative Writing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (84, N'Painting / Sketching')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (85, N'Fitness Training')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (86, N'Resume Writing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (87, N'Freelancing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (88, N'Interviewing Techniques')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (89, N'Remote Work Collaboration')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (90, N'Personal Branding')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (91, N'Entrepreneurship')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (92, N'Virtual Assistance')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (93, N'E-commerce')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (94, N'Dropshipping')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (95, N'Amazon FBA')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (96, N'Excel (Advanced)')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (97, N'Financial Planning')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (98, N'Accounting Basics')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (99, N'Taxation / GST Filing')
GO
INSERT [dbo].[SkillMaster] ([SkillID], [SkillName]) VALUES (100, N'MS Office Suite')
GO
INSERT [dbo].[UserDetails] ([ID], [RoleID], [UserEmail], [UserPassword], [FirstName], [LastName], [ProfilePhoto], [UserLocation], [UserAvailability], [ProfileStatus], [IsActive], [CreatedDateTime], [UpdatedDateTime]) VALUES (N'6b847b5c-abb8-4400-aded-756b3a271094', 1, N'user1@gmail.com', N'user!23', N'FirstUser', N'LastUser', NULL, N'Goa', N'Morning', N'Public', 1, CAST(N'2025-07-12T11:26:29.153' AS DateTime), CAST(N'2025-07-12T11:26:29.153' AS DateTime))
GO
/****** Object:  StoredProcedure [dbo].[SS_SP_UserDetailsAction]    Script Date: 12-07-2025 12:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SS_SP_UserDetailsAction]
(
	@ID NVARCHAR(50),
	@userEmail NVARCHAR(50),
	@userPassword NVARCHAR(MAX),
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50),
	@profilePhoto NVARCHAR(MAX),
	@userLocation NVARCHAR(50),
	@userAvailability NVARCHAR(50),
	@profileStatus NVARCHAR(50),
	@action NVARCHAR(10),
	@status BIT OUT,
	@message NVARCHAR(250) OUT
)
AS
BEGIN
	IF(@action = 'INSERT')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM UserDetails WHERE UserEmail = @userEmail AND IsActive = 1)
		BEGIN
			INSERT INTO UserDetails VALUES(
				@ID, 1, @userEmail, @userPassword, @firstName, @lastName, @profilePhoto, @userLocation, @userAvailability, 
				@profileStatus, 1, GETDATE(), NULL
			)
			SET @status = 1
			SET @message = 'User Created Successfully'
		END
		ELSE
		BEGIN
			SET @status = 0
			SET @message = 'User Created Failed'
		END
	END
	ELSE IF (@action = 'EDIT')
	BEGIN
		IF EXISTS (SELECT 1 FROM UserDetails WHERE ID = @ID)
		BEGIN
			UPDATE UserDetails SET UserPassword = @userPassword, FirstName = @firstName, LastName = @lastName, ProfilePhoto = @profilePhoto,
			UserLocation = @userLocation, UserAvailability = @userAvailability, ProfileStatus = @profileStatus, 
			UpdatedDateTime = GETDATE() WHERE ID = @ID
			SET @status = 1
			SET @message = 'User Updated Successfully'
		END
		ELSE
		BEGIN
			SET @status = 0
			SET @message = 'User not found'
			RETURN
		END
	END
	ELSE IF (@action = 'DELETE')
	BEGIN
		IF EXISTS (SELECT 1 FROM UserDetails WHERE ID = @ID)
		BEGIN
			UPDATE UserDetails SET IsActive = 0 WHERE ID = @ID
			SET @status = 1
			SET @message = 'User deleted successfully'
		END
		ELSE
		BEGIN
			SET @status = 0
			SET @message = 'User not found'
			RETURN
		END
	END
	ELSE
	BEGIN
		SET @status = 0
		SET @message = 'Invalid Action'
	END
END
GO
USE [master]
GO
ALTER DATABASE [SkillSwap] SET  READ_WRITE 
GO
