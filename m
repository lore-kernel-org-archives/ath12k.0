Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257EBCFB43C
	for <ath12k@archiver.kernel.org>; Sat,  5 Oct 2024 22:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upiCy4XCLf9EqMXSIZD/d4bidDwoLphVGmu+DXVkZDg=; b=m6FXHamn3+8FYld4sko0A9ANho
	u7fLceQY/X+x8+KoSTa6tlMHjt3V8Ww+7wyIyGo7/1OmmTNXpx8IwcFVGvmRHWkLh4HNB/H60RYFx
	B0QcDOoT0MeMcsaJVm9I6SPyyaKUiPcOyKFU9TdBzcn0NpPaCsr+G5wmWxP+sxKYXosl97Z5Lrb/j
	JgB7eVfGamIzkk3DvXiO0ktXcPgJ0bI5x8AfoWEo7lOfZjzLA3/WdyNZp01CFcRbndPXP9yLF7FCa
	yArs+ZzeERJ6v0VbXUgfiqSeMT01KTtWAzP1s7Xo08IgUTE32wDbkx66SThE32LFhD+15GARxpOHY
	vbL0RHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxCqt-0000000G2FR-2ze6
	for ath12k@archiver.kernel.org;
	Sat, 05 Oct 2024 22:02:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxBlY-0000000Fwns-3SQL
	for ath12k@bombadil.infradead.org;
	Sat, 05 Oct 2024 20:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=upiCy4XCLf9EqMXSIZD/d4bidDwoLphVGmu+DXVkZDg=; b=H1FxXxiIays1S497z/kBsPJWjI
	EA8242uXLawoKqgda1IytTLpWahihOw1JBRCkgInLl5Xcrhn2tiKP8igYgI/Uz4GmSJznV1pN/XBe
	ToRsRyHdFL1nhh6iY9OLOieIkN5lFmkqAmdSAjeR3RDfKtVsAovzIAchPBeGWUgJ3YyqGpQO//Wuo
	EWE9TRG8+p4pPkiEFOh4lEzSrX8DC6cfA8T7C1BSzj7fov0nu+GRXwjqVA+WT1fnE+fQTX5S7cEc8
	4uHhmsDwQEb9/dqi/3v/rnwoeaQAbSwm2jnHaobsFzIpvOwLHXgMcT5mwSoU74eoDJwoeGd3wMNeE
	5Fp2DNgw==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxBlU-000000047HS-2gaE
	for ath12k@lists.infradead.org;
	Sat, 05 Oct 2024 20:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728161557; x=1759697557;
  h=date:from:to:cc:subject:message-id;
  bh=3L1z4AF5CIJPYetoTmkrx9aymVI25u5LixFCyaZBI0Y=;
  b=kFaoYpsd9dw+N6gZ8OsuWw+cF8obm7iWAcKkG6restqiSpKJgkz9JxGu
   3ilRAz0JA6hbcH3D9bS0YSQIQ9Dnr/+ovzb4baWPnafm5NuhjPOcQj4ZO
   TDfLTKS6kp5XSUQoyyRmfru0kk9iTL2f+pK+Lgb4pz9Rotu0Pica3ypgr
   ISofFjbRn8JKEViowaGWNYR6GiXzsFYAF9Pst1++lvfZtu71zTQiBDVtF
   beSj6moSAf4XBjIY2KdetUSfRwXuBoo1syONqKkdATJ9pVLAVSMBJwhbQ
   z90yiu6KiXkZQM4aYVWfChSOdaONRKpPSUieBa8xooxsYB0LI3P8KVE76
   w==;
X-CSE-ConnectionGUID: ExmWh+R1QY6fPu5KDBrXHg==
X-CSE-MsgGUID: AshcwGnPRo2zAONyHD9wSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27166924"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27166924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 13:52:28 -0700
X-CSE-ConnectionGUID: svVDypudSTuDkeg4/cKyzA==
X-CSE-MsgGUID: z2rRKudRRxSoa/zNrwwy8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79828300"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2024 13:52:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxBlI-0003Le-2Q;
	Sat, 05 Oct 2024 20:52:24 +0000
Date: Sun, 06 Oct 2024 04:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 c8b4c8253a14f28f97dc7d6130d69632b7207e04
Message-ID: <202410060440.a0PiEnCB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_215237_373744_E6D1FB50 
X-CRM114-Status: UNSURE (   3.11  )
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
branch HEAD: c8b4c8253a14f28f97dc7d6130d69632b7207e04  Merge branch 'pending' into main-pending

elapsed time: 1650m

configs tested: 128
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241006    gcc-13.2.0
arc                   randconfig-002-20241006    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                       aspeed_g5_defconfig    gcc-14.1.0
arm                                 defconfig    clang-14
arm                       multi_v4t_defconfig    clang-20
arm                   randconfig-001-20241006    gcc-14.1.0
arm                   randconfig-002-20241006    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241005    clang-18
i386        buildonly-randconfig-002-20241005    clang-18
i386        buildonly-randconfig-003-20241005    clang-18
i386        buildonly-randconfig-004-20241005    clang-18
i386        buildonly-randconfig-005-20241005    gcc-12
i386        buildonly-randconfig-006-20241005    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241005    gcc-11
i386                  randconfig-002-20241005    clang-18
i386                  randconfig-003-20241005    gcc-12
i386                  randconfig-004-20241005    clang-18
i386                  randconfig-005-20241005    clang-18
i386                  randconfig-006-20241005    clang-18
i386                  randconfig-011-20241005    gcc-12
i386                  randconfig-012-20241005    clang-18
i386                  randconfig-013-20241005    clang-18
i386                  randconfig-014-20241005    gcc-12
i386                  randconfig-015-20241005    gcc-12
i386                  randconfig-016-20241005    gcc-12
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
mips                          ath79_defconfig    gcc-14.1.0
mips                         rt305x_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241006    clang-18
x86_64      buildonly-randconfig-002-20241006    gcc-12
x86_64      buildonly-randconfig-003-20241006    gcc-12
x86_64      buildonly-randconfig-004-20241006    clang-18
x86_64      buildonly-randconfig-005-20241006    gcc-12
x86_64      buildonly-randconfig-006-20241006    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241006    clang-18
x86_64                randconfig-002-20241006    gcc-12
x86_64                randconfig-003-20241006    gcc-12
x86_64                randconfig-004-20241006    clang-18
x86_64                randconfig-005-20241006    clang-18
x86_64                randconfig-006-20241006    gcc-12
x86_64                randconfig-011-20241006    gcc-12
x86_64                randconfig-012-20241006    gcc-12
x86_64                randconfig-013-20241006    clang-18
x86_64                randconfig-014-20241006    clang-18
x86_64                randconfig-015-20241006    clang-18
x86_64                randconfig-016-20241006    gcc-12
x86_64                randconfig-071-20241006    clang-18
x86_64                randconfig-072-20241006    gcc-12
x86_64                randconfig-073-20241006    gcc-12
x86_64                randconfig-074-20241006    clang-18
x86_64                randconfig-075-20241006    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                    rhel-8.3-kselftests    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

