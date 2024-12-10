Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45413E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJQOgy/wucTIJyaZBav9SQzRKizSC99v5rTfOiJBExQ=; b=3nX30hOismC7g/WL/DZ0mYwnlB
	gvhaqBNaTpMtez7TacWwfiCaV2zpLfavJ088uLlyz3EiUnXJa4KNjX2cTRnEBGEbT/1p2AOQ4swT1
	xHOhb1PDrm5MIfJ3LbX6yaMIVpCPXQ9h9oxF3a6jZFv6SRlk9lHy16QpvGHqRIpHUcsuTmTVfF/0Z
	7GWamigeO2EaYjvsTqbgTq0BzQTceb+EkggkgWdx3SBHpr+ybOO7XFWgHAfns41/BPuPNI+0YHCLq
	o/0N2xaMJYkzQLHjzFXN/UyK+iNC1hmS51kZDGRjjnWBJX/TjMls02bHOvBVLbuWuC/rVi6dQqD8y
	1k8xnfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3GT-0000000C7q7-0Ak1
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 16:39:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3GQ-0000000C7pe-1YaP
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 16:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733848750; x=1765384750;
  h=date:from:to:cc:subject:message-id;
  bh=NsyQhB5b/Cf6cq/PtwuslJhamDLhFf1RuqI1GwzWl4I=;
  b=K/ZD0ijW4Nb0T5Tisn8LOcz4puwowuxDr7hhhBtcnBhSzHQ3kPea4NBm
   EJxZpRvRvW83w1TPYZT8J9lOO0yoi9BJ+aJz3Rc/maZw9lVCG1q5cW7Fo
   BSCszgr2SfYs0yudbQI/MhDj2RVe2TPHhkYc1mFIDW4VYcbENwGTJ8BYI
   RraWux4a0jampcrhHyx4YlehXPf61+/mX2sNUh47731A05HZdIdv45P6P
   ekiwYJ43LV44Yu0T2lo10xg75YezmuOOhHTqjyB5aq8cc2Kg0wPl8BSPK
   NL/budvGje4LYGjE/0+4YuC6zF/lT1KtZgxe0Rb6iQB5yCViq9ZJ5oroa
   Q==;
X-CSE-ConnectionGUID: bn+VBPHRQF+6dkQL3M/aDw==
X-CSE-MsgGUID: 3nvuiliVS9iGr1lv+fIhZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34106615"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="34106615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:39:06 -0800
X-CSE-ConnectionGUID: d4FGXpmuSu23VtIlSZxfBA==
X-CSE-MsgGUID: 6wNdIdy9SK+IRmkH6m0B3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95290639"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 08:39:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL3GJ-0005lw-1R;
	Tue, 10 Dec 2024 16:39:03 +0000
Date: Wed, 11 Dec 2024 00:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 105c23d2b3c306553276a492242837b45360db42
Message-ID: <202412110053.37N27rLb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_083910_419795_F767B6CF 
X-CRM114-Status: UNSURE (   3.08  )
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
branch HEAD: 105c23d2b3c306553276a492242837b45360db42  Merge branch 'pending' into main-pending

elapsed time: 1173m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-004-20241210    clang-20
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-004-20241210    clang-20
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-002-20241210    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-006-20241210    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-003-20241210    clang-20
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-002-20241210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-002-20241210    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-002-20241210    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-002-20241210    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241210    clang-20
um                    randconfig-002-20241210    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-002-20241210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

