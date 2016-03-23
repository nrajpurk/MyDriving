/****** Object:  Table [dbo].[Devices]    Script Date: 3/21/2016 9:51:22 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Devices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Devices](
	[Id] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[Name] [nvarchar](max) NULL,
	[Version] [timestamp] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NULL,
	[Deleted] [bit] NOT NULL,
	[UserProfile_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Devices] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[factMLOutputData]    Script Date: 3/21/2016 9:51:22 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factMLOutputData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factMLOutputData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tripId] [nvarchar](50) NULL,
	[userId] [nvarchar](50) NULL,
	[tripstarttime] [nvarchar](50) NULL,
	[driverType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[IOTHubDatas]    Script Date: 3/21/2016 9:51:22 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IOTHubDatas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IOTHubDatas](
	[Id] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[Version] [timestamp] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.IOTHubDatas] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[POIs]    Script Date: 3/21/2016 9:51:22 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POIs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POIs](
	[Id] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[TripId] [nvarchar](max) NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[POIType] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NULL,
	[Deleted] [bit] NOT NULL,
	[Timestamp] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.POIs] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[TripPoints]    Script Date: 3/21/2016 9:51:22 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TripPoints]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TripPoints](
	[Id] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[TripId] [nvarchar](128) NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Speed] [float] NOT NULL,
	[RecordedTimeStamp] [datetime] NOT NULL,
	[Sequence] [int] NOT NULL,
	[RPM] [float] NOT NULL,
	[ShortTermFuelBank] [float] NOT NULL,
	[LongTermFuelBank] [float] NOT NULL,
	[ThrottlePosition] [float] NOT NULL,
	[RelativeThrottlePosition] [float] NOT NULL,
	[Runtime] [float] NOT NULL,
	[DistanceWithMalfunctionLight] [float] NOT NULL,
	[EngineLoad] [float] NOT NULL,
	[MassFlowRate] [float] NOT NULL,
	[EngineFuelRate] [float] NOT NULL,
	[VIN] [nvarchar](max) NULL,
	[HasOBDData] [bit] NOT NULL,
	[HasSimulatedOBDData] [bit] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.TripPoints] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[Trips]    Script Date: 3/21/2016 9:51:22 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trips]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Trips](
	[Id] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[Name] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
	[RecordedTimeStamp] [datetime] NOT NULL,
	[EndTimeStamp] [datetime] NOT NULL,
	[Rating] [int] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[HasSimulatedOBDData] [bit] NOT NULL,
	[AverageSpeed] [float] NOT NULL,
	[FuelUsed] [float] NOT NULL,
	[HardStops] [bigint] NOT NULL,
	[HardAccelerations] [bigint] NOT NULL,
	[MainPhotoUrl] [nvarchar](max) NULL,
	[Distance] [float] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Trips] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

/****** Object:  Table [dbo].[UserProfiles]    Script Date: 3/21/2016 9:51:23 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserProfiles](
	[Id] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
	[ProfilePictureUri] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[Ranking] [int] NOT NULL,
	[TotalDistance] [float] NOT NULL,
	[TotalTrips] [bigint] NOT NULL,
	[TotalTime] [bigint] NOT NULL,
	[HardStops] [bigint] NOT NULL,
	[HardAccelerations] [bigint] NOT NULL,
	[FuelConsumption] [float] NOT NULL,
	[MaxSpeed] [float] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.UserProfiles] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Devices_dbo.UserProfiles_UserProfile_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Devices]'))
ALTER TABLE [dbo].[Devices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Devices_dbo.UserProfiles_UserProfile_Id] FOREIGN KEY([UserProfile_Id])
REFERENCES [dbo].[UserProfiles] ([Id])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Devices_dbo.UserProfiles_UserProfile_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Devices]'))
ALTER TABLE [dbo].[Devices] CHECK CONSTRAINT [FK_dbo.Devices_dbo.UserProfiles_UserProfile_Id]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.TripPoints_dbo.Trips_TripId]') AND parent_object_id = OBJECT_ID(N'[dbo].[TripPoints]'))
ALTER TABLE [dbo].[TripPoints]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TripPoints_dbo.Trips_TripId] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.TripPoints_dbo.Trips_TripId]') AND parent_object_id = OBJECT_ID(N'[dbo].[TripPoints]'))
ALTER TABLE [dbo].[TripPoints] CHECK CONSTRAINT [FK_dbo.TripPoints_dbo.Trips_TripId]
