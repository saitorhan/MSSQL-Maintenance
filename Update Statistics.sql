-- Video: https://youtu.be/LYPJwhA1h94

declare @sql nvarchar(500)
declare @tableName nvarchar(200)

declare cls cursor for select '[' + TABLE_SCHEMA + '].' + '[' + TABLE_NAME + ']' from INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
open cls
fetch next from cls into @tableName

while @@FETCH_STATUS = 0
begin

set @sql = 'UPDATE STATISTICS ' + @tableName
exec sp_executesql @sql

fetch next from cls into @tableName
end

close cls
deallocate cls
