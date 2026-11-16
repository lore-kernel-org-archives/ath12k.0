Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81422606A32C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k0K0VWao;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYYie50E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+zgRE4SUd+gh+ILxgXoI96mFhUTN5iykrJBUIGx3scs=; b=k0K0VWaorjeIKsS0sHtPmQUbKs
	yFrs4vX1XYTumR6WZ4h+cn5GHs6MsivDWtzScu9uON+ANjPW0cCepdkD5Jx9XO0QZgYHzGC/EXVdY
	7GR4Cm8PHxTc3u1d8wCTtQvDLS2LONrlAHmDmiGxFNSK32dYHUcrvt74xti+1h1itMdRwUi0DIwJ2
	DaN4pl1gWMqIKWB6tLUcZUSQPKUTye8WbwSDL4VdhZnVhHPv7hNSCP8IyETdTWbF+DxHfEaSpPge2
	ZP44M8CP53OlRF9Ca7w/TvSwS0ykSohLwVx5Fuv+OqCTjNUgjEVAhbc0BpEOosI8jF0prIulQXOeX
	dNq2We0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvP1-00000002Hg6-0gyP;
	Mon, 16 Nov 2026 12:01:39 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvOy-00000002Hfb-1Hol
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 12:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794830497; x=1826366497;
  h=date:from:to:cc:subject:message-id;
  bh=tq4f2PMhD84aqk4xCO81lY7mbLQfIvFQJSoYnnNSQGQ=;
  b=bYYie50EU2vvaxQAC4n4lQhhDvq3m/SU8SoDQcbTruZSRzYCDv3l6J6z
   29gGsncUxG+9ADWbL5BG9p+vVBmVNTLfAXs7kOLs34cK/+kNPUwMPpjZF
   rSB2ZrVaOvl7nfQ8jUMtcu2xvuRzhXtj84xw2DFfW5SahsXM4A5p/Qd/l
   eUHSav+jiujQUmk9vwV+VCzxnN9s1DRTeFGO7DXFeyyiHjHrygYptrt5x
   ZwlZXaaGXMVlCFG6cxGdh9S3PgJxc6NX1e5uWLi8nUkfcQROzAq25eAoo
   2rA1Y4+6p1MRQYH+xez5DLAMxzNPofhTR+ujoyjteVBXe/OwZHDao7EZB
   g==;
X-CSE-ConnectionGUID: R/qvZO3zROehBNAXuGi3UQ==
X-CSE-MsgGUID: zCJTjX9OQ1S4I+a/yIkuYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3481155"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3481155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:01:36 -0800
X-CSE-ConnectionGUID: igv8YhxNSj6Hj0SugXMyPw==
X-CSE-MsgGUID: lzybLSGeQ3ydA9aC2fQqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9665570"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 04:01:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSvOt-000000018TY-3kFV;
	Mon, 16 Nov 2026 12:01:31 +0000
Date: Mon, 16 Nov 2026 20:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-current] BUILD SUCCESS
 b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
Message-ID: <20261116200055.uKaYz0oZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_040136_378542_CC986177 
X-CRM114-Status: UNSURE (   4.00  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-current
branch HEAD: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a  Revert "wifi: ath10k: Stop unanswered temperature reads"

elapsed time: 918m

configs tested: 742
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261114    gcc-12.5.0
alpha                 randconfig-2000-20261115    gcc-8.5.0
alpha                 randconfig-2001-20261114    gcc-12.5.0
alpha                 randconfig-2001-20261115    gcc-8.5.0
alpha                 randconfig-2200-20261114    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261115    gcc-8.5.0  smatch
alpha                randconfig-r2104-20261114    gcc-12.5.0 cocci
alpha                randconfig-r2108-20261115    gcc-10.5.0 cocci
alpha                randconfig-r2109-20261115    clang-17   cocci
alpha                randconfig-r2109-20261115    gcc-13.5.0 cocci
alpha                randconfig-r2306-20261114    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261116    gcc-8.5.0
arc                   randconfig-1001-20261116    gcc-8.5.0
arc                   randconfig-2000-20261114    gcc-11.5.0
arc                   randconfig-2000-20261115    gcc-8.5.0
arc                   randconfig-2001-20261114    gcc-11.5.0
arc                   randconfig-2001-20261115    gcc-8.5.0
arc                   randconfig-2002-20261114    gcc-11.5.0
arc                   randconfig-2002-20261115    gcc-8.5.0
arc                   randconfig-2003-20261114    gcc-11.5.0
arc                   randconfig-2003-20261115    gcc-8.5.0
arc                   randconfig-2004-20261114    gcc-11.5.0
arc                   randconfig-2004-20261115    gcc-8.5.0
arc                   randconfig-2005-20261114    gcc-11.5.0
arc                   randconfig-2005-20261115    gcc-8.5.0
arc                   randconfig-2200-20261114    gcc-8.5.0  smatch
arc                   randconfig-2200-20261115    gcc-16.2.0 smatch
arc                  randconfig-r2100-20261115    gcc-8.5.0  cocci
arc                  randconfig-r2101-20261115    clang-17   cocci
arc                  randconfig-r2102-20261114    gcc-12.5.0 cocci
arc                  randconfig-r2103-20261115    clang-17   cocci
arc                  randconfig-r2103-20261115    gcc-8.5.0  cocci
arc                  randconfig-r2108-20261115    gcc-13.5.0 cocci
arc                  randconfig-r2301-20261115    gcc-14     sparse
arc                  randconfig-r2302-20261114    clang-24   sparse
arc                  randconfig-r2307-20261114    gcc-12.5.0 sparse
arc                  randconfig-r2307-20261115    clang-17   sparse
arc                  randconfig-r2310-20261115    gcc-8.5.0  sparse
arc                  randconfig-r2311-20261115    gcc-15.3.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          at91_dt_defconfig    gcc-16.2.0
arm                      davinci_all_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-24
arm                        imx_v4_v5_defconfig    clang-24
arm                           moxart_defconfig    clang-24
arm                           moxart_defconfig    gcc-16.2.0
arm                             mps2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                              mxs_defconfig    clang-17
arm                         neponset_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-14
arm                   randconfig-1000-20261116    gcc-8.5.0
arm                   randconfig-1001-20261116    gcc-8.5.0
arm                   randconfig-1002-20261116    gcc-8.5.0
arm                   randconfig-1003-20261116    gcc-8.5.0
arm                   randconfig-2000-20261114    gcc-10.5.0
arm                   randconfig-2000-20261115    clang-24
arm                   randconfig-2001-20261114    gcc-10.5.0
arm                   randconfig-2001-20261115    clang-24
arm                   randconfig-2002-20261114    gcc-10.5.0
arm                   randconfig-2002-20261115    clang-24
arm                   randconfig-2200-20261114    clang-17   smatch
arm                   randconfig-2200-20261115    clang-17   smatch
arm                  randconfig-r2101-20261115    gcc-8.5.0  cocci
arm                  randconfig-r2103-20261115    gcc-15.3.0 cocci
arm                  randconfig-r2104-20261115    gcc-15.3.0 cocci
arm                  randconfig-r2104-20261115    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261115    clang-17   cocci
arm                  randconfig-r2105-20261115    gcc-15.3.0 cocci
arm                  randconfig-r2106-20261115    gcc-8.5.0  cocci
arm                  randconfig-r2108-20261115    clang-17   cocci
arm                  randconfig-r2110-20261114    gcc-10.5.0 cocci
arm                  randconfig-r2303-20261114    clang-22   sparse
arm                  randconfig-r2306-20261115    gcc-11.5.0 sparse
arm                  randconfig-r2310-20261114    clang-24   sparse
arm                         realview_defconfig    clang-17
arm                            tegra_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261116    gcc-10.5.0
arm64                 randconfig-1001-20261116    gcc-10.5.0
arm64                 randconfig-1002-20261116    gcc-10.5.0
arm64                 randconfig-1003-20261116    gcc-10.5.0
arm64                 randconfig-2000-20261114    gcc-10.5.0
arm64                 randconfig-2000-20261115    clang-24
arm64                 randconfig-2001-20261114    gcc-10.5.0
arm64                 randconfig-2001-20261115    clang-24
arm64                 randconfig-2002-20261114    gcc-10.5.0
arm64                 randconfig-2002-20261115    clang-24
arm64                 randconfig-2200-20261114    clang-17   smatch
arm64                 randconfig-2200-20261115    gcc-15.3.0 smatch
arm64                randconfig-r2100-20261114    gcc-12.5.0 cocci
arm64                randconfig-r2101-20261115    gcc-15.3.0 cocci
arm64                randconfig-r2102-20261115    gcc-14     cocci
arm64                randconfig-r2103-20261114    clang-24   cocci
arm64                randconfig-r2107-20261114    gcc-14.4.0 cocci
arm64                randconfig-r2107-20261115    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261115    gcc-11.5.0 cocci
arm64                randconfig-r2110-20261115    gcc-8.5.0  cocci
arm64                randconfig-r2304-20261115    gcc-14     sparse
arm64                randconfig-r2306-20261115    clang-20   sparse
arm64                randconfig-r2307-20261115    clang-20   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261116    gcc-10.5.0
csky                  randconfig-1001-20261116    gcc-10.5.0
csky                  randconfig-2000-20261114    gcc-16.2.0
csky                  randconfig-2000-20261115    gcc-14.4.0
csky                  randconfig-2001-20261114    gcc-16.2.0
csky                  randconfig-2001-20261115    gcc-14.4.0
csky                  randconfig-2200-20261114    gcc-16.2.0 smatch
csky                  randconfig-2200-20261115    gcc-12.5.0 smatch
csky                 randconfig-r2103-20261114    gcc-12.5.0 cocci
csky                 randconfig-r2105-20261114    gcc-16.2.0 cocci
csky                 randconfig-r2106-20261114    gcc-10.5.0 cocci
csky                 randconfig-r2106-20261115    gcc-16.2.0 cocci
csky                 randconfig-r2110-20261115    gcc-8.5.0  cocci
csky                 randconfig-r2301-20261115    gcc-8.5.0  sparse
csky                 randconfig-r2302-20261115    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261115    gcc-15.3.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261116    clang-17
hexagon               randconfig-1001-20261116    clang-17
hexagon               randconfig-2000-20261114    gcc-16.2.0
hexagon               randconfig-2000-20261115    gcc-14.4.0
hexagon               randconfig-2001-20261114    gcc-16.2.0
hexagon               randconfig-2001-20261115    gcc-14.4.0
hexagon               randconfig-2200-20261114    clang-24   smatch
hexagon               randconfig-2200-20261115    clang-24   smatch
hexagon              randconfig-r2103-20261114    gcc-11.5.0 cocci
hexagon              randconfig-r2106-20261114    clang-24   cocci
hexagon              randconfig-r2108-20261114    clang-24   cocci
hexagon              randconfig-r2109-20261115    gcc-8.5.0  cocci
hexagon              randconfig-r2110-20261115    gcc-10.5.0 cocci
hexagon              randconfig-r2111-20261114    gcc-10.5.0 cocci
hexagon              randconfig-r2300-20261114    gcc-16.2.0 sparse
hexagon              randconfig-r2301-20261114    clang-24   sparse
hexagon              randconfig-r2301-20261114    gcc-12.5.0 sparse
hexagon              randconfig-r2304-20261115    gcc-16.2.0 sparse
hexagon              randconfig-r2305-20261115    gcc-16.2.0 sparse
hexagon              randconfig-r2310-20261115    clang-20   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261116    gcc-14
i386        buildonly-randconfig-1001-20261116    gcc-14
i386        buildonly-randconfig-1002-20261116    gcc-14
i386        buildonly-randconfig-1003-20261116    gcc-14
i386        buildonly-randconfig-1004-20261116    gcc-14
i386        buildonly-randconfig-1005-20261116    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261116    gcc-14
i386                  randconfig-1001-20261116    gcc-14
i386                  randconfig-1002-20261116    gcc-14
i386                  randconfig-1003-20261116    gcc-14
i386                  randconfig-1004-20261116    gcc-14
i386                  randconfig-1005-20261116    gcc-14
i386                  randconfig-1006-20261116    gcc-14
i386                  randconfig-1007-20261116    gcc-12
i386                  randconfig-1008-20261116    gcc-12
i386                  randconfig-1009-20261116    gcc-12
i386                  randconfig-1010-20261116    gcc-12
i386                  randconfig-1011-20261116    gcc-12
i386                  randconfig-1012-20261116    gcc-12
i386                  randconfig-1013-20261116    gcc-12
i386                  randconfig-2000-20261114    clang-22
i386                  randconfig-2000-20261115    gcc-14
i386                  randconfig-2001-20261114    clang-22
i386                  randconfig-2001-20261115    gcc-14
i386                  randconfig-2002-20261114    clang-22
i386                  randconfig-2002-20261115    gcc-14
i386                  randconfig-2003-20261114    clang-22
i386                  randconfig-2003-20261115    gcc-14
i386                  randconfig-2004-20261114    clang-22
i386                  randconfig-2004-20261115    gcc-14
i386                  randconfig-2005-20261114    clang-22
i386                  randconfig-2005-20261115    gcc-14
i386                  randconfig-2100-20261114    gcc-14     cocci
i386                  randconfig-2100-20261115    gcc-14     cocci
i386                  randconfig-2101-20261114    gcc-14     cocci
i386                  randconfig-2101-20261115    gcc-14     cocci
i386                  randconfig-2102-20261114    gcc-14     cocci
i386                  randconfig-2102-20261115    gcc-14     cocci
i386                  randconfig-2103-20261114    gcc-14     cocci
i386                  randconfig-2103-20261115    gcc-14     cocci
i386                  randconfig-2104-20261114    gcc-14     cocci
i386                  randconfig-2104-20261115    gcc-14     cocci
i386                  randconfig-2105-20261114    gcc-14     cocci
i386                  randconfig-2105-20261115    gcc-14     cocci
i386                  randconfig-2200-20261114    gcc-14     smatch
i386                  randconfig-2200-20261115    gcc-14     smatch
i386                  randconfig-2300-20261114    clang-22   sparse
i386                  randconfig-2300-20261115    clang-22   sparse
i386                  randconfig-2301-20261114    clang-22   sparse
i386                  randconfig-2301-20261115    clang-22   sparse
i386                  randconfig-2302-20261114    clang-22   sparse
i386                  randconfig-2302-20261115    clang-22   sparse
i386                 randconfig-r2102-20261114    clang-22   cocci
i386                 randconfig-r2109-20261114    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261115    gcc-10.5.0 cocci
i386                 randconfig-r2300-20261115    gcc-8.5.0  sparse
i386                 randconfig-r2302-20261114    clang-22   sparse
i386                 randconfig-r2304-20261115    gcc-14.4.0 sparse
i386                 randconfig-r2304-20261115    gcc-8.5.0  sparse
i386                 randconfig-r2309-20261115    gcc-8.5.0  sparse
i386                 randconfig-r2311-20261114    clang-24   sparse
i386                 randconfig-r2311-20261115    clang-20   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261116    clang-17
loongarch             randconfig-1001-20261116    clang-17
loongarch             randconfig-2000-20261114    gcc-11.5.0
loongarch             randconfig-2000-20261115    gcc-8.5.0
loongarch             randconfig-2001-20261114    gcc-11.5.0
loongarch             randconfig-2001-20261115    gcc-8.5.0
loongarch             randconfig-2200-20261114    clang-18   smatch
loongarch             randconfig-2200-20261115    gcc-16.2.0 smatch
loongarch            randconfig-r2105-20261114    gcc-11.5.0 cocci
loongarch            randconfig-r2105-20261114    gcc-12.5.0 cocci
loongarch            randconfig-r2303-20261114    gcc-12.5.0 sparse
loongarch            randconfig-r2303-20261114    gcc-9.5.0  sparse
loongarch            randconfig-r2304-20261114    gcc-12.5.0 sparse
loongarch            randconfig-r2308-20261114    clang-24   sparse
loongarch            randconfig-r2309-20261114    clang-22   sparse
loongarch            randconfig-r2309-20261115    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                        m5249evb_defconfig    gcc-14
m68k                         m5272c3_defconfig    gcc-14
m68k                        m5282evb_defconfig    gcc-14
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261114    gcc-12.5.0
m68k                  randconfig-2000-20261115    gcc-8.5.0
m68k                  randconfig-2001-20261114    gcc-12.5.0
m68k                  randconfig-2001-20261115    gcc-8.5.0
m68k                  randconfig-2200-20261114    gcc-16.2.0 smatch
m68k                  randconfig-2200-20261115    gcc-8.5.0  smatch
m68k                 randconfig-r2103-20261114    clang-22   cocci
m68k                 randconfig-r2105-20261114    clang-24   cocci
m68k                 randconfig-r2106-20261115    gcc-10.5.0 cocci
m68k                 randconfig-r2107-20261114    clang-24   cocci
m68k                 randconfig-r2108-20261114    gcc-16.2.0 cocci
m68k                 randconfig-r2110-20261114    gcc-16.2.0 cocci
m68k                 randconfig-r2111-20261114    gcc-14.4.0 cocci
m68k                 randconfig-r2111-20261115    gcc-16.2.0 cocci
m68k                 randconfig-r2111-20261115    gcc-8.5.0  cocci
m68k                 randconfig-r2302-20261115    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20261114    gcc-16.2.0 sparse
m68k                 randconfig-r2306-20261115    gcc-8.5.0  sparse
m68k                 randconfig-r2311-20261114    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261114    gcc-12.5.0
microblaze            randconfig-2000-20261115    gcc-8.5.0
microblaze            randconfig-2001-20261114    gcc-12.5.0
microblaze            randconfig-2001-20261115    gcc-8.5.0
microblaze            randconfig-2200-20261114    gcc-9.5.0  smatch
microblaze            randconfig-2200-20261115    gcc-12.5.0 smatch
microblaze           randconfig-r2101-20261114    clang-22   cocci
microblaze           randconfig-r2101-20261115    gcc-15.3.0 cocci
microblaze           randconfig-r2102-20261114    gcc-11.5.0 cocci
microblaze           randconfig-r2108-20261115    gcc-16.2.0 cocci
microblaze           randconfig-r2109-20261115    gcc-10.5.0 cocci
microblaze           randconfig-r2300-20261114    gcc-9.5.0  sparse
microblaze           randconfig-r2301-20261115    gcc-8.5.0  sparse
microblaze           randconfig-r2303-20261114    clang-24   sparse
microblaze           randconfig-r2303-20261115    gcc-14     sparse
microblaze           randconfig-r2308-20261115    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    clang-17
mips                          cobalt_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-14
mips                            ip28_defconfig    clang-24
mips                            jazz_defconfig    gcc-14
mips                            jazz_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261114    clang-24
mips                  randconfig-2000-20261114    gcc-16.2.0
mips                  randconfig-2000-20261115    gcc-10.5.0
mips                  randconfig-2001-20261114    gcc-16.2.0
mips                  randconfig-2001-20261114    gcc-8.5.0
mips                  randconfig-2001-20261115    gcc-10.5.0
mips                  randconfig-2002-20261114    gcc-13.5.0
mips                  randconfig-2002-20261114    gcc-16.2.0
mips                  randconfig-2002-20261115    gcc-10.5.0
mips                  randconfig-2200-20261114    gcc-15.3.0 smatch
mips                  randconfig-2200-20261115    clang-24   smatch
mips                 randconfig-r2100-20261114    clang-24   cocci
mips                 randconfig-r2101-20261114    clang-24   cocci
mips                 randconfig-r2107-20261114    clang-24   cocci
mips                 randconfig-r2107-20261115    clang-17   cocci
mips                 randconfig-r2111-20261115    clang-17   cocci
mips                 randconfig-r2111-20261115    gcc-13.5.0 cocci
mips                 randconfig-r2300-20261115    clang-24   sparse
mips                 randconfig-r2309-20261114    gcc-12.5.0 sparse
mips                            rs90_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261116    clang-17
nios2                 randconfig-1001-20261116    clang-17
nios2                 randconfig-2000-20261114    gcc-11.5.0
nios2                 randconfig-2000-20261115    gcc-8.5.0
nios2                 randconfig-2001-20261114    gcc-11.5.0
nios2                 randconfig-2001-20261115    gcc-8.5.0
nios2                 randconfig-2200-20261114    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261115    gcc-11.5.0 smatch
nios2                randconfig-r2103-20261115    gcc-14     cocci
nios2                randconfig-r2105-20261114    clang-24   cocci
nios2                randconfig-r2106-20261114    gcc-14.4.0 cocci
nios2                randconfig-r2106-20261115    gcc-11.5.0 cocci
nios2                randconfig-r2107-20261115    gcc-10.5.0 cocci
nios2                randconfig-r2301-20261115    gcc-14.4.0 sparse
nios2                randconfig-r2302-20261115    clang-24   sparse
nios2                randconfig-r2303-20261114    gcc-16.2.0 sparse
nios2                randconfig-r2307-20261115    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261115    clang-17   sparse
nios2                randconfig-r2310-20261115    gcc-16.2.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261114    gcc-16.2.0
openrisc              randconfig-2000-20261115    gcc-10.5.0
openrisc              randconfig-2001-20261114    gcc-16.2.0
openrisc              randconfig-2001-20261114    gcc-9.5.0
openrisc              randconfig-2001-20261115    gcc-10.5.0
openrisc              randconfig-2002-20261114    gcc-16.2.0
openrisc              randconfig-2002-20261115    gcc-10.5.0
openrisc              randconfig-2200-20261114    gcc-16.2.0 smatch
openrisc              randconfig-2200-20261115    gcc-12.5.0 smatch
openrisc             randconfig-r2100-20261114    clang-22   cocci
openrisc             randconfig-r2101-20261114    gcc-16.2.0 cocci
openrisc             randconfig-r2102-20261114    gcc-16.2.0 cocci
openrisc             randconfig-r2103-20261115    gcc-15.3.0 cocci
openrisc             randconfig-r2104-20261114    clang-24   cocci
openrisc             randconfig-r2107-20261115    gcc-11.5.0 cocci
openrisc             randconfig-r2108-20261114    gcc-10.5.0 cocci
openrisc             randconfig-r2108-20261114    gcc-14.4.0 cocci
openrisc             randconfig-r2109-20261114    clang-24   cocci
openrisc             randconfig-r2305-20261115    gcc-14     sparse
openrisc             randconfig-r2306-20261115    gcc-16.2.0 sparse
openrisc             randconfig-r2308-20261115    clang-20   sparse
openrisc             randconfig-r2311-20261114    gcc-12.5.0 sparse
openrisc             randconfig-r2311-20261114    gcc-16.2.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261116    gcc-16.2.0
parisc                randconfig-1001-20261116    gcc-16.2.0
parisc                randconfig-2000-20261114    gcc-11.5.0
parisc                randconfig-2000-20261115    gcc-8.5.0
parisc                randconfig-2001-20261114    gcc-11.5.0
parisc                randconfig-2001-20261115    gcc-8.5.0
parisc                randconfig-2200-20261114    gcc-8.5.0  smatch
parisc                randconfig-2200-20261115    gcc-10.5.0 smatch
parisc               randconfig-r2101-20261114    gcc-11.5.0 cocci
parisc               randconfig-r2102-20261115    gcc-15.3.0 cocci
parisc               randconfig-r2103-20261114    clang-24   cocci
parisc               randconfig-r2105-20261115    gcc-14     cocci
parisc               randconfig-r2106-20261115    gcc-8.5.0  cocci
parisc               randconfig-r2108-20261115    gcc-8.5.0  cocci
parisc               randconfig-r2111-20261114    gcc-13.5.0 cocci
parisc               randconfig-r2307-20261115    gcc-15.3.0 sparse
parisc               randconfig-r2308-20261115    gcc-11.5.0 sparse
parisc               randconfig-r2309-20261115    clang-20   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    clang-17
powerpc                       ep88xc_defconfig    clang-24
powerpc                     gamecube_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                  linkstation_defconfig    gcc-16.2.0
powerpc                   mpc885_ads_defconfig    clang-24
powerpc                     mvme5100_defconfig    clang-24
powerpc                      powernv_defconfig    clang-24
powerpc                       ppc44x_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261116    gcc-16.2.0
powerpc               randconfig-1001-20261116    gcc-16.2.0
powerpc               randconfig-2000-20261114    gcc-8.5.0
powerpc               randconfig-2000-20261115    gcc-8.5.0
powerpc               randconfig-2001-20261114    gcc-8.5.0
powerpc               randconfig-2001-20261115    gcc-8.5.0
powerpc               randconfig-2002-20261114    gcc-8.5.0
powerpc               randconfig-2002-20261115    gcc-8.5.0
powerpc               randconfig-2200-20261114    clang-24   smatch
powerpc               randconfig-2200-20261115    clang-17   smatch
powerpc              randconfig-r2100-20261115    clang-17   cocci
powerpc              randconfig-r2101-20261114    clang-24   cocci
powerpc              randconfig-r2103-20261114    gcc-16.2.0 cocci
powerpc              randconfig-r2104-20261114    clang-24   cocci
powerpc              randconfig-r2106-20261115    clang-17   cocci
powerpc              randconfig-r2108-20261115    gcc-8.5.0  cocci
powerpc              randconfig-r2109-20261114    gcc-14.4.0 cocci
powerpc              randconfig-r2109-20261114    gcc-16.2.0 cocci
powerpc              randconfig-r2300-20261114    clang-24   sparse
powerpc              randconfig-r2301-20261115    clang-24   sparse
powerpc              randconfig-r2306-20261114    gcc-12.5.0 sparse
powerpc              randconfig-r2307-20261115    gcc-16.2.0 sparse
powerpc                     sam440ep_defconfig    clang-24
powerpc                      stx_gp3_defconfig    clang-24
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc                         warp_defconfig    clang-24
powerpc64             randconfig-1000-20261116    gcc-16.2.0
powerpc64             randconfig-1001-20261116    gcc-16.2.0
powerpc64             randconfig-2000-20261114    gcc-8.5.0
powerpc64             randconfig-2000-20261115    gcc-8.5.0
powerpc64             randconfig-2001-20261114    gcc-8.5.0
powerpc64             randconfig-2001-20261115    gcc-8.5.0
powerpc64             randconfig-2002-20261114    gcc-8.5.0
powerpc64             randconfig-2002-20261115    gcc-8.5.0
powerpc64             randconfig-2200-20261114    clang-17   smatch
powerpc64             randconfig-2200-20261115    clang-24   smatch
powerpc64            randconfig-r2100-20261115    gcc-15.3.0 cocci
powerpc64            randconfig-r2102-20261114    clang-24   cocci
powerpc64            randconfig-r2104-20261115    gcc-15.3.0 cocci
powerpc64            randconfig-r2105-20261114    clang-22   cocci
powerpc64            randconfig-r2105-20261115    gcc-15.3.0 cocci
powerpc64            randconfig-r2106-20261114    gcc-16.2.0 cocci
powerpc64            randconfig-r2107-20261115    gcc-8.5.0  cocci
powerpc64            randconfig-r2301-20261115    gcc-16.2.0 sparse
powerpc64            randconfig-r2304-20261115    clang-24   sparse
powerpc64            randconfig-r2306-20261114    gcc-16.2.0 sparse
powerpc64            randconfig-r2307-20261114    clang-24   sparse
powerpc64            randconfig-r2310-20261114    gcc-12.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261116    clang-17
riscv                 randconfig-1001-20261116    clang-17
riscv                 randconfig-2000-20261114    gcc-12.5.0
riscv                 randconfig-2000-20261115    gcc-8.5.0
riscv                 randconfig-2001-20261114    gcc-12.5.0
riscv                 randconfig-2001-20261115    gcc-8.5.0
riscv                 randconfig-2002-20261114    gcc-12.5.0
riscv                 randconfig-2002-20261115    gcc-8.5.0
riscv                 randconfig-2003-20261114    gcc-12.5.0
riscv                 randconfig-2003-20261115    gcc-8.5.0
riscv                 randconfig-2004-20261114    gcc-12.5.0
riscv                 randconfig-2004-20261115    gcc-8.5.0
riscv                 randconfig-2005-20261114    gcc-12.5.0
riscv                 randconfig-2005-20261115    gcc-8.5.0
riscv                 randconfig-2200-20261114    clang-24   smatch
riscv                 randconfig-2200-20261115    clang-24   smatch
riscv                randconfig-r2101-20261114    gcc-12.5.0 cocci
riscv                randconfig-r2104-20261114    clang-22   cocci
riscv                randconfig-r2104-20261114    gcc-16.2.0 cocci
riscv                randconfig-r2108-20261114    gcc-13.5.0 cocci
riscv                randconfig-r2108-20261115    gcc-11.5.0 cocci
riscv                randconfig-r2300-20261115    gcc-14.4.0 sparse
riscv                randconfig-r2301-20261114    gcc-9.5.0  sparse
riscv                randconfig-r2305-20261115    gcc-8.5.0  sparse
riscv                randconfig-r2309-20261115    gcc-15.3.0 sparse
riscv                randconfig-r2310-20261115    clang-17   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261116    clang-17
s390                  randconfig-1001-20261116    clang-17
s390                  randconfig-2000-20261114    clang-24
s390                  randconfig-2000-20261115    gcc-13.5.0
s390                  randconfig-2001-20261114    clang-24
s390                  randconfig-2001-20261115    gcc-13.5.0
s390                  randconfig-2002-20261114    clang-24
s390                  randconfig-2002-20261115    gcc-13.5.0
s390                  randconfig-2003-20261114    clang-24
s390                  randconfig-2003-20261115    gcc-13.5.0
s390                  randconfig-2004-20261114    clang-24
s390                  randconfig-2004-20261115    gcc-13.5.0
s390                  randconfig-2005-20261114    clang-24
s390                  randconfig-2005-20261115    gcc-13.5.0
s390                  randconfig-2200-20261114    clang-24   smatch
s390                  randconfig-2200-20261115    clang-24   smatch
s390                 randconfig-r2102-20261114    clang-24   cocci
s390                 randconfig-r2108-20261114    clang-24   cocci
s390                 randconfig-r2110-20261114    gcc-13.5.0 cocci
s390                 randconfig-r2301-20261114    gcc-16.2.0 sparse
s390                 randconfig-r2302-20261115    gcc-14     sparse
s390                 randconfig-r2304-20261114    clang-22   sparse
s390                 randconfig-r2304-20261114    gcc-9.5.0  sparse
s390                 randconfig-r2307-20261115    gcc-8.5.0  sparse
s390                 randconfig-r2308-20261114    gcc-16.2.0 sparse
s390                 randconfig-r2309-20261114    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261116    clang-17
sh                    randconfig-1001-20261116    clang-17
sh                    randconfig-2000-20261114    gcc-13.5.0
sh                    randconfig-2000-20261115    gcc-12.5.0
sh                    randconfig-2001-20261114    gcc-13.5.0
sh                    randconfig-2001-20261115    gcc-12.5.0
sh                    randconfig-2002-20261114    gcc-13.5.0
sh                    randconfig-2002-20261115    gcc-12.5.0
sh                    randconfig-2003-20261114    gcc-13.5.0
sh                    randconfig-2003-20261115    gcc-12.5.0
sh                    randconfig-2004-20261114    gcc-13.5.0
sh                    randconfig-2004-20261115    gcc-12.5.0
sh                    randconfig-2005-20261114    gcc-13.5.0
sh                    randconfig-2005-20261115    gcc-12.5.0
sh                    randconfig-2200-20261114    gcc-9.5.0  smatch
sh                    randconfig-2200-20261115    gcc-16.2.0 smatch
sh                   randconfig-r2100-20261115    gcc-15.3.0 cocci
sh                   randconfig-r2102-20261115    gcc-8.5.0  cocci
sh                   randconfig-r2107-20261114    gcc-16.2.0 cocci
sh                   randconfig-r2107-20261115    gcc-16.2.0 cocci
sh                   randconfig-r2110-20261114    clang-24   cocci
sh                   randconfig-r2110-20261114    gcc-14.4.0 cocci
sh                   randconfig-r2302-20261114    gcc-12.5.0 sparse
sh                   randconfig-r2302-20261114    gcc-9.5.0  sparse
sh                   randconfig-r2303-20261115    gcc-14.4.0 sparse
sh                   randconfig-r2303-20261115    gcc-16.2.0 sparse
sh                   randconfig-r2304-20261114    clang-24   sparse
sh                   randconfig-r2304-20261115    gcc-8.5.0  sparse
sh                   randconfig-r2305-20261114    gcc-12.5.0 sparse
sh                   randconfig-r2307-20261114    gcc-16.2.0 sparse
sh                   randconfig-r2311-20261114    clang-22   sparse
sh                           sdk7786_defconfig    clang-17
sh                            se7206_defconfig    clang-17
sh                            se7619_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-14
sh                               ul2_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261116    gcc-16.2.0
sparc                 randconfig-1001-20261116    gcc-16.2.0
sparc                 randconfig-2000-20261114    clang-21
sparc                 randconfig-2000-20261115    clang-24
sparc                 randconfig-2001-20261114    clang-21
sparc                 randconfig-2001-20261115    clang-24
sparc                 randconfig-2200-20261114    gcc-8.5.0  smatch
sparc                 randconfig-2200-20261115    gcc-16.2.0 smatch
sparc                randconfig-r2101-20261115    gcc-15.3.0 cocci
sparc                randconfig-r2102-20261115    clang-17   cocci
sparc                randconfig-r2102-20261115    gcc-15.3.0 cocci
sparc                randconfig-r2106-20261114    clang-24   cocci
sparc                randconfig-r2111-20261114    gcc-16.2.0 cocci
sparc                randconfig-r2305-20261114    clang-22   sparse
sparc                randconfig-r2305-20261115    clang-24   sparse
sparc                randconfig-r2306-20261115    gcc-15.3.0 sparse
sparc                randconfig-r2309-20261115    clang-17   sparse
sparc                randconfig-r2311-20261115    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261116    gcc-16.2.0
sparc64               randconfig-1001-20261116    gcc-16.2.0
sparc64               randconfig-2000-20261114    clang-21
sparc64               randconfig-2000-20261115    clang-24
sparc64               randconfig-2001-20261114    clang-21
sparc64               randconfig-2001-20261115    clang-24
sparc64               randconfig-2200-20261114    gcc-16.2.0 smatch
sparc64               randconfig-2200-20261115    gcc-13.5.0 smatch
sparc64              randconfig-r2100-20261115    gcc-15.3.0 cocci
sparc64              randconfig-r2107-20261115    gcc-13.5.0 cocci
sparc64              randconfig-r2111-20261114    clang-24   cocci
sparc64              randconfig-r2300-20261115    gcc-8.5.0  sparse
sparc64              randconfig-r2301-20261114    clang-22   sparse
sparc64              randconfig-r2302-20261114    gcc-16.2.0 sparse
sparc64              randconfig-r2303-20261115    gcc-8.5.0  sparse
sparc64              randconfig-r2305-20261114    gcc-9.5.0  sparse
sparc64              randconfig-r2305-20261115    gcc-14.4.0 sparse
sparc64              randconfig-r2308-20261114    gcc-12.5.0 sparse
sparc64              randconfig-r2309-20261114    clang-24   sparse
sparc64              randconfig-r2309-20261114    gcc-16.2.0 sparse
sparc64              randconfig-r2311-20261115    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261116    gcc-16.2.0
um                    randconfig-1001-20261116    gcc-16.2.0
um                    randconfig-2000-20261114    clang-21
um                    randconfig-2000-20261115    clang-24
um                    randconfig-2001-20261114    clang-21
um                    randconfig-2001-20261115    clang-24
um                    randconfig-2200-20261114    gcc-14     smatch
um                    randconfig-2200-20261115    clang-24   smatch
um                   randconfig-r2100-20261114    clang-24   cocci
um                   randconfig-r2100-20261115    gcc-14     cocci
um                   randconfig-r2104-20261115    gcc-14     cocci
um                   randconfig-r2109-20261115    gcc-11.5.0 cocci
um                   randconfig-r2109-20261115    gcc-16.2.0 cocci
um                   randconfig-r2110-20261115    clang-17   cocci
um                   randconfig-r2110-20261115    gcc-16.2.0 cocci
um                   randconfig-r2111-20261114    clang-24   cocci
um                   randconfig-r2111-20261115    gcc-11.5.0 cocci
um                   randconfig-r2300-20261115    gcc-16.2.0 sparse
um                   randconfig-r2302-20261115    gcc-14.4.0 sparse
um                   randconfig-r2306-20261114    clang-22   sparse
um                   randconfig-r2308-20261114    clang-24   sparse
um                   randconfig-r2310-20261115    gcc-11.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261116    gcc-14
x86_64      buildonly-randconfig-1001-20261116    gcc-14
x86_64      buildonly-randconfig-1002-20261116    gcc-14
x86_64      buildonly-randconfig-1003-20261116    gcc-14
x86_64      buildonly-randconfig-1004-20261116    gcc-14
x86_64      buildonly-randconfig-1005-20261116    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261116    gcc-14
x86_64                randconfig-1001-20261116    gcc-14
x86_64                randconfig-1002-20261116    gcc-14
x86_64                randconfig-1003-20261116    gcc-14
x86_64                randconfig-1004-20261116    gcc-14
x86_64                randconfig-1005-20261116    gcc-14
x86_64                randconfig-1006-20261116    clang-22
x86_64                randconfig-1007-20261116    clang-22
x86_64                randconfig-1008-20261116    clang-22
x86_64                randconfig-1009-20261116    clang-22
x86_64                randconfig-1010-20261116    clang-22
x86_64                randconfig-1011-20261116    clang-22
x86_64                randconfig-1012-20261116    clang-22
x86_64                randconfig-1013-20261116    clang-22
x86_64                randconfig-1014-20261116    clang-22
x86_64                randconfig-1015-20261116    clang-22
x86_64                randconfig-1016-20261116    clang-22
x86_64                randconfig-1017-20261116    clang-22
x86_64                randconfig-2000-20261114    gcc-14
x86_64                randconfig-2000-20261115    gcc-14
x86_64                randconfig-2001-20261114    gcc-14
x86_64                randconfig-2001-20261115    gcc-14
x86_64                randconfig-2002-20261114    gcc-14
x86_64                randconfig-2002-20261115    gcc-14
x86_64                randconfig-2003-20261114    gcc-14
x86_64                randconfig-2003-20261115    gcc-14
x86_64                randconfig-2004-20261114    gcc-14
x86_64                randconfig-2004-20261115    gcc-14
x86_64                randconfig-2005-20261114    gcc-14
x86_64                randconfig-2005-20261115    gcc-14
x86_64                randconfig-2100-20261114    gcc-14     cocci
x86_64                randconfig-2100-20261115    clang-22   cocci
x86_64                randconfig-2101-20261114    gcc-14     cocci
x86_64                randconfig-2101-20261115    clang-22   cocci
x86_64                randconfig-2102-20261114    gcc-14     cocci
x86_64                randconfig-2102-20261115    clang-22   cocci
x86_64                randconfig-2103-20261114    gcc-14     cocci
x86_64                randconfig-2103-20261115    clang-22   cocci
x86_64                randconfig-2104-20261114    gcc-14     cocci
x86_64                randconfig-2104-20261115    clang-22   cocci
x86_64                randconfig-2105-20261114    gcc-14     cocci
x86_64                randconfig-2105-20261115    clang-22   cocci
x86_64                randconfig-2200-20261114    gcc-14     smatch
x86_64                randconfig-2200-20261115    clang-22   smatch
x86_64                randconfig-2300-20261114    clang-22   sparse
x86_64                randconfig-2300-20261115    clang-22   sparse
x86_64                randconfig-2301-20261114    clang-22   sparse
x86_64                randconfig-2301-20261115    clang-22   sparse
x86_64                randconfig-2302-20261114    clang-22   sparse
x86_64                randconfig-2302-20261115    clang-22   sparse
x86_64               randconfig-r2101-20261115    gcc-14     cocci
x86_64               randconfig-r2102-20261115    gcc-15.3.0 cocci
x86_64               randconfig-r2104-20261114    gcc-11.5.0 cocci
x86_64               randconfig-r2104-20261115    clang-17   cocci
x86_64               randconfig-r2105-20261115    gcc-15.3.0 cocci
x86_64               randconfig-r2105-20261115    gcc-8.5.0  cocci
x86_64               randconfig-r2109-20261114    clang-24   cocci
x86_64               randconfig-r2110-20261114    clang-24   cocci
x86_64               randconfig-r2110-20261115    gcc-13.5.0 cocci
x86_64               randconfig-r2300-20261114    gcc-12.5.0 sparse
x86_64               randconfig-r2300-20261115    gcc-14     sparse
x86_64               randconfig-r2302-20261115    gcc-8.5.0  sparse
x86_64               randconfig-r2303-20261115    gcc-8.5.0  sparse
x86_64               randconfig-r2307-20261114    clang-22   sparse
x86_64               randconfig-r2307-20261114    clang-24   sparse
x86_64               randconfig-r2310-20261114    gcc-16.2.0 sparse
x86_64               randconfig-r2311-20261115    clang-17   sparse
x86_64               randconfig-r2311-20261115    gcc-16.2.0 sparse
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
xtensa                randconfig-1000-20261116    gcc-16.2.0
xtensa                randconfig-1001-20261116    gcc-16.2.0
xtensa                randconfig-2000-20261114    gcc-16.2.0
xtensa                randconfig-2000-20261115    gcc-14.4.0
xtensa                randconfig-2001-20261114    gcc-16.2.0
xtensa                randconfig-2001-20261115    gcc-14.4.0
xtensa                randconfig-2200-20261115    gcc-14.4.0 smatch
xtensa               randconfig-r2100-20261114    gcc-11.5.0 cocci
xtensa               randconfig-r2100-20261114    gcc-16.2.0 cocci
xtensa               randconfig-r2106-20261115    gcc-13.5.0 cocci
xtensa               randconfig-r2107-20261114    gcc-10.5.0 cocci
xtensa               randconfig-r2107-20261114    gcc-13.5.0 cocci
xtensa               randconfig-r2109-20261114    gcc-13.5.0 cocci
xtensa               randconfig-r2300-20261114    clang-22   sparse
xtensa               randconfig-r2303-20261115    clang-24   sparse
xtensa               randconfig-r2304-20261114    gcc-16.2.0 sparse
xtensa               randconfig-r2305-20261114    clang-24   sparse
xtensa               randconfig-r2306-20261114    clang-24   sparse
xtensa               randconfig-r2306-20261115    clang-17   sparse
xtensa               randconfig-r2308-20261114    clang-22   sparse
xtensa               randconfig-r2308-20261115    gcc-16.2.0 sparse
xtensa               randconfig-r2309-20261115    gcc-16.2.0 sparse
xtensa               randconfig-r2310-20261114    clang-22   sparse
xtensa               randconfig-r2310-20261115    gcc-15.3.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

