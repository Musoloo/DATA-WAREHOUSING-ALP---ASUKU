DROP TABLE IF EXISTS DETAIL_ID;
DROP TABLE IF EXISTS dog;
DROP TABLE IF EXISTS account;
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
  gambar varchar(99),
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
/* Table: DETAIL ID                                      */
/*==============================================================*/
create TABLE DETAIL_ID(
id_anjing VARCHAR(10) NOT NULL,
id_account VARCHAR(5) NOT NULL,
id_order VARCHAR(10) NOT NULL,
id_order_details INT UNSIGNED not null,
total_harga INT not null,
FOREIGN KEY (id_anjing) REFERENCES dog (id_anjing),
FOREIGN KEY (id_account) REFERENCES account (id_account),
FOREIGN KEY (id_order) REFERENCES `order` (id_order),
FOREIGN KEY (id_order_details) REFERENCES orderdetails (id_order_details)
);

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
