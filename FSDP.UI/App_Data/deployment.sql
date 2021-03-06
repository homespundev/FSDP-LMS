IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonsQuizzes_Quizzes]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]'))
ALTER TABLE [dbo].[LessonsQuizzes] DROP CONSTRAINT [FK_LessonsQuizzes_Quizzes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonsQuizzes_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]'))
ALTER TABLE [dbo].[LessonsQuizzes] DROP CONSTRAINT [FK_LessonsQuizzes_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassSignUps_ClassDates]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassSignUps]'))
ALTER TABLE [dbo].[ClassSignUps] DROP CONSTRAINT [FK_ClassSignUps_ClassDates]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassSignUps_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassSignUps]'))
ALTER TABLE [dbo].[ClassSignUps] DROP CONSTRAINT [FK_ClassSignUps_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassDates_StoreClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassDates]'))
ALTER TABLE [dbo].[ClassDates] DROP CONSTRAINT [FK_ClassDates_StoreClasses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[StoreClasses]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreClasses]') AND type in (N'U'))
DROP TABLE [dbo].[StoreClasses]
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quizzes]') AND type in (N'U'))
DROP TABLE [dbo].[Quizzes]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
DROP TABLE [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[LessonsQuizzes]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]') AND type in (N'U'))
DROP TABLE [dbo].[LessonsQuizzes]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
DROP TABLE [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
DROP TABLE [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
DROP TABLE [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[ClassSignUps]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassSignUps]') AND type in (N'U'))
DROP TABLE [dbo].[ClassSignUps]
GO
/****** Object:  Table [dbo].[ClassDates]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassDates]') AND type in (N'U'))
DROP TABLE [dbo].[ClassDates]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/13/2017 9:53:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ClassDates]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassDates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClassDates](
	[ClassDateID] [int] IDENTITY(1,1) NOT NULL,
	[StoreClassID] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ClassLimit] [tinyint] NULL,
 CONSTRAINT [PK_ClassDates] PRIMARY KEY CLUSTERED 
(
	[ClassDateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ClassSignUps]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassSignUps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClassSignUps](
	[ClassSignUpID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ClassDateID] [int] NOT NULL,
 CONSTRAINT [PK_ClassSignUps] PRIMARY KEY CLUSTERED 
(
	[ClassSignUpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CourseID] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CourseImage] [varchar](100) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoUrl] [varchar](250) NULL,
	[PdfFileName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[LessonImage] [varchar](100) NULL,
	[QuizQuestion] [varchar](300) NOT NULL,
	[QuizAnswer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LessonsQuizzes]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonsQuizzes](
	[QuizID] [int] NOT NULL,
	[LessonID] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[LessonID] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quizzes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quizzes](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](200) NOT NULL,
	[CorrectAnswer] [varchar](50) NOT NULL,
	[WrongAnswer1] [varchar](50) NULL,
	[WrongAnswer2] [varchar](50) NULL,
	[WrongAnswer3] [varchar](50) NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoreClasses]    Script Date: 12/13/2017 9:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreClasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreClasses](
	[StoreClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[ClassDescription] [varchar](500) NULL,
 CONSTRAINT [PK_StoreClasses] PRIMARY KEY CLUSTERED 
(
	[StoreClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201712041659250_InitialCreate', N'FSDP.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FEB36127E5F60FF83A0A7EE22B572D9737036B05BA44EDC0D36371C2745DF0E688976842351AA44A50916FD657DE84FEA5F5852A22EBC49942D5F5214288EC9E137C3E10C391C0DF3E7EF7F8CBF7F0D03EB0526A91FA1897D323AB62D88DCC8F3D16A626778F9ED27FBFBEFFEFEB7F19517BE5A3F957467948E8C44E9C47EC6383E779CD47D86214847A1EF26511A2DF1C88D42077891737A7CFC6FE7E4C48104C226589635FE9C21EC8730FF417E4E23E4C2186720B88D3C18A4AC9DF4CC7354EB0E84308D810B27F66C7EF9307ABA1E1594B67511F880483187C1D2B60042110698C878FE94C2394E22B49AC7A401048F6F3124744B10A490C97E5E939B4EE3F8944EC3A90796506E96E228EC097872C6F4E288C3D7D2AE5DE98D68EE8A6818BFD159E7DA9BD8D71ECC9B3E47015180C8F07C1A24947862DF562C2ED2F80EE25139705440CE1202F76B947C1D35118F2CE37147951D9D8E8EE97F47D6340B7096C00982194E4070643D648BC077FF0BDF1EA3AF104DCE4E16CBB34F1F3E02EFECE3BFE0D987E64CC95C091DD7409A1E92288609910D2EABF9DB96C38F73C481D5B0C698422BC496884BD8D62D78BD8168859F89B39C7EB2AD99FF0ABDB28519D713F28907914138C9C8CFBB2C08C0228055BFD3CA93FEBF85EBE9878F8370BD032FFE2A5F7A813F719C84F8D56718E4BDE9B31F17EEC5ADF71746364BA290FEE6EDABE8FD328FB2C4A59389B4248F205941CC4B37766AE33532690A35BC5997A8876FDA5452D9BC95A47442EB7842C962D7DE50CABB5DBEC6167711C764F172D3A21A693338FEA01A09238F2CD65F9BCC89A9C9203295BFF20E38F39314776C83E49F46ACDB39DD801D31BA0A811F0CB0AB1B7021C1D4D24F42582DDC0F11F121807A2FC3034853B2A979FF01E9F3D61534876E96105F9B6310C65BE7F6F01C217897850BEAC2BBE335D8D23CFE1ACD808BA3E40AD1511BE3DD44EED728C357C8BB04183E61B704A43F1FFDD01C6010712E5C17A6E98C1833F4A611B92B9480D7089F9DF686A3FBEDBEA3AA6900FC501D560927C39792B40EADD4145278A5215385586DA2DE442B1F99895A92EA452D283A4565647D45A5606692324ABDA03941A79C05D560416BBE42C347AD39ECE187AD9BC523BABDA0A1C639D921E18F10C1846C63DE03C01826A85E01937D631FF14FBE7C94E9D6CFA69CD34F20C88666B59637E49BC0F0DE90C31EBE37E46292E617DFA35189C15DAE2426F046F4EA6B62B7CF0992EDDA1DB869EE9AF96EF6009DBB5CA469E4FAB91728B2782C07C3CB4F6238AB3B2153CC464CEA90891143F7E991475AC8DC6CD1A8EED1250C2086D6855B6439A720758127AB914CC8EB215879A22A04AB933BBC70FF9478124B87091D04E82528259EEA232CBB858F5C3F0641A79684918647189D7BC543ECB98431449461A7264C98AB733954808A8FB0285D1A1A3B0D8B6B37444DD4AA5BF3AE10B65E7729C5B2139BEC889D3576C9E2B7AD1866BBC676609CED2A3111409B97DC8781B2BB8AA901881797433350E1C6A431501652EDC440798DEDC1407995BC3B032DAEA8A6EB2FDC570FCD3CF98BF2EE8FF55675EDC136397D1C986916B1271983C90898C8E679B9A09DF0152B2E67444E763F4B59A82B9A08059F43CCA76CEA785719873AED20A211B501D686D601CABE684A409243F510AECCE5B54AC7A2881EB065DEAD1596EDFD026CC30664ECE697DD06A1FEFBAF689C46B78F6A66953548466E745968E0280C42DCBCF8891B28459797951563120BF789861B13638BD1A2A08EC855A3A47232836BA934CD6E2DA902B23E21D9465A12C2278D96CAC90CAE2566A3DD4A5204053DC2828D54C41FE103395B99E9A84E9BAA6FEC14C55EAC61EC68AAC2C6B7208E7DB46A5489B1166B5E94884DBF9DF7AF9F0A0B0CC74D15655495B415271C256005855EC29A489A7FBEBE04182C00CDF34CBD5022539EAD9AEDBF64D93C3EE5452CCF81929AFE9B7D4DE7EB10B873560E44D8F819995D48A3993C85AE587BF5708B56EC8100248AACFD340AB210E9832BFDE8E2DB5D737CD122238C1D417E297892342585B8BCDA8D164576880116A88A5BD65F243D844ED565D4D954B62E12D5A39489A9268A2E59B5B745D30530C60B25C685FDD7A913613BFED4A8AF6982349ACDB1EA0A9A2654DD6A8EC44A649A30ACA92746A3CA42026BF499A3F285304D4CBEC71C51A87669420A5D3DA46CD6B47042363BD6C2D368544D61CE41AE6269A2CBBD3DAC52AE67E1CC53EE5E035B21B3D8678EAA287969022BBACDB1EBFA17715B3FE073547B875AEB202DAED89B9DA41A8CEDECD1C31CC48D4A822650A3B92716AB1590C058FB415A92F69EB99625155995CD2C4983A1DF71B8EFEFFC86D35A34A0C7E43EAA739B7A5B51811EAF9FBD6ED52AA42BA6485271AFAE9AC29572CCAE77DDAF91A4FB5E41625BA51AC981FE9662188E28C168FE4B300D7C48B7EF92E016207F09535C1492D8A7C727A7C2A3A6C37960E4A4A91728AEC7BA5746FC9AEDA0260CBD80C47D06895CA1B1C1239C1A544A7E5F230FBE4EECFFE5A3CEF33C0AFD57DE7C645DA74FC8FF25231D8F4906ADDFE48AD3611E25B45FF70EF40989B956AF7FFE520C3DB2EE13E231E7D6B1A0CB7556987F58D24B9A62E806D2ACFDDCE4FD3A94F4A6A344FE2604AFFF68C2ADF36E632330EE6D8672C282AFAEFF1463E1E3419E616C345FE5538B8D1015CF2986C21B4485BAE712EB60699F4A78E427CE9F4AF4B465E5D3897544D33E9BF0517F30F1D184F90E598EDCE329A8B8AAED62B7CCF5DC5974BE5105EABE8F4DA9367D234797EBCF7BC06D5063BE8665BCB3F2ECC10E6E45F5F560D8FB34EDAD975C1F4A95755DFFB2DFE2EA5DD653B77C3BFB4B95511F40E19FA29069FFC5D2BBB6355D7AF9C02B4EFB95441F98B1B1F2B6FD173EEFDAD87419E80337B65EE5CD07666BFB3A3FF76C69C647E8DE8B95E5BA2BCD6722559ABAAB18B9C8E9931BFE222246504494C51B5275F55B5BE56E07C39A44CF545F762732961C47E22B51B4B3ED375776E0B74E96D1B4B3D514ABB6F166FB7F2B6F46D3CE5B5302BA8F326A6511A6AAB4BD631F6BAB147B4F65D3DC4C3AAAF4BB62D6D66FFEEFA94A7A10A570DEA3F97CFD7E8AA20751C990AED3A3085AFE124DCECEC65FCF24E777EAAF6A08FAB7341174B953B3A2B946CBA83CBC05894A122143730B31F0C8917A91607F095C4CBA698E397F049FE7EDE8978E05F4AED17D86E30C9329C3701170092F1A04B4F1CF2BBD7999C7F771FEF75C86980211D3A7B9F97BF443E6075E25F74C9113D240D0E8826574E95A629AD95DBD55487711320462EAAB82A24718C601014BEFD11CBCC0756423E6770357C07DAB33803A90EE85E0D53EBEF4C12A0161CA30EAF1E427B1612F7CFDEEFF6C78BEC844560000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'dbf3ab4b-1207-40e5-8046-b55600c1b66a', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9c425413-4de1-44f7-9f54-14835e7f8c1d', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f7f639cf-959c-4b43-b3ee-34b45be7d1c7', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'e2a15556-ceeb-4f53-a22a-352a4700d594', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6b7670e1-7004-486b-a5c0-1ac183fa620c', N'9c425413-4de1-44f7-9f54-14835e7f8c1d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9398f840-fc87-4e7f-bec3-c641bbf4c285', N'9c425413-4de1-44f7-9f54-14835e7f8c1d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'deee01ed-82d7-47a2-bfa3-b4a84389b2ff', N'9c425413-4de1-44f7-9f54-14835e7f8c1d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'292228a0-4c83-48c0-8ebf-95ef89959e2c', N'dbf3ab4b-1207-40e5-8046-b55600c1b66a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1da75bf4-801b-4b66-8402-2a2fe3160e62', N'e2a15556-ceeb-4f53-a22a-352a4700d594')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0792faa2-2fa9-4ec0-b288-4eb98643982a', N'f7f639cf-959c-4b43-b3ee-34b45be7d1c7')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', N'f7f639cf-959c-4b43-b3ee-34b45be7d1c7')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'54c9638d-d526-4516-9e0b-40841146a930', N'f7f639cf-959c-4b43-b3ee-34b45be7d1c7')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0792faa2-2fa9-4ec0-b288-4eb98643982a', N'William', N'Chartam', N'wchartam@nibinc.com', 1, N'AKs7BN4WSPI0A5wN/ef1S7etVj1HjP5mIQ8yk4wmF+i5WOikrysIf/8L4trSAS1Ntw==', N'680c89cd-c759-4cf1-9531-4fadf1deb74f', NULL, 0, 0, NULL, 1, 0, N'wchartam@nibinc.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1da75bf4-801b-4b66-8402-2a2fe3160e62', N'Jim', N'Penman', N'jpenman@nibinc.com', 0, N'AKO/sq83niQTX4bG/2RdEDJqXOXT/vu7V4/c6ZAoDRpR3Zs8ULWpB6mOQVTY2gitTQ==', N'6182849f-a81f-4562-b9e0-6b41df467dd4', NULL, 0, 0, NULL, 1, 0, N'jpenman@nibinc.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'292228a0-4c83-48c0-8ebf-95ef89959e2c', N'Mary', N'Frey', N'mary@homespundev.com', 0, N'APCwXT3IUOZLJP75ITjL2mfugc5sAvl9W+5Goq3GuScgpDV7y1uysV+oq/DkhA31Rg==', N'6dfb0007-2eae-4d4d-ac55-6cf789b3f13a', NULL, 0, 0, NULL, 1, 0, N'mary@homespundev.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', N'Frank', N'Papier', N'fpapier@nibinc.com', 0, N'AGSMifCYMb5BsKz/1ZHeyWuvWicrzcOMxQaIXIYnhvP2jk2FZIM86WAReg3tq0z+4g==', N'9f014e25-31fc-4cbc-8e28-74466c758f25', NULL, 0, 0, NULL, 1, 0, N'fpapier@nibinc.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'54c9638d-d526-4516-9e0b-40841146a930', N'Eric', N'Reid', N'ereid@centriq.com', 1, N'ANqSwF1otufsfuSUmOAAik7MwuD/0aiANGImJqW3OujXD9HjJKzh9eR8CGQRtSenkA==', N'6332aafa-4dc5-4e3f-8a14-9452fecf39c2', NULL, 0, 0, NULL, 1, 0, N'ereid@centriq.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6b7670e1-7004-486b-a5c0-1ac183fa620c', N'John', N'Hancock', N'jhancock@declaration.gov', 1, N'AHpIv8435q7qY7m5B/M9eA+4RfmX5ylIuJKHe4SF6FI6fMYLJ5/gBNLnKJJiuO2w8w==', N'b46904c8-12d6-469b-98a3-8ac7aa2053d8', NULL, 0, 0, NULL, 1, 0, N'jhancock@declaration.gov')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9398f840-fc87-4e7f-bec3-c641bbf4c285', N'Steve', N'Rogers', N'cptrogers@shield.org', 0, N'AH2AWuHxc0oQW7E738eJHcPZaVBsuH+pQKnlU8tEgD5QIRh0Kz1iSWpisSZRojZmPg==', N'7e37fd26-d184-45f4-8c58-ef05b1d8a7b2', NULL, 0, 0, NULL, 1, 0, N'cptrogers@shield.org')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'deee01ed-82d7-47a2-bfa3-b4a84389b2ff', N'Beatrix', N'Potter', N'bpotter@cottontail.com', 0, N'AEWVVT8JtxUNeHa8zkpg3cYo7rQMTeUdAIJ0FDfv8YjLM9wpY1KAB88JDhFSiCAUsw==', N'e5eb4659-810c-4970-8278-70085c6123d0', NULL, 0, 0, NULL, 1, 0, N'bpotter@cottontail.com')
SET IDENTITY_INSERT [dbo].[ClassDates] ON 

INSERT [dbo].[ClassDates] ([ClassDateID], [StoreClassID], [DateTime], [ClassLimit]) VALUES (2, 1, CAST(0x0000A84900000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClassDates] OFF
SET IDENTITY_INSERT [dbo].[ClassSignUps] ON 

INSERT [dbo].[ClassSignUps] ([ClassSignUpID], [UserID], [ClassDateID]) VALUES (1, N'0792faa2-2fa9-4ec0-b288-4eb98643982a', 2)
SET IDENTITY_INSERT [dbo].[ClassSignUps] OFF
SET IDENTITY_INSERT [dbo].[CourseCompletions] ON 

INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (2, N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', 16, CAST(0xA03D0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3, N'0792faa2-2fa9-4ec0-b288-4eb98643982a', 16, CAST(0xA03D0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (4, N'54c9638d-d526-4516-9e0b-40841146a930', 16, CAST(0xA13D0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (5, N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', 17, CAST(0xA13D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[CourseCompletions] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (16, N'Getting Your Nib Wet', N'An introduction course to help you get to know our company better', 1, N'a9bdd390-5534-48c2-8552-bcb50eac429d.png')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (17, N'The Weighty Topic of Paper', N'An overview of different paper types and their uses for artists', 1, N'f898e631-14f2-434a-b83f-ba51c410d6c5.png')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (18, N'Let Your Ink Flow', N'An overview of different ink types, goauches, and paints for all pen and brush types and all lettering techniques', 1, N'719aa570-901f-4076-8a37-4b4483520845.jpg')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (19, N'The Pen is Mightier Than The Sword', N'An overview of different pen types, brands, nibs, and more', 1, N'noimage.jpg')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (20, N'Calligraphy 101', N'An introduction to various types of calligraphy', 1, N'noimage.jpg')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (21, N'The Art of Papermaking', NULL, 1, N'noimage.jpg')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (22, N'The Art & Science of Making Ink', NULL, 1, N'noimage.jpg')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [IsActive], [CourseImage]) VALUES (24, N'Odds & Ends', N'A few more things you need to know.', 1, N'4d2c7e2d-29c1-49dd-b5e7-5bdbd9f4de09.jpg')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoUrl], [PdfFileName], [IsActive], [LessonImage], [QuizQuestion], [QuizAnswer]) VALUES (1, N'Nib, Inc. Philosophy', 16, N'An introduction to Nib, Inc''s company philosophy', NULL, N'97fa3f9e-f3ba-41b1-b94c-91cc6f3c4f56.pdf', 1, NULL, N'What''s another word for purveyor?', N'seller')
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoUrl], [PdfFileName], [IsActive], [LessonImage], [QuizQuestion], [QuizAnswer]) VALUES (2, N'Policies', 16, N'An overview of Nib, Inc''s conduct & customer service policies', NULL, NULL, 1, NULL, N'The customer is always ________.', N'right')
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoUrl], [PdfFileName], [IsActive], [LessonImage], [QuizQuestion], [QuizAnswer]) VALUES (4, N'Procedures', 16, N'An overview of common procedures', NULL, N'', 1, NULL, N'True or False: You should ensure all customers have left before counting the register drawer.', N'True')
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoUrl], [PdfFileName], [IsActive], [LessonImage], [QuizQuestion], [QuizAnswer]) VALUES (5, N'Papers for Final Drafts', 17, N'Ideal papers for final drafts made with various media', NULL, N'3e07697b-0aad-453b-a0a1-b9bbdef35823.pdf', 1, NULL, N'What does the "g" is gsm stand for?', N'grams')
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoUrl], [PdfFileName], [IsActive], [LessonImage], [QuizQuestion], [QuizAnswer]) VALUES (6, N'Practice Paper', 17, N'An overview of ideal papers for practice and rough drafts for various media', NULL, N'', 1, NULL, N'True or False: Vellum is great for calligraphy practice', N'true')
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoUrl], [PdfFileName], [IsActive], [LessonImage], [QuizQuestion], [QuizAnswer]) VALUES (9, N'Thing -a-ma-bobs', 24, N'A few helpful terms', NULL, N'baed9f0a-d424-46fb-bb5c-b3e84f40af62.pdf', 1, NULL, N'The most common nib is made from what metal?', N'steel')
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (8, N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', 1, CAST(0xA03D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (9, N'0792faa2-2fa9-4ec0-b288-4eb98643982a', 1, CAST(0xA03D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (10, N'54c9638d-d526-4516-9e0b-40841146a930', 1, CAST(0xA13D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (11, N'54c9638d-d526-4516-9e0b-40841146a930', 2, CAST(0xA13D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (12, N'54c9638d-d526-4516-9e0b-40841146a930', 4, CAST(0xA13D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (13, N'54c9638d-d526-4516-9e0b-40841146a930', 6, CAST(0xA13D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (14, N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', 5, CAST(0xA13D0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (15, N'37bb8bcd-9a78-417a-9d68-e2f5b4b02390', 6, CAST(0xA13D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
SET IDENTITY_INSERT [dbo].[StoreClasses] ON 

INSERT [dbo].[StoreClasses] ([StoreClassID], [ClassName], [ClassDescription]) VALUES (1, N'Starting Your Online Craft Business', NULL)
INSERT [dbo].[StoreClasses] ([StoreClassID], [ClassName], [ClassDescription]) VALUES (2, N'Historic Inks & Papers', N'Papers and Ink from around the world and throughout history (and how to make a few!)')
SET IDENTITY_INSERT [dbo].[StoreClasses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassDates_StoreClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassDates]'))
ALTER TABLE [dbo].[ClassDates]  WITH CHECK ADD  CONSTRAINT [FK_ClassDates_StoreClasses] FOREIGN KEY([StoreClassID])
REFERENCES [dbo].[StoreClasses] ([StoreClassID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassDates_StoreClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassDates]'))
ALTER TABLE [dbo].[ClassDates] CHECK CONSTRAINT [FK_ClassDates_StoreClasses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassSignUps_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassSignUps]'))
ALTER TABLE [dbo].[ClassSignUps]  WITH CHECK ADD  CONSTRAINT [FK_ClassSignUps_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassSignUps_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassSignUps]'))
ALTER TABLE [dbo].[ClassSignUps] CHECK CONSTRAINT [FK_ClassSignUps_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassSignUps_ClassDates]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassSignUps]'))
ALTER TABLE [dbo].[ClassSignUps]  WITH CHECK ADD  CONSTRAINT [FK_ClassSignUps_ClassDates] FOREIGN KEY([ClassDateID])
REFERENCES [dbo].[ClassDates] ([ClassDateID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClassSignUps_ClassDates]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClassSignUps]'))
ALTER TABLE [dbo].[ClassSignUps] CHECK CONSTRAINT [FK_ClassSignUps_ClassDates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonsQuizzes_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]'))
ALTER TABLE [dbo].[LessonsQuizzes]  WITH CHECK ADD  CONSTRAINT [FK_LessonsQuizzes_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonsQuizzes_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]'))
ALTER TABLE [dbo].[LessonsQuizzes] CHECK CONSTRAINT [FK_LessonsQuizzes_Lessons]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonsQuizzes_Quizzes]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]'))
ALTER TABLE [dbo].[LessonsQuizzes]  WITH CHECK ADD  CONSTRAINT [FK_LessonsQuizzes_Quizzes] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quizzes] ([QuizID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonsQuizzes_Quizzes]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonsQuizzes]'))
ALTER TABLE [dbo].[LessonsQuizzes] CHECK CONSTRAINT [FK_LessonsQuizzes_Quizzes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
