Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE8606A32D
	for <ath12k@archiver.kernel.org>; Sat,  7 Nov 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4AIvfpRG;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QVTOXnq3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eWU92bC6J0MBv8+tmTCB3vGX/e0HSY3b6ZxFqVFszxQ=; b=4AIvfpRGXbXu++WF6nSP3+TuGk
	htLfAMCfIsoWm8F8M1f3JpuWw72kehArrM8T+kZtT8d2sw4n8oY9w2/MnO9CsKFWQeOTFdLGReKmE
	pG03HuZdSz5DWATFQOKCIotryoba7LYvEbXnSxcCGPEF4jYu2Vk8n5/5wPKdCpQ98YM0/NqjKQi2s
	vqJNdZBCXzDjbC+wSvlOJNCAk8EidDSGEN38mTZko5q9eXNGpQB6rlfXmo+abgM1YkiOhxcAHNsoE
	CrKDDT7l4vuB/N8aybL6x4jc9W6dOEYrYz9H3rHHAqcPG8GFc1byYDSnhuZ//XMHjijrS6ul4TaLK
	Vd6NiuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPe2D-0000000EZRV-3s7m;
	Sat, 07 Nov 2026 10:52:33 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPe2B-0000000EZRB-0Ay3
	for ath12k@lists.infradead.org;
	Sat, 07 Nov 2026 10:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794048751; x=1825584751;
  h=date:from:to:cc:subject:message-id;
  bh=PoI8QQvC8fv6LDUmdpdzFHGbEnmXd3Vj++Sarnl4zqA=;
  b=QVTOXnq3jKSxXUbSD92M4c39P6lW640LU6snViTENna+jV0tikld4yh2
   sYvGulHJvxhzEd4Qg91WSWNmL5CPIcFZ1ymlBO9il2YTKnSXppu9HQYQc
   E8CvZJADIMeVk/CWIt6TkubMFthDAE91UqrIOJCBxNMO6Xu+R4xMvy8WI
   cpgwzOHMInONNWJAVT4nSvwHeummM3tkWjE6Qs9prNQQusdvmd0abHIWy
   9Sov0Sgv4+BdUlaEnx+ec3249iyTw4Idqc/Al78i0F/I8BXVCKc1hCVxW
   9F3fMW+Di7zo+EsvydkX2qysA/0Z8YIWPpFcyQ77YwcoG8cuSGtpRFnoJ
   g==;
X-CSE-ConnectionGUID: 6iyu7VS8TvWbjs+W1WrFLw==
X-CSE-MsgGUID: j/QY46oXQ4mS56/RuQ8hkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2880381"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2880381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 02:52:29 -0800
X-CSE-ConnectionGUID: nAh650MlStCjfangqzCGfw==
X-CSE-MsgGUID: kT9m7exLSTy7VSGuzsRrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7635494"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2026 02:52:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPe25-00000000qjJ-3I5l;
	Sat, 07 Nov 2026 10:52:25 +0000
Date: Sat, 07 Nov 2026 18:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 e670f079b9a86c68c3af84035fe829a1e77d5857
Message-ID: <20261107185147.HuK1oldl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_025231_339928_24D2B5EB 
X-CRM114-Status: UNSURE (   3.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: e670f079b9a86c68c3af84035fe829a1e77d5857  drm/amd/display: use include guards instead of #pragma once in Core 2 headers

elapsed time: 993m

configs tested: 570
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261106    gcc-8.5.0
alpha                 randconfig-2000-20261107    gcc-9.5.0
alpha                 randconfig-2001-20261106    gcc-8.5.0
alpha                 randconfig-2001-20261107    gcc-9.5.0
alpha                 randconfig-2200-20261106    gcc-14.4.0 smatch
alpha                 randconfig-2200-20261107    gcc-8.5.0  smatch
alpha                randconfig-r2103-20261107    gcc-13.5.0 cocci
alpha                randconfig-r2106-20261107    gcc-10.5.0 cocci
alpha                randconfig-r2107-20261106    gcc-12.5.0 cocci
alpha                randconfig-r2302-20261106    gcc-16.2.0 sparse
alpha                randconfig-r2304-20261106    gcc-16.2.0 sparse
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arc                   randconfig-2000-20261106    gcc-12.5.0
arc                   randconfig-2000-20261107    gcc-9.5.0
arc                   randconfig-2001-20261106    gcc-12.5.0
arc                   randconfig-2001-20261106    gcc-8.5.0
arc                   randconfig-2001-20261107    gcc-9.5.0
arc                   randconfig-2002-20261106    gcc-12.5.0
arc                   randconfig-2002-20261106    gcc-8.5.0
arc                   randconfig-2002-20261107    gcc-9.5.0
arc                   randconfig-2003-20261106    gcc-12.5.0
arc                   randconfig-2003-20261106    gcc-14.4.0
arc                   randconfig-2003-20261107    gcc-9.5.0
arc                   randconfig-2004-20261106    gcc-12.5.0
arc                   randconfig-2004-20261106    gcc-8.5.0
arc                   randconfig-2004-20261107    gcc-9.5.0
arc                   randconfig-2005-20261106    gcc-12.5.0
arc                   randconfig-2005-20261106    gcc-8.5.0
arc                   randconfig-2005-20261107    gcc-9.5.0
arc                   randconfig-2200-20261106    gcc-10.5.0 smatch
arc                   randconfig-2200-20261107    gcc-8.5.0  smatch
arc                  randconfig-r2108-20261107    gcc-8.5.0  cocci
arc                  randconfig-r2301-20261107    clang-17   sparse
arc                  randconfig-r2306-20261106    gcc-13.5.0 sparse
arc                  randconfig-r2307-20261107    clang-24   sparse
arc                  randconfig-r2309-20261107    clang-24   sparse
arc                  randconfig-r2310-20261107    gcc-16.2.0 sparse
arc                  randconfig-r2311-20261107    gcc-13.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                   randconfig-2000-20261106    gcc-9.5.0
arm                   randconfig-2000-20261107    gcc-16.2.0
arm                   randconfig-2001-20261106    gcc-9.5.0
arm                   randconfig-2001-20261107    gcc-16.2.0
arm                   randconfig-2002-20261106    gcc-9.5.0
arm                   randconfig-2002-20261107    gcc-16.2.0
arm                   randconfig-2200-20261106    clang-17   smatch
arm                   randconfig-2200-20261107    clang-24   smatch
arm                  randconfig-r2100-20261107    clang-20   cocci
arm                  randconfig-r2105-20261107    clang-20   cocci
arm                  randconfig-r2303-20261107    clang-17   sparse
arm                  randconfig-r2306-20261107    gcc-13.5.0 sparse
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm                     vt8500_v6_v7_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
arm64                 randconfig-2000-20261106    gcc-9.5.0
arm64                 randconfig-2000-20261107    gcc-16.2.0
arm64                 randconfig-2001-20261106    gcc-9.5.0
arm64                 randconfig-2001-20261107    gcc-16.2.0
arm64                 randconfig-2002-20261106    gcc-9.5.0
arm64                 randconfig-2002-20261107    gcc-16.2.0
arm64                 randconfig-2200-20261106    clang-24   smatch
arm64                 randconfig-2200-20261107    gcc-12.5.0 smatch
arm64                randconfig-r2101-20261107    clang-20   cocci
arm64                randconfig-r2103-20261106    gcc-15.3.0 cocci
arm64                randconfig-r2306-20261106    clang-17   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
csky                  randconfig-2000-20261106    clang-24
csky                  randconfig-2000-20261107    clang-24
csky                  randconfig-2001-20261106    clang-24
csky                  randconfig-2001-20261107    clang-24
csky                  randconfig-2200-20261106    gcc-10.5.0 smatch
csky                  randconfig-2200-20261107    gcc-11.5.0 smatch
csky                 randconfig-r2101-20261107    gcc-13.5.0 cocci
csky                 randconfig-r2103-20261107    gcc-15.3.0 cocci
csky                 randconfig-r2104-20261107    gcc-12.5.0 cocci
csky                 randconfig-r2105-20261107    clang-24   cocci
csky                 randconfig-r2107-20261107    clang-24   cocci
csky                 randconfig-r2109-20261107    gcc-10.5.0 cocci
csky                 randconfig-r2110-20261107    gcc-8.5.0  cocci
csky                 randconfig-r2300-20261107    gcc-8.5.0  sparse
csky                 randconfig-r2301-20261106    gcc-16.2.0 sparse
csky                 randconfig-r2306-20261106    gcc-15.3.0 sparse
csky                 randconfig-r2306-20261107    gcc-16.2.0 sparse
csky                 randconfig-r2309-20261107    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
hexagon               randconfig-2000-20261106    clang-24
hexagon               randconfig-2000-20261107    clang-24
hexagon               randconfig-2001-20261106    clang-24
hexagon               randconfig-2001-20261107    clang-24
hexagon               randconfig-2200-20261106    clang-24   smatch
hexagon               randconfig-2200-20261107    clang-19   smatch
hexagon              randconfig-r2102-20261107    clang-24   cocci
hexagon              randconfig-r2102-20261107    gcc-15.3.0 cocci
hexagon              randconfig-r2103-20261107    clang-24   cocci
hexagon              randconfig-r2111-20261107    gcc-10.5.0 cocci
hexagon              randconfig-r2301-20261107    gcc-8.5.0  sparse
hexagon              randconfig-r2305-20261107    gcc-8.5.0  sparse
hexagon              randconfig-r2308-20261106    clang-17   sparse
hexagon              randconfig-r2310-20261106    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
i386                  randconfig-2000-20261106    gcc-14
i386                  randconfig-2000-20261107    clang-22
i386                  randconfig-2001-20261106    clang-22
i386                  randconfig-2001-20261106    gcc-14
i386                  randconfig-2001-20261107    clang-22
i386                  randconfig-2002-20261106    gcc-14
i386                  randconfig-2002-20261107    clang-22
i386                  randconfig-2003-20261106    gcc-14
i386                  randconfig-2003-20261107    clang-22
i386                  randconfig-2004-20261106    gcc-14
i386                  randconfig-2004-20261107    clang-22
i386                  randconfig-2005-20261106    clang-22
i386                  randconfig-2005-20261106    gcc-14
i386                  randconfig-2005-20261107    clang-22
i386                  randconfig-2100-20261106    clang-22   cocci
i386                  randconfig-2100-20261107    gcc-14     cocci
i386                  randconfig-2101-20261106    clang-22   cocci
i386                  randconfig-2101-20261107    gcc-14     cocci
i386                  randconfig-2102-20261106    clang-22   cocci
i386                  randconfig-2102-20261107    gcc-14     cocci
i386                  randconfig-2103-20261106    clang-22   cocci
i386                  randconfig-2103-20261107    gcc-14     cocci
i386                  randconfig-2104-20261106    clang-22   cocci
i386                  randconfig-2104-20261107    gcc-14     cocci
i386                  randconfig-2105-20261106    clang-22   cocci
i386                  randconfig-2105-20261107    gcc-14     cocci
i386                  randconfig-2200-20261107    clang-22   smatch
i386                  randconfig-2300-20261106    clang-22   sparse
i386                  randconfig-2300-20261107    gcc-14     sparse
i386                  randconfig-2301-20261106    clang-22   sparse
i386                  randconfig-2301-20261106    gcc-14     sparse
i386                  randconfig-2301-20261107    gcc-14     sparse
i386                  randconfig-2302-20261106    clang-22   sparse
i386                  randconfig-2302-20261106    gcc-14     sparse
i386                  randconfig-2302-20261107    gcc-14     sparse
i386                 randconfig-r2108-20261107    gcc-14     cocci
i386                 randconfig-r2109-20261107    gcc-14     cocci
i386                 randconfig-r2110-20261106    gcc-9.5.0  cocci
i386                 randconfig-r2302-20261107    clang-17   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
loongarch             randconfig-2000-20261107    gcc-16.2.0
loongarch             randconfig-2001-20261107    gcc-16.2.0
loongarch             randconfig-2200-20261106    clang-24   smatch
loongarch             randconfig-2200-20261107    gcc-16.2.0 smatch
loongarch            randconfig-r2105-20261107    gcc-12.5.0 cocci
loongarch            randconfig-r2108-20261106    gcc-9.5.0  cocci
loongarch            randconfig-r2301-20261107    gcc-15.3.0 sparse
loongarch            randconfig-r2307-20261107    gcc-16.2.0 sparse
loongarch            randconfig-r2308-20261106    gcc-16.2.0 sparse
loongarch            randconfig-r2308-20261107    gcc-13.5.0 sparse
loongarch            randconfig-r2309-20261107    gcc-16.2.0 sparse
loongarch            randconfig-r2311-20261107    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261106    gcc-8.5.0
m68k                  randconfig-2000-20261107    gcc-9.5.0
m68k                  randconfig-2001-20261106    gcc-8.5.0
m68k                  randconfig-2001-20261107    gcc-9.5.0
m68k                  randconfig-2200-20261106    gcc-11.5.0 smatch
m68k                  randconfig-2200-20261107    gcc-8.5.0  smatch
m68k                 randconfig-r2102-20261107    gcc-13.5.0 cocci
m68k                 randconfig-r2106-20261106    gcc-9.5.0  cocci
m68k                 randconfig-r2107-20261107    gcc-10.5.0 cocci
m68k                 randconfig-r2111-20261107    gcc-14     cocci
m68k                 randconfig-r2304-20261107    gcc-15.3.0 sparse
m68k                 randconfig-r2305-20261106    gcc-16.2.0 sparse
m68k                 randconfig-r2307-20261106    gcc-8.5.0  sparse
m68k                 randconfig-r2310-20261107    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261106    gcc-8.5.0
microblaze            randconfig-2000-20261107    gcc-9.5.0
microblaze            randconfig-2001-20261106    gcc-8.5.0
microblaze            randconfig-2001-20261107    gcc-9.5.0
microblaze            randconfig-2200-20261106    gcc-14.4.0 smatch
microblaze            randconfig-2200-20261107    gcc-15.3.0 smatch
microblaze           randconfig-r2101-20261107    gcc-15.3.0 cocci
microblaze           randconfig-r2102-20261107    gcc-12.5.0 cocci
microblaze           randconfig-r2110-20261107    gcc-14     cocci
microblaze           randconfig-r2303-20261107    gcc-15.3.0 sparse
microblaze           randconfig-r2309-20261106    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261106    gcc-8.5.0
mips                  randconfig-2000-20261107    gcc-8.5.0
mips                  randconfig-2001-20261106    gcc-8.5.0
mips                  randconfig-2001-20261107    gcc-8.5.0
mips                  randconfig-2002-20261106    gcc-8.5.0
mips                  randconfig-2002-20261107    gcc-8.5.0
mips                  randconfig-2200-20261106    clang-17   smatch
mips                  randconfig-2200-20261107    gcc-13.5.0 smatch
mips                 randconfig-r2100-20261106    gcc-15.3.0 cocci
mips                 randconfig-r2109-20261106    gcc-12.5.0 cocci
mips                 randconfig-r2303-20261107    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261106    clang-17   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
nios2                 randconfig-2000-20261107    gcc-16.2.0
nios2                 randconfig-2001-20261107    gcc-16.2.0
nios2                 randconfig-2200-20261106    gcc-10.5.0 smatch
nios2                 randconfig-2200-20261107    gcc-11.5.0 smatch
nios2                randconfig-r2105-20261107    gcc-15.3.0 cocci
nios2                randconfig-r2307-20261106    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261107    gcc-16.2.0 sparse
nios2                randconfig-r2309-20261106    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261106    gcc-8.5.0
openrisc              randconfig-2000-20261107    gcc-8.5.0
openrisc              randconfig-2001-20261106    gcc-8.5.0
openrisc              randconfig-2001-20261107    gcc-8.5.0
openrisc              randconfig-2002-20261106    gcc-8.5.0
openrisc              randconfig-2002-20261107    gcc-8.5.0
openrisc              randconfig-2200-20261106    gcc-16.2.0 smatch
openrisc              randconfig-2200-20261107    gcc-11.5.0 smatch
openrisc             randconfig-r2100-20261107    clang-24   cocci
openrisc             randconfig-r2102-20261106    gcc-15.3.0 cocci
openrisc             randconfig-r2111-20261106    gcc-9.5.0  cocci
openrisc             randconfig-r2300-20261106    gcc-16.2.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc                randconfig-2000-20261107    gcc-16.2.0
parisc                randconfig-2001-20261107    gcc-16.2.0
parisc                randconfig-2200-20261106    gcc-12.5.0 smatch
parisc                randconfig-2200-20261107    gcc-9.5.0  smatch
parisc               randconfig-r2100-20261107    gcc-12.5.0 cocci
parisc               randconfig-r2105-20261107    gcc-13.5.0 cocci
parisc               randconfig-r2111-20261107    gcc-8.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     ge_imp3a_defconfig    clang-17
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                      ppa8548_defconfig    clang-17
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc               randconfig-2000-20261106    gcc-8.5.0
powerpc               randconfig-2000-20261107    clang-24
powerpc               randconfig-2001-20261106    gcc-8.5.0
powerpc               randconfig-2001-20261107    clang-24
powerpc               randconfig-2002-20261106    gcc-8.5.0
powerpc               randconfig-2002-20261107    clang-24
powerpc               randconfig-2200-20261106    clang-24   smatch
powerpc               randconfig-2200-20261107    gcc-10.5.0 smatch
powerpc              randconfig-r2100-20261107    gcc-13.5.0 cocci
powerpc              randconfig-r2104-20261107    clang-24   cocci
powerpc              randconfig-r2107-20261107    gcc-14     cocci
powerpc              randconfig-r2108-20261106    gcc-12.5.0 cocci
powerpc              randconfig-r2108-20261107    clang-24   cocci
powerpc              randconfig-r2109-20261106    gcc-9.5.0  cocci
powerpc              randconfig-r2308-20261107    clang-24   sparse
powerpc                      tqm8560_defconfig    clang-17
powerpc                         warp_defconfig    clang-17
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
powerpc64             randconfig-2000-20261106    gcc-8.5.0
powerpc64             randconfig-2000-20261107    clang-24
powerpc64             randconfig-2001-20261106    gcc-8.5.0
powerpc64             randconfig-2001-20261107    clang-24
powerpc64             randconfig-2002-20261106    gcc-8.5.0
powerpc64             randconfig-2002-20261107    clang-24
powerpc64             randconfig-2200-20261106    gcc-8.5.0  smatch
powerpc64             randconfig-2200-20261107    clang-24   smatch
powerpc64            randconfig-r2100-20261107    gcc-15.3.0 cocci
powerpc64            randconfig-r2101-20261106    gcc-15.3.0 cocci
powerpc64            randconfig-r2101-20261107    clang-24   cocci
powerpc64            randconfig-r2101-20261107    gcc-12.5.0 cocci
powerpc64            randconfig-r2109-20261107    clang-24   cocci
powerpc64            randconfig-r2110-20261107    clang-24   cocci
powerpc64            randconfig-r2304-20261107    clang-17   sparse
powerpc64            randconfig-r2305-20261107    clang-17   sparse
powerpc64            randconfig-r2310-20261106    gcc-8.5.0  sparse
powerpc64            randconfig-r2311-20261106    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
riscv                 randconfig-2000-20261106    gcc-13.5.0
riscv                 randconfig-2000-20261106    gcc-9.5.0
riscv                 randconfig-2000-20261107    clang-24
riscv                 randconfig-2001-20261106    gcc-13.5.0
riscv                 randconfig-2001-20261106    gcc-15.3.0
riscv                 randconfig-2001-20261107    clang-24
riscv                 randconfig-2002-20261106    gcc-13.5.0
riscv                 randconfig-2002-20261106    gcc-9.5.0
riscv                 randconfig-2002-20261107    clang-24
riscv                 randconfig-2003-20261106    gcc-13.5.0
riscv                 randconfig-2003-20261106    gcc-15.3.0
riscv                 randconfig-2003-20261107    clang-24
riscv                 randconfig-2004-20261106    gcc-13.5.0
riscv                 randconfig-2004-20261107    clang-24
riscv                 randconfig-2005-20261106    gcc-13.5.0
riscv                 randconfig-2005-20261106    gcc-15.3.0
riscv                 randconfig-2005-20261107    clang-24
riscv                 randconfig-2200-20261106    gcc-11.5.0 smatch
riscv                 randconfig-2200-20261107    gcc-10.5.0 smatch
riscv                randconfig-r2103-20261107    clang-20   cocci
riscv                randconfig-r2108-20261107    gcc-10.5.0 cocci
riscv                randconfig-r2308-20261106    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
s390                  randconfig-2000-20261106    gcc-8.5.0
s390                  randconfig-2000-20261107    gcc-14.4.0
s390                  randconfig-2001-20261106    clang-24
s390                  randconfig-2001-20261106    gcc-8.5.0
s390                  randconfig-2001-20261107    gcc-14.4.0
s390                  randconfig-2002-20261106    clang-21
s390                  randconfig-2002-20261106    gcc-8.5.0
s390                  randconfig-2002-20261107    gcc-14.4.0
s390                  randconfig-2003-20261106    gcc-8.5.0
s390                  randconfig-2003-20261107    gcc-14.4.0
s390                  randconfig-2004-20261106    gcc-8.5.0
s390                  randconfig-2004-20261106    gcc-9.5.0
s390                  randconfig-2004-20261107    gcc-14.4.0
s390                  randconfig-2005-20261106    gcc-15.3.0
s390                  randconfig-2005-20261106    gcc-8.5.0
s390                  randconfig-2005-20261107    gcc-14.4.0
s390                  randconfig-2200-20261106    clang-18   smatch
s390                  randconfig-2200-20261107    gcc-10.5.0 smatch
s390                 randconfig-r2104-20261106    gcc-15.3.0 cocci
s390                 randconfig-r2106-20261107    clang-24   cocci
s390                 randconfig-r2300-20261107    clang-17   sparse
s390                 randconfig-r2307-20261106    clang-17   sparse
s390                 randconfig-r2310-20261107    gcc-13.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                    randconfig-2000-20261106    gcc-16.2.0
sh                    randconfig-2000-20261107    gcc-13.5.0
sh                    randconfig-2001-20261106    gcc-16.2.0
sh                    randconfig-2001-20261107    gcc-13.5.0
sh                    randconfig-2002-20261106    gcc-16.2.0
sh                    randconfig-2002-20261107    gcc-13.5.0
sh                    randconfig-2003-20261106    gcc-16.2.0
sh                    randconfig-2003-20261107    gcc-13.5.0
sh                    randconfig-2004-20261106    gcc-16.2.0
sh                    randconfig-2004-20261107    gcc-13.5.0
sh                    randconfig-2005-20261106    gcc-16.2.0
sh                    randconfig-2005-20261107    gcc-13.5.0
sh                    randconfig-2200-20261107    gcc-11.5.0 smatch
sh                   randconfig-r2104-20261107    gcc-13.5.0 cocci
sh                   randconfig-r2104-20261107    gcc-15.3.0 cocci
sh                   randconfig-r2110-20261107    gcc-10.5.0 cocci
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                 randconfig-2000-20261106    gcc-16.2.0
sparc                 randconfig-2000-20261106    gcc-8.5.0
sparc                 randconfig-2000-20261107    clang-24
sparc                 randconfig-2001-20261106    gcc-8.5.0
sparc                 randconfig-2001-20261107    clang-24
sparc                 randconfig-2200-20261106    gcc-8.5.0  smatch
sparc                 randconfig-2200-20261107    gcc-11.5.0 smatch
sparc                randconfig-r2102-20261107    clang-20   cocci
sparc                randconfig-r2106-20261106    gcc-12.5.0 cocci
sparc                randconfig-r2106-20261107    gcc-8.5.0  cocci
sparc                randconfig-r2109-20261107    gcc-8.5.0  cocci
sparc                randconfig-r2111-20261106    gcc-12.5.0 cocci
sparc                randconfig-r2300-20261107    gcc-15.3.0 sparse
sparc                randconfig-r2306-20261107    clang-24   sparse
sparc                randconfig-r2307-20261107    gcc-13.5.0 sparse
sparc                randconfig-r2311-20261106    clang-17   sparse
sparc                randconfig-r2311-20261107    gcc-16.2.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
sparc64               randconfig-2000-20261106    gcc-8.5.0
sparc64               randconfig-2000-20261107    clang-24
sparc64               randconfig-2001-20261106    gcc-8.5.0
sparc64               randconfig-2001-20261107    clang-24
sparc64               randconfig-2200-20261106    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261107    clang-20   smatch
sparc64              randconfig-r2104-20261107    clang-20   cocci
sparc64              randconfig-r2105-20261106    gcc-15.3.0 cocci
sparc64              randconfig-r2302-20261107    gcc-8.5.0  sparse
sparc64              randconfig-r2304-20261107    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                    randconfig-2000-20261106    clang-17
um                    randconfig-2000-20261106    gcc-8.5.0
um                    randconfig-2000-20261107    clang-24
um                    randconfig-2001-20261106    clang-17
um                    randconfig-2001-20261106    gcc-8.5.0
um                    randconfig-2001-20261107    clang-24
um                    randconfig-2200-20261106    gcc-13     smatch
um                    randconfig-2200-20261107    gcc-14     smatch
um                   randconfig-r2103-20261107    gcc-12.5.0 cocci
um                   randconfig-r2107-20261106    gcc-9.5.0  cocci
um                   randconfig-r2111-20261107    clang-24   cocci
um                   randconfig-r2303-20261106    gcc-16.2.0 sparse
um                   randconfig-r2309-20261106    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.2.0
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-2000-20261106    gcc-14
x86_64                randconfig-2000-20261107    clang-22
x86_64                randconfig-2001-20261106    gcc-14
x86_64                randconfig-2001-20261107    clang-22
x86_64                randconfig-2002-20261106    gcc-14
x86_64                randconfig-2002-20261107    clang-22
x86_64                randconfig-2003-20261106    gcc-14
x86_64                randconfig-2003-20261107    clang-22
x86_64                randconfig-2004-20261106    gcc-14
x86_64                randconfig-2004-20261107    clang-22
x86_64                randconfig-2005-20261106    gcc-14
x86_64                randconfig-2005-20261107    clang-22
x86_64                randconfig-2100-20261106    clang-22   cocci
x86_64                randconfig-2100-20261107    gcc-14     cocci
x86_64                randconfig-2101-20261106    clang-22   cocci
x86_64                randconfig-2101-20261107    gcc-14     cocci
x86_64                randconfig-2102-20261106    clang-22   cocci
x86_64                randconfig-2102-20261107    gcc-14     cocci
x86_64                randconfig-2103-20261106    clang-22   cocci
x86_64                randconfig-2103-20261107    gcc-14     cocci
x86_64                randconfig-2104-20261106    clang-22   cocci
x86_64                randconfig-2104-20261107    gcc-14     cocci
x86_64                randconfig-2105-20261106    clang-22   cocci
x86_64                randconfig-2105-20261107    gcc-14     cocci
x86_64                randconfig-2200-20261106    gcc-14     smatch
x86_64                randconfig-2200-20261107    clang-22   smatch
x86_64                randconfig-2300-20261106    clang-22   sparse
x86_64                randconfig-2300-20261107    gcc-14     sparse
x86_64                randconfig-2301-20261106    clang-22   sparse
x86_64                randconfig-2301-20261107    gcc-14     sparse
x86_64                randconfig-2302-20261106    clang-22   sparse
x86_64                randconfig-2302-20261107    gcc-14     sparse
x86_64               randconfig-r2107-20261107    gcc-8.5.0  cocci
x86_64               randconfig-r2110-20261106    gcc-12.5.0 cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                randconfig-2000-20261106    clang-24
xtensa                randconfig-2000-20261107    clang-24
xtensa                randconfig-2001-20261106    clang-24
xtensa                randconfig-2001-20261107    clang-24
xtensa                randconfig-2200-20261106    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261107    gcc-13.5.0 smatch
xtensa               randconfig-r2106-20261107    gcc-14     cocci
xtensa               randconfig-r2302-20261107    gcc-15.3.0 sparse
xtensa               randconfig-r2305-20261107    gcc-15.3.0 sparse
xtensa               randconfig-r2310-20261106    gcc-8.5.0  sparse
xtensa                     xip_kc705_defconfig    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

