-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('BETH', 'i4/BqNxnBH08EVXd270IZQ==', 'LIBRARIAN', 'AA123456', 'GcG/mLS7/SzWuwcm4f2FZYseu4+T5DZcxP8mhNU1N0+Uh236PWAFMvK7vAreQhvwRdMKnqYSMRVnwdsRv6e/pcG4xjdtKnAOOt5C7yGud/Kvslbc0ei6LW0OYqA1zJ1m8sXM5z5VQPwfwN4qwYLsT0tzcxeQsLUlCKH9cc9c/lI=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('MASON', 'dMQ1MGeqMPqmKxXiNa1JIA==', 'MEMBER', 'BB123456', 'jTSxeqhgf77A7oAoIweOEPWopVjrXx5Q6N32kWOImEMrF+W7KJ7RArh++F2Zw6SsHMzzrzToGC+Hj9ph04Co3C2+nYp1426NI7P4PuQ7UR+n8784FzUhtfZYkMJ1kD3H9FAJJDuNy2LVFIGcamDV1jNYZSN8x6L3fjDGJsfGqfQ=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('OPRAH', 'TdbPNpfhb07+PWaHQ1YACA==', 'MEMBER', 'CC123456', '4tR+6FugeX3LOR0inpSWOr8eivL5wKS1/eK32YUHa7HYoo6dxFwCA9ABT3Ut86Pz96b6oNxBrLb2XYHJMl2OC//FO6DhHuuMjizgHd4MKGMyyCz8mztmMgdvowEyNZhZYRCcAzjYNBUiuZMzG/gNWlW2cSGw+ZXYYjhpoKgNCwM=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('ERIK', 'ANnZPwpNBXj75vEepIO7sQ==', 'LIBRARIAN', 'DD123456', 'cCtRv9vnty4zLh6o4exEyr0/IkH74AQz6HCLmyRtnauz9pA9+VHJabbejlkPwDB8kRJdDR+IyYOidBKEEw0nB7PHbMmwHORnYQeVzbJjJez/+P9nNIADclTEg8XeWE0sEdqoaqRWoyNlvTf+obqbtWwcQ3wizrI/k2qrqL5miaE=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('STEVE', 'ky5SZrav5QeqBp2Fs2y6gA==', 'MEMBER', 'EE123456', 'RT7Da5S/qkjKNfaFSFNR1ypDwRfo3dkZYTZS3Ckq4Fk63mGJ1oElSeF54PqNeyDOwb4HfnohHik85wmL+Q92r649pzWvWzZfd3Jb3nLP8BrfrhnrXpNAftown2tYl0c/5UW8Qa2cXf13jRqDZ6XZbpaNwDWr0r7Ii8lEqRh/mrc=');
INSERT INTO app_user (user_name, password, role, salt) VALUES ('BELLA', 'nsHJfxBM/woAvtEBkUcL7Q==', 'LIBRARIAN', 's080OAQEAntNRg8oo/CFixW3usOjnmUVmKMsnxLcLNLBjbGnHaOSR3Ib0XGfCEBTS6dreI50L2g/X/6RjugWppMpsVrxNz9F7T/FX4IkZgzkZr7iKStJezdnNTzOe1i5BGil+dTPVdhYKQJTM/sjV6sr5ejp0ct/JpqQ7/Ck2hE=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('KYLE', 'zHQUiQs+UafLfJUZrRHLtw==', 'MEMBER', 'FF123456', 'l5iH2sL2Nj7ANlZGMWkgdAp8J26biyh84HNF88VX2CMkrQHFqGqjXSvcQ2/s4snkvXubaZ3BXmBYPMiTKcgebmV7fbEmFlzTFLFhvRUqE2z6Q2hVNhUUCy4STD7EnwEhjHJH0PRF6lKnHDJsm5U3iYSsaRa0/NFNumBBIbEUOdY=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('ANDREW', 'b6jFWcwtRzH3LvWpg0wfyQ==', 'MEMBER', 'GG123456', 'Wa/1MxbjJpo6J3+aZUlx5E1uqhkSMxwce6ZONzDFR9kVovT5/ck5jAqk9e/9K3I20yUFB8WWTZlHfFr4ApDtVWqAybdbaLbaFdGbwemxtoK7UxOhh/DpvcKTQtDJFwyLVk+IgXyY8u8SJjBaKTp6ReKN5l10can8lDC7eIVWgY4=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('TEST USER', '4DfsV6VjDnPdWCOiYs9Dww==', 'MEMBER', 'TT123456', 'ehwrDx5gJ/liDjAkY5AG1mR+ZO2/9zEtVUym8Im/TIx+Db7WoYIjVLPsQw8ACooz3xONYCRaVlTyAa9ZNGpSEgsfcFFfK4tcHuVtAH0ZHRvBaPPX44b6doWnnGeLx7jTulwrC8jagnD/h/L2yMYMdmYHwAKEv04wR/kQ0C90Eoo=');
INSERT INTO app_user (user_name, password, role, drivers_license, salt) VALUES ('TEST LIBRARIAN', 'RnQc58wwMDxPzRlWJSoFcw==', 'LIBRARIAN', 'LL123456', 'gypTa8CG/IReW9zAIXk0KH84NbBZtPxvCmB7B4nViQRpXiLPl4D7UKx0ygZ2rB7YtRsoePKj426DtiRM+VnQ8bZjQKhw+QDFTp3oQZOm4qUqmDriy8QkMecKN1i3DYWH5YMOS6FCRVRZBlNk6Tf4RJ3LAy9aY/2ztVVVrkCB8fQ=');


INSERT INTO tool_type (tool_name, tool_description) VALUES ('HAMMER', '16 oz Fiber Glass Claw Hammer Heavy Duty Construction Shock Resistant Rubberized Non Slip Handle');
INSERT INTO tool_type (tool_name, tool_description) VALUES ('SAW', 'Black & Decker BDECS300C 13 Amp Circular Saw with Laser');
INSERT INTO tool_type (tool_name, tool_description) VALUES ('DRILL', 'Bosch 18-Volt Compact Tough Drill/Driver Kit DDB181-02 with 2 Lithium Ion Batteries and 18V Charger');

INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (2);
INSERT INTO tool (tool_type_id) VALUES (2);
INSERT INTO tool (tool_type_id) VALUES (3);
INSERT INTO tool (tool_type_id) VALUES (3);
INSERT INTO tool (tool_type_id) VALUES (3);
INSERT INTO tool (tool_type_id) VALUES (3);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (2);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);
INSERT INTO tool (tool_type_id) VALUES (1);


INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (2, NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (3, NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (5, NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (7, NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (8, NOW() - INTERVAL '15 days', NOW() - INTERVAL '11 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (8, NOW() - INTERVAL '10 days', NOW() - INTERVAL '3 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (2, NOW() - INTERVAL '10 days', NOW() - INTERVAL '3 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (3, NOW() - INTERVAL '10 days', NOW() - INTERVAL '3 days');
INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (5, NOW() - INTERVAL '10 days', NOW() - INTERVAL '3 days');

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (1, 1);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (4, 1);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (6, 1);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (2, 2);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (3, 3);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (5, 3);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (8, 4);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (9, 4);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (11, 4);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (1, 5);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (2, 5);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (3, 5);
INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (4, 5);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (5, 6);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (6, 7);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (7, 8);

INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (8, 9);

COMMIT;