create database DANG;
use DANG;

        --  Table for the creators --
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    WalletAddress VARCHAR(42) UNIQUE NOT NULL,
    Bio TEXT,
    JoinDate DATE
);

desc artists;

INSERT INTO Artists (Name, WalletAddress, Bio, JoinDate) VALUES
('ArtByAlex', '0x1A1...', 'Digital painter, loves color.', '2024-01-01'),
('BobPixel', '0x1B2...', 'Pixel art perfectionist.', '2024-01-02'),
('CryptoCarla', '0x1C3...', 'Abstract generative artist.', '2024-01-03'),
('Dave3D', '0x1D4...', '3D modeler and sculptor.', '2024-01-04'),
('EvaLines', '0x1E5...', 'Minimalist line art.', '2024-01-05'),
('FrankFuture', '0x1F6...', 'Futuristic concept art.', '2024-01-06'),
('GraceGlow', '0x1G7...', 'Neon and light specialist.', '2024-01-07'),
('HenryHype', '0x1H8...', 'Pop culture mashups.', '2024-01-08'),
('IvyInk', '0x1I9...', 'Traditional ink style, digitized.', '2024-01-09'),
('JackSketch', '0x1J0...', 'Pencil sketch artist.', '2024-01-10'),
('KyotoDreams', '0x1K1...', 'Anime and manga style.', '2024-01-11'),
('LeoLogic', '0x1L2...', 'Mathematical art.', '2024-01-12'),
('MonaMono', '0x1M3...', 'Black and white only.', '2024-01-13'),
('NateNature', '0x1N4...', 'Photorealistic nature scenes.', '2024-01-14'),
('Orbital', '0x1O5...', 'Space and sci-fi art.', '2024-01-15'),
('Penelope', '0x1P6...', 'Portrait specialist.', '2024-01-16'),
('Quill', '0x1Q7...', 'Calligraphy and text-based art.', '2024-01-17'),
('RetroRick', '0x1R8...', '8-bit and 16-bit art.', '2024-01-18'),
('SurrealSam', '0x1S9...', 'Surrealist and dreamscapes.', '2024-01-19'),
('TerraForm', '0x1T0...', 'World-building concept art.', '2024-01-20');


select * from artists;

--   Table for the Buyers ---
CREATE TABLE Collectors (
    CollectorID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    WalletAddress VARCHAR(42) UNIQUE NOT NULL,
    JoinDate DATE
);


INSERT INTO Collectors (Username, WalletAddress, JoinDate) VALUES
('NFTWhale', '0x111...', '2023-02-15'),
('ArtFanatic', '0x222...', '2023-04-01'),
('GalleryOwner', '0x333...', '2023-01-01');
INSERT INTO Collectors (Username, WalletAddress, JoinDate) VALUES
('AlphaBuyer', '0x2A1...', '2024-02-01'),
('BetaTrader', '0x2B2...', '2024-02-02'),
('Collectionz', '0x2C3...', '2024-02-03'),
('DiamondHands', '0x2D4...', '2024-02-04'),
('ETH_Maxi', '0x2E5...', '2024-02-05'),
('FutureFlip', '0x2F6...', '2024-02-06'),
('GrailHunter', '0x2G7...', '2024-02-07'),
('HighBidder', '0x2H8...', '2024-02-08'),
('Investor99', '0x2I9...', '2024-02-09'),
('JustLooking', '0x2J0...', '2024-02-10'),
('KingCrypto', '0x2K1...', '2024-02-11'),
('LamboSoon', '0x2L2...', '2024-02-12'),
('MintMaster', '0x2M3...', '2024-02-13'),
('NewWallet', '0x2N4...', '2024-02-14'),
('OG_Collector', '0x2O5...', '2024-02-15'),
('PaperHands', '0x2P6...', '2024-02-16');


select * from collectors;


--  Table for the NFT collections -- 
CREATE TABLE Collections (
    CollectionID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);


INSERT INTO Collections (Name, Description, ArtistID) VALUES 
('ColorBurst', 'By ArtByAlex', 9), 
('PixelTown', 'By BobPixel', 10), 
('Abstracta', 'By CryptoCarla', 11), 
('3DWorld', 'By Dave3D', 12), 
('Simple Forms', 'By EvaLines', 13), 
('FutureScapes', 'By FrankFuture', 14), 
('Neon City', 'By GraceGlow', 15), 
('Pop Art', 'By HenryHype', 16), 
('Ink Dreams', 'By IvyInk', 17), 
('Sketchbook', 'By JackSketch', 18), 
('Kawaii', 'By KyotoDreams', 19), 
('Formulas', 'By LeoLogic', 20), 
('Monochrome', 'By MonaMono', 1), 
('Landscapes', 'By NateNature', 2), 
('Galaxy', 'By Orbital', 3), 
('Portraits', 'By Penelope', 4), 
('The Scribe', 'By Quill', 5), 
('8-Bit Heroes', 'By RetroRick', 6), 
('Dreaming', 'By SurrealSam', 7), 
('New Worlds', 'By TerraForm', 8);

select * from collections;


--  Table for the individual NFTs -- 
CREATE TABLE Artworks (
    ArtworkID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Description TEXT,
    ImageURL VARCHAR(255),
    MintDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    CollectionID INT,
    CreatorID INT,
    CurrentOwnerID INT,

    ListPrice_ETH DECIMAL(10, 4), 
    FOREIGN KEY (CollectionID) REFERENCES Collections(CollectionID),
    FOREIGN KEY (CreatorID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (CurrentOwnerID) REFERENCES Collectors(CollectorID)
);


INSERT INTO Artworks (Title, CollectionID,  CurrentOwnerID, CreatorID, ListPrice_ETH) VALUES
('Red Splash', 1, 9, 14, 1.5),
('Pixel Castle', 2, 10, 15, 0.8),
('Gen_#112', 3, 11, 16, 3.0),
('The Golem', 4, 12, 17, 5.0),
('Single Line', 5, 13, 18, 1.0),
('Skyport 7', 6, 14, 19, 7.5),
('Glow District', 7, 15, 20, 2.2),
('Warhol Cat', 8, 16, 1, 1.2),
('The Zebra', 13, 1, 16, 2.0),
('The Mountain', 14, 2, 17, 8.0),
('Nebula', 15, 3, 18, 9.0),
('The Judge', 16, 4, 19, 3.5),
('Word Art', 17, 5, 20, 1.0),
('Mario', 18, 6, 1, 0.2),
('Melting Clock', 19, 7, 2, 4.5),
('World Tree', 20, 8, 3, 10.0);

select * from artworks;


-- Table to track all sales history
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    ArtworkID INT,
    SellerID INT,
    BuyerID INT,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    SalePrice_ETH DECIMAL(10, 4) NOT NULL,
    
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID),
    FOREIGN KEY (SellerID) REFERENCES Collectors(CollectorID),
    FOREIGN KEY (BuyerID) REFERENCES Collectors(CollectorID)
);



INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH)
VALUES (37, 3, 2, 4.5);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (38, 3, 1, 5.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (39, 4, 2, 2.5);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (40, 3, 1, 10.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (41, 4, 2, 8.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (42, 5, 3, 15.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (43, 6, 4, 1.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (44, 5, 3, 12.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (45, 6, 4, 6.5);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (46, 7, 5, 9.0);
INSERT INTO Transactions (ArtworkID, SellerID, BuyerID, SalePrice_ETH) VALUES (47, 8, 6, 3.5);


select * from Transactions ;



                                                -- subquery -- 



-- Display artworks are listed for more than the average price -- 
SELECT Title, ListPrice_ETH
FROM Artworks
WHERE ListPrice_ETH > (
    SELECT AVG(ListPrice_ETH)
    FROM Artworks
    WHERE ListPrice_ETH IS NOT NULL
);


-- Display the collectors who haven't bought anything yet 

SELECT Username
FROM Collectors
WHERE CollectorID NOT IN (
    SELECT DISTINCT BuyerID
    FROM Transactions
);


-- Display the single most expensive artwork currently listed for sale?

SELECT Title, ListPrice_ETH
FROM Artworks
WHERE ListPrice_ETH = (
    SELECT MAX(ListPrice_ETH)
    FROM Artworks
);


-- Display the all artworks created by artists who joined this year

SELECT Title, CreatorID
FROM Artworks
WHERE CreatorID IN (
    SELECT ArtistID
    FROM Artists
    WHERE YEAR(JoinDate) = 2024
);




                                               -- joins  -- 

-- Display List all artworks and who made them.

SELECT
    aw.Title,
    ar.Name AS ArtistName
FROM Artworks aw
JOIN Artists ar ON aw.CreatorID = ar.ArtistID;

-- Display a full sales report: date, artwork title, seller , buyer , and price.

SELECT
    t.TransactionDate,
    a.Title,
    seller.Username AS Seller,
    buyer.Username AS Buyer,
    t.SalePrice_ETH
FROM Transactions t
JOIN Artworks a ON t.ArtworkID = a.ArtworkID
JOIN Collectors seller ON t.SellerID = seller.CollectorID
JOIN Collectors buyer ON t.BuyerID = buyer.CollectorID
ORDER BY t.TransactionDate DESC;


-- Display all artworks and the name of the collection they belong to

SELECT
    a.Title AS ArtworkTitle,
    c.Name AS CollectionName
FROM Artworks a
JOIN Collections c ON a.CollectionID = c.CollectionID
ORDER BY c.Name, a.Title;


-- Display all artists by how much they've sold (include those with zero sales)

Select
    ar.Name AS ArtistName,
    IFNULL(SUM(t.SalePrice_ETH), 0) AS TotalVolume_ETH
FROM Artists ar
LEFT JOIN Artworks aw ON ar.ArtistID = aw.CreatorID
LEFT JOIN Transactions t ON aw.ArtworkID = t.ArtworkID
GROUP BY ar.Name
ORDER BY TotalVolume_ETH DESC;


                                                             -- views -- 


-- Let's create an easy way to see all items currently for sale, called ItemsForSaleView

CREATE VIEW ItemsForSaleView AS
SELECT
    a.ArtworkID,
    a.Title,
    ar.Name AS Artist,
    c.Name AS Collection,
    a.ListPrice_ETH
FROM Artworks a
JOIN Artists ar ON a.CreatorID = ar.ArtistID
JOIN Collections c ON a.CollectionID = c.CollectionID
WHERE a.ListPrice_ETH IS NOT NULL;

-- How to use it:
SELECT * FROM ItemsForSaleView;


-- Make a view called CollectorPortfolioView to easily check any collector's current holdings

CREATE VIEW CollectorPortfolioView AS
select
    col.Username,
    a.Title AS ArtworkTitle,
    ar.Name AS ArtistName,
    a.ArtworkID
FROM Collectors col
JOIN Artworks a ON col.CollectorID = a.CurrentOwnerID
JOIN Artists ar ON a.CreatorID = ar.ArtistID;

-- How to use it:
SELECT * FROM CollectorPortfolioView ;

-- Create a view called CollectionFloorPriceView to quickly see the cheapest item in each collection
CREATE VIEW CollectionFloorPriceView AS
select
    c.Name AS CollectionName,
    MIN(a.ListPrice_ETH) AS FloorPrice_ETH
FROM Collections c
JOIN Artworks a ON c.CollectionID = a.CollectionID
WHERE a.ListPrice_ETH IS NOT NULL
GROUP BY c.Name;

-- Usage:
 SELECT * FROM CollectionFloorPriceView;
 
 
--  Create a view named ArtworkSaleCount showing the number of sales per artwork?"

CREATE VIEW ArtworkSaleCount AS
SELECT
    a.Title,
    COUNT(t.TransactionID) AS NumberOfSales
FROM Artworks a
LEFT JOIN Transactions t ON a.ArtworkID = t.ArtworkID
GROUP BY a.ArtworkID, a.Title
ORDER BY NumberOfSales DESC;

-- How to use it:
SELECT * FROM ArtworkSaleCount;


