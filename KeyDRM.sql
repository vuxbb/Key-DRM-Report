select count(distinct (CustomerID)) as Total_ID, 'BHD' as Service, cast(date as date) as Date from(
select CustomerID, MovieID, Date from SalesLT.Log_BHD_MovieID BHD
left join SalesLT.MV_PropertiesShowVN MV on BHD.MovieID = MV.id
where MV.isDRM = 1) A
group by cast(date as date)
union
select count(distinct (CustomerID)) as Total_ID, 'Fimplus' as Service, cast(date as date) as Date from(
select CustomerID, MovieID, Date from SalesLT.Log_Fimplus_MovieID Fimplus
left join SalesLT.MV_PropertiesShowVN MV on Fimplus.MovieId = MV.id
where MV.isDRM = 1) B
group by cast(date as date)
union
select count(distinct (CustomerID)), 'PhimGoi' as Service, Date from(
select DRM.CustomerID, DRM.Date from SalesLT.Log_Get_DRM_List DRM
left join SalesLT.CustomerService CS on DRM.CustomerID = CS.CustomerID
where CS.ServiceID in (60, 153)) C
group by  Date