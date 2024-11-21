Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B6DD7879D
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qeSehZG+IhUfb1aZuO4cIpnq7JdrtLMlK+QekCjAcxM=; b=yJOx2dTFzKjBqjwu1Og17+NAOl
	azCaLH8XhESH/dASVazjHSqm4AlIw2BFVXdxmPQY/m6vCl6TUuzc7zEHxcpVYct7/p2bCWqHj56KJ
	j/LrTah2e/InUZGGmrb7iC4wDiDFTDtRhoB8r0xnUCAn+vNXgEoAWOd9FoF8z8chwUtWYdmqe+9qi
	ucKfkTPbfJjliCEj/jV3yqMuQnwcpGHBGi0gNZXGQJOtlGWdnQUadoPZTKXCfDZw8j8xcYrbbPHdb
	axcc9J+/LA0mZ+rT+TH9rd/22mqXlEvk8bPJeOknM17X34ZNJsXmlFJeAhHj7KQP70O1eMBXBq12f
	/r4aIuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEArz-00000000Xgf-2L5e
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 17:21:31 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEArx-00000000XgH-1oOk
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 17:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732209690; x=1763745690;
  h=date:from:to:cc:subject:message-id;
  bh=FSmEZpwS/mbW4wvNAd24+Vu/sFVdIhFR2hFIgRpjrIk=;
  b=Xk8zQ07mjrpj8ORZpFx57RS6+PLnHb80Ek/P3hyvq0KubvpRvVg18l3T
   hLduG6H5FxVk62RNv7SDNBfiZERyBm7WEQlEXQZAJ/aTDc07OJ+wJULoQ
   H+dPtEDUcBIo02FTVJezdWvHZGBMISG+8QyNGJNe44t1XFyO6LK84AhM2
   uyBa/0veOjRtSGqtWgUXAa8C7eRA2NfYumz3LFHvWlCEPe7Rx/U46ohHQ
   DkrlYtAaqMW5WfCVVnJxnZrOLvb1I+wB8HCA/EADBFQf7sMN91AfN5ySH
   2tbZxlFgVDrDEotu6xxso5gyKIgQWW1OF9o7L9KCtKU13NPffVBA8DFhD
   w==;
X-CSE-ConnectionGUID: kQk6+CyHTF2pthKFCzjLQA==
X-CSE-MsgGUID: BtdtlQtXSBCbyPHxECC5jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31727843"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="31727843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:21:29 -0800
X-CSE-ConnectionGUID: BPcDrHl2SkiKyblF62krfg==
X-CSE-MsgGUID: 3IptsUuPQJ2rywLzDfdlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90253547"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2024 09:21:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEArs-0003Cd-2q;
	Thu, 21 Nov 2024 17:21:24 +0000
Date: Fri, 22 Nov 2024 01:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 7c16c77c1c085ed2e14f95b3399fe216e1e42a35
Message-ID: <202411220148.P2uDYCw5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_092129_478491_C7F9F61B 
X-CRM114-Status: UNSURE (   4.05  )
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
branch HEAD: 7c16c77c1c085ed2e14f95b3399fe216e1e42a35  Add localversion-wireless-testing-ath

elapsed time: 1368m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241121    gcc-13.2.0
arc                   randconfig-002-20241121    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241121    clang-20
arm                   randconfig-002-20241121    gcc-14.2.0
arm                   randconfig-003-20241121    clang-20
arm                   randconfig-004-20241121    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241121    clang-20
arm64                 randconfig-002-20241121    clang-20
arm64                 randconfig-003-20241121    gcc-14.2.0
arm64                 randconfig-004-20241121    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241121    gcc-14.2.0
csky                  randconfig-002-20241121    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241121    clang-20
hexagon               randconfig-002-20241121    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241121    gcc-11
i386        buildonly-randconfig-002-20241121    gcc-12
i386        buildonly-randconfig-003-20241121    clang-19
i386        buildonly-randconfig-004-20241121    clang-19
i386        buildonly-randconfig-005-20241121    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241121    gcc-14.2.0
loongarch             randconfig-002-20241121    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241121    gcc-14.2.0
nios2                 randconfig-002-20241121    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241121    gcc-14.2.0
parisc                randconfig-002-20241121    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241121    clang-15
powerpc               randconfig-002-20241121    gcc-14.2.0
powerpc               randconfig-003-20241121    clang-20
powerpc64             randconfig-001-20241121    gcc-14.2.0
powerpc64             randconfig-002-20241121    clang-20
powerpc64             randconfig-003-20241121    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241121    gcc-14.2.0
riscv                 randconfig-002-20241121    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241121    gcc-14.2.0
s390                  randconfig-002-20241121    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241121    gcc-14.2.0
sh                    randconfig-002-20241121    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241121    gcc-14.2.0
sparc64               randconfig-002-20241121    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                    randconfig-001-20241121    gcc-12
um                    randconfig-002-20241121    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241121    gcc-14.2.0
xtensa                randconfig-002-20241121    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

