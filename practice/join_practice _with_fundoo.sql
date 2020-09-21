-- 1.CROSS JOIN
-- Join notes table with auth_user table
SELECT * 
FROM notes_note
CROSS JOIN auth_user;

-- 2. INNER JOIN
-- a. get title with username and email id from notes and user table
SELECT notes_note.title, auth_user.username, auth_user.email
FROM notes_note
INNER JOIN auth_user
ON notes_note.user_id = auth_user.username;

-- b. get title with username and email id from notes and user table for perticular user
SELECT notes_note.title, auth_user.username, auth_user.email
FROM notes_note
INNER JOIN auth_user
ON notes_note.user_id = auth_user.username
WHERE auth_user.username = 'iman';

-- 3. OUTER JOIN
-- 3.1 . LEFT OUTER JOIN
-- get note title and color along with username and email address for all record from notes data
SELECT notes_note.title, notes_note.color, auth_user.username, auth_user.email
FROM notes_note
LEFT OUTER JOIN auth_user
ON notes_note.user_id = auth_user.username
WHERE notes_note.color = '#ffffff';

-- 3.2 RIGHT OUTER JOIN
-- get note title along with username and email address for all record from auth user data
SELECT notes_note.title, auth_user.username, auth_user.email
FROM notes_note
RIGHT OUTER JOIN auth_user
ON notes_note.user_id = auth_user.username;

-- 3.3 FULL OUTER JOIN
-- get note along with username and email address for all record from both table
SELECT notes_note.note, auth_user.username, auth_user.email
FROM notes_note
FULL OUTER JOIN auth_user
ON notes_note.user_id = auth_user.username;