SET @job_name = 'police';
SET @society_name = 'society_police';
SET @job_Name_Caps = 'Police';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_police_fridge', 'police (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
('police', 0, 'recruit', 'Student Constable', 250, '{}', '{}'),
('police', 1, 'recruit', 'Constable', 300, '{}', '{}'),
('police', 2, 'recruit', 'Senior Constable', 350, '{}', '{}'),
('police', 3, 'recruit', 'Sergeant', 400, '{}', '{}'),
('police', 4, 'recruit', 'Senior Sargeant', 450, '{}', '{}'),
('police', 5, 'viceboss', 'Inspector', 500, '{}', '{}'),
('police', 6, 'viceboss', 'Chief Inspector', 550, '{}', '{}'),
('police', 7, 'viceboss', 'Superintendent', 600, '{}', '{}'),
('police', 8, 'viceboss', 'Chief Superintendent', 750, '{}', '{}'),
('police', 9, 'boss', 'Commander', 1000, '{}', '{}'),
('police', 10, 'boss', 'Chief Commander', 1250, '{}', '{}'),
('police', 11, 'boss', 'Deputy Assistant Commissioner', 1500, '{}', '{}'),
('police', 12, 'boss', 'Deputy Commissioner', 1750, '{}', '{}'),
('police', 13, 'boss', 'Commissioner', 2000, '{}', '{}'),
('police', 14, 'boss', 'Commissioner General', 2500, '{}', '{}'),
('offpolice', 0, 'recruit', 'Student Constable', 1, '{}', '{}'),
('offpolice', 1, 'recruit', 'Constable', 1, '{}', '{}'),
('offpolice', 2, 'recruit', 'Senior Constable', 1, '{}', '{}'),
('offpolice', 3, 'recruit', 'Sergeant', 1, '{}', '{}'),
('offpolice', 4, 'recruit', 'Senior Sergeant', 1, '{}', '{}'),
('offpolice', 5, 'viceboss', 'Inspector', 1, '{}', '{}'),
('offpolice', 6, 'viceboss', 'Chief Inspector', 1, '{}', '{}'),
('offpolice', 7, 'viceboss', 'Superintendent', 1, '{}', '{}'),
('offpolice', 8, 'viceboss', 'Chief Superintendent', 1, '{}', '{}'),
('offpolice', 9, 'boss', 'Commander', 1, '{}', '{}'),
('offpolice', 10, 'boss', 'Chief Commander', 1, '{}', '{}'),
('offpolice', 11, 'boss', 'Deputy Assistant Commissioner', 1, '{}', '{}'),
('offpolice', 12, 'boss', 'Deputy Commissioner', 1, '{}', '{}'),
('offpolice', 13, 'boss', 'Commissioner', 1, '{}', '{}'),
('offpolice', 14, 'boss', 'Commissioner General', 1, '{}', '{}'),
;