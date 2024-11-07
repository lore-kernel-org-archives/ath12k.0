Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE61D43349
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/pXPR4tgT0j385y1lgb7JRmOdYllDvevI93Lr6L2GE=; b=TjwIdVWlTMiqZK5ABlPQSmaU4A
	NAi8F3fMoP8+zKkh8x8cgzWg24rSwhrj/UG/SwIc/BpPrBY3bxHslE8LuT0D+1wvRoEUj7g+LyNF7
	hzT3Fws4qg2ynfMNzY9DWXRW6vDqfLP4gCjQ8ooEcJqqm0Un2iQAZwnfZNm7JigjEmSbOUZf4i1UT
	xdUvHzOxanl2+2CEuORdNIPLvurLA5NS5R0vylUobWvwji6Z9cQUdpIUHl6aCjEhIay039c8pdjKF
	m6raEixAO2RI9LKkJYfvgpx7KE3+F3IA09SNnqRpRxtcXzdr0+65VrU40oU16YBCsbpGZO40sQlWX
	lWjEYdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90kJ-00000006k9R-2vza
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 11:32:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90iZ-00000006jlW-2adE
	for ath12k@bombadil.infradead.org;
	Thu, 07 Nov 2024 11:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=D/pXPR4tgT0j385y1lgb7JRmOdYllDvevI93Lr6L2GE=; b=ml9n+UHAfWEa6zmjUk/1ug61IP
	mj0VxIgIMGd47CAm6wfKWWLt0BVBw0LgmBwcY6orMr50S+p3x/FEFeh+J2hbise/PUzC1m02gqjwM
	xr/bZdOJAPhM1ptbwnpOtDHVez267xLeFztx6zhx5sy/KVwvmAfsrosD6Hj1RjFpYDTsvcL8KBkl3
	gZpLnCFVPUC8mF0mHen0h5a4Lp5Erwm4giAmx3EU+VYCXeP6NwSia+Hjmwa4nQn/14rCgYkVNW75O
	4wc1fEide99SJjb1LjRNJ3dP5gb709Xyfo3Xsei4i8p/barstb2ynherQMWxnPbwSMLuhWvvJPvxa
	TENs1nLQ==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90iV-0000000C7pd-3IL9
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 11:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730979023; x=1762515023;
  h=date:from:to:cc:subject:message-id;
  bh=vPGHjLq2EIcQ+1vvU/nXcTBpqv/aCYtzzpyLDaUMSs8=;
  b=Iz0v46oo911+m7jDdhOT3XymRzrLxj7rh9b4cpmOiTJMrX5op9CJA4U/
   sFHfaXOF5xtF+yAwykx0tf/JUjOEXZsxgo5lW0or6bABSo1xL8FQRzPAJ
   wH9fMNiiRj+tHWg+4jTlzvH3Aox5gJT8MXPiuZ9mkk/7r8kraZhNICmZp
   Uj+vNSoFJp0C42iBLde05HlYc5aqclDekoqgQzLlgMTM9X4LmifTYYKzz
   /rZqJTgWQO6UKrDDDKnvwACFGiIJxcRz//PgO+hjs1JxfuIKvtpekiAhT
   1wF4chlWYtFLfmvc2jVZDPBVpSyVFcFL+U+K5IBEFdsLGAZAD5UKUfPpX
   Q==;
X-CSE-ConnectionGUID: yWGYLmbqT+WfemcjqGz5bQ==
X-CSE-MsgGUID: pRv8OqQbR+iRR7AvLNWCZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="31038083"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="31038083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:30:09 -0800
X-CSE-ConnectionGUID: wEftHNOdRGi2JXLd9hVMeA==
X-CSE-MsgGUID: gWZ+gbLkSHiAytgRlNClag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85836480"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2024 03:30:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t90iD-000qA6-2u;
	Thu, 07 Nov 2024 11:30:05 +0000
Date: Thu, 07 Nov 2024 19:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 9ee80e341c4e473f6c13af3b529fed4ab073234c
Message-ID: <202411071957.uExpQgM1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_113024_306696_0C6E0C1B 
X-CRM114-Status: UNSURE (   3.92  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: 9ee80e341c4e473f6c13af3b529fed4ab073234c  Add localversion-wireless-testing-ath

elapsed time: 837m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241107    gcc-13.2.0
arc                   randconfig-002-20241107    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241107    clang-16
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-004-20241107    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-003-20241107    clang-20
arm64                 randconfig-004-20241107    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241107    clang-20
hexagon               randconfig-002-20241107    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241107    gcc-12
i386        buildonly-randconfig-002-20241107    gcc-12
i386        buildonly-randconfig-003-20241107    gcc-12
i386        buildonly-randconfig-004-20241107    gcc-12
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-006-20241107    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-002-20241107    gcc-12
i386                  randconfig-003-20241107    gcc-12
i386                  randconfig-004-20241107    gcc-12
i386                  randconfig-005-20241107    gcc-12
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-011-20241107    gcc-12
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-014-20241107    gcc-12
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-016-20241107    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241107    clang-16
powerpc               randconfig-002-20241107    clang-20
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc64             randconfig-001-20241107    gcc-14.2.0
powerpc64             randconfig-002-20241107    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241107    clang-20
s390                  randconfig-002-20241107    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241107    clang-20
um                    randconfig-002-20241107    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241107    gcc-12
x86_64      buildonly-randconfig-003-20241107    gcc-12
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241107    gcc-12
x86_64      buildonly-randconfig-006-20241107    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

