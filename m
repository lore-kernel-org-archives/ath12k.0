Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA5C5B572
	for <ath12k@archiver.kernel.org>; Fri, 14 Aug 2026 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=demt/QXxOc0pmWM/cW4Dp4xK3Z6rcbqeechP5nxBKAQ=; b=iM50rZuBMuhj8fxqhtl1UvQ0e/
	mIcww0d5TsAFEPuDkYa0Ld4AjrxQGKVXEyb55MeE3kUDgXZ29k5VnqHJe5r04fMQ15/CRNXsdUCDv
	aYOdhmQmi5zYcOZjlcupqTxjQqLmSYnoG8XSaixPDr7GVPEXiwEj5jOPYlfAKVcFaV5zb7MLweyWr
	FxCKXxyJII8ZBlovnqa80gXdf6NtNGvcy1SCCDZYXibvK7I1pRwaylWH75Jcfo1kqJDJUIF09O6+p
	y/r4e5qzojpQnzZL/j9H1phxAxkGiHjJIXSWgzWYVbNe0v3y66IFs+08RrK5LpZeViwVwb/Vj32d6
	/IL2qB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuziE-00000003ET1-4AJX;
	Fri, 14 Aug 2026 21:45:14 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuziC-00000003ESd-0iAH
	for ath12k@lists.infradead.org;
	Fri, 14 Aug 2026 21:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786743912; x=1818279912;
  h=date:from:to:cc:subject:message-id;
  bh=9cnpSkMsp+hhl+4FD8PzVO+3yokdxBwcS5D9AjBOy/c=;
  b=Tiw+DkX9cW3OE/Io0pBfAlhvJ/URa4I7BsPy0smWCf3zXX/ZlQZi52uw
   SXDjn2+j39f0Kq3qjTLTzB10bkZeIefmIjA7QZ8aPqmUSktHGAOnkIJEW
   ObMLWslmPDcoIOZoFm/54yoTl+710LL2PYszfHJrm2XpPC/G6PayvtrG2
   +MxhzkcVMW2N+9jGyueQpqQDoRfRdjZr3YgGi27rRBKnIC397YzgIjhkH
   97fNqzwV62wBcLfTJBf4jDKw9IQGmvcvZSRLJ8BaE5r4SA+519kMsBJJY
   YdH/Kix+jLyTyFpuTyXI0seUiowQZVBgQTuYXHyWtCke14Un4XV3huEE1
   A==;
X-CSE-ConnectionGUID: vao2V1pBSSWnjG4+u2ZL2w==
X-CSE-MsgGUID: J++sP5HiQCqJdUPsN/hKng==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91138430"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="91138430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 14:45:11 -0700
X-CSE-ConnectionGUID: ZvKW18WgQDCi1QhOxwt3Ew==
X-CSE-MsgGUID: QEysmpAXRli/JVyF6X0WHQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2026 14:45:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuzi7-00000000aI2-2Pcu;
	Fri, 14 Aug 2026 21:45:07 +0000
Date: Sat, 15 Aug 2026 05:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 86722748a5fc04634191feb634eb5e0a1def8686
Message-ID: <202608150523.ogLKLPF5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_144512_226377_6B61C698 
X-CRM114-Status: UNSURE (   3.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: 86722748a5fc04634191feb634eb5e0a1def8686  Merge branch 'pending' into main-pending

elapsed time: 794m

configs tested: 45
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc        randconfig-001-20260815    gcc-11.5.0
arc        randconfig-002-20260815    gcc-8.5.0
arm        randconfig-001-20260815    clang-21
arm        randconfig-002-20260815    gcc-8.5.0
arm        randconfig-003-20260815    clang-17
arm        randconfig-004-20260815    gcc-8.5.0
arm64      randconfig-001-20260815    clang-24
arm64      randconfig-002-20260815    gcc-8.5.0
arm64      randconfig-003-20260815    clang-17
arm64      randconfig-004-20260815    clang-24
csky                  allmodconfig    gcc-16.1.0
csky       randconfig-001-20260815    gcc-13.4.0
csky       randconfig-002-20260815    gcc-15.2.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
mips             bcm47xx_defconfig    clang-24
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
riscv      randconfig-002-20260815    gcc-8.5.0
s390            zfcpdump_defconfig    clang-22
sh                       defconfig    gcc-16.1.0
sh         randconfig-002-20260815    gcc-11.5.0
sparc               randconfig-001    gcc-16.1.0
sparc      randconfig-001-20260814    gcc-16.1.0
sparc      randconfig-002-20260814    gcc-15.2.0
sparc64    randconfig-001-20260814    gcc-8.5.0
sparc64    randconfig-002-20260814    clang-24
um         randconfig-001-20260814    gcc-14
um         randconfig-002-20260814    clang-22
x86_64     randconfig-011-20260815    clang-22
x86_64     randconfig-012-20260815    gcc-14
x86_64     randconfig-013-20260815    clang-22
x86_64     randconfig-014-20260815    clang-22
x86_64     randconfig-015-20260815    gcc-14
x86_64     randconfig-016-20260815    gcc-14
xtensa     randconfig-001-20260814    gcc-9.5.0
xtensa     randconfig-002-20260814    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

