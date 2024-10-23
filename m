Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3DCCFA455
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7U9PGU94B4BoeweqjDBO1eS+8iqNNrORoGAi2zQ7Fl8=; b=Z+tbHkYJyCnDB0U2/RDnIG4btb
	GTsENPEhorTQYKMN5iJfK5q3e1Zwa5IK1zcB95ZW8fILbuN3dEEKl7qZMkSZEwr+HJ6OTMMXvoXyj
	eRPn5Pw+YR6zeY8sWn41O5bQkLGTxRuz/CxQQdYyjGKizGzbZVMpzOpg1q2AT+IMzCC4gicrGK1b9
	X1PZ60ROvPW145mgOdJLupY0jPhLBYPB0U2TCr8n3MggMT7EEEaPFqk88Wxybl8e+uaYSIy8FhAtX
	wTuTkrz0ohfPt4NBQ+jy0ZgJPNEjJIOFG/D54lHl7JqhOYAVNnZbtNsSvpJb0R1imlm99kcuh+lNy
	tG4JXnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egk-0000000FFbs-1xTe
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 16:58:26 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e1W-0000000F6RN-1JtI
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 16:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729700150; x=1761236150;
  h=date:from:to:cc:subject:message-id;
  bh=KDb7FFID7vIP9UzyDvR1hU20chddmd1EFMWx9UkOZac=;
  b=X540N0wd4dmcgSMM2k+gZfxtdfXA/bQgNdy2R55NdxcBbjXNL+cUMk3f
   c9bQTsqU3g8mXs4VhNE5Q5nqYSlejH1pDRLDypan/ItznBa8BeWgaMqIA
   En/deSHYEQQBcGBkw1ef7oCX+ZTLOCnsheGvz1LdfKe/pJfaFVTvdhoSS
   X6VlbGGVxrZcTgCD7gBn60N1+gLnZPf9jPICKoa95Pn0AIxc0gp9yUUeQ
   l+KZIM5pc+7/OhUTSb0CUOC1ibSEVdyqXcOKWuGQvya73Rhvu+C6tiasH
   8O0NmrxqNmUesZevwHPRJEZOgy3AeBrXr3c0mAsG/9hqafHk6gKeetZSW
   g==;
X-CSE-ConnectionGUID: XkCmUGCmQaacwkuc2/eX6g==
X-CSE-MsgGUID: tZ1UOyBYQ6i9g+ajZaTT6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29197133"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="29197133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:15:48 -0700
X-CSE-ConnectionGUID: mAKjWXaeTCuBBvwWUuGZmw==
X-CSE-MsgGUID: aP+lxegPQAW878Jb78ItGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80199491"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2024 09:15:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3e1Q-000V8M-0i;
	Wed, 23 Oct 2024 16:15:44 +0000
Date: Thu, 24 Oct 2024 00:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 ca68ce0d9f4bcd032fd1334441175ae399642a06
Message-ID: <202410240024.PiFzOiU2-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_091550_394654_1265D4E3 
X-CRM114-Status: UNSURE (   3.45  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: ca68ce0d9f4bcd032fd1334441175ae399642a06  wifi: ath12k: fix warning when unbinding

elapsed time: 1476m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                         mv78xx0_defconfig    clang-20
arm                           sunxi_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241023    clang-18
i386        buildonly-randconfig-002-20241023    clang-18
i386        buildonly-randconfig-003-20241023    gcc-12
i386        buildonly-randconfig-004-20241023    gcc-12
i386        buildonly-randconfig-005-20241023    clang-18
i386        buildonly-randconfig-006-20241023    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241023    gcc-12
i386                  randconfig-002-20241023    clang-18
i386                  randconfig-003-20241023    clang-18
i386                  randconfig-004-20241023    clang-18
i386                  randconfig-005-20241023    clang-18
i386                  randconfig-006-20241023    gcc-12
i386                  randconfig-011-20241023    clang-18
i386                  randconfig-012-20241023    gcc-12
i386                  randconfig-013-20241023    gcc-12
i386                  randconfig-014-20241023    clang-18
i386                  randconfig-015-20241023    clang-18
i386                  randconfig-016-20241023    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip30_defconfig    clang-20
mips                           jazz_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                    gamecube_defconfig    clang-20
powerpc                      ppc44x_defconfig    clang-20
powerpc                     redwood_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7722_defconfig    clang-20
sh                           se7724_defconfig    clang-20
sh                        sh7785lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                    rhel-8.3-kselftests    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

