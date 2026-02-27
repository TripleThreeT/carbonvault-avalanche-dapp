# CarbonVault: Tokenized Carbon Credits Platform on Avalanche

## Problem Statement
Corporations and individuals want to buy, hold, retire, and trade verifiable carbon credits transparently. Traditional carbon markets are slow, centralized, and lack real-time pricing and auditability. CarbonVault tokenizes carbon credits as ERC-20 tokens on Avalanche, allowing users to mint credits from verified projects, transfer them, retire them (burn), and view real-time pricing via Chainlink oracle — all with full on-chain auditability, low gas costs, and fast finality.

## Why Avalanche?
- Low gas fees and near-instant finality (seconds) for frequent actions like retiring credits.
- EVM-compatible for easy Chainlink integration and ERC-20 standards.
- Subnets for future scale: A custom subnet could handle high-volume issuance with compliance rules (e.g., gas token in fiat-pegged stablecoin, isolated for regulatory needs).

## Architecture Diagram
<image-card alt="Architecture Diagram" src="diagrams/architecture.png" ></image-card>

(Diagram explanation: Users interact via wallet-connected frontend. Registry contract handles issuance/metadata. Token contract manages ERC-20 logic (mint/transfer/retire). Oracle pulls external carbon price data.)