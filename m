Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54EDCCF2D5
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 03:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h6MdSVjBl0c/jf5Kn5Iyo3J6EiKggYpJWznixMfAm7E=; b=Mfu1IH7W/YsPPDy1/edMx1kLT/
	iSvne9i6BJdIbdcaQmqPLmZ7AZMfKz523jgW1ap1FVWbncqM5cSEAecB3uZjuItgCE7+xnLzMfsPd
	O9R33IkZNPybSa88Pr4H1MzD/RxkEVvQQ40tT0X9WZZPsd57wntuokucWvGB5KU/LT6uwHk6ug4ad
	yyJL9OVWWpbM7xjBV2zLBI7NUTWmez47Q/6Z+JBZkPGW1yVJmjfSDp3UUgV55oKCFEqXh7wg0xgmP
	9K/asOx7QfRsGB6d5E2jyDTzXqv5tNMptTbHyeE8bf5fRCIPswY2bwH9jNEQrD2ysAsCYEDbCX44d
	G9IbThqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdx0-00000006WHi-1Qo7;
	Mon, 19 Oct 2026 03:22:14 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdww-00000006WGX-1ygH
	for ath12k@lists.infradead.org;
	Mon, 19 Oct 2026 03:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792380131; x=1823916131;
  h=date:from:to:cc:subject:message-id;
  bh=ct1ijWt8PNw3WwOjVeETyIMgEF9d8evao4VsaeQ/rjo=;
  b=lt6X81ZWvxPLF52X0FQTCIwFZP4MJ8MsC+rLmN9ACLPZLZO4/y1Hgx3l
   r/ukPHW+Y+SoJvRmaMMk8M9CaBDld94EXBQ0VxZGg29gY9cWwVq/QU30I
   fb8mxP8QM9w2kMgedA9lqAKFAorkw6WPdvrMkmzsasjvjCdqtc8vyvAa7
   lnQ/k/t3P26ey7MW6HKaNDtmipOjob/JjWMgmnMkcXBbnP2mVA53XE2Hq
   P/ZxEBKwTJbz5MJPWPZZcEqXIlfmHIlP94zzPiEe9OFPpurV5rjjU4RjW
   cZnATMNkNMPJJYui8ET2EnDAxqE5bh0liGX6wl6qmnv5FuKzQNUXKjN9N
   Q==;
X-CSE-ConnectionGUID: WRXAqO9hT+WqOn+H9T7Qag==
X-CSE-MsgGUID: fX/OZ4ruRWuUwzSP1WJWEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1160517"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1160517"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 20:22:09 -0700
X-CSE-ConnectionGUID: H3K1vlEsRryLW9uznmRnEA==
X-CSE-MsgGUID: 8NvXbefbStG+dVHh8pAXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4177185"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 20:22:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIdwq-00000000LBm-1YGo;
	Mon, 19 Oct 2026 03:22:04 +0000
Date: Mon, 19 Oct 2026 11:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 ce4ccfac8725c0b18cdbcfb638ccbdf7f139ce4b
Message-ID: <202610191145.MS3jGACR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_202210_571412_7C1DCEEA 
X-CRM114-Status: UNSURE (   4.35  )
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
branch HEAD: ce4ccfac8725c0b18cdbcfb638ccbdf7f139ce4b  Merge branch 'pending' into main-pending

elapsed time: 1296m

configs tested: 164
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261019    clang-21
arc                   randconfig-1001-20261019    clang-21
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261019    clang-21
arm                   randconfig-1001-20261019    clang-21
arm                   randconfig-1002-20261019    clang-21
arm                   randconfig-1003-20261019    clang-21
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261019    clang-24
arm64                 randconfig-1001-20261019    clang-24
arm64                 randconfig-1002-20261019    clang-24
arm64                 randconfig-1003-20261019    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261019    clang-24
csky                  randconfig-1001-20261019    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261019    clang-24
hexagon               randconfig-1001-20261019    clang-24
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261018    clang-22
i386        buildonly-randconfig-1001-20261018    clang-22
i386        buildonly-randconfig-1002-20261018    clang-22
i386        buildonly-randconfig-1003-20261018    clang-22
i386        buildonly-randconfig-1004-20261018    clang-22
i386        buildonly-randconfig-1005-20261018    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261019    clang-22
i386                  randconfig-1001-20261019    clang-22
i386                  randconfig-1002-20261019    clang-22
i386                  randconfig-1003-20261019    clang-22
i386                  randconfig-1004-20261019    clang-22
i386                  randconfig-1005-20261019    clang-22
i386                  randconfig-1006-20261019    clang-22
i386                  randconfig-1007-20261018    gcc-14
i386                  randconfig-1008-20261018    gcc-14
i386                  randconfig-1009-20261018    gcc-14
i386                  randconfig-1010-20261018    gcc-14
i386                  randconfig-1011-20261018    gcc-14
i386                  randconfig-1012-20261018    gcc-14
i386                  randconfig-1013-20261018    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261019    clang-24
loongarch             randconfig-1001-20261019    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                             mac_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261019    clang-24
nios2                 randconfig-1001-20261019    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261018    clang-24
parisc                randconfig-1001-20261018    clang-24
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261018    clang-24
powerpc               randconfig-1001-20261018    clang-24
powerpc64             randconfig-1000-20261018    clang-24
powerpc64             randconfig-1001-20261018    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261018    clang-17
riscv                 randconfig-1001-20261018    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261018    clang-17
s390                  randconfig-1001-20261018    clang-17
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261018    clang-17
sh                    randconfig-1001-20261018    clang-17
sh                           rsk7264_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261019    clang-20
sparc                 randconfig-1001-20261019    clang-20
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261019    clang-20
sparc64               randconfig-1001-20261019    clang-20
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261019    clang-20
um                    randconfig-1001-20261019    clang-20
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261018    clang-22
x86_64                randconfig-1001-20261018    clang-22
x86_64                randconfig-1002-20261018    clang-22
x86_64                randconfig-1003-20261018    clang-22
x86_64                randconfig-1004-20261018    clang-22
x86_64                randconfig-1005-20261018    clang-22
x86_64                randconfig-1006-20261018    clang-22
x86_64                randconfig-1007-20261018    clang-22
x86_64                randconfig-1008-20261018    clang-22
x86_64                randconfig-1009-20261018    clang-22
x86_64                randconfig-1010-20261018    clang-22
x86_64                randconfig-1011-20261018    clang-22
x86_64                randconfig-1012-20261019    gcc-14
x86_64                randconfig-1013-20261019    gcc-14
x86_64                randconfig-1014-20261019    gcc-14
x86_64                randconfig-1015-20261019    gcc-14
x86_64                randconfig-1016-20261019    gcc-14
x86_64                randconfig-1017-20261019    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261019    clang-20
xtensa                randconfig-1001-20261019    clang-20
xtensa                          virt_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

