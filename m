Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD4E77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 22:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MW0muLWPi9eeD+ZLWTxuHesx4r6AkbWTY5zbSifJIq4=; b=oCKgICnCEWiX3gZ5SePEpjyHF8
	/PJhmtTRg4Cg+QKRwoDcrZDxWbD1TBW6pBFax5W2jN+XhJRt2LXRn4GXfzGx+flAN6va+vauWA/gp
	X6qY2E7M+6Fq/tB8QLUccWy7EXyNUu1tT9r2QIvNZq66h63yWFvUS1tZErUCWNnh5Ky4aSTGpbqh0
	y3RWcRlwRgFyKYJvE8wmHLUuJUnq0O4pE0OzSUnIbILda0xHVYWLr/qnwbDtkeOBfjXuHCXKHuW5F
	voUybD6VPK+Q85Zsf71g53qT27nqwC0kceUng26apUp6EhK+FZFUj1zqIGSnSs3V0aK1JRGutanQE
	axAl7uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpf7-00000009yOK-3Mwh
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 22:45:29 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpf4-00000009yNC-4B52
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 22:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736894727; x=1768430727;
  h=date:from:to:cc:subject:message-id;
  bh=pwdCPuIDCeUXSvwz3FE/ojePDvw/oEKMa/z90zxnGmE=;
  b=ADraBqhnDMHcFSkIqkOhj/KMIHRop6zBewJ7ttQN1BT3FwS6VsRSoasi
   Ui8ZYAGaZ75oikVKUBKU6qZ7AR7G7wCIfuXX3+uR11Ee3WGcqEz2DY7Rz
   SjFF4JWC1sYpm7/6Dlg28KVc6TihTWeME5F+D/yl+huHREVXy2tGAhugL
   LxC0cka0lq+tGHFCkTV4i43qNev/reBhojT3td8ZK7/Jk4YuxTRLTwaDX
   LRHwT4hKHyhKHVR8xaCcAc2FlfYZRvfaSeaJKkg8kaLIYZA0kIEVphxKl
   ClKLNk0tOGHcCgPhw/X7krVTuXO7GyOPkIp9347G2+JV0S03niQTcBipA
   A==;
X-CSE-ConnectionGUID: IXLZ/NfARjCbgOqsR2+4fg==
X-CSE-MsgGUID: 9rM6M9ACQmiFFQ/dRFDr4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40891411"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="40891411"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 14:45:26 -0800
X-CSE-ConnectionGUID: 3be01aP7QH2XpP++V6O5gQ==
X-CSE-MsgGUID: RQATKtmjSnyJn+J7m5MASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="105127152"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2025 14:45:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXpf0-000P8N-1A;
	Tue, 14 Jan 2025 22:45:22 +0000
Date: Wed, 15 Jan 2025 06:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 80982d8c01d7f5e09acd3e828a8364c82d102e22
Message-ID: <202501150639.j7CnKl2Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_144527_107389_ED4F7A07 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master-pending
branch HEAD: 80982d8c01d7f5e09acd3e828a8364c82d102e22  Merge branch 'pending' into main-pending

elapsed time: 1349m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250114    gcc-13.2.0
arc                   randconfig-002-20250114    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250114    clang-15
arm                   randconfig-002-20250114    clang-20
arm                   randconfig-003-20250114    gcc-14.2.0
arm                   randconfig-004-20250114    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250114    clang-17
arm64                 randconfig-002-20250114    clang-19
arm64                 randconfig-003-20250114    gcc-14.2.0
arm64                 randconfig-004-20250114    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250114    gcc-14.2.0
csky                  randconfig-002-20250114    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250114    clang-20
hexagon               randconfig-002-20250114    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250114    gcc-12
i386        buildonly-randconfig-002-20250114    clang-19
i386        buildonly-randconfig-003-20250114    clang-19
i386        buildonly-randconfig-004-20250114    gcc-12
i386        buildonly-randconfig-005-20250114    clang-19
i386        buildonly-randconfig-006-20250114    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250114    gcc-14.2.0
loongarch             randconfig-002-20250114    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250114    gcc-14.2.0
nios2                 randconfig-002-20250114    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250114    gcc-14.2.0
parisc                randconfig-002-20250114    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250114    gcc-14.2.0
powerpc               randconfig-002-20250114    clang-20
powerpc               randconfig-003-20250114    gcc-14.2.0
powerpc64             randconfig-001-20250114    clang-20
powerpc64             randconfig-002-20250114    clang-15
powerpc64             randconfig-003-20250114    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250114    gcc-14.2.0
riscv                 randconfig-002-20250114    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250114    clang-18
s390                  randconfig-002-20250114    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250114    gcc-14.2.0
sh                    randconfig-002-20250114    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250114    gcc-14.2.0
sparc                 randconfig-002-20250114    gcc-14.2.0
sparc64               randconfig-001-20250114    gcc-14.2.0
sparc64               randconfig-002-20250114    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250114    clang-17
um                    randconfig-002-20250114    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250114    clang-19
x86_64      buildonly-randconfig-002-20250114    clang-19
x86_64      buildonly-randconfig-003-20250114    clang-19
x86_64      buildonly-randconfig-004-20250114    clang-19
x86_64      buildonly-randconfig-005-20250114    clang-19
x86_64      buildonly-randconfig-006-20250114    clang-19
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250114    gcc-14.2.0
xtensa                randconfig-002-20250114    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

