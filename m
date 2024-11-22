Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ED4D75E49
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 13:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/0WZnk0KFmt4GxM5WxdJGH15hgchU0bAumxRUiINKgk=; b=e1XSH6OoxEssnE7+mGTtFXCa4s
	5I6DRiJI5xGc7xIljPqBACE23KDB029dUGzWfaX4C5pEl4nxnDD9RaLujrElZxDWXHiifnBr4mH1v
	3Q6DxYDYw86eW/Ht4w9sg1WeMVhPgJyM7vdUqL1epgn9NRsipJnqOjzDiMbN8SoTr+nbf6tb9QO9U
	89kP1mk5t0beSH3BpBeJWPig3GCUmF9AsY7Zc39hyaz9A5ydIId7hyC945WpT+81DCnHVWa4rU09G
	krcqDl5tY06kdM3MdPTYVo6sWPPX+DPx+uACZpC7qmdgSOl1KODSIEXkFgqAaNsVQYwtIowEhi3Jb
	GrWSgB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEU8H-00000002ZUq-0Uau
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 13:55:37 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEU8E-00000002ZUW-1biY
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 13:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732283734; x=1763819734;
  h=date:from:to:cc:subject:message-id;
  bh=7DvwvHZMEZR+gBBVklLjx4pgA/6GsjQngs3rJmj+ZMI=;
  b=RFW804t3rbl645kLX3i4cmBhtvO8M1e5LpSQYOouR7LfjBj+TcYOuZA+
   kKuYVVcxJ3YriEI5In6qYDxtHyXmDIYFz6ICR8gXzZrSZzJr+3bsAxFc8
   9D1FeFNMtxsFwBjxPX3QoD0BHxwqNjq2VCeBAPXi/SY/ztL46LDP8AqFF
   9H8CHacLavM2HALnzltA7votWEnsDscLWS29++GMkETzIZ3/mFh5qHgU9
   HxsDn5eBCJxeWCx6/5B84Mh3qxhLJ6yNrT9bIX2ntNd658+vk1SkH/yaG
   pdbWoj0GrtI+SEzA/f/GYlm5m6M7eT5jCPV+xmw0TsC4qJcESZtEAzK9Y
   Q==;
X-CSE-ConnectionGUID: FJzH7bEkR8aBcXXr1U6eUQ==
X-CSE-MsgGUID: nFRKZjq7SQe8HhNg9D+EZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20028702"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="20028702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 05:55:34 -0800
X-CSE-ConnectionGUID: zJ/15az5RzqshSwVUsakug==
X-CSE-MsgGUID: ldpzL0FMRbq7rF7XXAABSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90388031"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2024 05:55:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEU8A-0003xF-1P;
	Fri, 22 Nov 2024 13:55:30 +0000
Date: Fri, 22 Nov 2024 21:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 4ba72ff2919cad90e1963b708ce23b92120613ff
Message-ID: <202411222157.0PBshEui-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_055534_442028_133BF10E 
X-CRM114-Status: UNSURE (   3.81  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 4ba72ff2919cad90e1963b708ce23b92120613ff  wifi: ath11k: mark ath11k_wow_convert_8023_to_80211() as noinline

elapsed time: 1272m

configs tested: 229
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241122    gcc-13.2.0
arc                   randconfig-002-20241122    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                           omap1_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241122    clang-17
arm                   randconfig-002-20241122    gcc-14.2.0
arm                   randconfig-003-20241122    clang-20
arm                   randconfig-004-20241122    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241122    gcc-14.2.0
arm64                 randconfig-002-20241122    gcc-14.2.0
arm64                 randconfig-003-20241122    gcc-14.2.0
arm64                 randconfig-004-20241122    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241122    gcc-14.2.0
csky                  randconfig-002-20241122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241122    clang-20
hexagon               randconfig-002-20241122    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241122    clang-19
i386        buildonly-randconfig-002-20241122    clang-19
i386        buildonly-randconfig-003-20241122    clang-19
i386        buildonly-randconfig-004-20241122    clang-19
i386        buildonly-randconfig-005-20241122    clang-19
i386        buildonly-randconfig-006-20241122    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241122    clang-19
i386                  randconfig-002-20241122    clang-19
i386                  randconfig-003-20241122    clang-19
i386                  randconfig-004-20241122    clang-19
i386                  randconfig-005-20241122    clang-19
i386                  randconfig-006-20241122    clang-19
i386                  randconfig-011-20241122    clang-19
i386                  randconfig-012-20241122    clang-19
i386                  randconfig-013-20241122    clang-19
i386                  randconfig-014-20241122    clang-19
i386                  randconfig-015-20241122    clang-19
i386                  randconfig-016-20241122    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241122    gcc-14.2.0
loongarch             randconfig-002-20241122    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                            gpr_defconfig    gcc-14.2.0
mips                           ip22_defconfig    clang-20
mips                           ip30_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241122    gcc-14.2.0
nios2                 randconfig-002-20241122    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                  or1klitex_defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    clang-20
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241122    gcc-14.2.0
parisc                randconfig-002-20241122    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-20
powerpc                 linkstation_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20241122    gcc-14.2.0
powerpc               randconfig-002-20241122    clang-20
powerpc               randconfig-003-20241122    clang-20
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241122    gcc-14.2.0
powerpc64             randconfig-002-20241122    gcc-14.2.0
powerpc64             randconfig-003-20241122    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241122    gcc-14.2.0
riscv                 randconfig-002-20241122    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241122    clang-20
s390                  randconfig-002-20241122    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241122    gcc-14.2.0
sh                    randconfig-002-20241122    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241122    gcc-14.2.0
sparc64               randconfig-002-20241122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241122    clang-17
um                    randconfig-002-20241122    gcc-11
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241122    clang-19
x86_64      buildonly-randconfig-002-20241122    clang-19
x86_64      buildonly-randconfig-003-20241122    clang-19
x86_64      buildonly-randconfig-004-20241122    clang-19
x86_64      buildonly-randconfig-005-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241122    clang-19
x86_64                randconfig-002-20241122    clang-19
x86_64                randconfig-003-20241122    clang-19
x86_64                randconfig-003-20241122    gcc-12
x86_64                randconfig-004-20241122    clang-19
x86_64                randconfig-005-20241122    clang-19
x86_64                randconfig-005-20241122    gcc-12
x86_64                randconfig-006-20241122    clang-19
x86_64                randconfig-011-20241122    clang-19
x86_64                randconfig-012-20241122    clang-19
x86_64                randconfig-012-20241122    gcc-12
x86_64                randconfig-013-20241122    clang-19
x86_64                randconfig-013-20241122    gcc-12
x86_64                randconfig-014-20241122    clang-19
x86_64                randconfig-014-20241122    gcc-12
x86_64                randconfig-015-20241122    clang-19
x86_64                randconfig-015-20241122    gcc-12
x86_64                randconfig-016-20241122    clang-19
x86_64                randconfig-016-20241122    gcc-12
x86_64                randconfig-071-20241122    clang-19
x86_64                randconfig-072-20241122    clang-19
x86_64                randconfig-072-20241122    gcc-12
x86_64                randconfig-073-20241122    clang-19
x86_64                randconfig-073-20241122    gcc-12
x86_64                randconfig-074-20241122    clang-19
x86_64                randconfig-075-20241122    clang-19
x86_64                randconfig-075-20241122    gcc-12
x86_64                randconfig-076-20241122    clang-19
x86_64                randconfig-076-20241122    gcc-11
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241122    gcc-14.2.0
xtensa                randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

