Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E9C7EE39
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAVMNdehvCuh5ZgL6lpPK0MATY83cQ5i2Tgd78NGquk=; b=s+L6sFJckr1Q1GHerQW+hnpHE9
	RY7876fMJkWzcWZOApI1dx/UiH4J1MH2tDJuytm4PDeKPyoRA220IV2zSFu1Jr4/Q0a3Pd+dYYqJz
	QscBUlBA+xn2+upsGXbYMxbT1VGFam7Ej2n0+AZ9RWyJ9P7P60ECfwfiJ0QsBRlkglyWIm+JB0GUf
	DkCdNv2eyUaENTXs/NFgNenp4xSNZvDS7n1t7JZfmCJit9DSd72DGdkU20SSeRgPa/0xNauYBCPpY
	ogHFwIMkTGx25xwUOrUu4cXa3t+xfsK4PyDtGcv9ZdNz04euiIQ7O9jHxA45PT6Y23QRPfIuBGUR/
	DTDWjQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jB-00000006fN0-2z7n;
	Tue, 24 Jun 2025 19:54:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU68j-00000006Ebd-0NCr
	for ath12k@bombadil.infradead.org;
	Tue, 24 Jun 2025 16:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FAVMNdehvCuh5ZgL6lpPK0MATY83cQ5i2Tgd78NGquk=; b=J59yRhCpy3ciPkItfQOFtutxhU
	5C61K/MjceIySxqLtoHafnz5yhcBX/A13bcE5nsz00JbNw6rC+AlPDjklK1x4UzX40QyzggSAJLEJ
	4eo+0SDIHGpvxtaMwdrc2vk0EmhIt7PTynkHWW4i1jKRnujK6vec1iQ57d6kpU+dkLnF5730DWI2o
	1d4KND/htQexXQDnUiGo7TiSwVI6vusQVj61/SUE94FhUWTYHYkng1P71gfLA8Yz/VoEZN1qli5gg
	ks+lhtrzYyuqPdFVmkohKBWx9z0u7MAMvIGxMDYB3VwgOhCBb3VR7/LwOy9CVJXPjPpPYXF/R0Vm1
	GIgU5s8w==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU68d-00000005UDR-2XDl
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 16:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750781087; x=1782317087;
  h=date:from:to:cc:subject:message-id;
  bh=ZqX4kdE2f9gX9R/SnSLBhh7JD9gLOf2RN+t47mnOJnI=;
  b=L8SUU5vPMgpabWzASnxehCKE0qPIL+ybY0YYRoCxajFspsT77VtJw/pu
   IRPzchG1H6Uw57maHZJ2/KfG/70o48JBrl2QLHrWMEO2oQCScArPiSqZn
   LbuRCm+P7E1Qt26zD/MGBzHI48m6Zu0PQaApwHm9bU+4/y5IR4YMELwaL
   fOF4Qc2L70NUgK3eQDpiO/MUXrTFwC37iPEZk5SeImd0kyL/sxeQCpxtD
   xD2gat5jlG2NnjqeTTN4sUImUubMgqZTO56dL1U8LEA22+J2AtLh+z2xo
   EolHIpi5XfE8UVEGCcmorr50cR46vjhiQ7tg6S3g21DK1+qbGDVOILZfD
   g==;
X-CSE-ConnectionGUID: ZUbURMlWS0qXreArN2y4Rw==
X-CSE-MsgGUID: n5e1G53eSoWz2QvDGDe3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53167064"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="53167064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 09:04:40 -0700
X-CSE-ConnectionGUID: Yil2LeKaQvON6akRsDyFEA==
X-CSE-MsgGUID: apI6FbLkRoONalbozUt5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="152082276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2025 09:04:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU68S-000SIO-2E;
	Tue, 24 Jun 2025 16:04:36 +0000
Date: Wed, 25 Jun 2025 00:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 05062834350f0bf7ad1abcebc2807220e90220eb
Message-ID: <202506250034.SthsqklC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_170448_408282_460FF2F3 
X-CRM114-Status: UNSURE (   3.90  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 05062834350f0bf7ad1abcebc2807220e90220eb  wifi: ath12k: Pass ab pointer directly to ath12k_dp_tx_get_encap_type()

elapsed time: 1454m

configs tested: 52
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
loongarch                         allnoconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

