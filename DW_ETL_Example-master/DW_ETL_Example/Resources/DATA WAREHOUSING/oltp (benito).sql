DROP DATABASE IF EXISTS oltpbenito;
CREATE DATABASE oltpbenito;
USE oltpbenito;

DROP TABLE IF EXISTS dog;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS orderdetails;
DROP TABLE IF EXISTS wishlist;

/*==============================================================*/
/* Table: DOG                                                   */
/*==============================================================*/
CREATE TABLE dog (
  id_anjing VARCHAR(10) NOT NULL,
  jenis VARCHAR(30) NOT NULL,
  nama VARCHAR(25) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  tanggal_lahir DATE NOT NULL,
  berat VARCHAR(20) DEFAULT NULL,
  warna VARCHAR(30) NOT NULL,
  harga INT NOT NULL,
  deskripsi VARCHAR(200),
  status_jual CHAR(1) NOT NULL,
  gambar VARCHAR(99),
  PRIMARY KEY (id_anjing)
);

/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
CREATE TABLE account (
  id_account VARCHAR(5) NOT NULL,
  nama VARCHAR(50) NOT NULL,
  alamat VARCHAR(50) NOT NULL,
  email VARCHAR(30) NOT NULL,
  tanggal_lahir DATE NOT NULL,
  nomor_telepon VARCHAR(15) DEFAULT NULL,
  username VARCHAR(20) DEFAULT NULL,
  `password` VARCHAR(100) DEFAULT NULL,
  ROLES VARCHAR(15) NOT NULL DEFAULT 'User',
  PRIMARY KEY (id_account)
);

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
CREATE TABLE cart (
  id_cart VARCHAR(5) NOT NULL,
  id_account VARCHAR(5) NOT NULL,
  id_anjing VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_cart),
  FOREIGN KEY (id_anjing) REFERENCES dog (id_anjing),
  FOREIGN KEY (id_account) REFERENCES account (id_account)
);

/*==============================================================*/
/* Table: ORDER                                                 */
/*==============================================================*/
CREATE TABLE `order` (
  id_order VARCHAR(5) NOT NULL,
  id_account VARCHAR(5) NOT NULL, 
  total_qty INT NOT NULL,
  total_harga DECIMAL(10,2) NOT NULL,
  tanggal_transaksi DATETIME NOT NULL,
  PRIMARY KEY (id_order),
  FOREIGN KEY (id_account) REFERENCES account (id_account)
);


/*==============================================================*/
/* Table: ORDER DETAILS                                         */
/*==============================================================*/
CREATE TABLE orderdetails (
  id_order_details INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_anjing VARCHAR(10) NOT NULL,
  id_order VARCHAR(5) NOT NULL,
  PRIMARY KEY (id_order_details),
  FOREIGN KEY (id_order) REFERENCES `order` (id_order),
  FOREIGN KEY (id_anjing) REFERENCES dog (id_anjing)
);

/*==============================================================*/
/* Table: WISHLIST                                              */
/*==============================================================*/
CREATE TABLE wishlist (
  id_wishlist INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_account VARCHAR(5) NOT NULL,
  id_anjing VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_wishlist),
  FOREIGN KEY (id_anjing) REFERENCES dog (id_anjing),
  FOREIGN KEY (id_account) REFERENCES account (id_account)
);


/*==============================================================*/
/* Dummy Data : DOG                                             */
/*==============================================================*/
INSERT INTO dog (`id_anjing`,`jenis`, `nama`, `gender`, `tanggal_lahir`, `berat`, `warna`, `harga`, `deskripsi`, `status_jual`, `gambar`) VALUES
('RE0001','Retriever', 'Golden Retriever', 'Male', '2023-07-15', '25 kg', 'Golden', 1000000, 'If youre seeking a loyal,energetic, and loving companion for family, look no further than the Golden Retriever.', 'R', 'img/Dog1.png'),
('RE0002','Retriever', 'Labrador Retriever', 'Female', '2022-11-20', '30 kg', 'Black', 1200000, 'These friendly and intelligent dogs, known for their playful spirit and eagerness to please, ranked as one of the most popular breeds in the world.', 'R', 'img/Golden1.png'),
('RE0003','Retriever', 'Poodle', 'Male', '2023-04-17', '30 kg', 'Black', 1050000, 'a loving, active home with regular training and grooming, the Poodle can be a loyal, intelligent, and undeniably stylish companion for years to come.', 'R', 'img/Golden2.png'),
('PI0001','Pitbull', 'American Pug', 'Female', '2023-06-12', '9 kg', 'Brown', 850000, 'If youre looking for a loving, low-maintenance companion with a dash of humor, the Pug might be your perfect match.', 'R', 'img/Dog3.png'),
('PI0002','Pitbull', 'Staffordshire Terrier', 'Male', '2022-09-08', '27 kg', 'Fawn', 13000000, 'If you can provide a loving, active home with consistent training and socialization, the Bull Terrier can be a loyal, playful, and uniquely charming companion for years to come.', 'R', 'img/Pitbull1.png'),
('PI0003','Pitbull', 'Blue Nose Pitbull', 'Female', '2023-03-15', '25 kg', 'Blue', 1400000, 'Loyal and affectionate, the Blue Nose Pitbull is a great family dog.', 'R', 'img/Pitbull4.png'),
('PI0004','Pitbull', 'American Bully', 'Female', '2024-01-25', '8 kg', 'Fawn', 750000, 'These powerful and visually impressive dogs were developed in the United States for companionship and athleticism. the American Bully can be a loyal and rewarding companion.', 'R', 'img/Pitbull.png'),
('PI0005','Pitbull', 'American Bully', 'Female', '2024-01-25', '8 kg', 'Fawn', 750000, 'These powerful and visually impressive dogs were developed in the United States for companionship and athleticism. the American Bully can be a loyal and rewarding companion.', 'R', 'img/Pitbull.png'),
('HU0001', 'Husky', 'Samoyed', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 31000000, 'These fluffy white "Smiling Samoyeds" are known for their thick, double coat, playful spirit, and unwavering loyalty.', 'R', 'img/Husky2.png'),
('HU0002','Husky', 'Greenland Husky', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 22000000, 'If youre an experienced owner seeking a powerful, loyal, and working companion built for adventure, the Greenland Dog might be the perfect fit for your active lifestyle.', 'R', 'img/Husky3.png'),
('HU0003','Husky', 'Alaskan Malamute', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 40000000, 'These magnificent, double-coated giants were originally bred for hauling heavy loads across vast Alaskan terrain.', 'R', 'img/Husky1.png'),
('HU0004','Husky', 'Siberian Husky', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 21000000, 'Look no further than the Siberian Husky! Stunning dogs, known for their thick fur, piercing eyes, energetic spirit, Loyal and friendly.', 'R', 'img/Dog2.png'),
('HU0005','Husky', 'Siberian Husky', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 21000000, 'Look no further than the Siberian Husky! Stunning dogs, known for their thick fur, piercing eyes, energetic spirit, Loyal and friendly.', 'R', 'img/Dog2.png'),
('HU0006','Husky', 'Siberian Husky', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 21000000, 'Look no further than the Siberian Husky! Stunning dogs, known for their thick fur, piercing eyes, energetic spirit, Loyal and friendly.', 'R', 'img/Dog2.png'),
('HU0007','Husky', 'Siberian Husky', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 21000000, 'Look no further than the Siberian Husky! Stunning dogs, known for their thick fur, piercing eyes, energetic spirit, Loyal and friendly.', 'R', 'img/Dog2.png'),
('HU0008','Husky', 'Siberian Husky', 'Male', '2023-08-20', '40 kg', 'Black and Tan', 21000000, 'Look no further than the Siberian Husky! Stunning dogs, known for their thick fur, piercing eyes, energetic spirit, Loyal and friendly.', 'R', 'img/Dog2.png'),
('CO0001','Corgi', 'Pembroke Corgi Welsh', 'Female', '2022-12-03', '3 kg', 'Blue and Tan', 28000000, 'These adorable short-legged, known for their fluffy and big personalities, will win you over with their, loyalty, and playful spirit.', 'R', 'img/Corgi1.png'),
('CO0002','Corgi', 'Welsh Corgi Cardigan', 'Female', '2024-04-09', '20 kg', 'Gray and White', 22000000, 'known for their intelligence, loyalty, and independent spirit. While playful and affectionate with their families, Cardigans can be wary of strangers.', 'R', 'img/Corgi2.png'),
('CO0003','Corgi', 'Cardigan Welsh Corgi', 'Male', '2023-06-25', '14 kg', 'Brindle', 23000000, 'Cardigan Corgis are known for their distinct brindle coats and playful demeanor.', 'R', 'img/Corgi3.png'),
('CO0004','Corgi', 'Pembroke Welsh Corgi', 'Female', '2023-07-12', '10 kg', 'Red and White', 25000000, 'These adorable short-legged dogs are known for their loyalty and playful spirit.', 'R', 'img/Corgi4.png'),
('CO0005','Corgi', 'Pembroke Welsh Corgi', 'Female', '2023-07-12', '10 kg', 'Red and White', 25000000, 'These adorable short-legged dogs are known for their loyalty and playful spirit.', 'R', 'img/Corgi4.png'),
('CO0006','Corgi', 'Pembroke Welsh Corgi', 'Female', '2023-07-12', '10 kg', 'Red and White', 25000000, 'These adorable short-legged dogs are known for their loyalty and playful spirit.', 'R', 'img/Corgi4.png'),
('CO0007','Corgi', 'Pembroke Welsh Corgi', 'Female', '2023-07-12', '10 kg', 'Red and White', 25000000, 'These adorable short-legged dogs are known for their loyalty and playful spirit.', 'R', 'img/Corgi4.png'),
('CO0008','Corgi', 'Pembroke Welsh Corgi', 'Female', '2023-07-12', '10 kg', 'Red and White', 25000000, 'These adorable short-legged dogs are known for their loyalty and playful spirit.', 'R', 'img/Corgi4.png'),
('CO0009','Corgi', 'Pembroke Welsh Corgi', 'Female', '2023-07-12', '10 kg', 'Red and White', 25000000, 'These adorable short-legged dogs are known for their loyalty and playful spirit.', 'R', 'img/Corgi4.png');

SELECT * FROM dog;


/*==============================================================*/
/* Dummy Data : ACCOUNT                                         */
/*==============================================================*/
INSERT INTO account (`id_account`,`nama`, `alamat`, `email`, `tanggal_lahir`, `nomor_telepon`, `username`, `password`, `ROLES`) VALUES
('AB01','John Doe', '123 Main Street', 'john.doe@example.com', '1990-05-20', '01234567890', 'johndoe', 'password123', 'User'),
('AB02','Jane Smith', '456 Elm Street', 'jane.smith@example.com', '1985-08-15', '0987654321', 'janesmith', 'password456', 'User'),
('AB03','Alice Johnson', '789 Oak Street', 'alice.johnson@example.com', '1978-12-10', '05551234567', 'alicejohnson', 'password789', 'User'),
('AB04','Michael Williams', '101 Pine Street', 'michael.williams@example.com', '1992-03-25', '02345678901', 'michaelwilliams', 'password101', 'User'),
('AB05','Emily Brown', '222 Maple Street', 'emily.brown@example.com', '1987-09-05', '08887776666', 'emilybrown', 'password222', 'User'),
('AB06','Daniel Garcia', '333 Cedar Street', 'daniel.garcia@example.com', '1980-11-18', '09998887777', 'danielgarcia', 'password333', 'User'),
('AB07','Olivia Martinez', '444 Birch Street', 'olivia.martinez@example.com', '1995-07-30', '03334445555', 'oliviamartinez', 'password444', 'User'),
('AB08','William Lee', '555 Oakwood Street', 'william.lee@example.com', '1983-04-12', '01112223333', 'williamlee', 'password555', 'User'),
('AB09','Sophia Rodriguez', '666 Elmwood Street', 'sophia.rodriguez@example.com', '1998-10-22', '07776665544', 'sophiarodriguez', 'password666', 'User'),
('AB10','James Nguyen', '777 Cherry Street', 'james.nguyen@example.com', '1976-06-28', '06665554433', 'jamesnguyen', 'password777', 'User'),
('AB11','Amelia Kim', '888 Walnut Street', 'amelia.kim@example.com', '1991-01-15', '09997778888', 'ameliakim', 'password888', 'User'),
('AB12','Benjamin Hernandez', '999 Cedarwood Street', 'benjamin.hernandez@example.com', '1989-08-03', '01110009999', 'benjaminhernandez', 'password999', 'User'),
('AB13','Ethan Smith', '111 Pinewood Street', 'ethan.smith@example.com', '1982-05-08', '07778889999', 'ethansmith', 'password1234', 'User'),
('AB14','Isabella Kim', '222 Maplewood Street', 'isabella.kim@example.com', '1994-09-17', '08883332222', 'isabellakim', 'password2345', 'User'),
('AB15','Aiden Martinez', '333 Cedarwood Street', 'aiden.martinez@example.com', '1979-02-19', '09994443333', 'aidenmartinez', 'password3456', 'User'),
('AB16','Miguel Admin', '090 Ciland', 'miguel.admin@example.com', '2004-10-05', '0978767688676', 'migueladmin', 'admin', 'Admin');

SELECT * FROM account;

/*==============================================================*/
/* Dummy Data : CART                                            */
/*==============================================================*/
INSERT INTO cart (`id_cart`,`id_account`, `id_anjing`) VALUES
('CB01','AB01', 'CO0001'),
('CB02','AB02', 'CO0002'),
('CB03','AB03', 'CO0003'),
('CB04','AB04', 'CO0004'),
('CB05','AB05', 'HU0001'),
('CB06','AB06', 'HU0002'),
('CB07','AB07', 'HU0003'),
('CB08','AB08', 'HU0004'),
('CB09','AB09', 'PI0001'),
('CB10','AB10', 'PI0002'),
('CB11','AB11', 'PI0003'),
('CB12','AB12', 'PI0004'),
('CB13','AB13', 'RE0001'),
('CB14','AB14', 'RE0002'),
('CB15','AB15', 'RE0003'),
('CB16','AB14', 'HU0005'),
('CB17','AB02', 'HU0006'),
('CB18','AB01', 'HU0007'),
('CB19','AB07', 'HU0008'),
('CB20','AB02', 'CO0006'),
('CB21','AB02', 'CO0007'),
('CB22','AB02', 'CO0008'),
('CB23','AB01', 'CO0009'),
('CB24','AB01', 'CO0005'),
('CB25','AB07', 'PI0005');

SELECT * FROM cart;

/*==============================================================*/
/* Dummy Data : ORDER                                           */
/*==============================================================*/
INSERT INTO `order` (id_order, total_qty, total_harga, tanggal_transaksi, id_account) VALUES
('OB01', 5, 50000000.00, '2024-06-13 08:30:00', 'AB01'),
('OB02', 3, 30500000.00, '2024-06-13 09:45:00', 'AB02'),
('OB03', 4, 40500000.00, '2024-06-13 10:15:00', 'AB03'),
('OB04', 2, 20250000.00, '2024-06-13 11:20:00', 'AB04'),
('OB05', 6, 60900000.00, '2024-06-13 12:00:00', 'AB05'),
('OB06', 1, 10100000.00, '2024-06-13 12:30:00', 'AB06'),
('OB07', 3, 30500000.00, '2024-06-13 13:15:00', 'AB07'),
('OB08', 4, 40500000.00, '2024-06-13 14:20:00', 'AB08'),
('OB09', 2, 20250000.00, '2024-06-13 15:00:00', 'AB09'),
('OB10', 6, 60900000.00, '2024-06-13 16:30:00', 'AB10'),
('OB11', 1, 10100000.00, '2024-06-13 17:15:00', 'AB11'),
('OB12', 5, 50000000.00, '2024-06-14 08:30:00', 'AB12'),
('OB13', 3, 30500000.00, '2024-06-14 09:45:00', 'AB13'),
('OB14', 4, 40500000.00, '2024-06-14 10:15:00', 'AB14'),
('OB15', 2, 20250000.00, '2024-06-14 11:20:00', 'AB15'),
('OB16', 6, 60900000.00, '2024-06-14 12:00:00', 'AB01'),
('OB17', 1, 10100000.00, '2024-06-14 12:30:00', 'AB02'),
('OB18', 3, 30500000.00, '2024-06-14 13:15:00', 'AB03'),
('OB19', 4, 40500000.00, '2024-06-14 14:20:00', 'AB04'),
('OB20', 2, 20250000.00, '2024-06-14 15:00:00', 'AB05'),
('OB21', 6, 60900000.00, '2024-06-14 16:30:00', 'AB06'),
('OB22', 1, 10100000.00, '2024-06-14 17:15:00', 'AB07'),
('OB23', 5, 50000000.00, '2024-06-15 08:30:00', 'AB08'),
('OB24', 3, 30500000.00, '2024-06-15 09:45:00', 'AB09'),
('OB25', 4, 40500000.00, '2024-06-15 10:15:00', 'AB10');
SELECT * FROM `order`;

/*==============================================================*/
/* Dummy Data : ORDER DETAILS                                   */
/*==============================================================*/
INSERT INTO orderdetails (id_order_details, id_anjing, id_order) VALUES
(1, 'RE0001', 'OB01'),
(2, 'RE0002', 'OB02'),
(3, 'RE0003', 'OB03'),
(4, 'PI0001', 'OB04'),
(5, 'PI0002', 'OB05'),
(6, 'PI0003', 'OB06'),
(7, 'PI0004', 'OB07'),
(8, 'PI0005', 'OB08'),
(9, 'HU0001', 'OB09'),
(10, 'HU0002', 'OB10'),
(11, 'HU0003', 'OB11'),
(12, 'HU0004', 'OB12'),
(13, 'HU0005', 'OB13'),
(14, 'HU0006', 'OB14'),
(15, 'HU0007', 'OB15'),
(16, 'HU0008', 'OB16'),
(17, 'CO0001', 'OB17'),
(18, 'CO0002', 'OB18'),
(19, 'CO0003', 'OB19'),
(20, 'CO0004', 'OB20'),
(21, 'CO0005', 'OB21'),
(22, 'CO0006', 'OB22'),
(23, 'CO0007', 'OB23'),
(24, 'CO0008', 'OB24'),
(25, 'CO0009', 'OB25');


SELECT * FROM orderdetails;

/*==============================================================*/
/* Dummy Data : WISHLIST                                        */
/*==============================================================*/
INSERT INTO wishlist (`id_wishlist`,`id_account`, `id_anjing`) VALUES
('1','AB01', 'CO0001'),
('2','AB02', 'CO0002'),
('3','AB03', 'CO0003'),
('4','AB04', 'CO0004'),
('5','AB05', 'HU0001'),
('6','AB06', 'HU0002'),
('7','AB07', 'HU0003'),
('8','AB08', 'HU0004'),
('9','AB09', 'PI0001'),
('10','AB10', 'PI0002'),
('11','AB11', 'PI0003'),
('12','AB12', 'PI0004'),
('13','AB13', 'RE0001'),
('14','AB14', 'RE0002'),
('15','AB15', 'RE0003');


SELECT * FROM wishlist;
