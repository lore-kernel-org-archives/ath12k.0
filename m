Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0812D21277
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mV2ll5Pv2iGI23Qrq2wv6UUW9WSHIzC3X9sEy2AND94=; b=LmUF3DqQo/oNIKOUGMooQRbaTV
	kd1YH+2KJEHECYx3torzYw56bW+2R16/Mtqmky1kItehtl6OUqG3Mef8ai2uWYtajdOYa9eMiW9dh
	3hm4e5XqkjuZwkf9W1H1fAgAE8MPBGuFD3fBfFY7v9eN5rI4YXfTMUCLPgcykwqD0yUc5RWvZcZqz
	HFNNK48fu8MnRIREruYQkW/1/zaP+u94rzpROGTjsDvT9wC0GZt7qFuHGui6QKER9hhbdPxPeB+Gv
	EahH93Wia/QI700uhjohjUIhK0UvYPWEEvEU7kXqdyH9wAhVsTDpME3PeM6Rcdor+AmhpGj5A4iaJ
	w5Rwm7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NZI-0000000EUdv-1BUk
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 10:17:20 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NCw-0000000EQeG-1Bb9
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 09:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729158854; x=1760694854;
  h=date:from:to:cc:subject:message-id;
  bh=UYUInC1OZZe8u3LNNNQ+rEB9Ky1pZkRzA1v76rWABlU=;
  b=n90J5AWDOVw1yxw8FuV0N52zNdwjuXp4b3r1cg6X6gCFBRxFmYGddAR+
   hn5TZ1IKzo6N4bgfKovwdLpIKd/JxN4lcigAOFJvK0MjlYwFfVeBVKrIN
   Rjwv+hFiKg1ki7os/tVIzsshi94spW+S/kEcKKabiIY1+1zjUbSJJ4FzK
   3G8w6XDKB6LcVfy/D7HyuKZHe50xUR2kbdN6UkrpBEkGX53VKPgEBwDJb
   qQSxdQqFJMfA80cmIIR8SWLLsH+6TDVY472mZdX8aNwN/pElDc2AaS94+
   7ZnUOiNr1A82eJaV2XeHWmDi48YqAHMZH7B/x2rBQJvPFavsyqNbgUL4A
   g==;
X-CSE-ConnectionGUID: P4Q4QYazQLSD8/2o2GF9Hg==
X-CSE-MsgGUID: k2t+gzRUQgGK2kEC7DuONg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="16254721"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="16254721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:54:14 -0700
X-CSE-ConnectionGUID: g7TGjtwfTdWAygXosRtNrg==
X-CSE-MsgGUID: p5KjhP11QXu3VDAfE29+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83568191"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2024 02:54:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1NCs-000M9L-0R;
	Thu, 17 Oct 2024 09:54:10 +0000
Date: Thu, 17 Oct 2024 17:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 b65c3fb0a74d225194a3a613d9381d23d9f6232f
Message-ID: <202410171711.Tj1masEp-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_025414_360776_60BF0C9C 
X-CRM114-Status: UNSURE (   3.54  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: b65c3fb0a74d225194a3a613d9381d23d9f6232f  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 2464m

configs tested: 107
configs skipped: 4

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
arc                         haps_hs_defconfig    clang-14
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241017    clang-18
i386        buildonly-randconfig-002-20241017    clang-18
i386        buildonly-randconfig-003-20241017    clang-18
i386        buildonly-randconfig-004-20241017    clang-18
i386        buildonly-randconfig-005-20241017    clang-18
i386        buildonly-randconfig-006-20241017    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241017    clang-18
i386                  randconfig-002-20241017    clang-18
i386                  randconfig-003-20241017    clang-18
i386                  randconfig-004-20241017    clang-18
i386                  randconfig-005-20241017    clang-18
i386                  randconfig-006-20241017    clang-18
i386                  randconfig-011-20241017    clang-18
i386                  randconfig-012-20241017    clang-18
i386                  randconfig-013-20241017    clang-18
i386                  randconfig-014-20241017    clang-18
i386                  randconfig-015-20241017    clang-18
i386                  randconfig-016-20241017    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5208evb_defconfig    clang-14
m68k                           virt_defconfig    clang-14
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip28_defconfig    clang-14
mips                           jazz_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
mips                          rb532_defconfig    clang-14
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                      bamboo_defconfig    clang-14
powerpc                     ksi8560_defconfig    clang-14
powerpc                       maple_defconfig    clang-14
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-14
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    clang-14
sh                           se7705_defconfig    clang-14
sh                           se7750_defconfig    clang-14
sh                  sh7785lcr_32bit_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
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
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

