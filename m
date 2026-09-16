Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C64EC982CD
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vcF1DnnnzakUkhri5Ahjv8tWUXc+AtF8CEOQgzWDiEs=; b=ip6KFONN+9x0MPy5kNj2vTJLS+
	tUVCUpUm9fdProPT60eROTMHQrIV/ic8HUB565jdfo0FGRAfyeTC/Cou0XIVjnfWVz554QP+38ZsU
	MGkZXnFM5VmUwGV2xrD84dmMkKDD6jAE/wpAFIFSj6SnrTT+mtfC3n2n/AgocQzVM3i4JCFgUMi+/
	tAwrPSWjYn3RyDUTiFFLxJcUIMEeTolWE9G4xmD4nY7CjxYnmT9W3aTQ2LVBuSRq0ZKdkVe7ITI6g
	jgtp8qWJUAJCytiSAJAmbOPikSSthaiIh5ZZKywAkqhtvTdQcz8ax4gcqOWa6DAuZbK3B+4PqCxcU
	zXQzHvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rvJ-00000009dyb-0IpZ;
	Wed, 16 Sep 2026 15:51:49 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rvG-00000009dxG-1JaZ
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 15:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573906; x=1821109906;
  h=date:from:to:cc:subject:message-id;
  bh=wFA1cIfo59X3qnrNza1ytQyfLost7RJj0yQOPMDvNVA=;
  b=R+8IboloIfFCz0fkYbAcwzY+FuDjpwF7udJORSxcNfsmBC230Io85JZv
   GSq9Z7lkOfFrB5ipt0/+9X7cM+8BNxZ9iDiyYMUe00pLyOMsnFPF1hu5W
   XdFE61oqwTa/FZEO4D+McR7RV1vvt5bWuiLvslYSj24ZmCOXRJgpqsGn7
   2Y+qcwf3vkwNujk3XGhv/F1lnMO1HvRPEEXRBKiysIwnfA9CvUySAbKve
   xH7k0bLqEtHsXMPRONYPWDbOkuheDYTBFkOw5PzPDzw7OfvG6JoqC/6+w
   pqV4nZmYJnwt/UVIfj27SV5b4VtzgzQZB7tZZ/eWT+M5MCGFfuRQIqoTd
   w==;
X-CSE-ConnectionGUID: 3Gfci3VVQHyZCgSPz66K2A==
X-CSE-MsgGUID: YdhfcygDT6+9BlE7wlZ76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100550160"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100550160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:51:46 -0700
X-CSE-ConnectionGUID: F9vbbjqIQnabN/+IgK0IKw==
X-CSE-MsgGUID: J76W8Pi4QmuMdHaIFeWS7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="303273719"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2026 08:51:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6rvC-000000006J7-0tQ8;
	Wed, 16 Sep 2026 15:51:42 +0000
Date: Wed, 16 Sep 2026 23:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-current] BUILD SUCCESS
 820b8cff81c796ba20573e04722ab62500713f97
Message-ID: <202609162310.mW2UpoFo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085146_371051_7562EB9D 
X-CRM114-Status: UNSURE (   4.07  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-current
branch HEAD: 820b8cff81c796ba20573e04722ab62500713f97  wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()

elapsed time: 2695m

configs tested: 334
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    clang-20
arc                    randconfig-001-20260916    clang-24
arc                    randconfig-002-20260916    clang-24
arc                   randconfig-1000-20260916    gcc-10.5.0
arc                   randconfig-1001-20260916    gcc-10.5.0
arc                  randconfig-r1307-20260916    gcc-16.1.0 sparse
arc                  randconfig-r1308-20260916    gcc-16.1.0 sparse
arc                         vdk_hs38_defconfig    clang-22
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    clang-20
arm                             hisi_defconfig    clang-20
arm                       jornada720_defconfig    clang-24
arm                              mxs_defconfig    clang-20
arm                              pxa_defconfig    clang-22
arm                    randconfig-001-20260916    clang-24
arm                    randconfig-002-20260916    clang-24
arm                    randconfig-003-20260916    clang-24
arm                    randconfig-004-20260916    clang-24
arm                   randconfig-1000-20260916    gcc-10.5.0
arm                   randconfig-1001-20260916    gcc-10.5.0
arm                   randconfig-1002-20260916    gcc-10.5.0
arm                   randconfig-1003-20260916    gcc-10.5.0
arm                   randconfig-r051-20260915    clang-19
arm                  randconfig-r1306-20260916    gcc-13.4.0 sparse
arm                         realview_defconfig    clang-24
arm                            spitz_defconfig    clang-24
arm                            tegra_defconfig    clang-20
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                  randconfig-001-20260916    gcc-16.1.0
arm64                  randconfig-002-20260916    gcc-16.1.0
arm64                  randconfig-003-20260916    gcc-16.1.0
arm64                  randconfig-004-20260916    gcc-16.1.0
arm64                 randconfig-1000-20260916    gcc-14.3.0
arm64                 randconfig-1001-20260916    gcc-14.3.0
arm64                 randconfig-1002-20260916    gcc-14.3.0
arm64                 randconfig-1003-20260916    gcc-14.3.0
arm64                 randconfig-r062-20260915    gcc-8.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                   randconfig-001-20260916    gcc-16.1.0
csky                   randconfig-002-20260916    gcc-16.1.0
csky                  randconfig-1000-20260916    gcc-14.3.0
csky                  randconfig-1001-20260916    gcc-14.3.0
csky                  randconfig-r111-20260916    clang-24   sparse
csky                 randconfig-r1307-20260916    gcc-13.4.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon                randconfig-001-20260916    gcc-16.1.0
hexagon                randconfig-002-20260916    gcc-16.1.0
hexagon               randconfig-1000-20260916    gcc-16.1.0
hexagon               randconfig-1001-20260916    gcc-16.1.0
i386                              alldefconfig    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386         buildonly-randconfig-001-20260916    clang-22
i386         buildonly-randconfig-002-20260916    clang-22
i386         buildonly-randconfig-003-20260916    clang-22
i386         buildonly-randconfig-004-20260916    clang-22
i386         buildonly-randconfig-005-20260916    clang-22
i386         buildonly-randconfig-006-20260916    clang-22
i386        buildonly-randconfig-1000-20260916    clang-22
i386        buildonly-randconfig-1001-20260916    clang-22
i386        buildonly-randconfig-1002-20260916    clang-22
i386        buildonly-randconfig-1003-20260916    clang-22
i386        buildonly-randconfig-1004-20260916    clang-22
i386        buildonly-randconfig-1005-20260916    clang-22
i386                                 defconfig    gcc-16.1.0
i386                   randconfig-001-20260916    gcc-14
i386                   randconfig-002-20260916    gcc-14
i386                   randconfig-003-20260916    gcc-14
i386                   randconfig-004-20260916    gcc-14
i386                   randconfig-005-20260916    gcc-14
i386                   randconfig-006-20260916    gcc-14
i386                   randconfig-007-20260916    gcc-14
i386                   randconfig-011-20260916    clang-22
i386                   randconfig-012-20260916    clang-22
i386                   randconfig-013-20260916    clang-22
i386                   randconfig-014-20260916    clang-22
i386                   randconfig-015-20260916    clang-22
i386                   randconfig-016-20260916    clang-22
i386                   randconfig-017-20260916    clang-22
i386                   randconfig-051-20260915    clang-22
i386                   randconfig-052-20260915    clang-22
i386                   randconfig-053-20260915    clang-22
i386                   randconfig-054-20260915    clang-22
i386                  randconfig-1000-20260916    gcc-14
i386                  randconfig-1001-20260916    gcc-14
i386                  randconfig-1002-20260916    gcc-14
i386                  randconfig-1003-20260916    gcc-14
i386                  randconfig-1004-20260916    gcc-14
i386                  randconfig-1005-20260916    gcc-14
i386                  randconfig-1006-20260916    gcc-14
i386                  randconfig-1007-20260916    clang-22
i386                  randconfig-1008-20260916    clang-22
i386                  randconfig-1009-20260916    clang-22
i386                  randconfig-1010-20260916    clang-22
i386                  randconfig-1011-20260916    clang-22
i386                  randconfig-1012-20260916    clang-22
i386                  randconfig-1013-20260916    clang-22
i386                   randconfig-141-20260915    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    clang-24
loongarch              randconfig-001-20260916    gcc-16.1.0
loongarch              randconfig-002-20260916    gcc-16.1.0
loongarch             randconfig-1000-20260916    gcc-16.1.0
loongarch             randconfig-1001-20260916    gcc-16.1.0
loongarch             randconfig-r053-20260915    clang-19
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-22
m68k                           atari_defconfig    clang-20
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    clang-20
m68k                         m5407c3_defconfig    clang-24
m68k                 randconfig-r1306-20260916    gcc-15.2.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze            randconfig-r073-20260915    gcc-8.5.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq5_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    clang-24
mips                  randconfig-r064-20260915    gcc-8.5.0
mips                  randconfig-r113-20260916    clang-24   sparse
mips                         vocore2_defconfig    clang-20
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                  randconfig-001-20260916    gcc-16.1.0
nios2                  randconfig-002-20260916    gcc-16.1.0
nios2                 randconfig-1000-20260916    gcc-16.1.0
nios2                 randconfig-1001-20260916    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc              randconfig-r071-20260915    gcc-14.3.0
openrisc             randconfig-r1309-20260916    gcc-15.2.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    clang-24
parisc                 randconfig-001-20260916    clang-24
parisc                 randconfig-002-20260916    clang-24
parisc                randconfig-1000-20260916    gcc-10.5.0
parisc                randconfig-1001-20260916    gcc-10.5.0
parisc                randconfig-r052-20260915    clang-19
parisc               randconfig-r1309-20260916    gcc-13.4.0 sparse
parisc                randconfig-r132-20260916    gcc-11.5.0 sparse
parisc64                          alldefconfig    clang-20
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    clang-22
powerpc                  canyonlands_defconfig    gcc-16.1.0
powerpc                    currituck_defconfig    clang-20
powerpc                      ep8248e_defconfig    clang-22
powerpc                           g5_defconfig    clang-20
powerpc                      mpc512x_defconfig    clang-20
powerpc                      mpc512x_defconfig    clang-22
powerpc                  mpc837x_rdb_defconfig    clang-22
powerpc                   mpc885_ads_defconfig    gcc-16.1.0
powerpc                     mvme5100_defconfig    clang-20
powerpc                       ppc6xx_defconfig    gcc-16.1.0
powerpc                randconfig-001-20260916    clang-24
powerpc                randconfig-002-20260916    clang-24
powerpc               randconfig-1000-20260916    gcc-10.5.0
powerpc               randconfig-1001-20260916    gcc-10.5.0
powerpc               randconfig-r071-20260915    clang-24
powerpc               randconfig-r122-20260916    clang-24   sparse
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc64              randconfig-001-20260916    clang-24
powerpc64              randconfig-002-20260916    clang-24
powerpc64             randconfig-1000-20260916    gcc-10.5.0
powerpc64             randconfig-1001-20260916    gcc-10.5.0
powerpc64             randconfig-r054-20260915    clang-19
powerpc64            randconfig-r1307-20260916    gcc-15.2.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                  randconfig-001-20260916    gcc-16.1.0
riscv                  randconfig-002-20260916    gcc-16.1.0
riscv                 randconfig-1000-20260916    gcc-8.5.0
riscv                 randconfig-1001-20260916    gcc-8.5.0
riscv                 randconfig-r053-20260915    clang-24
riscv                 randconfig-r072-20260915    clang-19
s390                              alldefconfig    clang-20
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                   randconfig-001-20260916    gcc-16.1.0
s390                   randconfig-002-20260916    gcc-16.1.0
s390                  randconfig-1000-20260916    gcc-8.5.0
s390                  randconfig-1001-20260916    gcc-8.5.0
s390                  randconfig-r064-20260915    gcc-13
s390                  randconfig-r073-20260915    clang-19
s390                  randconfig-r133-20260916    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                           lboxre2_defconfig    gcc-16.1.0
sh                     randconfig-001-20260916    gcc-16.1.0
sh                     randconfig-002-20260916    gcc-16.1.0
sh                    randconfig-1000-20260916    gcc-8.5.0
sh                    randconfig-1001-20260916    gcc-8.5.0
sh                    randconfig-r054-20260915    clang-24
sh                    randconfig-r123-20260916    clang-24   sparse
sh                   randconfig-r1306-20260916    gcc-16.1.0 sparse
sh                   randconfig-r1308-20260916    gcc-15.2.0 sparse
sh                           sdk7786_defconfig    clang-20
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                  randconfig-001-20260916    gcc-14.3.0
sparc                  randconfig-002-20260916    gcc-14.3.0
sparc                 randconfig-1000-20260916    clang-24
sparc                 randconfig-1001-20260916    clang-24
sparc                 randconfig-r063-20260915    gcc-13
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64                randconfig-001-20260916    gcc-14.3.0
sparc64                randconfig-002-20260916    gcc-14.3.0
sparc64               randconfig-1000-20260916    clang-24
sparc64               randconfig-1001-20260916    clang-24
sparc64               randconfig-r112-20260916    clang-24   sparse
sparc64              randconfig-r1308-20260916    gcc-13.4.0 sparse
sparc64              randconfig-r1309-20260916    gcc-16.1.0 sparse
sparc64               randconfig-r134-20260916    gcc-11.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                     randconfig-001-20260916    gcc-14.3.0
um                     randconfig-002-20260916    gcc-14.3.0
um                    randconfig-1000-20260916    clang-24
um                    randconfig-1001-20260916    clang-24
um                    randconfig-r052-20260915    clang-24
um                    randconfig-r072-20260915    clang-17
um                    randconfig-r121-20260916    clang-24   sparse
um                            x86_64_defconfig    clang-22
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260916    gcc-14
x86_64      buildonly-randconfig-1001-20260916    gcc-14
x86_64      buildonly-randconfig-1002-20260916    gcc-14
x86_64      buildonly-randconfig-1003-20260916    gcc-14
x86_64      buildonly-randconfig-1004-20260916    gcc-14
x86_64      buildonly-randconfig-1005-20260916    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                 randconfig-011-20260916    gcc-14
x86_64                 randconfig-012-20260916    gcc-14
x86_64                 randconfig-013-20260916    gcc-14
x86_64                 randconfig-014-20260916    gcc-14
x86_64                 randconfig-015-20260916    gcc-14
x86_64                 randconfig-016-20260916    gcc-14
x86_64                 randconfig-071-20260916    gcc-14
x86_64                 randconfig-072-20260916    gcc-14
x86_64                 randconfig-073-20260916    gcc-14
x86_64                 randconfig-074-20260916    gcc-14
x86_64                 randconfig-075-20260916    gcc-14
x86_64                 randconfig-076-20260916    gcc-14
x86_64                randconfig-1000-20260916    clang-22
x86_64                randconfig-1001-20260916    clang-22
x86_64                randconfig-1002-20260916    clang-22
x86_64                randconfig-1003-20260916    clang-22
x86_64                randconfig-1004-20260916    clang-22
x86_64                randconfig-1005-20260916    clang-22
x86_64                randconfig-1006-20260916    clang-22
x86_64                randconfig-1007-20260916    clang-22
x86_64                randconfig-1008-20260916    clang-22
x86_64                randconfig-1009-20260916    clang-22
x86_64                 randconfig-101-20260915    clang-22
x86_64                randconfig-1010-20260916    clang-22
x86_64                randconfig-1011-20260916    clang-22
x86_64                randconfig-1012-20260916    gcc-14
x86_64                randconfig-1013-20260916    gcc-14
x86_64                randconfig-1014-20260916    gcc-14
x86_64                randconfig-1015-20260916    gcc-14
x86_64                randconfig-1016-20260916    gcc-14
x86_64                randconfig-1017-20260916    gcc-14
x86_64                 randconfig-102-20260915    clang-22
x86_64                 randconfig-103-20260915    clang-22
x86_64                 randconfig-104-20260915    clang-22
x86_64                 randconfig-161-20260915    clang-22
x86_64                randconfig-r061-20260915    gcc-13
x86_64                randconfig-r063-20260915    gcc-8.5.0
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 randconfig-001-20260916    gcc-14.3.0
xtensa                 randconfig-002-20260916    gcc-14.3.0
xtensa                randconfig-1000-20260916    clang-24
xtensa                randconfig-1001-20260916    clang-24
xtensa                randconfig-r051-20260915    clang-24
xtensa                randconfig-r061-20260915    gcc-8.5.0
xtensa                randconfig-r062-20260915    gcc-13
xtensa                randconfig-r131-20260916    gcc-11.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

