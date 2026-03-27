Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1F310BA445
	for <ath12k@archiver.kernel.org>; Fri, 27 Mar 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YIM15ydOo1yN41bnLybN/PmsnCoj4FvPlIsgv4L610w=; b=cNV2gxMPcqsUcotEPg+jRSW1y+
	8dhGnwQL6bHXQQDvipGsoOn9B9pxaOq2D8QMH8ffEdWteg7TkDJWL/KIZExPQGSVYO2jlRWg8qkTE
	4HvfOaUiWhOmx2Q+zIBor2zxxxh6s9cPWd9grOzN/FEJbkgapekVhI5/YQFbRx7uXqrdrZKt7kc5n
	gZK8VMLqN905q2820do4TP0LMsRkugTb0aYpW4DCUhc7yUWqf9HJFMBPZrchKfYTDDaE82nLIWE5t
	eC/jI/iCsSewiChOhvc0IdoMXNTEJOMvuVGeM4IDgea6krLjJ1NBqBr3HfYT6w+qaq+cd1ehq4TPJ
	eWgg/x8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62cG-00000006yf6-2Iuw;
	Fri, 27 Mar 2026 08:32:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62cD-00000006yec-29m1
	for ath12k@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YIM15ydOo1yN41bnLybN/PmsnCoj4FvPlIsgv4L610w=; b=IMkt+P6W0wdIgqgfD+3q32O9j5
	P7j+bU7w/zc1+IP509HM826IXfEFpx4kCX2KgnNHs1gD4uL7mBrESF6PXjsK9arjIOzlTN8chB0di
	9PLMAydJrEpOecPJyjglSM/5VXTkGRDndDNafBc9vmwbGQmMmxkZ+6d6LyNYnZA5lLfjGrZkf+8um
	qqwHj5RCf3fU4JqPQMeCjXEEBPbr1iDWJX2nESSrMQKuLKbzUZBgysJF61CK6f3zM2Y9fXJFWEsw5
	bnlkl4FSEJ77XA7qFMWrzrR7kATS5tnyqbba8p7PQglMFM86e5nn1OLZZb/TxUYqPp7sZCZTMbIxd
	EBsxnKFw==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62c9-00000009yTF-2QIm
	for ath12k@lists.infradead.org;
	Fri, 27 Mar 2026 08:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774600341; x=1806136341;
  h=date:from:to:cc:subject:message-id;
  bh=OBIg5c/wfgtttsm/LFdo5a8+w5dAMF5NOS0h2AxwU3Q=;
  b=iCSiDOZs0gDz+oUCIDswMXVg08r9cmUtVLaoWuZX2o+/IP4BpFBHxqKg
   1gUSXn9G5vKN1vPII7LFLBSQeLDc3p2pMdp+MhYdfWMLIZ9mu+AW4GXCe
   Z2KyXloaFDsVHYEbaGHkJLx/pKXNCGLoFO7o9rmMBE4wS/fuD4dUUqmnj
   x+OEMIEOuYMSaENI5b9XwXvk8IpEeU/qcOJSuIN/7HxHEArck7iew841H
   LY3qDJ0enhBonJHEMIMQBLivshYECXErjB7lznKJ+dJvthUtGb3ePlRE0
   20r05Ll3MRbq4yyAjjvWg4Fw0ht8sJTGVbk1QUmhBoQXOmVvvR4WnN4W1
   A==;
X-CSE-ConnectionGUID: 20lcZ6cEQsqdiCVXNqAp9g==
X-CSE-MsgGUID: qalpXXlyQ6K1U3WQcS65YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75785795"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75785795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 01:32:13 -0700
X-CSE-ConnectionGUID: mBMEX8iSTLWLqEZnlN6EOQ==
X-CSE-MsgGUID: SQ52YJsvQoefyGHcPF+Dbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="230030796"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 01:32:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w62by-000000009yu-0iAg;
	Fri, 27 Mar 2026 08:32:10 +0000
Date: Fri, 27 Mar 2026 16:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 ca48bb315817e2b5ab4b8e77996ae781365c5e21
Message-ID: <202603271645.Ywv9kIS9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_083222_019986_79AD7A17 
X-CRM114-Status: UNSURE (   3.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: ca48bb315817e2b5ab4b8e77996ae781365c5e21  Add localversion-wireless-testing-ath

elapsed time: 758m

configs tested: 141
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260327    gcc-11.5.0
arc                   randconfig-002-20260327    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260327    gcc-8.5.0
arm                   randconfig-002-20260327    clang-23
arm                   randconfig-003-20260327    clang-18
arm                   randconfig-004-20260327    gcc-11.5.0
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260327    clang-23
arm64                 randconfig-002-20260327    clang-18
arm64                 randconfig-003-20260327    gcc-9.5.0
arm64                 randconfig-004-20260327    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260327    gcc-15.2.0
csky                  randconfig-002-20260327    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260327    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260327    clang-20
i386        buildonly-randconfig-002-20260327    clang-20
i386        buildonly-randconfig-003-20260327    gcc-14
i386        buildonly-randconfig-004-20260327    clang-20
i386        buildonly-randconfig-005-20260327    clang-20
i386        buildonly-randconfig-006-20260327    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-011-20260327    clang-20
i386                  randconfig-012-20260327    gcc-14
i386                  randconfig-013-20260327    gcc-12
i386                  randconfig-014-20260327    gcc-12
i386                  randconfig-015-20260327    clang-20
i386                  randconfig-016-20260327    gcc-14
i386                  randconfig-017-20260327    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260327    clang-18
parisc                randconfig-002-20260327    clang-18
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260327    clang-18
powerpc               randconfig-002-20260327    clang-18
powerpc64             randconfig-001-20260327    clang-18
powerpc64             randconfig-002-20260327    clang-18
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260327    clang-23
riscv                 randconfig-002-20260327    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260327    clang-23
s390                  randconfig-002-20260327    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260327    gcc-14.3.0
sh                    randconfig-002-20260327    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260327    clang-20
x86_64      buildonly-randconfig-002-20260327    clang-20
x86_64      buildonly-randconfig-003-20260327    gcc-14
x86_64      buildonly-randconfig-004-20260327    clang-20
x86_64      buildonly-randconfig-005-20260327    gcc-14
x86_64      buildonly-randconfig-006-20260327    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-003-20260327    gcc-14
x86_64                randconfig-071-20260327    clang-20
x86_64                randconfig-072-20260327    clang-20
x86_64                randconfig-073-20260327    clang-20
x86_64                randconfig-074-20260327    gcc-13
x86_64                randconfig-075-20260327    clang-20
x86_64                randconfig-076-20260327    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

