drop procedure if exists `addColumn`;
drop procedure if exists `dropColumn`;
drop procedure if exists `putColumn`;

create procedure `addColumn`(in tableName varchar(50), columnName varchar(50),
                             columnType varchar(50), afterColumnName varchar(50),
                             commentContext varchar(100), defaultValue varchar(100))
begin
    if not exists(select COLUMN_NAME
                  from information_schema.COLUMNS
                  where TABLE_NAME = tableName
                    and COLUMN_NAME = columnName
                    and COLUMN_NAME <> afterColumnName
        )
    then
        set @sqlStr = concat(
                ' alter table ', tableName,
                ' add column ', columnName, ' ',
                columnType,
                ' default "', defaultValue, '"',
                ' comment "', commentContext, '"'
                    ' after ', afterColumnName
            );
        select @sqlStr;
        prepare stmt from @sqlStr;
        execute stmt;
    end if;

end ;;


create procedure `dropColumn`(in tableName varchar(50), columnName varchar(50))
begin
    if exists(select COLUMN_NAME
                  from information_schema.COLUMNS
                  where TABLE_NAME = tableName
                    and COLUMN_NAME = columnName
        )
    then
        set @sqlStr = concat(
                ' alter table ', tableName,
                ' drop column ', columnName
            );
        select @sqlStr;
        prepare stmt from @sqlStr;
        execute stmt;
    end if;

end ;;

create procedure `putColumn`(in tableName varchar(50), columnName varchar(50), newColumnName varchar(50),
                             columnType varchar(50), afterColumnName varchar(50),
                             commentContext varchar(100), defaultValue varchar(100))
begin
    if not exists(select COLUMN_NAME
                  from information_schema.COLUMNS
                  where TABLE_NAME = tableName
                    and COLUMN_NAME = newColumnName
                    and COLUMN_NAME <> columnName
                    and COLUMN_NAME <> afterColumnName
                    and COLUMN_DEFAULT = defaultValue
                    and COLUMN_COMMENT = commentContext
        )
    then
        set @sqlStr = concat(
                ' alter table ', tableName,
                ' change column ', columnName, ' ' ,newColumnName, ' ',
                columnType,
                ' default "', defaultValue, '"',
                ' comment "', commentContext, '"'
                    ' after ', afterColumnName
            );
        select @sqlStr;
        prepare stmt from @sqlStr;
        execute stmt;
    end if;

end ;;

# call addColumn('user', 'resource', 'varchar(20)', 'name', '资源', '-1');
# call dropColumn('user','resource');
# call putColumn('user', 'resource1','resource2', 'varchar(20)', 'name', '资源1', '-1');


drop procedure if exists `addColumn`;
drop procedure if exists `dropColumn`;
drop procedure if exists `putColumn`;









