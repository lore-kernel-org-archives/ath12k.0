Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05CE606A329
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cc3NPHIM;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aJyRSU4L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VEW+PzkST17PzV0cQ8jLgrGD3JryJxnxICvirHtcQqw=; b=cc3NPHIM0lijhWgNvqM3bhy3zq
	I+M13QEgbNVdLQRYQvpvzLSMVuCCOZmsct4upZ2rsMb9t0TUvAE2YJ3k0PmLaAk4EfvbBPD8Uh5OG
	13UdfsyF3hInbBexauK7KD6TG+M/IR/M9QXfTfoOhJsq/5KIy7/HMVmyoYz5JAZzDs7oM7Apefp+q
	WThyLz1FcIBIMXN49kJCFEvNF2puvAwnodxxSVTDdSmDb+rDvPARhBlIS9rTehqDnOwcSX3Fd+Xq7
	kDO+7n6sMvZdrwHpB5kETWkeVg/SryizD25yviBokMGoO0BA0HdEa5P8nodES3IvvZlIZV10GS43A
	vMdSWl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLKH-0000000Gmo3-2NWY;
	Sat, 14 Nov 2026 21:30:21 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLKC-0000000Gmmx-294n
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 21:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794691816; x=1826227816;
  h=date:from:to:cc:subject:message-id;
  bh=vXOc8SPZb7dVvGwIVbNsa95GQyjtB2xvLXFsPUd5Hy4=;
  b=aJyRSU4L93sNemNPqwbBFIRxebONhFVQ5eahhQ4qEWdUT4zeVBX2MvpO
   FknMOdHDyyrA5nhMobL/l0oQQ/fWZD2yryyQhCCkRo+OOH+9il6Acz3vZ
   g8v9gchebXCp78AtBMK4k8nlES8IpwFwgghxyOERe6ldnCTu3D29v8Eu0
   FKXSXTWY2/hs4FM6AF46gzHImryS/SB9utL5WJQ0ANQx/ju27P0nS83kG
   GGAdYV7RxQKhVQXSsldgmQPO7JYsC1xwHTASh5JOOuQZ+JDUAutSw1yI0
   MI7u1tkiPR5BUlz366fEsnKsYpTSKmcLnD0hUFm5mbWxZlTKIrrw7tShh
   w==;
X-CSE-ConnectionGUID: Cmd+hdHfTfalYL0q0PauvA==
X-CSE-MsgGUID: RAB0bSoqTVSrDx3QH79cNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3505762"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3505762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 13:30:15 -0800
X-CSE-ConnectionGUID: k2JrrMEvR0apoRxvG3VD+Q==
X-CSE-MsgGUID: lUCcaaMcSTK0PAM1wYFMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9290757"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2026 13:30:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSLK7-00000001620-1XBg;
	Sat, 14 Nov 2026 21:30:11 +0000
Date: Sun, 15 Nov 2026 05:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 89fc637b4bbb1de2733df25b64bf1f06a2b84411
Message-ID: <20261115052942.2Fys75xW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_133016_646044_228B06BE 
X-CRM114-Status: UNSURE (   3.46  )
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
branch HEAD: 89fc637b4bbb1de2733df25b64bf1f06a2b84411  drm/amd/display: use include guards instead of #pragma once in Core 2 headers

elapsed time: 798m

configs tested: 616
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261113    gcc-8.5.0
alpha                 randconfig-2000-20261114    gcc-12.5.0
alpha                 randconfig-2001-20261113    gcc-8.5.0
alpha                 randconfig-2001-20261114    gcc-12.5.0
alpha                 randconfig-2200-20261113    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261114    gcc-9.5.0  smatch
alpha                randconfig-r2101-20261114    clang-17   cocci
alpha                randconfig-r2103-20261113    gcc-14.4.0 cocci
alpha                randconfig-r2104-20261113    gcc-14.4.0 cocci
alpha                randconfig-r2105-20261113    gcc-14.4.0 cocci
alpha                randconfig-r2109-20261113    clang-22   cocci
alpha                randconfig-r2110-20261113    gcc-14     cocci
alpha                randconfig-r2303-20261114    gcc-8.5.0  sparse
alpha                randconfig-r2306-20261113    gcc-10.5.0 sparse
alpha                randconfig-r2306-20261114    gcc-13.5.0 sparse
alpha                randconfig-r2308-20261114    gcc-8.5.0  sparse
alpha                randconfig-r2309-20261113    clang-24   sparse
alpha                randconfig-r2309-20261114    clang-19   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261115    gcc-11.5.0
arc                   randconfig-1001-20261115    gcc-11.5.0
arc                   randconfig-2000-20261113    gcc-16.2.0
arc                   randconfig-2000-20261114    gcc-11.5.0
arc                   randconfig-2001-20261113    gcc-16.2.0
arc                   randconfig-2001-20261114    gcc-11.5.0
arc                   randconfig-2002-20261113    gcc-16.2.0
arc                   randconfig-2002-20261114    gcc-11.5.0
arc                   randconfig-2003-20261113    gcc-16.2.0
arc                   randconfig-2003-20261114    gcc-11.5.0
arc                   randconfig-2004-20261113    gcc-16.2.0
arc                   randconfig-2004-20261114    gcc-11.5.0
arc                   randconfig-2005-20261113    gcc-16.2.0
arc                   randconfig-2005-20261114    gcc-11.5.0
arc                   randconfig-2200-20261113    gcc-14.4.0 smatch
arc                   randconfig-2200-20261114    gcc-8.5.0  smatch
arc                  randconfig-r2100-20261113    gcc-8.5.0  cocci
arc                  randconfig-r2103-20261114    gcc-15.3.0 cocci
arc                  randconfig-r2105-20261113    gcc-8.5.0  cocci
arc                  randconfig-r2106-20261114    gcc-10.5.0 cocci
arc                  randconfig-r2108-20261113    gcc-11.5.0 cocci
arc                  randconfig-r2304-20261113    gcc-13.5.0 sparse
arc                  randconfig-r2304-20261113    gcc-8.5.0  sparse
arc                  randconfig-r2306-20261114    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261113    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261115    gcc-11.5.0
arm                   randconfig-1001-20261115    gcc-11.5.0
arm                   randconfig-1002-20261115    gcc-11.5.0
arm                   randconfig-1003-20261115    gcc-11.5.0
arm                   randconfig-2000-20261113    gcc-14.4.0
arm                   randconfig-2000-20261114    gcc-10.5.0
arm                   randconfig-2001-20261113    gcc-14.4.0
arm                   randconfig-2001-20261114    gcc-10.5.0
arm                   randconfig-2002-20261113    gcc-14.4.0
arm                   randconfig-2002-20261114    gcc-10.5.0
arm                   randconfig-2200-20261113    clang-24   smatch
arm                   randconfig-2200-20261114    clang-17   smatch
arm                  randconfig-r2100-20261113    gcc-9.5.0  cocci
arm                  randconfig-r2102-20261113    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261114    gcc-8.5.0  cocci
arm                  randconfig-r2300-20261113    clang-17   sparse
arm                  randconfig-r2302-20261114    gcc-14.4.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261114    gcc-16.2.0
arm64                 randconfig-1001-20261114    gcc-16.2.0
arm64                 randconfig-1002-20261114    gcc-16.2.0
arm64                 randconfig-1003-20261114    gcc-16.2.0
arm64                 randconfig-2000-20261113    gcc-14.4.0
arm64                 randconfig-2000-20261114    gcc-10.5.0
arm64                 randconfig-2001-20261113    gcc-14.4.0
arm64                 randconfig-2001-20261114    gcc-10.5.0
arm64                 randconfig-2002-20261113    gcc-14.4.0
arm64                 randconfig-2002-20261114    gcc-10.5.0
arm64                 randconfig-2200-20261113    gcc-8.5.0  smatch
arm64                 randconfig-2200-20261114    clang-17   smatch
arm64                randconfig-r2100-20261113    gcc-14.4.0 cocci
arm64                randconfig-r2102-20261114    clang-17   cocci
arm64                randconfig-r2103-20261113    gcc-9.5.0  cocci
arm64                randconfig-r2103-20261114    clang-17   cocci
arm64                randconfig-r2104-20261114    clang-17   cocci
arm64                randconfig-r2105-20261113    gcc-14.4.0 cocci
arm64                randconfig-r2107-20261113    clang-24   cocci
arm64                randconfig-r2301-20261113    clang-24   sparse
arm64                randconfig-r2304-20261113    clang-17   sparse
arm64                randconfig-r2310-20261114    clang-19   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261114    gcc-16.2.0
csky                  randconfig-1001-20261114    gcc-16.2.0
csky                  randconfig-2000-20261113    gcc-12.5.0
csky                  randconfig-2000-20261114    gcc-16.2.0
csky                  randconfig-2001-20261113    gcc-12.5.0
csky                  randconfig-2001-20261114    gcc-16.2.0
csky                  randconfig-2200-20261113    gcc-10.5.0 smatch
csky                  randconfig-2200-20261114    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261113    gcc-15.3.0 cocci
csky                 randconfig-r2104-20261113    gcc-9.5.0  cocci
csky                 randconfig-r2107-20261114    clang-24   cocci
csky                 randconfig-r2302-20261114    gcc-8.5.0  sparse
csky                 randconfig-r2303-20261113    gcc-8.5.0  sparse
csky                 randconfig-r2306-20261113    gcc-8.5.0  sparse
csky                 randconfig-r2307-20261114    gcc-13.5.0 sparse
csky                 randconfig-r2310-20261114    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261114    clang-24
hexagon               randconfig-1000-20261115    clang-24
hexagon               randconfig-1001-20261114    clang-24
hexagon               randconfig-1001-20261115    clang-24
hexagon               randconfig-2000-20261113    gcc-12.5.0
hexagon               randconfig-2000-20261114    gcc-16.2.0
hexagon               randconfig-2001-20261113    gcc-12.5.0
hexagon               randconfig-2001-20261114    gcc-16.2.0
hexagon               randconfig-2200-20261113    clang-17   smatch
hexagon               randconfig-2200-20261114    clang-24   smatch
hexagon              randconfig-r2101-20261113    gcc-14.4.0 cocci
hexagon              randconfig-r2101-20261113    gcc-8.5.0  cocci
hexagon              randconfig-r2102-20261114    gcc-8.5.0  cocci
hexagon              randconfig-r2104-20261113    gcc-9.5.0  cocci
hexagon              randconfig-r2106-20261113    gcc-14     cocci
hexagon              randconfig-r2107-20261113    gcc-14     cocci
hexagon              randconfig-r2108-20261114    clang-22   cocci
hexagon              randconfig-r2109-20261114    clang-22   cocci
hexagon              randconfig-r2306-20261114    gcc-11.5.0 sparse
hexagon              randconfig-r2307-20261113    clang-24   sparse
hexagon              randconfig-r2311-20261114    clang-19   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261114    gcc-14
i386        buildonly-randconfig-1001-20261114    gcc-14
i386        buildonly-randconfig-1002-20261114    gcc-14
i386        buildonly-randconfig-1003-20261114    gcc-14
i386        buildonly-randconfig-1004-20261114    gcc-14
i386        buildonly-randconfig-1005-20261114    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261114    gcc-12
i386                  randconfig-1000-20261115    clang-22
i386                  randconfig-1001-20261114    gcc-12
i386                  randconfig-1001-20261115    clang-22
i386                  randconfig-1002-20261114    gcc-12
i386                  randconfig-1002-20261115    clang-22
i386                  randconfig-1003-20261114    gcc-12
i386                  randconfig-1003-20261115    clang-22
i386                  randconfig-1004-20261114    gcc-12
i386                  randconfig-1004-20261115    clang-22
i386                  randconfig-1005-20261114    gcc-12
i386                  randconfig-1005-20261115    clang-22
i386                  randconfig-1006-20261114    gcc-12
i386                  randconfig-1006-20261115    clang-22
i386                  randconfig-1007-20261114    clang-22
i386                  randconfig-1008-20261114    clang-22
i386                  randconfig-1009-20261114    clang-22
i386                  randconfig-1010-20261114    clang-22
i386                  randconfig-1011-20261114    clang-22
i386                  randconfig-1012-20261114    clang-22
i386                  randconfig-1013-20261114    clang-22
i386                  randconfig-2000-20261113    gcc-12
i386                  randconfig-2000-20261114    clang-22
i386                  randconfig-2001-20261113    gcc-12
i386                  randconfig-2001-20261114    clang-22
i386                  randconfig-2002-20261113    gcc-12
i386                  randconfig-2002-20261114    clang-22
i386                  randconfig-2003-20261113    gcc-12
i386                  randconfig-2003-20261114    clang-22
i386                  randconfig-2004-20261113    gcc-12
i386                  randconfig-2004-20261114    clang-22
i386                  randconfig-2005-20261113    gcc-12
i386                  randconfig-2005-20261114    clang-22
i386                  randconfig-2100-20261113    gcc-14     cocci
i386                  randconfig-2100-20261114    gcc-14     cocci
i386                  randconfig-2101-20261113    gcc-14     cocci
i386                  randconfig-2101-20261114    gcc-14     cocci
i386                  randconfig-2102-20261113    gcc-14     cocci
i386                  randconfig-2102-20261114    gcc-14     cocci
i386                  randconfig-2103-20261113    gcc-14     cocci
i386                  randconfig-2103-20261114    gcc-14     cocci
i386                  randconfig-2104-20261113    gcc-14     cocci
i386                  randconfig-2104-20261114    gcc-14     cocci
i386                  randconfig-2105-20261113    gcc-14     cocci
i386                  randconfig-2105-20261114    gcc-14     cocci
i386                  randconfig-2200-20261113    clang-22   smatch
i386                  randconfig-2200-20261114    gcc-14     smatch
i386                  randconfig-2300-20261113    gcc-14     sparse
i386                  randconfig-2300-20261114    clang-22   sparse
i386                  randconfig-2301-20261113    gcc-14     sparse
i386                  randconfig-2301-20261114    clang-22   sparse
i386                  randconfig-2302-20261113    gcc-14     sparse
i386                  randconfig-2302-20261114    clang-22   sparse
i386                 randconfig-r2106-20261114    clang-22   cocci
i386                 randconfig-r2107-20261113    clang-22   cocci
i386                 randconfig-r2108-20261113    clang-22   cocci
i386                 randconfig-r2110-20261113    clang-24   cocci
i386                 randconfig-r2300-20261114    gcc-8.5.0  sparse
i386                 randconfig-r2305-20261113    clang-24   sparse
i386                 randconfig-r2305-20261113    gcc-13.5.0 sparse
i386                 randconfig-r2309-20261113    gcc-10.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261114    clang-24
loongarch             randconfig-1000-20261115    clang-24
loongarch             randconfig-1001-20261114    clang-24
loongarch             randconfig-1001-20261115    clang-24
loongarch             randconfig-2000-20261113    gcc-8.5.0
loongarch             randconfig-2000-20261114    gcc-11.5.0
loongarch             randconfig-2001-20261113    gcc-8.5.0
loongarch             randconfig-2001-20261114    gcc-11.5.0
loongarch             randconfig-2200-20261113    gcc-16.2.0 smatch
loongarch             randconfig-2200-20261114    clang-18   smatch
loongarch            randconfig-r2100-20261114    clang-17   cocci
loongarch            randconfig-r2303-20261113    gcc-13.5.0 sparse
loongarch            randconfig-r2305-20261113    clang-17   sparse
loongarch            randconfig-r2305-20261114    gcc-14.4.0 sparse
loongarch            randconfig-r2309-20261114    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261113    gcc-8.5.0
m68k                  randconfig-2000-20261114    gcc-12.5.0
m68k                  randconfig-2001-20261113    gcc-8.5.0
m68k                  randconfig-2001-20261114    gcc-12.5.0
m68k                  randconfig-2200-20261113    gcc-15.3.0 smatch
m68k                  randconfig-2200-20261114    gcc-16.2.0 smatch
m68k                 randconfig-r2104-20261114    gcc-11.5.0 cocci
m68k                 randconfig-r2301-20261114    gcc-8.5.0  sparse
m68k                 randconfig-r2303-20261114    gcc-14.4.0 sparse
m68k                 randconfig-r2307-20261113    clang-24   sparse
m68k                 randconfig-r2310-20261113    clang-24   sparse
m68k                 randconfig-r2310-20261114    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261113    gcc-8.5.0
microblaze            randconfig-2000-20261114    gcc-12.5.0
microblaze            randconfig-2001-20261113    gcc-8.5.0
microblaze            randconfig-2001-20261114    gcc-12.5.0
microblaze            randconfig-2200-20261113    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261114    gcc-9.5.0  smatch
microblaze           randconfig-r2100-20261113    gcc-14.4.0 cocci
microblaze           randconfig-r2111-20261114    clang-22   cocci
microblaze           randconfig-r2300-20261113    gcc-8.5.0  sparse
microblaze           randconfig-r2303-20261113    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                  randconfig-2000-20261113    gcc-16.2.0
mips                  randconfig-2000-20261114    gcc-16.2.0
mips                  randconfig-2001-20261113    gcc-16.2.0
mips                  randconfig-2001-20261114    gcc-16.2.0
mips                  randconfig-2002-20261113    gcc-16.2.0
mips                  randconfig-2002-20261114    gcc-16.2.0
mips                  randconfig-2200-20261113    clang-24   smatch
mips                  randconfig-2200-20261114    gcc-15.3.0 smatch
mips                 randconfig-r2100-20261113    gcc-15.3.0 cocci
mips                 randconfig-r2105-20261114    gcc-11.5.0 cocci
mips                 randconfig-r2106-20261113    clang-24   cocci
mips                 randconfig-r2111-20261114    gcc-10.5.0 cocci
mips                 randconfig-r2302-20261113    clang-17   sparse
mips                 randconfig-r2308-20261114    clang-19   sparse
mips                 randconfig-r2308-20261114    gcc-13.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261114    clang-24
nios2                 randconfig-1000-20261115    clang-24
nios2                 randconfig-1001-20261114    clang-24
nios2                 randconfig-1001-20261115    clang-24
nios2                 randconfig-2000-20261113    gcc-8.5.0
nios2                 randconfig-2000-20261114    gcc-11.5.0
nios2                 randconfig-2001-20261113    gcc-8.5.0
nios2                 randconfig-2001-20261114    gcc-11.5.0
nios2                 randconfig-2200-20261113    gcc-10.5.0 smatch
nios2                 randconfig-2200-20261114    gcc-11.5.0 smatch
nios2                randconfig-r2101-20261113    gcc-14.4.0 cocci
nios2                randconfig-r2105-20261113    gcc-9.5.0  cocci
nios2                randconfig-r2108-20261114    gcc-10.5.0 cocci
nios2                randconfig-r2110-20261113    clang-22   cocci
nios2                randconfig-r2110-20261113    gcc-8.5.0  cocci
nios2                randconfig-r2310-20261114    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc              randconfig-2000-20261113    gcc-16.2.0
openrisc              randconfig-2000-20261114    gcc-16.2.0
openrisc              randconfig-2001-20261113    gcc-16.2.0
openrisc              randconfig-2001-20261114    gcc-16.2.0
openrisc              randconfig-2002-20261113    gcc-16.2.0
openrisc              randconfig-2002-20261114    gcc-16.2.0
openrisc              randconfig-2200-20261113    gcc-14.4.0 smatch
openrisc              randconfig-2200-20261114    gcc-16.2.0 smatch
openrisc             randconfig-r2101-20261114    gcc-15.3.0 cocci
openrisc             randconfig-r2103-20261113    gcc-8.5.0  cocci
openrisc             randconfig-r2103-20261113    gcc-9.5.0  cocci
openrisc             randconfig-r2104-20261113    gcc-8.5.0  cocci
openrisc             randconfig-r2108-20261113    gcc-8.5.0  cocci
openrisc             randconfig-r2300-20261113    gcc-13.5.0 sparse
openrisc             randconfig-r2302-20261113    gcc-8.5.0  sparse
openrisc             randconfig-r2305-20261113    gcc-8.5.0  sparse
openrisc             randconfig-r2307-20261114    clang-19   sparse
openrisc             randconfig-r2307-20261114    gcc-11.5.0 sparse
openrisc             randconfig-r2309-20261114    gcc-13.5.0 sparse
openrisc             randconfig-r2310-20261113    gcc-8.5.0  sparse
openrisc             randconfig-r2311-20261113    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                randconfig-2000-20261113    gcc-8.5.0
parisc                randconfig-2000-20261114    gcc-11.5.0
parisc                randconfig-2001-20261113    gcc-8.5.0
parisc                randconfig-2001-20261114    gcc-11.5.0
parisc                randconfig-2200-20261113    gcc-16.2.0 smatch
parisc                randconfig-2200-20261114    gcc-8.5.0  smatch
parisc               randconfig-r2102-20261113    gcc-9.5.0  cocci
parisc               randconfig-r2103-20261114    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261113    gcc-14.4.0 cocci
parisc               randconfig-r2106-20261113    gcc-11.5.0 cocci
parisc               randconfig-r2108-20261113    gcc-14     cocci
parisc               randconfig-r2111-20261113    clang-22   cocci
parisc               randconfig-r2305-20261114    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-2000-20261113    clang-24
powerpc               randconfig-2000-20261114    gcc-8.5.0
powerpc               randconfig-2001-20261113    clang-24
powerpc               randconfig-2001-20261114    gcc-8.5.0
powerpc               randconfig-2002-20261113    clang-24
powerpc               randconfig-2002-20261114    gcc-8.5.0
powerpc               randconfig-2200-20261113    clang-24   smatch
powerpc               randconfig-2200-20261114    clang-24   smatch
powerpc              randconfig-r2100-20261114    gcc-15.3.0 cocci
powerpc              randconfig-r2100-20261114    gcc-8.5.0  cocci
powerpc              randconfig-r2101-20261114    gcc-11.5.0 cocci
powerpc              randconfig-r2107-20261114    clang-22   cocci
powerpc              randconfig-r2109-20261113    clang-24   cocci
powerpc              randconfig-r2109-20261113    gcc-8.5.0  cocci
powerpc              randconfig-r2110-20261114    gcc-10.5.0 cocci
powerpc              randconfig-r2111-20261113    clang-24   cocci
powerpc              randconfig-r2111-20261113    gcc-14     cocci
powerpc              randconfig-r2111-20261114    clang-24   cocci
powerpc              randconfig-r2303-20261113    clang-17   sparse
powerpc              randconfig-r2308-20261114    gcc-11.5.0 sparse
powerpc64             randconfig-2000-20261113    clang-24
powerpc64             randconfig-2000-20261114    gcc-8.5.0
powerpc64             randconfig-2001-20261113    clang-24
powerpc64             randconfig-2001-20261114    gcc-8.5.0
powerpc64             randconfig-2002-20261113    clang-24
powerpc64             randconfig-2002-20261114    gcc-8.5.0
powerpc64             randconfig-2200-20261113    gcc-10.5.0 smatch
powerpc64             randconfig-2200-20261114    clang-17   smatch
powerpc64            randconfig-r2103-20261114    gcc-11.5.0 cocci
powerpc64            randconfig-r2106-20261114    clang-24   cocci
powerpc64            randconfig-r2108-20261113    clang-24   cocci
powerpc64            randconfig-r2110-20261114    clang-24   cocci
powerpc64            randconfig-r2111-20261113    gcc-8.5.0  cocci
powerpc64            randconfig-r2300-20261113    clang-24   sparse
powerpc64            randconfig-r2300-20261114    gcc-14.4.0 sparse
powerpc64            randconfig-r2301-20261113    gcc-8.5.0  sparse
powerpc64            randconfig-r2306-20261113    clang-24   sparse
powerpc64            randconfig-r2308-20261113    clang-24   sparse
powerpc64            randconfig-r2309-20261113    gcc-8.5.0  sparse
powerpc64            randconfig-r2311-20261113    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                 randconfig-1000-20261114    gcc-15.3.0
riscv                 randconfig-1001-20261114    gcc-15.3.0
riscv                 randconfig-2000-20261113    gcc-11.5.0
riscv                 randconfig-2000-20261114    gcc-12.5.0
riscv                 randconfig-2001-20261113    gcc-11.5.0
riscv                 randconfig-2001-20261114    gcc-12.5.0
riscv                 randconfig-2002-20261113    gcc-11.5.0
riscv                 randconfig-2002-20261114    gcc-12.5.0
riscv                 randconfig-2003-20261113    gcc-11.5.0
riscv                 randconfig-2003-20261114    gcc-12.5.0
riscv                 randconfig-2004-20261113    gcc-11.5.0
riscv                 randconfig-2004-20261114    gcc-12.5.0
riscv                 randconfig-2005-20261113    gcc-11.5.0
riscv                 randconfig-2005-20261114    gcc-12.5.0
riscv                 randconfig-2200-20261113    clang-17   smatch
riscv                 randconfig-2200-20261114    clang-24   smatch
riscv                randconfig-r2102-20261113    gcc-9.5.0  cocci
riscv                randconfig-r2111-20261113    gcc-11.5.0 cocci
riscv                randconfig-r2307-20261113    gcc-8.5.0  sparse
riscv                randconfig-r2309-20261114    gcc-11.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                  randconfig-1000-20261114    gcc-15.3.0
s390                  randconfig-1001-20261114    gcc-15.3.0
s390                  randconfig-2000-20261113    gcc-11.5.0
s390                  randconfig-2000-20261114    clang-24
s390                  randconfig-2001-20261113    gcc-11.5.0
s390                  randconfig-2001-20261114    clang-24
s390                  randconfig-2002-20261113    gcc-11.5.0
s390                  randconfig-2002-20261114    clang-24
s390                  randconfig-2003-20261113    gcc-11.5.0
s390                  randconfig-2003-20261114    clang-24
s390                  randconfig-2004-20261113    gcc-11.5.0
s390                  randconfig-2004-20261114    clang-24
s390                  randconfig-2005-20261113    gcc-11.5.0
s390                  randconfig-2005-20261114    clang-24
s390                  randconfig-2200-20261113    clang-24   smatch
s390                  randconfig-2200-20261114    clang-24   smatch
s390                 randconfig-r2100-20261113    gcc-9.5.0  cocci
s390                 randconfig-r2102-20261113    gcc-14.4.0 cocci
s390                 randconfig-r2103-20261113    gcc-14.4.0 cocci
s390                 randconfig-r2107-20261113    gcc-8.5.0  cocci
s390                 randconfig-r2107-20261114    gcc-10.5.0 cocci
s390                 randconfig-r2306-20261114    clang-19   sparse
s390                 randconfig-r2311-20261114    gcc-11.5.0 sparse
s390                 randconfig-r2311-20261114    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261114    gcc-15.3.0
sh                    randconfig-1001-20261114    gcc-15.3.0
sh                    randconfig-2000-20261113    gcc-14.4.0
sh                    randconfig-2000-20261114    gcc-13.5.0
sh                    randconfig-2001-20261113    gcc-14.4.0
sh                    randconfig-2001-20261114    gcc-13.5.0
sh                    randconfig-2002-20261113    gcc-14.4.0
sh                    randconfig-2002-20261114    gcc-13.5.0
sh                    randconfig-2003-20261113    gcc-14.4.0
sh                    randconfig-2003-20261114    gcc-13.5.0
sh                    randconfig-2004-20261113    gcc-14.4.0
sh                    randconfig-2004-20261114    gcc-13.5.0
sh                    randconfig-2005-20261113    gcc-14.4.0
sh                    randconfig-2005-20261114    gcc-13.5.0
sh                    randconfig-2200-20261113    gcc-14.4.0 smatch
sh                    randconfig-2200-20261114    gcc-9.5.0  smatch
sh                   randconfig-r2102-20261114    gcc-11.5.0 cocci
sh                   randconfig-r2102-20261114    gcc-15.3.0 cocci
sh                   randconfig-r2104-20261114    gcc-15.3.0 cocci
sh                   randconfig-r2109-20261114    gcc-10.5.0 cocci
sh                   randconfig-r2110-20261114    clang-22   cocci
sh                   randconfig-r2304-20261114    gcc-14.4.0 sparse
sh                   randconfig-r2306-20261113    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                 randconfig-1000-20261114    gcc-12.5.0
sparc                 randconfig-1001-20261114    gcc-12.5.0
sparc                 randconfig-2000-20261113    clang-24
sparc                 randconfig-2000-20261114    clang-21
sparc                 randconfig-2001-20261113    clang-24
sparc                 randconfig-2001-20261114    clang-21
sparc                 randconfig-2200-20261113    gcc-14.4.0 smatch
sparc                 randconfig-2200-20261114    gcc-8.5.0  smatch
sparc                randconfig-r2100-20261114    gcc-11.5.0 cocci
sparc                randconfig-r2101-20261113    gcc-9.5.0  cocci
sparc                randconfig-r2102-20261113    gcc-14.4.0 cocci
sparc                randconfig-r2105-20261114    gcc-15.3.0 cocci
sparc                randconfig-r2106-20261113    gcc-8.5.0  cocci
sparc                randconfig-r2108-20261114    clang-24   cocci
sparc                randconfig-r2302-20261113    clang-24   sparse
sparc                randconfig-r2304-20261113    clang-24   sparse
sparc                randconfig-r2304-20261114    gcc-8.5.0  sparse
sparc                randconfig-r2307-20261114    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261114    gcc-12.5.0
sparc64               randconfig-1001-20261114    gcc-12.5.0
sparc64               randconfig-2000-20261113    clang-24
sparc64               randconfig-2000-20261114    clang-21
sparc64               randconfig-2001-20261113    clang-24
sparc64               randconfig-2001-20261114    clang-21
sparc64               randconfig-2200-20261113    gcc-15.3.0 smatch
sparc64               randconfig-2200-20261114    gcc-16.2.0 smatch
sparc64              randconfig-r2104-20261113    gcc-15.3.0 cocci
sparc64              randconfig-r2106-20261113    clang-22   cocci
sparc64              randconfig-r2310-20261113    clang-24   sparse
sparc64              randconfig-r2310-20261113    gcc-10.5.0 sparse
sparc64              randconfig-r2311-20261114    gcc-13.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261114    gcc-12.5.0
um                    randconfig-1001-20261114    gcc-12.5.0
um                    randconfig-2000-20261113    clang-24
um                    randconfig-2000-20261114    clang-21
um                    randconfig-2001-20261113    clang-24
um                    randconfig-2001-20261114    clang-21
um                    randconfig-2200-20261113    clang-24   smatch
um                    randconfig-2200-20261114    gcc-14     smatch
um                   randconfig-r2101-20261113    gcc-9.5.0  cocci
um                   randconfig-r2102-20261113    gcc-15.3.0 cocci
um                   randconfig-r2103-20261113    gcc-15.3.0 cocci
um                   randconfig-r2104-20261114    gcc-8.5.0  cocci
um                   randconfig-r2107-20261113    gcc-11.5.0 cocci
um                   randconfig-r2109-20261113    gcc-11.5.0 cocci
um                   randconfig-r2301-20261113    clang-17   sparse
um                   randconfig-r2301-20261113    gcc-13.5.0 sparse
um                   randconfig-r2301-20261114    gcc-14.4.0 sparse
um                   randconfig-r2302-20261113    gcc-13.5.0 sparse
um                   randconfig-r2311-20261113    gcc-10.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261114    gcc-14
x86_64      buildonly-randconfig-1001-20261114    gcc-14
x86_64      buildonly-randconfig-1002-20261114    gcc-14
x86_64      buildonly-randconfig-1003-20261114    gcc-14
x86_64      buildonly-randconfig-1004-20261114    gcc-14
x86_64      buildonly-randconfig-1005-20261114    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261114    gcc-14
x86_64                randconfig-1000-20261115    gcc-14
x86_64                randconfig-1001-20261114    gcc-14
x86_64                randconfig-1001-20261115    gcc-14
x86_64                randconfig-1002-20261114    gcc-14
x86_64                randconfig-1002-20261115    gcc-14
x86_64                randconfig-1003-20261114    gcc-14
x86_64                randconfig-1003-20261115    gcc-14
x86_64                randconfig-1004-20261114    gcc-14
x86_64                randconfig-1004-20261115    gcc-14
x86_64                randconfig-1005-20261114    gcc-14
x86_64                randconfig-1005-20261115    gcc-14
x86_64                randconfig-1006-20261114    gcc-14
x86_64                randconfig-1007-20261114    gcc-14
x86_64                randconfig-1008-20261114    gcc-14
x86_64                randconfig-1009-20261114    gcc-14
x86_64                randconfig-1010-20261114    gcc-14
x86_64                randconfig-1011-20261114    gcc-14
x86_64                randconfig-1012-20261114    clang-22
x86_64                randconfig-1012-20261115    gcc-14
x86_64                randconfig-1013-20261114    clang-22
x86_64                randconfig-1013-20261115    gcc-14
x86_64                randconfig-1014-20261114    clang-22
x86_64                randconfig-1014-20261115    gcc-14
x86_64                randconfig-1015-20261114    clang-22
x86_64                randconfig-1015-20261115    gcc-14
x86_64                randconfig-1016-20261114    clang-22
x86_64                randconfig-1016-20261115    gcc-14
x86_64                randconfig-1017-20261114    clang-22
x86_64                randconfig-1017-20261115    gcc-14
x86_64                randconfig-2000-20261113    gcc-14
x86_64                randconfig-2000-20261114    gcc-14
x86_64                randconfig-2001-20261113    gcc-14
x86_64                randconfig-2001-20261114    gcc-14
x86_64                randconfig-2002-20261113    gcc-14
x86_64                randconfig-2002-20261114    gcc-14
x86_64                randconfig-2003-20261113    gcc-14
x86_64                randconfig-2003-20261114    gcc-14
x86_64                randconfig-2004-20261113    gcc-14
x86_64                randconfig-2004-20261114    gcc-14
x86_64                randconfig-2005-20261113    gcc-14
x86_64                randconfig-2005-20261114    gcc-14
x86_64                randconfig-2100-20261113    clang-22   cocci
x86_64                randconfig-2100-20261114    gcc-14     cocci
x86_64                randconfig-2101-20261113    clang-22   cocci
x86_64                randconfig-2101-20261114    gcc-14     cocci
x86_64                randconfig-2102-20261113    clang-22   cocci
x86_64                randconfig-2102-20261114    gcc-14     cocci
x86_64                randconfig-2103-20261113    clang-22   cocci
x86_64                randconfig-2103-20261114    gcc-14     cocci
x86_64                randconfig-2104-20261113    clang-22   cocci
x86_64                randconfig-2104-20261114    gcc-14     cocci
x86_64                randconfig-2105-20261113    clang-22   cocci
x86_64                randconfig-2105-20261114    gcc-14     cocci
x86_64                randconfig-2200-20261113    clang-22   smatch
x86_64                randconfig-2200-20261114    gcc-14     smatch
x86_64                randconfig-2300-20261113    gcc-14     sparse
x86_64                randconfig-2300-20261114    clang-22   sparse
x86_64                randconfig-2301-20261113    gcc-14     sparse
x86_64                randconfig-2301-20261114    clang-22   sparse
x86_64                randconfig-2302-20261113    gcc-14     sparse
x86_64                randconfig-2302-20261114    clang-22   sparse
x86_64               randconfig-r2101-20261114    gcc-8.5.0  cocci
x86_64               randconfig-r2105-20261113    gcc-15.3.0 cocci
x86_64               randconfig-r2105-20261113    gcc-9.5.0  cocci
x86_64               randconfig-r2105-20261114    clang-17   cocci
x86_64               randconfig-r2109-20261113    gcc-14     cocci
x86_64               randconfig-r2308-20261113    clang-24   sparse
x86_64               randconfig-r2308-20261113    gcc-10.5.0 sparse
x86_64               randconfig-r2309-20261113    clang-24   sparse
x86_64               randconfig-r2311-20261113    clang-24   sparse
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
xtensa                randconfig-1000-20261114    gcc-12.5.0
xtensa                randconfig-1001-20261114    gcc-12.5.0
xtensa                randconfig-2000-20261113    gcc-12.5.0
xtensa                randconfig-2000-20261114    gcc-16.2.0
xtensa                randconfig-2001-20261113    gcc-12.5.0
xtensa                randconfig-2001-20261114    gcc-16.2.0
xtensa                randconfig-2200-20261113    gcc-12.5.0 smatch
xtensa               randconfig-r2109-20261114    clang-24   cocci
xtensa               randconfig-r2110-20261113    gcc-11.5.0 cocci
xtensa               randconfig-r2307-20261113    gcc-10.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

