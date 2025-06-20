create database test2;
use test2;

# drop database db1;

@CREATE SCHEMA db1 DEFAULT ENCRYPTION='y';

create table address (address varchar(80), district varchar(20), postal_code varchar(10), phone varchar(2), encrypted_phone varbinary(128));
# ALTER TABLE address MODIFY phone VARCHAR(20);

Insert into address values ('Kebon Melati 3 No. 31', 'Tanah Abang', '10240', '(021)3707129',aes_encrypt('(021)3707129', 'encryptionkey'));
Insert into address values ('Kebon Melati 3 No. 30', 'Tanah Abang', '10240', '(021)3707130',aes_encrypt('(021)3707130', 'encryptionkey'));
Insert into address values ('Kebon Melati 3 No. 29', 'Tanah Abang', '10240', '(021)3707131',aes_encrypt('(021)3707131', 'encryptionkey'));

select * from address;
select aes_decrypt(encrypted_phone, 'encryptionkey') as phone from address;

CREATE TABLE Employees
(
    EmployeeID INT NOT NULL PRIMARY KEY,
    SSN_Encrypted BINARY(32) NOT NULL
);


INSERT INTO Employees (EmployeeID, SSN_Encrypted)
VALUES (1, AES_ENCRYPT('1112223333', UNHEX(SHA2('MyPassword',512)), 1));

SELECT EmployeeID,
SSN_Encrypted,
AES_DECRYPT(SSN_Encrypted, UNHEX(SHA2('MyPassword',512)), EmployeeID) AS SSN
FROM Employees;


create table demo(id int not null primary key, ssn varbinary(100) not null);

insert into demo(id, ssn) values (1, AES_ENCRYPT('111122223333', UNHEX(SHA2('MyPassword', '512')),1));
insert into demo(id, ssn) values (2, AES_ENCRYPT('AABBCCDDDD', UNHEX(SHA2('MyPassword', '512')),1));

select id, ssn, AES_DECRYPT(ssn, UNHEX(SHA2('MyPassword', '512')),id) as ssn from demo;

