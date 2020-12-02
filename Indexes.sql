select 
t.name TableName, 
i.name IndexName, 
c.name ColumnName
from sys.tables t 
join sys.indexes i on t.object_id = i.object_id
join sys.index_columns ic on i.index_id = ic.index_id and ic.object_id = t.object_id
join sys.columns c on c.object_id = t.object_id and ic.column_id = c.column_id
where t.type = 'U' and t.name like '%'


