Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA5C7EE30
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VcUTAHWJxQ6zbrQ0jFEWegPfIYrRT9X1nG04umvRx2k=; b=NYxjun8xPX/e0z7ZfDzD4ptVjs
	YwSPYVyC3/pIIp2L44A9g6DlJLHnPD4FD6BMkGoV47Zosg4bUZuhRtrEt6TfHxpoFxpRpa0wpnhT4
	Qr+ev6B9vZsum76XqW5Vzp7WJic0yiTeoY7Jkx2IaijjE+795vh8wlOf1hnVeOpty/IlUQeA9gyXs
	/EHiH8Q9vL09rG9Nrwj+cKU/AYGEwqlT/ft/I5+U9YGXN2QPFk4NQp4mskHRijuOXv7ycCMfoer3Z
	5xAAAxror9OJeolSgrdtIV/GN//5uK3XQzqys4tk72T3RLflKIRg0INGDwCXQhnM6L8Ut2j4/8Xqa
	2fZDWNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVO7-00000004Gdb-0Z00;
	Tue, 01 Jul 2025 07:26:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUgg-00000004B7b-2lY7
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 06:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751352111; x=1782888111;
  h=date:from:to:cc:subject:message-id;
  bh=tTUoSyLXWqOOuq6lZWlLUsWxDLL6hiNo8w3n7DSQIes=;
  b=LeOsBKYF/1NTylj31v3gJx4F8AmQxS6eRutfhS/MzIPllOahk/y+OffN
   g/gI8puFUtXlKPq2PAiLQlhevNZTD7BZyCgJ3xMWZZv2UnbY1wLxTxaKN
   v4hzHKjE5JT9/SQomVFHu1yXG6h7f99urYay9uZQTv1kPVxZlVeayfJLQ
   FmxM1e7SQO56tw09gK4imtS6H9dNZ9bZ0XWeoweWA5hC1QdpWslpeV7af
   AXEm4m6Au8ArCgrB5qdUC4VjZvgbzvyvg/fU5QdZPtxaO55/twNJD5KpQ
   hNwanL8NA8B5AfJ30aQeqRWVO7wkp2wN+/pWz2+Z2oTiW23WTMELqc/BB
   A==;
X-CSE-ConnectionGUID: bkAmamdsSqS0eh3C/otmEw==
X-CSE-MsgGUID: yq21HrsiQl2llG/4kUctFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53468074"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53468074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 23:41:50 -0700
X-CSE-ConnectionGUID: NK51J9sPQmeyM8prsF9VKQ==
X-CSE-MsgGUID: KFav+eKyQf2QriLjNOfp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157949455"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2025 23:41:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWUgb-000Zo2-36;
	Tue, 01 Jul 2025 06:41:45 +0000
Date: Tue, 01 Jul 2025 14:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 e5e42bc47438ad0567e524a5df5489b82607b8e2
Message-ID: <202507011437.3CNtZfd5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_234150_768576_D95B9422 
X-CRM114-Status: UNSURE (   3.86  )
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
branch HEAD: e5e42bc47438ad0567e524a5df5489b82607b8e2  Merge branch 'pending' into main-pending

elapsed time: 952m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250630    gcc-10.5.0
arc                   randconfig-002-20250630    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250630    clang-21
arm                   randconfig-002-20250630    gcc-12.4.0
arm                   randconfig-003-20250630    gcc-14.3.0
arm                   randconfig-004-20250630    clang-21
arm                        shmobile_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250630    gcc-9.5.0
arm64                 randconfig-002-20250630    gcc-14.3.0
arm64                 randconfig-003-20250630    clang-21
arm64                 randconfig-004-20250630    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250630    gcc-15.1.0
csky                  randconfig-001-20250701    gcc-11.5.0
csky                  randconfig-002-20250630    gcc-10.5.0
csky                  randconfig-002-20250701    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250630    clang-16
hexagon               randconfig-001-20250701    clang-21
hexagon               randconfig-002-20250630    clang-19
hexagon               randconfig-002-20250701    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250701    gcc-12
i386        buildonly-randconfig-002-20250701    gcc-12
i386        buildonly-randconfig-003-20250701    gcc-12
i386        buildonly-randconfig-004-20250701    gcc-12
i386        buildonly-randconfig-005-20250701    gcc-12
i386        buildonly-randconfig-006-20250701    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250630    gcc-15.1.0
loongarch             randconfig-001-20250701    gcc-13.3.0
loongarch             randconfig-002-20250630    gcc-15.1.0
loongarch             randconfig-002-20250701    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250630    gcc-14.2.0
nios2                 randconfig-001-20250701    gcc-14.2.0
nios2                 randconfig-002-20250630    gcc-8.5.0
nios2                 randconfig-002-20250701    gcc-13.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250630    gcc-8.5.0
parisc                randconfig-001-20250701    gcc-14.3.0
parisc                randconfig-002-20250630    gcc-8.5.0
parisc                randconfig-002-20250701    gcc-10.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250630    clang-18
powerpc               randconfig-001-20250701    gcc-13.3.0
powerpc               randconfig-002-20250630    clang-21
powerpc               randconfig-002-20250701    clang-21
powerpc               randconfig-003-20250630    gcc-13.3.0
powerpc               randconfig-003-20250701    clang-21
powerpc64             randconfig-001-20250630    gcc-10.5.0
powerpc64             randconfig-001-20250701    clang-21
powerpc64             randconfig-002-20250630    gcc-14.3.0
powerpc64             randconfig-002-20250701    clang-21
powerpc64             randconfig-003-20250630    gcc-10.5.0
powerpc64             randconfig-003-20250701    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250701    gcc-14.3.0
riscv                 randconfig-002-20250701    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250701    gcc-9.3.0
s390                  randconfig-002-20250701    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250701    gcc-15.1.0
sh                    randconfig-002-20250701    gcc-13.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250701    gcc-10.3.0
sparc                 randconfig-002-20250701    gcc-15.1.0
sparc64               randconfig-001-20250701    gcc-8.5.0
sparc64               randconfig-002-20250701    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250701    gcc-12
um                    randconfig-002-20250701    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250701    gcc-12
x86_64      buildonly-randconfig-002-20250701    gcc-12
x86_64      buildonly-randconfig-003-20250701    gcc-12
x86_64      buildonly-randconfig-004-20250701    gcc-12
x86_64      buildonly-randconfig-005-20250701    clang-20
x86_64      buildonly-randconfig-006-20250701    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250701    gcc-15.1.0
xtensa                randconfig-002-20250701    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

