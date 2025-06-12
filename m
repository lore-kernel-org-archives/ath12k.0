Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D88C71136
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZNJrXYyW+J+5IpbZpfCWtAk4qW4QSrpktJK0I1+DgJQ=; b=3MP9LucW9K05lnVdjEEOVJPcAE
	7+PmgoWDqGv5WCL2tzF1wZTFzb7+TJazbx2hZhmQdDj3lzKF0Fn5Zwbk4h1cXjHDy15Lsp0jwH8sb
	V0My+P3bA3+ZeX7560mEZtNrGmJpu3l7ArmlzhspcCffVcD6K2NwdpxxzkAz3WaRQG8UgQASWiAE7
	zLKseVsrJVPUlYrJdUaAoi0f3bkvdwifKky0ZcIbppvS0uEvhMUIRkDU6sGS+OsigaWCPR6Tc0G5k
	NRxRT6tNVivOhZ0iBo3XmwUJBDdoLCy+R/OmdS1+XBK6EJFRTbO0ksrdHdkpTVMdmrdl3xAZGx//e
	QXkDigMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntX-0000000ENnV-1qhb;
	Thu, 12 Jun 2025 19:47:27 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPmXh-0000000E6xS-3IV4
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 18:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752449; x=1781288449;
  h=date:from:to:cc:subject:message-id;
  bh=IHVB3Jm5A8lUlLo6fy4FpniX7fiPtz+pPN04tlLKqHY=;
  b=CEJ+OzVL+QbTSrfnUU+LcpVYTf2qmNAcPew4NiJpghgRJ4Z0yn4HqBrd
   9wQIU20M+IQ59U1xyI4MM8bmDxcGrWURrDK7FPEUw4ildOEIZmGStKyBu
   LQhrwm2/ivxn33w2jUmx+Afp3S0PngCjzqatbCGSklja5fG2rWDq0CazZ
   fiwQwcgWLRhO09gmF26YHNZ0bAUMnMZn75bKf808vT085/Q7P8pYFA1Ew
   de0L2truFoGCNlgXGipLcx1yyJ1uMYmXvWI3BBzFTas8/cPHzDI99nuFH
   5c0xWNM3s/bYv49UuEA1jdhX4TkEEHT4Gi6moXr/zg8WX9uL/2NPl6/YL
   A==;
X-CSE-ConnectionGUID: JKbDmbtuSHWKXWWe1F5m5Q==
X-CSE-MsgGUID: 8DIPJYpTRVuuSW/9P7qROg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62603641"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62603641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:20:44 -0700
X-CSE-ConnectionGUID: aATgh6YbQpOTSt1AS0JoQg==
X-CSE-MsgGUID: vMZ3tuWUSQChgk12md25kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="148483065"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2025 11:20:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPmXZ-000Brq-18;
	Thu, 12 Jun 2025 18:20:41 +0000
Date: Fri, 13 Jun 2025 02:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 1964d41876fab418f9a2f40247c12fb264daca7c
Message-ID: <202506130246.jEXgDI6X-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_112049_834834_E2E928E7 
X-CRM114-Status: UNSURE (   4.02  )
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
branch HEAD: 1964d41876fab418f9a2f40247c12fb264daca7c  Merge branch 'pending' into main-pending

elapsed time: 1458m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250612    gcc-8.5.0
arc                   randconfig-002-20250612    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250612    clang-21
arm                   randconfig-002-20250612    clang-18
arm                   randconfig-003-20250612    clang-21
arm                   randconfig-004-20250612    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250612    clang-19
arm64                 randconfig-002-20250612    clang-17
arm64                 randconfig-003-20250612    clang-21
arm64                 randconfig-004-20250612    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-11.5.0
csky                  randconfig-002-20250612    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250612    clang-21
hexagon               randconfig-002-20250612    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250612    clang-20
i386        buildonly-randconfig-002-20250612    gcc-12
i386        buildonly-randconfig-003-20250612    clang-20
i386        buildonly-randconfig-004-20250612    clang-20
i386        buildonly-randconfig-005-20250612    clang-20
i386        buildonly-randconfig-006-20250612    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-13.3.0
loongarch             randconfig-002-20250612    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250612    gcc-14.2.0
nios2                 randconfig-002-20250612    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250612    gcc-8.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250612    clang-21
powerpc               randconfig-002-20250612    gcc-8.5.0
powerpc               randconfig-003-20250612    clang-17
powerpc64             randconfig-001-20250612    gcc-12.4.0
powerpc64             randconfig-002-20250612    clang-21
powerpc64             randconfig-003-20250612    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250612    clang-21
riscv                 randconfig-002-20250612    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250612    clang-21
s390                  randconfig-002-20250612    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250612    gcc-14.3.0
sparc                 randconfig-002-20250612    gcc-10.3.0
sparc64               randconfig-001-20250612    gcc-13.3.0
sparc64               randconfig-002-20250612    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250612    clang-17
um                    randconfig-002-20250612    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250612    gcc-12
x86_64      buildonly-randconfig-002-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    gcc-12
x86_64      buildonly-randconfig-004-20250612    gcc-12
x86_64      buildonly-randconfig-005-20250612    clang-20
x86_64      buildonly-randconfig-006-20250612    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250612    gcc-10.5.0
xtensa                randconfig-002-20250612    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

