# Task 2.1. Most Popular Hypervisors for Infrastructure Virtualization and their Key Differences

Citrix XenServer, Microsoft Hyper-V, Red Hat KVM, and VMware vSphere are the biggest players in the server virtualization market.


### Let's compare

### Hyper-V

Launched in 2008, Microsoft Hyper-V helps in expanding or establishing a private cloud environment. It promotes effective hardware utilization, improves business continuity, as well as makes development and test more efficient.

#### Features of Microsoft Hyper-V for Windows Server 2019:

* Persistent memory support.
* Shielded VM updates.
* Simple Two-Node clusters.
* ReFS Deduplication.
* Storage Spaces Direct improvements.
* Windows Admin Center.
* Encrypted subnets.


### 2. KVM

KVM (Kernel-based Virtual Machine), a part of Red Hat Virtualization Suite, is a complete virtualization infrastructure solution. KVM turns Linux kernel into a hypervisor. It was merged into the Linux kernel mainline in kernel version 2.6.20.

#### Red Hat KVM server virtualizationFeatures of Red Hat KVM:

* Container support
* Scalability
* Overcommit resources
* Disk I/O throttling
* Hot plug of virtual resources
* Low-cost virtualization solution
* Red Hat Enterprise Virtualization programming & API
* Live Migration & Storage Migration
* Assign any PCI device to virtual machines
* Red Hat Satellite integration
* Disaster Recovery support

### 3. vSphere

vSphere, the virtualization platform of VMware, is a set of products that not only includes virtualization, but also management and interface layers.
It provides a number of key components including infrastructure services (vCompute, vStorage, and vNetwork), application services, vCenter Server, vSphere Client, etc.

#### VMware vSphere server virtualizationFeatures of VMware vSphere:

* vCenter Server: A centralized management tool used to configure, provision and manage virtual IT environments.
* vSphere Client: vSphere has the final version of Flash-based vSphere Web Client. Newer workflows in the updated vSphere Client release includes vSphere Update Manager, Content library, vSAN, Storage policies, Host profiles, VMware vSphere Distributed Switch™ topology diagram and Licensing.
* vSphere SDKs: Provides interfaces for third-party solutions to access vSphere.
* VM File System: Cluster file system for VMs.
* Virtual SMP: Enables a single VM to use multiple physical processors at a time.
* vMotion: Enables live migration with transaction integrity.
* Storage vMotion: Enables VM file migration from one place to other without service interruption.
* High Availability: If one server fails, VM is shifted to other server with spare capacity to enable business continuity.
* Distributed Resource Scheduler (DRS): Assigns and balances compute automatically across hardware resources available for VMs.
* Fault Tolerance: Generates copy of primary VM to ensure its continuous availability.
* Distributed Switch (VDS): Spans multiple ESXi hosts and enables considerable reduction of network maintenance activities.

### 4. XenServer

Based on Xen Project Hypervisor, XenServer is an open sourced bare-metal virtualization platform. It consists of enterprise-grade features that help enterprises to easily handle workloads, combined OS, and networking configurations.
XenServer provides improved virtualized graphics with NIVIDA and Intel and allows execution of multiple computer operating systems on same computer hardware.

#### Citrix XenServer server virtualizationFeatures of Citrix XenServer:

* Site Recovery
* Host Failure Protection
* Multi-server management
* Dynamic Memory Control
* Active Directory Integration
* Role Based Administration and Control (RBAC)
* Mixed Resource Pools with CPU Masking
* Distributed Virtual Switch Controller
* In Memory read caching
* Live VM migration & Storage XenMotion
