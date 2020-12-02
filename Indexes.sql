-- Remove comments on rows to include column list as well

select 
ROW_NUMBER() over(partition by i.object_id, i.index_id order by i.name) IndexColumnId,
t.name TableName, 
i.name IndexName,
--c.name ColumnName,
frag.index_type_desc IndexType,
frag.avg_fragmentation_in_percent,
frag.alloc_unit_type_desc
from sys.tables t 
join sys.indexes i on t.object_id = i.object_id
--join sys.index_columns ic on i.index_id = ic.index_id and ic.object_id = t.object_id
--join sys.columns c on c.object_id = t.object_id and ic.column_id = c.column_id
join sys.dm_db_index_physical_stats(DB_ID(), null, null, null, null) as frag on frag.object_id = t.object_id and frag.index_id = i.index_id
where t.type = 'U' and t.name like '%'
order by t.name

