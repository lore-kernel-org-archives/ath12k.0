Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDBFE77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDzNnJAMhefpe+4i+8YX1nIWYtZikYpey5YnPBlCURY=; b=GD01KVin9oTtyoNeZTatVLIydr
	jxl6bZIGaGmNWvHFKPiHZPNmcfsZE0pyhL+xRSoDi5pfIiaVbEr0dE1tflwDMHJJUqxRIboex1E9/
	Zm+Jtvc0qieLztaed9ziHwiKYE8v0zRX+6gCLkVFxtOtNNspVZaRCRb+mjuXEShcIFYv3hXq2R93B
	1Tcvg1lhrGBscrogaRnbMgsB9TdDG3CZFJa/KsE6IAkwjQLm1lr1BQZxaX1GW674J94JQAOQlC7J0
	tqBwFIca+2SVI85b+4Vm6S1jhu9hHkinaopg12F0Mubjsbpo9QOg3p7tLV3cQCogWuxZsujrhIb5x
	ef7JK3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjpI-0000000AgED-2FVZ
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:07:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVie6-0000000AWJ8-3eAE
	for ath12k@bombadil.infradead.org;
	Thu, 09 Jan 2025 02:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=oDzNnJAMhefpe+4i+8YX1nIWYtZikYpey5YnPBlCURY=; b=JE9zLTVrX1ensVjsDwKnfzGEel
	+CSjlaes2pTVp6UBRkgeW73wS3KzrCpypj7ReouCwCEsEejRM/tOA2ooAdP3sQct7s0eF7MJmP85k
	0b4hHTOtyuuFdGPIS+gZC5eqUwa13p/VUozcxBMLa4y/3LC8q0VC1/j+3uGZwiSNLRdI0e3UADwpW
	MLn5NX76xAZVTECLZqKz5JY8ugRIQ9YIPyACsKBcnCY1DhS/J/611oOn2z4Fg9w0PZ+ew/GzCh3ly
	oLEjYLQVzHePuEuCwooQ5px877P/LwpM5Wt6nCbY2FwhGbX0fjQrGTZVcXuni4up2m+vGZV9f/qgn
	lI64PohA==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVie3-00000009TSV-0IL4
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 02:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736391099; x=1767927099;
  h=date:from:to:cc:subject:message-id;
  bh=dbleqyRt2YBSSQScZSZ9GR6J6aFPhy1kCAitB2KI5J8=;
  b=UYzt4B9zrZOWNjDc2+SFG8ZlTRdnN6C37Juz6b6NT5z2mIygXdo9Jo49
   rYcvyZ7v/fxCQGILc9NO6q5sRumJ6867J1zhwK7Rkr8iTp9LzGd6BeQnp
   LYnSQdxXE6S/FwjNItSsBPuAAiTE6iXvb4bjGIZbvjmj9GJPtvUBhugXj
   AI//7MGFD1Inh8oI4AWRRaYSSMJeGC78GziDj1UeVQrHs9aLML0H8O1qN
   t6FIAUuRZdE4RgRQAzO6kV8F64Y+XzgkxNlcdGhN0l+yBwKqfMewOcscP
   sIjm8VnHgc+6Xlc8YnysuLAOvZiAXqsApd3s8Pfuwgwdky0KopMgbebAZ
   A==;
X-CSE-ConnectionGUID: jNMDvYdgTP2tbYIMwf1aOg==
X-CSE-MsgGUID: kInj+XJHQVO6ot++OulRHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35861253"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="35861253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 18:51:35 -0800
X-CSE-ConnectionGUID: 8OS/H7WlR2aqnM2TW9gaXw==
X-CSE-MsgGUID: G6u0e1RDRm2MQVsmQO2AOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107881411"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2025 18:51:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVidw-000Gxv-0P;
	Thu, 09 Jan 2025 02:51:32 +0000
Date: Thu, 09 Jan 2025 10:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e86d6e7a3c0210d50b40d85570c01fe94654db48
Message-ID: <202501091044.vhHsgZjc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_025139_761801_48F5BCD7 
X-CRM114-Status: UNSURE (   3.40  )
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
branch HEAD: e86d6e7a3c0210d50b40d85570c01fe94654db48  Merge branch 'pending' into main-pending

elapsed time: 1463m

configs tested: 192
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250108    gcc-13.2.0
arc                   randconfig-001-20250109    clang-20
arc                   randconfig-002-20250108    gcc-13.2.0
arc                   randconfig-002-20250109    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                   randconfig-001-20250108    gcc-14.2.0
arm                   randconfig-001-20250109    clang-20
arm                   randconfig-002-20250108    gcc-14.2.0
arm                   randconfig-002-20250109    clang-20
arm                   randconfig-003-20250108    clang-20
arm                   randconfig-003-20250109    clang-20
arm                   randconfig-004-20250108    clang-18
arm                   randconfig-004-20250109    clang-20
arm                           sama5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250108    gcc-14.2.0
arm64                 randconfig-001-20250109    clang-20
arm64                 randconfig-002-20250108    clang-20
arm64                 randconfig-002-20250109    clang-20
arm64                 randconfig-003-20250108    gcc-14.2.0
arm64                 randconfig-003-20250109    clang-20
arm64                 randconfig-004-20250108    gcc-14.2.0
arm64                 randconfig-004-20250109    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250108    gcc-14.2.0
csky                  randconfig-001-20250109    gcc-14.2.0
csky                  randconfig-002-20250108    gcc-14.2.0
csky                  randconfig-002-20250109    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250108    clang-20
hexagon               randconfig-001-20250109    gcc-14.2.0
hexagon               randconfig-002-20250108    clang-20
hexagon               randconfig-002-20250109    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250108    clang-19
i386        buildonly-randconfig-002-20250108    gcc-12
i386        buildonly-randconfig-003-20250108    gcc-12
i386        buildonly-randconfig-004-20250108    gcc-12
i386        buildonly-randconfig-005-20250108    gcc-12
i386        buildonly-randconfig-006-20250108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250109    gcc-12
i386                  randconfig-002-20250109    gcc-12
i386                  randconfig-003-20250109    gcc-12
i386                  randconfig-004-20250109    gcc-12
i386                  randconfig-005-20250109    gcc-12
i386                  randconfig-006-20250109    gcc-12
i386                  randconfig-007-20250109    gcc-12
i386                  randconfig-011-20250109    clang-19
i386                  randconfig-012-20250109    clang-19
i386                  randconfig-013-20250109    clang-19
i386                  randconfig-014-20250109    clang-19
i386                  randconfig-015-20250109    clang-19
i386                  randconfig-016-20250109    clang-19
i386                  randconfig-017-20250109    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250108    gcc-14.2.0
loongarch             randconfig-001-20250109    gcc-14.2.0
loongarch             randconfig-002-20250108    gcc-14.2.0
loongarch             randconfig-002-20250109    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-20
mips                              allnoconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250108    gcc-14.2.0
nios2                 randconfig-001-20250109    gcc-14.2.0
nios2                 randconfig-002-20250108    gcc-14.2.0
nios2                 randconfig-002-20250109    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250108    gcc-14.2.0
parisc                randconfig-001-20250109    gcc-14.2.0
parisc                randconfig-002-20250108    gcc-14.2.0
parisc                randconfig-002-20250109    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                      pasemi_defconfig    clang-20
powerpc                      ppc6xx_defconfig    clang-20
powerpc               randconfig-001-20250108    clang-16
powerpc               randconfig-001-20250109    gcc-14.2.0
powerpc               randconfig-002-20250108    gcc-14.2.0
powerpc               randconfig-002-20250109    gcc-14.2.0
powerpc               randconfig-003-20250108    gcc-14.2.0
powerpc               randconfig-003-20250109    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-20
powerpc64             randconfig-001-20250108    clang-18
powerpc64             randconfig-001-20250109    gcc-14.2.0
powerpc64             randconfig-002-20250108    clang-16
powerpc64             randconfig-002-20250109    gcc-14.2.0
powerpc64             randconfig-003-20250108    clang-20
powerpc64             randconfig-003-20250109    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250108    gcc-14.2.0
riscv                 randconfig-001-20250109    gcc-12
riscv                 randconfig-002-20250108    gcc-14.2.0
riscv                 randconfig-002-20250109    gcc-12
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250108    gcc-14.2.0
s390                  randconfig-001-20250109    gcc-12
s390                  randconfig-002-20250108    gcc-14.2.0
s390                  randconfig-002-20250109    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250108    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-12
sh                    randconfig-002-20250108    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-12
sh                          rsk7264_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250108    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-12
sparc                 randconfig-002-20250108    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-12
sparc64               randconfig-001-20250108    gcc-14.2.0
sparc64               randconfig-001-20250109    gcc-12
sparc64               randconfig-002-20250108    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250108    gcc-12
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250108    clang-16
um                    randconfig-002-20250109    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250108    clang-19
x86_64      buildonly-randconfig-002-20250108    gcc-11
x86_64      buildonly-randconfig-003-20250108    clang-19
x86_64      buildonly-randconfig-004-20250108    gcc-12
x86_64      buildonly-randconfig-005-20250108    gcc-12
x86_64      buildonly-randconfig-006-20250108    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250109    gcc-12
x86_64                randconfig-072-20250109    gcc-12
x86_64                randconfig-073-20250109    gcc-12
x86_64                randconfig-074-20250109    gcc-12
x86_64                randconfig-075-20250109    gcc-12
x86_64                randconfig-076-20250109    gcc-12
x86_64                randconfig-077-20250109    gcc-12
x86_64                randconfig-078-20250109    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250108    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-12
xtensa                randconfig-002-20250108    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

