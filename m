Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3F5CE8E78
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ooANpeN2k7TYm/B1r6kmE2Pr7iQFy/7faCn6FobMGP8=; b=VpPfw3QpHLVq1z2H7AmCNQZ2Vb
	xEGRwfKyVhHRcSJRNaIbwmQD/IIYS+Dn7dWvGu27r1KM/ZAvRI/qT73+J1saPB7UmJgooC+RIlphx
	dTQz7+A8zt36IGJlSe4JVv0PXZoNAXbm/7A83U6qHGorgdoDZ5MSDc6pQURKASukn7NyH7iSOUtTZ
	vCIGDncoVi1efMIyg6PVT3dhQNMURBJEM/St4vOp/bAw6OxdvYDDfb8GirbT4jaB8D+dBTWuIKeYB
	OTgFGXrtbl7qwnSsM0V6b2QrFVuF1yqMr/TObyTVnmY3zfGGvETGElUuwha4VBW0ftuZ+QFf0LxSX
	vrWdqdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yOe-00000000bON-3zoD
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 14:01:04 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xGt-00000000OsH-29BG
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 12:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729774139; x=1761310139;
  h=date:from:to:cc:subject:message-id;
  bh=AzYuCkXCALiaO77OY7d/vrW6Cl7enVGfwGOjeXdbe+0=;
  b=QKa+3RGoWjg8fx4I4YaWgm7MNaRDWttbcMOFlaMu56bU3P2TiVxoxQwz
   RwgaKNmCWIf4nwxUUmN9z6MKJjF36tkJ1cYWH5jC+vWCpbdSVXmuaXXNr
   141yjryg2vR1bUIIvnsz5MdCYCYufDFDhJI4JPkbA+n5/0zBFDn4zSmIo
   Mc56clGf1gOJEIFgmcZ1sAK4TOkoYKvGZh5HJppL7XifwRp1SL2jTESt2
   Hes/DBF4X06/j7+3RRsUBPrZUTGn4CSTfbbP4icMdfrIWEV8UdSSCWINe
   DZO3deURYj43M6+0js2XCABsYp96Fg3cVBf5DN2oTyQNtkG2p0EQBhgbw
   w==;
X-CSE-ConnectionGUID: cJ8SBfcVQ62P8sjSfMPpCA==
X-CSE-MsgGUID: qvK0xMeuSoGwbfuXugVR+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29302169"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29302169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 05:48:55 -0700
X-CSE-ConnectionGUID: 9RhQ/PonRQG72j2FFUanlA==
X-CSE-MsgGUID: yam3NAZRTNi0OegTUACRSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85701366"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2024 05:48:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3xGl-000WQo-2m;
	Thu, 24 Oct 2024 12:48:51 +0000
Date: Thu, 24 Oct 2024 20:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 d93ffa358fffafb2817649508cac55415940a2fb
Message-ID: <202410242009.ChpVBqz4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_054859_673729_C49D0CBA 
X-CRM114-Status: UNSURE (   3.51  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: d93ffa358fffafb2817649508cac55415940a2fb  wifi: ath12k: convert tasklet to BH workqueue for CE interrupts

elapsed time: 1071m

configs tested: 151
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241024    gcc-14.1.0
arc                   randconfig-002-20241024    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                   randconfig-001-20241024    gcc-14.1.0
arm                   randconfig-002-20241024    gcc-14.1.0
arm                   randconfig-003-20241024    gcc-14.1.0
arm                   randconfig-004-20241024    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241024    gcc-14.1.0
arm64                 randconfig-002-20241024    gcc-14.1.0
arm64                 randconfig-003-20241024    gcc-14.1.0
arm64                 randconfig-004-20241024    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241024    gcc-14.1.0
csky                  randconfig-002-20241024    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241024    gcc-14.1.0
hexagon               randconfig-002-20241024    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241024    gcc-14.1.0
loongarch             randconfig-002-20241024    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241024    gcc-14.1.0
nios2                 randconfig-002-20241024    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241024    gcc-14.1.0
parisc                randconfig-002-20241024    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       ebony_defconfig    gcc-14.1.0
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241024    gcc-14.1.0
powerpc               randconfig-002-20241024    gcc-14.1.0
powerpc               randconfig-003-20241024    gcc-14.1.0
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241024    gcc-14.1.0
powerpc64             randconfig-002-20241024    gcc-14.1.0
powerpc64             randconfig-003-20241024    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241024    gcc-14.1.0
riscv                 randconfig-002-20241024    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241024    gcc-14.1.0
s390                  randconfig-002-20241024    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241024    gcc-14.1.0
sh                    randconfig-002-20241024    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241024    gcc-14.1.0
sparc64               randconfig-002-20241024    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241024    gcc-14.1.0
um                    randconfig-002-20241024    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241024    gcc-12
x86_64      buildonly-randconfig-002-20241024    gcc-12
x86_64      buildonly-randconfig-003-20241024    gcc-12
x86_64      buildonly-randconfig-004-20241024    gcc-12
x86_64      buildonly-randconfig-005-20241024    gcc-12
x86_64      buildonly-randconfig-006-20241024    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241024    gcc-12
x86_64                randconfig-002-20241024    gcc-12
x86_64                randconfig-003-20241024    gcc-12
x86_64                randconfig-004-20241024    gcc-12
x86_64                randconfig-005-20241024    gcc-12
x86_64                randconfig-006-20241024    gcc-12
x86_64                randconfig-011-20241024    gcc-12
x86_64                randconfig-012-20241024    gcc-12
x86_64                randconfig-013-20241024    gcc-12
x86_64                randconfig-014-20241024    gcc-12
x86_64                randconfig-015-20241024    gcc-12
x86_64                randconfig-016-20241024    gcc-12
x86_64                randconfig-071-20241024    gcc-12
x86_64                randconfig-072-20241024    gcc-12
x86_64                randconfig-073-20241024    gcc-12
x86_64                randconfig-074-20241024    gcc-12
x86_64                randconfig-075-20241024    gcc-12
x86_64                randconfig-076-20241024    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241024    gcc-14.1.0
xtensa                randconfig-002-20241024    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

