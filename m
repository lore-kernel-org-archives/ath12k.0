Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00073C021AA
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iL49MQ7PcSFAdcZwwahO585iTANo+5wKo9+RIfKnbKE=; b=O27kj1mOt6HnqT9GjLnalrDuUe
	9gjZFLSZXG5vkyoqpPQotGs94rOeURmnyNkPXLzEuMVXpjtbhTML0DU8eetjm9pefv4Y6bODTBgPa
	8gSfkco/jhYJGYBPoV/sfmGWXAqgwYYOjJS5L4H/0tIXJ7lMhe6/Essz+Nn1P21SX9IEOBkefxiRz
	LXcrfLJiOZT6cCvlzmyU1kp92q8GRy/WEYA3BZBGTu4PRC7jDtHWQfT+YBIo2me+9vXAjUkYdH2T9
	53QnVHDuWwPSXbTqPWM6HvjaiMqXrrelmE4ayYQQaJDB9muOQQJLJsYVrW/EGEt2ksklbiP8/LlRC
	9EIcdTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknQI-0000000Dymc-2NVQ
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 16:59:46 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknQG-0000000Dylq-1uk6
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 16:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739984384; x=1771520384;
  h=date:from:to:cc:subject:message-id;
  bh=XuyS6591nEG/MpPRtDEdf3OKD+5ggUQj1eMbkc7aUiY=;
  b=bCY8DQrEbWuHB9yFKIl/qWn4w3qyMSzQ3yvACOnT06W5iq4mgXynAwng
   tJgsrDNaoLlf6o2KXzpK/Da8Ut1nA+QLxxjMVk6ttm0RxFdXw3Da4tgxu
   pOS1GkJBA7JoqtAjSSSMTy6qiSBXM4aS1Ug76ia+zGzrwVWZoTY5zUPy+
   fJFnVBzIVWyUf3t908u4uqDhCFfu+miQNFebSbQ7fBBHrJG+aN/NNxJaq
   SqNg7KztKjLU20WfOFcXOeeYSTCqgElclVEcEM34jb/KK2Ew2D/mYB4R0
   gPpL9hHGiXKzE5M82LxKBdFoiwyhI84NpvxTP+eBSYmHXhi8wL+XIY07O
   g==;
X-CSE-ConnectionGUID: /WM2kJnvRf2ywhJ0NrD2Qg==
X-CSE-MsgGUID: pY2lLvsrT8CAtMsvsvEqQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="58274249"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="58274249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 08:59:43 -0800
X-CSE-ConnectionGUID: 4yZyeGyhT2KlmEfnUtGWMg==
X-CSE-MsgGUID: XEWnoc7pS+yNsa8faKKnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="119868811"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Feb 2025 08:20:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkmns-00039f-20;
	Wed, 19 Feb 2025 16:20:09 +0000
Date: Thu, 20 Feb 2025 00:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-split-phy] BUILD SUCCESS WITH WARNING
 c836072ed719073e205d0d8d16b766940e240e68
Message-ID: <202502200049.HY5m73gQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_085944_506663_22B0C459 
X-CRM114-Status: UNSURE (   2.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
branch HEAD: c836072ed719073e205d0d8d16b766940e240e68  wifi: ath12k: DVLAN multicast to be treated as unicast in Tx op

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202502191045.TBgxxg1V-lkp@intel.com

    drivers/net/wireless/ath/ath12k/mac.c:4778:15: warning: variable 'ar' is uninitialized when used here [-Wuninitialized]

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here
|-- um-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-mac.c:warning:variable-ar-is-uninitialized-when-used-here

elapsed time: 1446m

configs tested: 104
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250219    gcc-13.2.0
arc                   randconfig-002-20250219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250219    gcc-14.2.0
arm                   randconfig-002-20250219    clang-17
arm                   randconfig-003-20250219    clang-15
arm                   randconfig-004-20250219    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250219    clang-21
arm64                 randconfig-002-20250219    gcc-14.2.0
arm64                 randconfig-003-20250219    gcc-14.2.0
arm64                 randconfig-004-20250219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250219    gcc-14.2.0
csky                  randconfig-002-20250219    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250219    clang-14
hexagon               randconfig-002-20250219    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250219    clang-19
i386        buildonly-randconfig-002-20250219    clang-19
i386        buildonly-randconfig-003-20250219    gcc-12
i386        buildonly-randconfig-004-20250219    clang-19
i386        buildonly-randconfig-005-20250219    clang-19
i386        buildonly-randconfig-006-20250219    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250219    gcc-14.2.0
loongarch             randconfig-002-20250219    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250219    gcc-14.2.0
nios2                 randconfig-002-20250219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250219    gcc-14.2.0
parisc                randconfig-002-20250219    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250219    clang-15
powerpc               randconfig-002-20250219    clang-17
powerpc               randconfig-003-20250219    gcc-14.2.0
powerpc64             randconfig-001-20250219    gcc-14.2.0
powerpc64             randconfig-002-20250219    gcc-14.2.0
powerpc64             randconfig-003-20250219    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250219    clang-21
riscv                 randconfig-002-20250219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250219    clang-18
s390                  randconfig-002-20250219    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250219    gcc-14.2.0
sh                    randconfig-002-20250219    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250219    gcc-14.2.0
sparc                 randconfig-002-20250219    gcc-14.2.0
sparc64               randconfig-001-20250219    gcc-14.2.0
sparc64               randconfig-002-20250219    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250219    clang-21
um                    randconfig-002-20250219    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250219    gcc-12
x86_64      buildonly-randconfig-002-20250219    clang-19
x86_64      buildonly-randconfig-003-20250219    gcc-12
x86_64      buildonly-randconfig-004-20250219    clang-19
x86_64      buildonly-randconfig-005-20250219    gcc-12
x86_64      buildonly-randconfig-006-20250219    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250219    gcc-14.2.0
xtensa                randconfig-002-20250219    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

