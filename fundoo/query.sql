-- get notes with labels
select title, name
from note_note
inner join note_labelmap
on note_note.id = note_labelmap.note_id
inner join label_label
on label_label.id = note_labelmap.label_id
where note_note.title like '%rem%';

--get note title, label name, colab from note
select note_note.title, name, auth_user.username
from note_note
inner join note_labelmap
on note_note.id = note_labelmap.note_id
inner join label_label
on note_labelmap.label_id = label_label.id
inner join note_usermap
on note_note.id = note_usermap.note_id
inner join auth_user
on note_usermap.user_id = auth_user.id
where note_note.user_id = 1;
