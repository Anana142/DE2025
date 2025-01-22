USE user49;
GO
CREATE PROC PercentageOfRoomOccupancy 
	@date DATE
AS
SELECT (SELECT COUNT(*) FROM Booking WHERE @date >= DateIn AND @date <= DateOut) / (SElECT COUNT(*) FROM HotelRoom) * 100