Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B4D358CC
	for <ath12k@archiver.kernel.org>; Thu, 29 Jan 2026 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b04mNVqhQQI3g5mTYfQcihLW54805cdByM+I/0CJx04=; b=e7LvpzY2TOtinDOrrOCxky4YMl
	InZkQd1VnqjxdZg7wJACB5qzS5M7DBQs0ipOjAGGC8L/wtMAL6nto/9WayyJr5NfRxCG8OlrwcsOr
	GWDydcJuSOCALlLKAxZZRTII7zTVaoxVWemNDLUhVjxd2ywDS5jAGu6FVTRJwv80uWAJcvJM7sONv
	yIUVcNA+kzyeM1PkSgSmJmEiIuTzIeT5sVS+FCSLoBj44B1J1QhX/ModQg/7ZFGSmO/f6vlrxglcq
	kDfzD4I9rx0XvTKXyNQzKTUg9SjfHGZidnKzTRgE/a+mLlF0EMkFVyarvllOduumsfXoBqyl4Fv5Y
	R8Oc9FwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMWO-0000000HOZx-0x23;
	Thu, 29 Jan 2026 07:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMWN-0000000HOZp-1Hfd
	for ath12k@bombadil.infradead.org;
	Thu, 29 Jan 2026 07:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=b04mNVqhQQI3g5mTYfQcihLW54805cdByM+I/0CJx04=; b=HYQZS/9goMm/DN7eyCgadD5bnN
	sk2/swoU5G4flsseP0H5n6+iDm6/5xYcdca7SZ82pCWiK1jMSk5YWgnOkHOoR4taPl9ed8dXA3FhI
	l+oCHx80sjbcMEt2wNJ8/jqox4rPkB+uvdxSbnLFkzbcjut224kguZTCpuWUPIDZbTpnpzVge/7gF
	R5L0AMCLwCBy8EDjMzEZVWASVxBtTooEkDytWn7i3ANxhtPNg4CdOT/fb/7vZE0bDk19VdhDlS99G
	dtcYJ6ddhJSUc7gASGcjH5gSJYbZgHE5P69/1eDnVPF+xZI1eFbNhE4anH7FP0CXCpY+L1PLQaojV
	MxLKmcZQ==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMWF-00000009vcP-3Q5a
	for ath12k@lists.infradead.org;
	Thu, 29 Jan 2026 07:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769671968; x=1801207968;
  h=date:from:to:cc:subject:message-id;
  bh=APNhcSO7yutXXcODSn60ZIBf9/U2RqUAT9N4EXbaI80=;
  b=ix4IO4wN/I/4eRaI/nS3HhaXaIDoUlCf+MiwUCNgbMjhLJ7rLdJf+9W4
   qEDr/6Pb/twu4W4PdkU006y35y8hrZy+tuQkPnsmGj+x2tw5pCetF049j
   rU6iE4ZLnXlWMSKRhl1tQJEMVEyegOTv9jEMsHvsNF3rRfl7+DHJWfBh+
   ng8q+xAI6XS0fzUy2zdP3W2Q6UO4dN/UNwWwtFOkvlyBzyEYuO8gYbG1z
   LDZoX8zaTLkucKGcJhbxTfaSXsrmmECwjoOxm0zGrnYFSHT4DTDKBAo7z
   005rDR0uqbT1CFiUBfU+W2QwuGaBNl2Dkk29A1E/9/pxzXC6GCrVv4eDQ
   w==;
X-CSE-ConnectionGUID: 96CIRR5DQTWMrVPCq4ouAw==
X-CSE-MsgGUID: uRk6qiS6QySJxzxkQNVdCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70802442"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70802442"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 23:32:43 -0800
X-CSE-ConnectionGUID: fOOG3ojWS9eSsBhj5tanrQ==
X-CSE-MsgGUID: oJk66BZPS+SoVd0cmGR3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="231417448"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 23:32:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlMW6-00000000bDY-2NiJ;
	Thu, 29 Jan 2026 07:32:38 +0000
Date: Thu, 29 Jan 2026 15:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 f5470be164c7e44cf2fcacb6d179aadb0617585d
Message-ID: <202601291507.GrTI6QyJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_073249_280062_4EC5ADC0 
X-CRM114-Status: UNSURE (   3.70  )
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
branch HEAD: f5470be164c7e44cf2fcacb6d179aadb0617585d  Merge branch 'pending' into main-pending

elapsed time: 732m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260129    clang-18
arc                   randconfig-002-20260129    clang-18
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260129    clang-18
arm                   randconfig-002-20260129    clang-18
arm                   randconfig-003-20260129    clang-18
arm                   randconfig-004-20260129    clang-18
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260129    gcc-11.5.0
arm64                 randconfig-002-20260129    gcc-11.5.0
arm64                 randconfig-003-20260129    gcc-11.5.0
arm64                 randconfig-004-20260129    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260129    gcc-11.5.0
csky                  randconfig-002-20260129    gcc-11.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-002-20260129    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260129    clang-20
i386                  randconfig-002-20260129    clang-20
i386                  randconfig-003-20260129    clang-20
i386                  randconfig-004-20260129    clang-20
i386                  randconfig-005-20260129    clang-20
i386                  randconfig-006-20260129    clang-20
i386                  randconfig-007-20260129    clang-20
i386                  randconfig-011-20260129    clang-20
i386                  randconfig-012-20260129    clang-20
i386                  randconfig-013-20260129    clang-20
i386                  randconfig-014-20260129    clang-20
i386                  randconfig-015-20260129    clang-20
i386                  randconfig-016-20260129    clang-20
i386                  randconfig-017-20260129    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-002-20260129    clang-22
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
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-002-20260129    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260129    gcc-8.5.0
parisc                randconfig-002-20260129    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20260129    gcc-8.5.0
powerpc               randconfig-002-20260129    gcc-8.5.0
powerpc64             randconfig-001-20260129    gcc-8.5.0
powerpc64             randconfig-002-20260129    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260129    gcc-15.2.0
riscv                 randconfig-002-20260129    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260129    gcc-15.2.0
s390                  randconfig-002-20260129    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260129    gcc-15.2.0
sh                    randconfig-002-20260129    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260129    gcc-15.2.0
sparc                 randconfig-002-20260129    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260129    gcc-15.2.0
sparc64               randconfig-002-20260129    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260129    gcc-15.2.0
um                    randconfig-002-20260129    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260129    gcc-13
x86_64      buildonly-randconfig-002-20260129    gcc-13
x86_64      buildonly-randconfig-003-20260129    gcc-13
x86_64      buildonly-randconfig-004-20260129    gcc-13
x86_64      buildonly-randconfig-005-20260129    gcc-13
x86_64      buildonly-randconfig-006-20260129    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260129    clang-20
x86_64                randconfig-002-20260129    clang-20
x86_64                randconfig-003-20260129    clang-20
x86_64                randconfig-004-20260129    clang-20
x86_64                randconfig-005-20260129    clang-20
x86_64                randconfig-006-20260129    clang-20
x86_64                randconfig-011-20260129    clang-20
x86_64                randconfig-012-20260129    clang-20
x86_64                randconfig-013-20260129    clang-20
x86_64                randconfig-014-20260129    clang-20
x86_64                randconfig-015-20260129    clang-20
x86_64                randconfig-016-20260129    clang-20
x86_64                randconfig-071-20260129    gcc-14
x86_64                randconfig-072-20260129    gcc-14
x86_64                randconfig-073-20260129    gcc-14
x86_64                randconfig-074-20260129    gcc-14
x86_64                randconfig-075-20260129    gcc-14
x86_64                randconfig-076-20260129    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260129    gcc-15.2.0
xtensa                randconfig-002-20260129    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

