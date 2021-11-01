
CREATE TABLE Album (
                AlbumID INTEGER NOT NULL,
                Title VARCHAR NOT NULL,
                Release_Date VARCHAR NOT NULL,
                Age VARCHAR NOT NULL,
                Format VARCHAR NOT NULL,
                CONSTRAINT albumid PRIMARY KEY (AlbumID)
);


CREATE TABLE Address (
                AddressID INTEGER NOT NULL,
                Number INTEGER NOT NULL,
                Street1 VARCHAR NOT NULL,
                Street2 VARCHAR NOT NULL,
                City VARCHAR NOT NULL,
                State VARCHAR NOT NULL,
                Zip_Code INTEGER NOT NULL,
                Telephone VARCHAR NOT NULL,
                CONSTRAINT addressid PRIMARY KEY (AddressID)
);


CREATE TABLE Instrument (
                Name VARCHAR NOT NULL,
                Pitch VARCHAR NOT NULL,
                CONSTRAINT name PRIMARY KEY (Name)
);


CREATE TABLE Song (
                Title VARCHAR NOT NULL,
                AlbumID INTEGER NOT NULL,
                Name VARCHAR NOT NULL,
                Length INTEGER NOT NULL,
                CONSTRAINT title PRIMARY KEY (Title, AlbumID, Name)
);


CREATE TABLE Musician (
                SSN INTEGER NOT NULL,
                AddressID INTEGER NOT NULL,
                AlbumID INTEGER NOT NULL,
                Instrument_Name VARCHAR NOT NULL,
                Title VARCHAR NOT NULL,
                Name VARCHAR NOT NULL,
                CONSTRAINT ssn PRIMARY KEY (SSN, AddressID, AlbumID, Instrument_Name, Title)
);


ALTER TABLE Musician ADD CONSTRAINT album_musician_fk
FOREIGN KEY (AlbumID)
REFERENCES Album (AlbumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Song ADD CONSTRAINT album_song_fk
FOREIGN KEY (AlbumID)
REFERENCES Album (AlbumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (AddressID)
REFERENCES Address (AddressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Musician ADD CONSTRAINT instrument_musician_fk
FOREIGN KEY (Instrument_Name)
REFERENCES Instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Song ADD CONSTRAINT instrument_song_fk
FOREIGN KEY (Name)
REFERENCES Instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Musician ADD CONSTRAINT author
FOREIGN KEY (Title)
REFERENCES Song (Title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Musician ADD CONSTRAINT perform
FOREIGN KEY (Title)
REFERENCES Song (Title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
