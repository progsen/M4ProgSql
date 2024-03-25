
INSERT INTO `m4prog`.`dienstcodes` (`id`,`dienstnaam`) VALUES
 (1,'SMS'),
(2,'DATA'),
(3,'BELLEN');

INSERT INTO `m4prog`.`tarief` (`id`,`perunit`, `tariefnaam`, `geldigvan`, `dienstcodes_id`) VALUES
 (1,'0.05', 'perMinuten', '2000-01-01', '3'),
(2,'0.55', 'perMinutenBuitenland', '2000-01-01', '3'),
(3,'0.50', 'perMB', '2000-01-01', '2'),
(4,'0.10', 'perSms', '2000-01-01', '1'),
(5,'0.00', 'unlimitedMinuten', '2000-01-01', '3'),
(6,'0.00', 'unlimitedSms', '2000-01-01', '1'),
(7,'0.00', 'unlimitedData', '2000-01-01', '2'),
(8,'0.55', 'perMinutenBuitenlandGoedkoop', '2000-01-01', '3'),
(9,'1.50', 'perMBDuur', '2000-01-01', '2');

INSERT INTO `m4prog`.`abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES 
('basis', '5', '500', '60', '80');

INSERT INTO `m4prog`.`abonnement_has_tarief` (`abonnement_id`, `tarief_id`) VALUES
(1, 1),
(1, 2),
 (1, 3),
 (1, 4);


INSERT INTO `m4prog`.`abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES 
('veel mbs', '15', '4000', '0', '60');

INSERT INTO `m4prog`.`abonnement_has_tarief` (`abonnement_id`, `tarief_id`) VALUES 
(2, 1),
 (2, 2),
 (2, 3),
 (2, 4);


INSERT INTO `m4prog`.`abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES 
('unlimited', '40', '0', '0', '0');

INSERT INTO `m4prog`.`abonnement_has_tarief` (`abonnement_id`, `tarief_id`) 
VALUES ('3', '5'),
('3', '6'),
('3', '7'),
('3', '2');


INSERT INTO `m4prog`.`abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES
 ('analoog', '10', '0', '200', '300');

INSERT INTO `m4prog`.`abonnement_has_tarief` (`abonnement_id`, `tarief_id`) VALUES 
(4, 1),
 (4, 4),
 (4, 8),
 (4, 9);


INSERT INTO `m4prog`.`klant` (`naam`, `geboortedatum`) VALUES 
('leraar', '2000-01-01'),
 ('mario', '1980-04-27'),
 ('bowser', '1970-05-21'),
 ('peach', '1979-09-15');


INSERT INTO `m4prog`.`contract` (`id`, `ingangsdatum`, `einddatum`, `abonnement_id`) VALUES 
('1', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '1'),
('2', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '2'),
('3', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '3'),
 ('4', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '4');

INSERT INTO `m4prog`.`klant_has_contract` (`klant_id`, `contract_id`) VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4');


-- FACTUURDATA EXAMPLES
-- INSERT INTO `m4prog`.`dataverbruik` (`MBs`, `datum`, `tarief_id`, `klant_id`) VALUES
--  ('10', '2024-01-01', '1', '3');
-- 
-- 
-- INSERT INTO `m4prog`.`gesprekken` (`naarnummer`, `startdatum`, `einddatum`, `tarief_id`, `klant_id`) VALUES 
-- ('0678437875', '2024-02-04 00:04:10', '2024-02-04 00:05:00', '1', '1');
-- 
-- INSERT INTO `m4prog`.`smsverbruik` (`naarnummer`, `aantalpaginas`, `tarief_id`, `klant_id`, `datum`) VALUES 
-- ('0688856765', '2', '4', '1', '2024-01-02 09:30:00'),
-- ('0688856765', '1', '4', '1', '2024-01-02 10:15:40');
