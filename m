Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5870BC5AD5A
	for <ath12k@archiver.kernel.org>; Thu, 13 Aug 2026 02:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kaUqf+dTFzHBjFH0W4vzD3GHH9oXGyjJoMtjBWzCm60=; b=vsgtCeAvcQrFenneeMl959A+83
	2lBzYXunP9TM2KEyP0OV3qXuuD6XaFAsHOkKZkaAOuc0TtUHf1L016r0ejgGMy8o54hht8oALUIhm
	Iw+fJStRC7loY74lqushCCcMyxz1wjfzW5R0FYZ+Mru/pc9QkGiz09xTDZqTPUx2ntvB3zkiW9l3h
	tyZoT1AlpjmWM6C25eJjr2TcmL0bDwD8PsCMKCR+ye1ZTDSVbgbiiD4aFCIAClp412jCNM6IqH3S/
	iSrtoJ0NfvKxBnoc2DXB3CB/aCIxj0PhtSG8BxBXHPBDnFlRtoq+XMgf+pWm4L6xzaL8D8zO2sAnr
	ZhURizUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLAK-0000000HHUt-0FQN;
	Thu, 13 Aug 2026 02:27:32 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLAH-0000000HHUZ-37T8
	for ath12k@lists.infradead.org;
	Thu, 13 Aug 2026 02:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786588050; x=1818124050;
  h=date:from:to:cc:subject:message-id;
  bh=9wn4PY3m0EbFCeAGgwLDvHwNT1U9DdUf7pXhu0W4skY=;
  b=QZzZ/hWdWvuxLscmZg7fsWGCA4d1OpBlGok6UTlr5ru6Q4kVT9F9rxsO
   g6QVahRXY57N1kyEuHuw7M30IY1yRqJWdPLop24ovjpNSbZmH37dLUI01
   atOioDFvsC9gaWQn2QWzyI2y5xMUL5jL1PptsnGJtV2V5Ig731453FCkt
   gK3ReDifjN68XRdlfWC+x5Vp4TV9MV5ItvT1PYTggF2FvpCpKRUeDxcim
   3Gdj+Cbd4mSXT076sW+IzPgUy2KjkDL11voeWvSaONZYaHKrxboraN84q
   4DXGc73+rqIRtaApdCouzslUwiP3ZewTmue5C4CQX2ORBAhwpcitKdy9R
   g==;
X-CSE-ConnectionGUID: zJ3Wdy5GRCqnd+sVP1Gt+w==
X-CSE-MsgGUID: 1uZ8qFIURSOeQyJOqkQdLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97504620"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97504620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:27:29 -0700
X-CSE-ConnectionGUID: go8XmdrBThSboQ0JcmN9qw==
X-CSE-MsgGUID: V/i4FrFMRhOJ4M/JlvycNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288595387"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 19:27:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuLAC-00000000SXS-3fK0;
	Thu, 13 Aug 2026 02:27:24 +0000
Date: Thu, 13 Aug 2026 10:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 2cf9613c28ce77b57d9f1b2cd4cdebdbb6d6e7f0
Message-ID: <202608131027.3RIptE5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_192729_824047_7B80713D 
X-CRM114-Status: UNSURE (   4.18  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: 2cf9613c28ce77b57d9f1b2cd4cdebdbb6d6e7f0  .mailmap: add entries for Baochen Qiang

elapsed time: 2416m

configs tested: 159
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260812    gcc-12.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-001-20260812    gcc-14
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-002-20260812    gcc-14
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-004-20260812    gcc-14
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-005-20260812    gcc-14
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-007-20260812    gcc-14
i386                 randconfig-007-20260813    clang-22
i386                          randconfig-011    gcc-12
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                     ppc6xx_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260812    clang-24
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260812    clang-24
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260812    clang-24
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                         randconfig-001    gcc-13.4.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-001-20260813    clang-20
sparc                randconfig-002-20260812    gcc-13.4.0
sparc                randconfig-002-20260813    clang-20
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-001-20260813    clang-20
sparc64              randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-002-20260813    clang-20
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-001-20260813    clang-20
um                   randconfig-002-20260812    gcc-13.4.0
um                   randconfig-002-20260813    clang-20
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-001-20260813    clang-20
xtensa               randconfig-002-20260812    gcc-13.4.0
xtensa               randconfig-002-20260813    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

