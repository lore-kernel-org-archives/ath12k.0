Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C6D3C931
	for <ath12k@archiver.kernel.org>; Sun, 20 Oct 2024 03:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ufgs3EkH0c0kfPL6zCf8Si0TqjeBl0XfR16Kf7f6LfQ=; b=3rHt0jL6B5Iy3u1A/+phDlF0m6
	Nsw+k1Y8rKeuOr64LF/dxdRJo3c5ft8lVOdeP/7bBfW+QmPr8p4dSCKWo8BnaRbfQuYLxydo5T27J
	SscLJ5IQavbkEZxEdbTtGBn50fDgkegNg7gNkrKuM8qJOdxfVefpViXGFy8/4bLKlGQFLi3ifOB6Q
	S4z3E6nduXi5p1sjyar8+1HKRgyeB4fnI39lAwonnNMMIqPmiwvJZSKBpyOtteJB7MdUvYQUtCcaP
	0pHJtKX6T51QZUWaQiq+O3s9gjsLIMagEXXbsZCQLmk+GtP6GgABxeyNAAAuJ+pYYsqLpRHVlMwOt
	2xzELrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2MBw-00000004IkW-1EpU
	for ath12k@archiver.kernel.org;
	Sun, 20 Oct 2024 03:01:16 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2MBt-00000004Ik6-2RTl
	for ath12k@lists.infradead.org;
	Sun, 20 Oct 2024 03:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729393273; x=1760929273;
  h=date:from:to:cc:subject:message-id;
  bh=4JYIlbeZcjrSr8FPvlgPtUJJVcw9GhIGk/ce+wcqr+A=;
  b=QfS9QH2W8SBA/9Lm0tsbZgZwaSIrfsi8KPnSatplIX778yUHLqQej5k3
   HBUJI8gz2PCSU8kr6NyrsDNKE8NAA9SrAQK7G8K5M6TF+eZxHACCi97fZ
   w+kkl5xo2IrYpIXYjNHEtqN2TKLzy3Xeo+hIG+BeJuwavuzIQCdG9Esx7
   4Xxy4iL0hwagp768Tnsb8GWI/sof/fVWGSVNwaY7zBuNEqdmLo4U9wBQO
   r+8Yd6JOP0zPTLc2iPAGwf12hnLEJETDwkdZrKzKDW0uFlrNdfinEiYm9
   waexvaUFkVSujN1bmb3L3weXWy8GdkWfESzUIDmP5oeni1LSVoY8Kr+VZ
   Q==;
X-CSE-ConnectionGUID: LfzGSdfqSMuKDBf8TTkmlg==
X-CSE-MsgGUID: QqD6aF8QQWaAdl1m6qG6kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28772558"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28772558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 20:01:13 -0700
X-CSE-ConnectionGUID: 7G/hgCzFTKmyIdTiU28/Iw==
X-CSE-MsgGUID: 3wRpPjgITSGBqjjFHIL2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83827538"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2024 20:01:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2MBp-000PoL-2X;
	Sun, 20 Oct 2024 03:01:09 +0000
Date: Sun, 20 Oct 2024 11:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 e1bc273f8589fbc76bf1fc76d605a5efafc2d3bf
Message-ID: <202410201157.LKQYiie6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_200113_715499_CE0EAB16 
X-CRM114-Status: UNSURE (   3.74  )
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
branch HEAD: e1bc273f8589fbc76bf1fc76d605a5efafc2d3bf  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 1999m

configs tested: 101
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                             rpc_defconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241020    gcc-12
i386        buildonly-randconfig-002-20241020    gcc-12
i386        buildonly-randconfig-003-20241020    gcc-12
i386        buildonly-randconfig-004-20241020    gcc-12
i386        buildonly-randconfig-005-20241020    gcc-12
i386        buildonly-randconfig-006-20241020    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241020    gcc-12
i386                  randconfig-002-20241020    gcc-12
i386                  randconfig-003-20241020    gcc-12
i386                  randconfig-004-20241020    gcc-12
i386                  randconfig-005-20241020    gcc-12
i386                  randconfig-006-20241020    gcc-12
i386                  randconfig-011-20241020    gcc-12
i386                  randconfig-012-20241020    gcc-12
i386                  randconfig-013-20241020    gcc-12
i386                  randconfig-014-20241020    gcc-12
i386                  randconfig-015-20241020    gcc-12
i386                  randconfig-016-20241020    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                     tqm8540_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    clang-20
sh                                  defconfig    gcc-12
sh                           se7780_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                              ul2_defconfig    clang-20
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
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

