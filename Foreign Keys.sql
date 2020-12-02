-- Video: https://youtu.be/DcZThzSyzBo
select fk.name fkName,
t.name TableName,
pc.name ColumnName,
rt.name referencedTable,
rc.name referencedColumn,
fk.delete_referential_action_desc,
fk.update_referential_action_desc
from sys.foreign_keys fk 
join sys.tables t on fk.parent_object_id = t.object_id
join sys.tables rt on fk.referenced_object_id = rt.object_id
join sys.foreign_key_columns fkc on fk.object_id = fkc.constraint_object_id
join sys.columns pc  on pc.object_id = fkc.parent_object_id  and pc.column_id = fkc.parent_column_id
join sys.columns rc on rc.object_id = fkc.referenced_object_id and rc.column_id = fkc.referenced_column_id
order by t.name
