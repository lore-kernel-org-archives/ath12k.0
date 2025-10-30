Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C7ECCF9F8
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qLx85FKGKramoB3s3LozAKDLa/8gLDXYUvT5tfbuBLA=; b=jvqOyHmvfh+MEM6XrTAb20FouO
	EAyb9KTMvglDFtL8L2soPSdjgoH3shlP20vp1rpV7Uz9YgT0oyhmrJdm/1zGvHL5tV7+71URUXkCK
	U6zJ3w4WT/vVPB5VBT78LwhaWVIvombi5a1jyi7TXIQdji2Nep/ewCk6SlqchDOWLGypBTUik4q8/
	W6LJXz0ZdjbcdmpevshWg5yCme2nla/5JC8oGldCQFRqLhExfPpKxTShWxSWpYYQZacM9ifrJWtTV
	F2gnmsEhZKv89Q30hgrqD7GIaXS8joqyKkaqCQjHGniNxGXVOqaIbacEfj2wkHoRyitevw5Nf2ERc
	Sei2oKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVoC-00000004U70-3SJR;
	Thu, 30 Oct 2025 16:47:32 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVo9-00000004U6g-0Zbr
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 16:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761842849; x=1793378849;
  h=date:from:to:cc:subject:message-id;
  bh=oxB0ya5NgGQNS8BRk7efLR1cIh/ec4cZYlxiBYag6KQ=;
  b=YCNIRtkNBeG3IOOJybYVSV5mGgX8NjsOwOOrc+Xx/VNINis5CLSFrfW5
   nJuFFsq2v2UOALqWIlqZp/Dw1YScbYDfPJm+2RbmqHhS6vC2gZHyvsxY5
   8KVQYYn6PoR7zL8ils8Mq0X0rFB3Y3Bubk2WCZCEWZ2jE2ecYmRZxWi/F
   DezeKPId8K7xPnwHWkb5nXd4K4UMCM+G+4a/ge/dWTs3o7OflJnkUokCP
   NhwJ/6JvCaRayaZiQc/C/58I7yVYrJJLWk4SxL8BTgs5M38za3XfKczFv
   Womse87uRWk0BfHYwh3AgCVdno4TOXdm6TuYugR4ILcW/BysoI7FR3AuL
   w==;
X-CSE-ConnectionGUID: M9o4fi+NTpmrSfKPAdBc0Q==
X-CSE-MsgGUID: phXZAr3RQmiEDieP4lqN0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63013479"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63013479"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 09:47:29 -0700
X-CSE-ConnectionGUID: G6WSUGlcQBKdhdanrl9y9A==
X-CSE-MsgGUID: 4fe0RHvRTbyoRnZ9A37R1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="216850282"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2025 09:47:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEVo5-000MF6-1x;
	Thu, 30 Oct 2025 16:47:25 +0000
Date: Fri, 31 Oct 2025 00:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:for-current] BUILD SUCCESS
 9222582ec524707fbb9d076febead5b6a07611ed
Message-ID: <202510310038.InwdNVSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_094729_326772_2FA3BD81 
X-CRM114-Status: UNSURE (   4.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
branch HEAD: 9222582ec524707fbb9d076febead5b6a07611ed  Revert "wifi: ath12k: Fix missing station power save configuration"

elapsed time: 1471m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251030    gcc-12.5.0
arm64                 randconfig-002-20251030    gcc-8.5.0
arm64                 randconfig-003-20251030    clang-17
arm64                 randconfig-004-20251030    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251030    gcc-13.4.0
csky                  randconfig-002-20251030    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251030    clang-20
i386        buildonly-randconfig-002-20251030    gcc-14
i386        buildonly-randconfig-003-20251030    clang-20
i386        buildonly-randconfig-004-20251030    clang-20
i386        buildonly-randconfig-005-20251030    gcc-14
i386        buildonly-randconfig-006-20251030    clang-20
i386                  randconfig-001-20251030    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251030    gcc-8.5.0
nios2                 randconfig-002-20251030    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251030    gcc-8.5.0
parisc                randconfig-002-20251030    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-22
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251030    clang-22
powerpc               randconfig-002-20251030    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20251030    gcc-8.5.0
powerpc64             randconfig-002-20251030    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
sh                               alldefconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251030    gcc-8.5.0
sparc                 randconfig-002-20251030    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251030    gcc-11.5.0
sparc64               randconfig-002-20251030    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251030    gcc-14
um                    randconfig-002-20251030    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251030    clang-20
x86_64      buildonly-randconfig-002-20251030    gcc-14
x86_64      buildonly-randconfig-003-20251030    gcc-13
x86_64      buildonly-randconfig-004-20251030    gcc-14
x86_64      buildonly-randconfig-005-20251030    clang-20
x86_64      buildonly-randconfig-006-20251030    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251030    clang-20
x86_64                randconfig-012-20251030    clang-20
x86_64                randconfig-013-20251030    gcc-13
x86_64                randconfig-014-20251030    gcc-14
x86_64                randconfig-015-20251030    clang-20
x86_64                randconfig-016-20251030    clang-20
x86_64                randconfig-071-20251030    gcc-14
x86_64                randconfig-072-20251030    gcc-14
x86_64                randconfig-073-20251030    clang-20
x86_64                randconfig-074-20251030    clang-20
x86_64                randconfig-075-20251030    gcc-13
x86_64                randconfig-076-20251030    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251030    gcc-10.5.0
xtensa                randconfig-002-20251030    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

