# CarbonVault: Tokenized Carbon Credits Platform on Avalanche

## Problem Statement
Corporations and individuals want to buy, hold, retire, and trade verifiable carbon credits transparently. Traditional carbon markets are slow, centralized, and lack real-time pricing and auditability. CarbonVault tokenizes carbon credits as ERC-20 tokens on Avalanche, allowing users to mint credits from verified projects, transfer them, retire them (burn), and view real-time pricing via Chainlink oracle — all with full on-chain auditability, low gas costs, and fast finality.

## Why Avalanche?
- Low gas fees and near-instant finality (seconds) for frequent actions like retiring credits.
- EVM-compatible for easy Chainlink integration and ERC-20 standards.
- Subnets for future scale: A custom subnet could handle high-volume issuance with compliance rules (e.g., gas token in fiat-pegged stablecoin, isolated for regulatory needs).

## Architecture Diagram
User (Corporations / Individuals)
↓ (Core Wallet connect + sign tx)
Frontend (HTML + ethers.js)
↓
Avalanche Fuji C-Chain
├── CarbonCreditToken (ERC-20: mint / transfer / retire)
├── CarbonRegistry (issuance, validation, metadata)
└── OracleConsumer (mock Chainlink price feed)

**Deployed Addresses on Fuji Testnet:**
- CarbonCreditToken: `0x95a56CC491d1df281fA42C0c7cd4CBd875a7dddf`
- CarbonRegistry: `0x8B1C7eA72c47bEA382Ba7B2e9F01C369A085f896`
- OracleConsumer: `0x7a2003e629662B8Dbd5C54Dd792d39f7DC34586f`

**System Flow:**
- Frontend connects to Core Wallet
- Registry.registerProject() creates metadata and calls Token.mint()
- OracleConsumer provides carbon price data to the system
- All actions are transparent and on-chain with low gas