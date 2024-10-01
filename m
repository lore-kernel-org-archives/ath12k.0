Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34623CEACFF
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DL+YLOuy7HV8Bp/tMwC5BIOcS+ughNLeqGO700MlSLE=; b=FxCmGsQksotqWtyI4RJGrwmpXQ
	ey29HjNxkx66cpRRjUPKTC/Pj5cvV7icoadlr4bu4Fodjzn7bXvfdhG4ds6O7ejYJyKhzeKKvoRf3
	+b73MP9/iGNkID5y/L5SBm4aE/i4FTOkR0zvrZ5qY+2ccGLMoKsg5TmcDxonSKHM3B7DCd4NKEdZn
	30faIUz+3FNIs5FGCqkriNTK6tn8Wb8sv5OmWsN9spwPRgNa2CqzuA14sL0qssAoePpVefXhez0jM
	IjBAtQYQFCOoxcbro2R4U6VVX0wDTK06Ug3Pslu5dTJnGdStRQixPCV5crrzIihOUW2GmCGhytlz+
	7RtN8b6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjIQ-00000003yBu-3GQx
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 20:16:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svgyN-00000003hf1-28Je
	for ath12k@bombadil.infradead.org;
	Tue, 01 Oct 2024 17:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=DL+YLOuy7HV8Bp/tMwC5BIOcS+ughNLeqGO700MlSLE=; b=F7NKuErDAuC7xRZWjFm9D9XHKg
	Me3ELDGvjDCki+9D8ECl3rQNuqxsN3TGQcbrvm9F6oHYVtPYNl/qSP1APg8Od1JU8UEbaYJTcGuTI
	/5yYzTSGmodaJwRSU3QmS2LYcD+BZOi7Wk4kGd5sBZzXsbjMaPkDo3y2i8mZA8v++XdLNAUi6GNTL
	VLG9T02bx/MtaJBCGQOVGvasN4j+eiCAgp0ei6rP/3uQw4XAeIgpiQVh6DY199jgPXHC+J/zID2BV
	M3O9ZgYi9aWuy/ZMr6tuYK0uSpDI47YupUXNRnF8s8p8399AoOvqj0ELKMp0CcocoXVS3Nty/vl9O
	j6IiFKnw==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svgyJ-00000003Gpr-2Doh
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 17:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727804859; x=1759340859;
  h=date:from:to:cc:subject:message-id;
  bh=erkpiUJJXGG8uNmZaUxgbB7eW4oV3CttLNjXEycsDIw=;
  b=JDah7LxVITRSGcLdPtsEjOk6yRUcck6NsCg1CYj+EzUbbcegsmTKYAzo
   59K7G0ud5i0vwq34nyv3670jF46KtYHgP9TG9TKBIoeV+puT9WhiFGrc+
   Y0Uh8iHatLV4J3kb18LvJbZbB4Ne0boEZSx2z17Ajpis5lLI341kdR/C0
   QnJ9QrdsvX19EaW75Wso93HCo/ai1jvFZFcm6mNADu2Q+eI9iB49lwCqK
   cIPAX4+o+sDDEA/g32b9IEGqLNC2wiqulXxqneVCNVxE95Oqxcq+WJkom
   o3gaLX7navuE9qoRKCezBYkWmYAOljxWCz+2GS4m/a7gnzd3V7wFcAmSE
   A==;
X-CSE-ConnectionGUID: Ql32otkMQhy1xRMO6tHbHQ==
X-CSE-MsgGUID: qdLxzYD7TESSF475eG2R3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26459071"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="26459071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 10:47:33 -0700
X-CSE-ConnectionGUID: c1fxaXBLQpaYikcjGX8sBA==
X-CSE-MsgGUID: R0eE7id5RMu9OquYPT9cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="104527822"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2024 10:47:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svgy9-000R0p-36;
	Tue, 01 Oct 2024 17:47:29 +0000
Date: Wed, 02 Oct 2024 01:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo] BUILD SUCCESS
 8d6f03ed42b89bff5af467647e8a9f63d6a1d59f
Message-ID: <202410020117.UK4oRyR3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_184740_165286_81496513 
X-CRM114-Status: UNSURE (   4.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
branch HEAD: 8d6f03ed42b89bff5af467647e8a9f63d6a1d59f  wifi: ath12k: remove warning print in htt mlo offset event message

elapsed time: 1363m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241001    gcc-13.2.0
arc                   randconfig-002-20241001    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-14
arm                   randconfig-001-20241001    gcc-14.1.0
arm                   randconfig-002-20241001    gcc-14.1.0
arm                   randconfig-003-20241001    clang-17
arm                   randconfig-004-20241001    clang-17
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241001    gcc-14.1.0
arm64                 randconfig-002-20241001    gcc-14.1.0
arm64                 randconfig-003-20241001    clang-15
arm64                 randconfig-004-20241001    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241001    gcc-14.1.0
csky                  randconfig-002-20241001    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241001    clang-20
hexagon               randconfig-002-20241001    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20241001    gcc-12
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20241001    gcc-12
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20241001    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    gcc-12
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20241001    gcc-12
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20241001    gcc-12
i386                  randconfig-012-20241001    gcc-12
i386                  randconfig-013-20241001    gcc-12
i386                  randconfig-014-20241001    gcc-11
i386                  randconfig-015-20241001    gcc-12
i386                  randconfig-016-20241001    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241001    gcc-14.1.0
loongarch             randconfig-002-20241001    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241001    gcc-14.1.0
nios2                 randconfig-002-20241001    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20241001    gcc-14.1.0
parisc                randconfig-002-20241001    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241001    clang-20
powerpc               randconfig-002-20241001    clang-15
powerpc64             randconfig-001-20241001    gcc-14.1.0
powerpc64             randconfig-002-20241001    clang-20
powerpc64             randconfig-003-20241001    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241001    gcc-14.1.0
riscv                 randconfig-002-20241001    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241001    gcc-14.1.0
s390                  randconfig-002-20241001    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20241001    gcc-14.1.0
sh                    randconfig-002-20241001    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20241001    gcc-14.1.0
sparc64               randconfig-002-20241001    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241001    clang-20
um                    randconfig-002-20241001    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241001    clang-18
x86_64      buildonly-randconfig-002-20241001    clang-18
x86_64      buildonly-randconfig-003-20241001    clang-18
x86_64      buildonly-randconfig-004-20241001    gcc-12
x86_64      buildonly-randconfig-005-20241001    clang-18
x86_64      buildonly-randconfig-006-20241001    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241001    clang-18
x86_64                randconfig-002-20241001    clang-18
x86_64                randconfig-003-20241001    gcc-11
x86_64                randconfig-004-20241001    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

