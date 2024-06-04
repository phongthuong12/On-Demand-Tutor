USE [master]
GO
/****** Object:  Database [On_Demand_Tutor]    Script Date: 6/4/2024 3:40:29 PM ******/
CREATE DATABASE [On_Demand_Tutor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'On_Demand_Tutor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\On_Demand_Tutor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'On_Demand_Tutor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\On_Demand_Tutor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [On_Demand_Tutor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [On_Demand_Tutor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [On_Demand_Tutor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET ARITHABORT OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [On_Demand_Tutor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [On_Demand_Tutor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [On_Demand_Tutor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [On_Demand_Tutor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [On_Demand_Tutor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [On_Demand_Tutor] SET  MULTI_USER 
GO
ALTER DATABASE [On_Demand_Tutor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [On_Demand_Tutor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [On_Demand_Tutor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [On_Demand_Tutor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [On_Demand_Tutor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [On_Demand_Tutor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [On_Demand_Tutor] SET QUERY_STORE = ON
GO
ALTER DATABASE [On_Demand_Tutor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [On_Demand_Tutor]
GO
/****** Object:  Table [dbo].[certificate]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificate](
	[certificate_id] [int] IDENTITY(1,1) NOT NULL,
	[certificate_name] [varchar](100) NULL,
	[tutor_id] [int] NULL,
	[certificate_img] [varchar](2048) NULL,
PRIMARY KEY CLUSTERED 
(
	[certificate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[complaint]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[complaint](
	[complaint_id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[user_id] [int] NULL,
	[complaint_text] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[complaint_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[day_slot]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day_slot](
	[day_slot_id] [int] IDENTITY(1,1) NOT NULL,
	[day_slot] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[day_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[grade_level] [varchar](100) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moderator]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moderator](
	[moderator_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[moderator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[register]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register](
	[register_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[registerDetail_id] [int] NULL,
	[service_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[register_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registerDetail]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registerDetail](
	[registerDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[registerStatus_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[registerDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registerStatus]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registerStatus](
	[registerStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[registerStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[review_id] [int] NOT NULL,
	[review_score] [decimal](2, 1) NULL,
	[review_text] [nvarchar](255) NULL,
	[subject_id] [int] NULL,
	[tutor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NULL,
	[day_slot_id] [int] NULL,
	[time_slot_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
	[tutor_video] [varchar](2048) NULL,
	[tutor_id] [int] NULL,
	[description] [nvarchar](255) NULL,
	[subject_id] [int] NULL,
	[grade_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[grade_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_slot]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_slot](
	[time_slot_id] [int] IDENTITY(1,1) NOT NULL,
	[time_slot] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[time_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutor]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutor](
	[tutor_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tutor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/4/2024 3:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[phone_number] [varchar](15) NULL,
	[address] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[complaint] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[certificate]  WITH CHECK ADD FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor] ([tutor_id])
GO
ALTER TABLE [dbo].[complaint]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[moderator]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[register]  WITH CHECK ADD FOREIGN KEY([registerDetail_id])
REFERENCES [dbo].[registerDetail] ([registerDetail_id])
GO
ALTER TABLE [dbo].[register]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[register]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[registerDetail]  WITH CHECK ADD FOREIGN KEY([registerStatus_id])
REFERENCES [dbo].[registerStatus] ([registerStatus_id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor] ([tutor_id])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([day_slot_id])
REFERENCES [dbo].[day_slot] ([day_slot_id])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([time_slot_id])
REFERENCES [dbo].[time_slot] ([time_slot_id])
GO
ALTER TABLE [dbo].[service]  WITH CHECK ADD FOREIGN KEY([grade_id])
REFERENCES [dbo].[grade] ([grade_id])
GO
ALTER TABLE [dbo].[service]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[subjects]  WITH CHECK ADD FOREIGN KEY([grade_id])
REFERENCES [dbo].[grade] ([grade_id])
GO
ALTER TABLE [dbo].[tutor]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD CHECK  (([review_score]>=(1) AND [review_score]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [On_Demand_Tutor] SET  READ_WRITE 
GO
