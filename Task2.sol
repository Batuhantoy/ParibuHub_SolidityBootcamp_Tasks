// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract task2 {

    struct Tenant {
        string tenantName;
        string tenantLastname;
        string tenantIdNumber;
        string tenantAddress;
    }

    // Ev Sahibi
    struct Owner {
        string ownerName;
        string ownerLastname;
        string ownerIdNumber;
        string ownerAddress;
    }

    // Kira
    struct Lease {
        string tenement;
        uint256 leaseStartDate;
        uint256 leaseEndDate;
    }

     // Kiracılar   
    mapping(string => Tenant) public Tenants;

    // Ev Sahipleri
    mapping(string => Owner) public Owners;

    // Kiralar
    mapping(string => Lease) public Leases;

     function rent (
        string memory tenement,
        string memory tenantName,
        string memory tenantLastname,
        string memory tenantIdNumber,
        string memory tenantAddress,
        string memory ownerName,
        string memory ownerLastname,
        string memory ownerIdNumber,
        string memory ownerAddress,
        uint256 leaseStartDate,
        uint256 leaseEndDate) public {

    // Kiracının bilgilerini sözleşmeye ekle
    Tenants[tenantName] = Tenant(tenantName, tenantLastname, tenantIdNumber, tenantAddress);

    // Sahibinin bilgilerini sözleşmeye ekle
    Owners[ownerName] = Owner(ownerName, ownerLastname, ownerIdNumber, ownerAddress);

   // Kiralamayı sözleşmeye ekle
    Leases[tenement] = Lease(tenement, leaseStartDate, leaseEndDate);
  }

    // Kirayı sonlandır
    function terminateLease(string memory tenement) public {
    delete Leases[tenement];
  }

    // Kiracı hatası bildir
    function reportLease(string memory tenement, string memory reportLeaseDesc) public {

    // Hatayı kayıt altına al
    emit reportedLeaseDesc(tenement, reportLeaseDesc);
  }

    // Olaylar
    event reportedLeaseDesc(string tenement, string reportLeaseDesc);

    
}