🎨 DigiArt NFT Marketplace Database
📌 Project Overview

DigiArt is a relational database project that simulates a digital NFT marketplace where artists create artworks, collectors purchase them, and transactions are recorded on a marketplace platform.

This project demonstrates database design, SQL queries, joins, subqueries, and views to manage and analyze data for an NFT ecosystem.

The system tracks:

Artists and their profiles

NFT collections

Individual artworks

Collectors

Artwork transactions and sales history

🗄 Database Schema

The database contains the following tables:

1️⃣ Artists

Stores information about digital artists who create artworks.

Column	Description
ArtistID	Unique ID for each artist
Name	Artist name
WalletAddress	Blockchain wallet address
Bio	Artist description
JoinDate	Date the artist joined the platform
2️⃣ Collectors

Represents users who buy and collect NFTs.

Column	Description
CollectorID	Unique collector ID
Username	Collector username
WalletAddress	Blockchain wallet
JoinDate	Date joined
3️⃣ Collections

NFT artworks are grouped into collections.

Column	Description
CollectionID	Unique collection ID
Name	Collection name
Description	Collection description
ArtistID	Creator of the collection
4️⃣ Artworks

Stores individual NFTs created by artists.

Column	Description
ArtworkID	Unique artwork ID
Title	Artwork title
Description	Artwork description
ImageURL	NFT image location
MintDate	Creation date
CollectionID	Collection reference
CreatorID	Artist who created it
CurrentOwnerID	Current NFT owner
ListPrice_ETH	Price listed for sale
5️⃣ Transactions

Tracks all NFT sales between collectors.

Column	Description
TransactionID	Unique transaction ID
ArtworkID	Artwork sold
SellerID	Seller
BuyerID	Buyer
TransactionDate	Sale date
SalePrice_ETH	Price in ETH


🔗 Database Relationships
The database uses foreign keys to maintain relationships:
Artists → Collections
Artists → Artworks
Collectors → Artworks
Artworks → Transactions
Collectors → Transactions
This creates a fully normalized relational schema.

