Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5361F47CAC
	for <ath12k@archiver.kernel.org>; Thu,  5 Mar 2026 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRr8mwCTMw7BWNzQFrNjKJowyOHTtULOY1zxenOvsBY=; b=Fpm+ns08tOU/yb4IjjXKJb9eIH
	7noZNTY8tvg5vPcjWwUT5QRoO3icesZ3u1xlN2Hl2swcRd+zMKqA5Di/Xlh4HGOwYXIX7OUPV9WgY
	/wUFgWodWu+tzNerdcppOTnYElKeSrh81LUqAwVuophFhtEezbnX1pPVLRrvIWcbjUE0YWLpNy/p/
	ISAIRrkRylLbqKaSQt3leDbyYfbPsNrKbfgsrenGecgGZJB+rSjyBr7rfAk2t/RVU6A8d7szus0PF
	MHYjJnLQjM+K76Ud6uQ4wmfUw2hBvUkPFwxnDIpQYSyxjHApEed9rwuH3aJNUtmrkcFLvi5vtMn6Q
	YJSbXQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDPX-00000002Nod-2YyU;
	Thu, 05 Mar 2026 18:26:59 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDPR-00000002Nnp-36jj
	for ath12k@lists.infradead.org;
	Thu, 05 Mar 2026 18:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772735214; x=1804271214;
  h=date:from:to:cc:subject:message-id;
  bh=nPaAvIFXPSze+fc48ESIstRV9kga6qnyvOgj9V+rlSs=;
  b=Ij4Fh+UZZnO4iacWV0Nr3GIIEJxePZCao+63yZlZBMusz6uQC3YJSkTM
   yrXN/Sfw2FuOr8lD/TAzv4ZzbOM63hfgWhQPNzfHWnTGOu+hDLB8m629m
   X1Ti8AxZAemwe41zgAAxTCQA1LRCg0cap1JejkpZa5o0LLRDRd9VP482Q
   gtxYelPiwuyYPMoSsHFLwk+exBgyDpJKs0GXl8WXrAKGHTd3oN1Dups2T
   9VqFB/W1yPEahK+SNL7kWXI3zcAItMVnH5AA75OBWe13R9WjyikAsAQ3x
   1ExF4999ofnvDZCCsT/SEu/BTMSTuZ0mfTbGtjuWaKBE3EYoSG/GY1BvU
   g==;
X-CSE-ConnectionGUID: SRdvIgepSbK7oTPLfPlJSg==
X-CSE-MsgGUID: pMblIOVmQeiI7PsxC0Pu/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99302445"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="99302445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 10:26:46 -0800
X-CSE-ConnectionGUID: twLrWiZZTviQa8Qfv5Wiiw==
X-CSE-MsgGUID: gRXG5wQaTFmLzThr4EM8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="221622488"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 10:26:44 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyDPG-00000000150-0uAZ;
	Thu, 05 Mar 2026 18:26:42 +0000
Date: Fri, 06 Mar 2026 02:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e7ac936de05e486c4aac0ae82e65ad4d75a4498b
Message-ID: <202603060244.wyy6Bz4s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_102655_431027_853049DC 
X-CRM114-Status: UNSURE (   3.48  )
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
branch HEAD: e7ac936de05e486c4aac0ae82e65ad4d75a4498b  Merge branch 'pending' into main-pending

elapsed time: 1199m

configs tested: 143
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260305    clang-19
arc                   randconfig-002-20260305    clang-19
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                   randconfig-001-20260305    clang-19
arm                   randconfig-002-20260305    clang-19
arm                   randconfig-003-20260305    clang-19
arm                   randconfig-004-20260305    clang-19
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260305    gcc-8.5.0
arm64                 randconfig-002-20260305    gcc-8.5.0
arm64                 randconfig-003-20260305    gcc-8.5.0
arm64                 randconfig-004-20260305    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260305    gcc-8.5.0
csky                  randconfig-002-20260305    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260305    clang-20
i386        buildonly-randconfig-003-20260305    clang-20
i386        buildonly-randconfig-004-20260305    clang-20
i386        buildonly-randconfig-005-20260305    clang-20
i386        buildonly-randconfig-006-20260305    clang-20
i386                  randconfig-011-20260305    clang-20
i386                  randconfig-012-20260305    clang-20
i386                  randconfig-013-20260305    clang-20
i386                  randconfig-014-20260305    clang-20
i386                  randconfig-015-20260305    clang-20
i386                  randconfig-016-20260305    clang-20
i386                  randconfig-017-20260305    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260305    gcc-9.5.0
parisc                randconfig-002-20260305    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc               randconfig-001-20260305    gcc-9.5.0
powerpc               randconfig-002-20260305    gcc-9.5.0
powerpc64             randconfig-001-20260305    gcc-9.5.0
powerpc64             randconfig-002-20260305    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260305    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-002-20260305    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260305    gcc-14.3.0
sparc                 randconfig-002-20260305    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260305    gcc-14.3.0
sparc64               randconfig-002-20260305    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260305    gcc-14.3.0
um                    randconfig-002-20260305    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260305    clang-20
x86_64                randconfig-002-20260305    clang-20
x86_64                randconfig-003-20260305    clang-20
x86_64                randconfig-004-20260305    clang-20
x86_64                randconfig-005-20260305    clang-20
x86_64                randconfig-006-20260305    clang-20
x86_64                randconfig-011-20260305    clang-20
x86_64                randconfig-012-20260305    clang-20
x86_64                randconfig-013-20260305    clang-20
x86_64                randconfig-014-20260305    clang-20
x86_64                randconfig-015-20260305    clang-20
x86_64                randconfig-016-20260305    clang-20
x86_64                randconfig-071-20260305    gcc-14
x86_64                randconfig-072-20260305    gcc-14
x86_64                randconfig-073-20260305    gcc-14
x86_64                randconfig-074-20260305    gcc-14
x86_64                randconfig-075-20260305    gcc-14
x86_64                randconfig-076-20260305    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260305    gcc-14.3.0
xtensa                randconfig-002-20260305    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

