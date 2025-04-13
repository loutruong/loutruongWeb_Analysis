show databases;
show tables;
create database loutruong_db;
drop table if exists loutruong.usr_id;
CREATE TABLE loutruong.usr_id (usr_id DOUBLE);
INSERT INTO loutruong.usr_id (usr_id)
VALUES (1),
    (2),
    (3),
    (4),
    (5);
SELECT *
FROM loutruong.usr_id;
drop table if exists loutruong.trn_core;
CREATE TABLE loutruong.trn_core (transaction_id DOUBLE, usr_id DOUBLE);
INSERT INTO loutruong.trn_core (transaction_id, usr_id)
VALUES (123, 2),
    (234, 2),
    (456, 3),
    (567, 4),
    (890, 5),
    (90, 6),
    (100, 7);
SELECT t1.usr_id,
    t2.transaction_id
FROM (
        SELECT *
        FROM loutruong.usr_id
    ) AS t1
    LEFT JOIN (
        SELECT *
        FROM loutruong.trn_core
    ) AS t2 ON t1.usr_id = t2.usr_id;
with t_dwd_usr_id as (
    select usr_id
    from loutruong.usr_id
    union
    select usr_id
    from loutruong.trn_core
) -- Re-process user ID table
SELECT t1.usr_id,
    t2.transaction_id
FROM (
        SELECT *
        FROM t_dwd_usr_id
    ) AS t1
    LEFT JOIN (
        SELECT *
        FROM loutruong.trn_core
    ) AS t2 ON t1.usr_id = t2.usr_id;