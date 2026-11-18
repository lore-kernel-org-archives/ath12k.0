Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8481606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WokCu4oW;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gg0btoYu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=44zjPr+uVI2V8boP8dmoyArpMGXhiWdTd6KmGQ0/lcc=; b=WokCu4oW6a6QGfH2PrJreqf3lV
	fL0ApITQ1a6yqIy4ZfXc1xLXPsQ5OGs69fh9avikNVzgG567PIZZsnTufsA/gIfe1sXa7gYL4+Da3
	qhdaK0ymH8qOrye63s/6m8eJSOv18zllg53L0roHXYtJKZs6jKIVCBjwOrYQe59XWse4k94zP335r
	3iUpT7S6t5YXm+SLM0PzUAlk0LEe2TEW1OUjWJh7LLTH5cmYIDmSU/7Vgrl080sHUeP8uIh2LpF0P
	JsUIQYtgvB//pXwgNSci95wsVh3/5RWmNte9rZT/Ioifb9Kwu1xJJTBYuX7iPMGxF+0fezBqs9p44
	zpZK6xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiFA-00000009Pzn-3C3y;
	Wed, 18 Nov 2026 16:10:44 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiF7-00000009Pyh-0gbb
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 16:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795018241; x=1826554241;
  h=date:from:to:cc:subject:message-id;
  bh=95fXeHbCfbROSCaGUbmemO3GY265j7bNf+YUXwAC73U=;
  b=Gg0btoYuxJrMwiC0yN65tNp1pX0vWvAxk6V38ibElYghs7C7q7sbaY58
   3wMkRIZyTzV7x0VHjK2ysM4OuilA9PgC+0FdmQHS5BcwA39/iiNUjAPSK
   8iLG6zMx0tK1A/5bHTAfy6YcKIC3UmR0gpxN44MuuiVOss9pZNUdYH3G+
   Fp/FfVRLhtn1O+y64V1eWhYavYSDlUge0ZFAXPdDjqHAKylf21vg8vmnR
   3541BhlREnXYj3osImf97RhzGfHwoVR9sh3zGFtHqhMLkgr4BvklEb0GQ
   lYbL06gvS9skhoj51JPlTFkWYOD5732zD/2poRz05hMBrtKXJCSDaMpWy
   A==;
X-CSE-ConnectionGUID: A7UkYeHCTPqTbHyL7pecJg==
X-CSE-MsgGUID: 16wyTAoiSd+gj9I+kqlYRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3934686"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3934686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:10:24 -0800
X-CSE-ConnectionGUID: vQ6C4SfFTuiyTxz0fbityw==
X-CSE-MsgGUID: 4ARrmXBxT3Ka8/RFp+VAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10414776"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2026 08:10:22 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiEm-00000001DoU-1I4g;
	Wed, 18 Nov 2026 16:10:20 +0000
Date: Thu, 19 Nov 2026 00:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 4016f6c3149e7e3faccc1654db6a3030c069383a
Message-ID: <20261119000923.rADfcQOH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081041_249216_7B5A9079 
X-CRM114-Status: UNSURE (   4.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 4016f6c3149e7e3faccc1654db6a3030c069383a  .mailmap: add entries for Tamizh Chelvam Raja

elapsed time: 1505m

configs tested: 700
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261117    gcc-15.3.0
alpha                 randconfig-2000-20261118    gcc-16.2.0
alpha                 randconfig-2001-20261117    gcc-15.3.0
alpha                 randconfig-2001-20261118    gcc-16.2.0
alpha                 randconfig-2200-20261117    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261118    gcc-13.5.0 smatch
alpha                randconfig-r2102-20261117    gcc-13.5.0 cocci
alpha                randconfig-r2105-20261118    gcc-14.4.0 cocci
alpha                randconfig-r2106-20261117    clang-24   cocci
alpha                randconfig-r2110-20261117    gcc-16.2.0 cocci
alpha                randconfig-r2111-20261117    gcc-14     cocci
alpha                randconfig-r2111-20261117    gcc-16.2.0 cocci
alpha                randconfig-r2300-20261117    gcc-8.5.0  sparse
alpha                randconfig-r2301-20261117    gcc-14.4.0 sparse
alpha                randconfig-r2301-20261117    gcc-8.5.0  sparse
alpha                randconfig-r2302-20261117    gcc-8.5.0  sparse
alpha                randconfig-r2305-20261117    gcc-8.5.0  sparse
alpha                randconfig-r2309-20261117    gcc-14.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261118    gcc-10.5.0
arc                   randconfig-1001-20261118    gcc-10.5.0
arc                   randconfig-2000-20261117    gcc-12.5.0
arc                   randconfig-2000-20261118    gcc-11.5.0
arc                   randconfig-2001-20261117    gcc-12.5.0
arc                   randconfig-2001-20261118    gcc-11.5.0
arc                   randconfig-2002-20261117    gcc-12.5.0
arc                   randconfig-2002-20261118    gcc-11.5.0
arc                   randconfig-2003-20261117    gcc-12.5.0
arc                   randconfig-2003-20261118    gcc-11.5.0
arc                   randconfig-2004-20261117    gcc-12.5.0
arc                   randconfig-2004-20261118    gcc-11.5.0
arc                   randconfig-2005-20261117    gcc-12.5.0
arc                   randconfig-2005-20261118    gcc-11.5.0
arc                   randconfig-2200-20261117    gcc-8.5.0  smatch
arc                   randconfig-2200-20261118    gcc-9.5.0  smatch
arc                  randconfig-r2100-20261117    gcc-11.5.0 cocci
arc                  randconfig-r2101-20261118    clang-24   cocci
arc                  randconfig-r2102-20261117    gcc-14     cocci
arc                  randconfig-r2104-20261118    gcc-14.4.0 cocci
arc                  randconfig-r2106-20261118    clang-22   cocci
arc                  randconfig-r2108-20261117    gcc-12     cocci
arc                  randconfig-r2111-20261117    gcc-12     cocci
arc                  randconfig-r2301-20261117    gcc-15.3.0 sparse
arc                  randconfig-r2304-20261118    gcc-12.5.0 sparse
arc                  randconfig-r2309-20261117    gcc-11.5.0 sparse
arc                         vdk_hs38_defconfig    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261118    gcc-10.5.0
arm                   randconfig-1001-20261118    gcc-10.5.0
arm                   randconfig-1002-20261118    gcc-10.5.0
arm                   randconfig-1003-20261118    gcc-10.5.0
arm                   randconfig-2000-20261117    gcc-10.5.0
arm                   randconfig-2000-20261118    gcc-13.5.0
arm                   randconfig-2001-20261117    gcc-10.5.0
arm                   randconfig-2001-20261118    gcc-13.5.0
arm                   randconfig-2002-20261117    gcc-10.5.0
arm                   randconfig-2002-20261118    gcc-13.5.0
arm                   randconfig-2200-20261118    gcc-8.5.0  smatch
arm                  randconfig-r2100-20261117    gcc-13.5.0 cocci
arm                  randconfig-r2102-20261117    gcc-11.5.0 cocci
arm                  randconfig-r2103-20261117    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261118    clang-22   cocci
arm                  randconfig-r2109-20261117    gcc-16.2.0 cocci
arm                  randconfig-r2109-20261118    clang-17   cocci
arm                  randconfig-r2111-20261117    gcc-16.2.0 cocci
arm                  randconfig-r2302-20261117    gcc-8.5.0  sparse
arm                  randconfig-r2304-20261117    gcc-8.5.0  sparse
arm                  randconfig-r2308-20261117    clang-20   sparse
arm                  randconfig-r2308-20261117    gcc-10.5.0 sparse
arm                  randconfig-r2309-20261117    gcc-10.5.0 sparse
arm                  randconfig-r2310-20261118    clang-24   sparse
arm                         realview_defconfig    clang-17
arm                          s3c6400_defconfig    clang-24
arm                         spear3xx_defconfig    clang-24
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261118    gcc-16.2.0
arm64                 randconfig-1001-20261118    gcc-16.2.0
arm64                 randconfig-1002-20261118    gcc-16.2.0
arm64                 randconfig-1003-20261118    gcc-16.2.0
arm64                 randconfig-2000-20261117    gcc-10.5.0
arm64                 randconfig-2000-20261118    gcc-13.5.0
arm64                 randconfig-2001-20261117    gcc-10.5.0
arm64                 randconfig-2001-20261118    gcc-13.5.0
arm64                 randconfig-2002-20261117    gcc-10.5.0
arm64                 randconfig-2002-20261118    gcc-13.5.0
arm64                 randconfig-2200-20261117    clang-17   smatch
arm64                 randconfig-2200-20261118    clang-24   smatch
arm64                randconfig-r2103-20261117    gcc-13.5.0 cocci
arm64                randconfig-r2105-20261117    gcc-11.5.0 cocci
arm64                randconfig-r2107-20261117    gcc-14     cocci
arm64                randconfig-r2108-20261117    gcc-16.2.0 cocci
arm64                randconfig-r2300-20261117    clang-22   sparse
arm64                randconfig-r2300-20261118    gcc-12.5.0 sparse
arm64                randconfig-r2303-20261117    clang-22   sparse
arm64                randconfig-r2303-20261117    gcc-15.3.0 sparse
arm64                randconfig-r2306-20261118    clang-24   sparse
arm64                randconfig-r2307-20261117    gcc-11.5.0 sparse
arm64                randconfig-r2307-20261117    gcc-14.4.0 sparse
arm64                randconfig-r2310-20261117    gcc-10.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261118    gcc-16.2.0
csky                  randconfig-1001-20261118    gcc-16.2.0
csky                  randconfig-2000-20261117    gcc-16.2.0
csky                  randconfig-2000-20261118    gcc-16.2.0
csky                  randconfig-2001-20261117    gcc-16.2.0
csky                  randconfig-2001-20261118    gcc-16.2.0
csky                  randconfig-2200-20261117    gcc-14.4.0 smatch
csky                  randconfig-2200-20261118    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261118    gcc-14.4.0 cocci
csky                 randconfig-r2107-20261117    clang-24   cocci
csky                 randconfig-r2109-20261117    gcc-16.2.0 cocci
csky                 randconfig-r2300-20261117    gcc-15.3.0 sparse
csky                 randconfig-r2305-20261118    clang-24   sparse
csky                 randconfig-r2306-20261117    gcc-10.5.0 sparse
csky                 randconfig-r2307-20261117    gcc-16.2.0 sparse
csky                 randconfig-r2309-20261117    clang-20   sparse
csky                 randconfig-r2309-20261117    gcc-13.5.0 sparse
csky                 randconfig-r2309-20261117    gcc-9.5.0  sparse
csky                 randconfig-r2311-20261117    gcc-10.5.0 sparse
csky                 randconfig-r2311-20261117    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261118    clang-22
hexagon               randconfig-1001-20261118    clang-22
hexagon               randconfig-2000-20261117    gcc-16.2.0
hexagon               randconfig-2000-20261118    gcc-16.2.0
hexagon               randconfig-2001-20261117    gcc-16.2.0
hexagon               randconfig-2001-20261118    gcc-16.2.0
hexagon               randconfig-2200-20261117    clang-17   smatch
hexagon               randconfig-2200-20261118    clang-20   smatch
hexagon              randconfig-r2106-20261117    gcc-16.2.0 cocci
hexagon              randconfig-r2107-20261118    clang-17   cocci
hexagon              randconfig-r2111-20261117    clang-24   cocci
hexagon              randconfig-r2111-20261117    gcc-16.2.0 cocci
hexagon              randconfig-r2307-20261117    clang-24   sparse
i386                              alldefconfig    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261118    gcc-12
i386        buildonly-randconfig-1001-20261118    gcc-12
i386        buildonly-randconfig-1002-20261118    gcc-12
i386        buildonly-randconfig-1003-20261118    gcc-12
i386        buildonly-randconfig-1004-20261118    gcc-12
i386        buildonly-randconfig-1005-20261118    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261118    clang-22
i386                  randconfig-1001-20261118    clang-22
i386                  randconfig-1002-20261118    clang-22
i386                  randconfig-1003-20261118    clang-22
i386                  randconfig-1004-20261118    clang-22
i386                  randconfig-1005-20261118    clang-22
i386                  randconfig-1006-20261118    clang-22
i386                  randconfig-1007-20261118    clang-22
i386                  randconfig-1008-20261118    clang-22
i386                  randconfig-1009-20261118    clang-22
i386                  randconfig-1010-20261118    clang-22
i386                  randconfig-1011-20261118    clang-22
i386                  randconfig-1012-20261118    clang-22
i386                  randconfig-1013-20261118    clang-22
i386                  randconfig-2000-20261117    clang-22
i386                  randconfig-2000-20261118    gcc-14
i386                  randconfig-2001-20261117    clang-22
i386                  randconfig-2001-20261118    gcc-14
i386                  randconfig-2002-20261117    clang-22
i386                  randconfig-2002-20261118    gcc-14
i386                  randconfig-2003-20261117    clang-22
i386                  randconfig-2003-20261118    gcc-14
i386                  randconfig-2004-20261117    clang-22
i386                  randconfig-2004-20261118    gcc-14
i386                  randconfig-2005-20261117    clang-22
i386                  randconfig-2005-20261118    gcc-14
i386                  randconfig-2100-20261117    clang-22   cocci
i386                  randconfig-2100-20261118    gcc-14     cocci
i386                  randconfig-2101-20261117    clang-22   cocci
i386                  randconfig-2101-20261118    gcc-14     cocci
i386                  randconfig-2102-20261117    clang-22   cocci
i386                  randconfig-2102-20261118    gcc-14     cocci
i386                  randconfig-2103-20261117    clang-22   cocci
i386                  randconfig-2103-20261118    gcc-14     cocci
i386                  randconfig-2104-20261117    clang-22   cocci
i386                  randconfig-2104-20261118    gcc-14     cocci
i386                  randconfig-2105-20261117    clang-22   cocci
i386                  randconfig-2105-20261118    gcc-14     cocci
i386                  randconfig-2200-20261117    gcc-14     smatch
i386                  randconfig-2200-20261118    gcc-13     smatch
i386                  randconfig-2300-20261117    clang-22   sparse
i386                  randconfig-2300-20261118    gcc-14     sparse
i386                  randconfig-2301-20261117    clang-22   sparse
i386                  randconfig-2301-20261118    gcc-14     sparse
i386                  randconfig-2302-20261117    clang-22   sparse
i386                  randconfig-2302-20261118    gcc-14     sparse
i386                 randconfig-r2101-20261118    gcc-14     cocci
i386                 randconfig-r2102-20261118    gcc-14     cocci
i386                 randconfig-r2106-20261117    clang-24   cocci
i386                 randconfig-r2109-20261117    gcc-14     cocci
i386                 randconfig-r2109-20261118    clang-22   cocci
i386                 randconfig-r2110-20261117    clang-24   cocci
i386                 randconfig-r2302-20261117    clang-22   sparse
i386                 randconfig-r2303-20261117    clang-22   sparse
i386                 randconfig-r2305-20261117    clang-22   sparse
i386                 randconfig-r2308-20261117    gcc-10.5.0 sparse
i386                 randconfig-r2309-20261117    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261118    clang-22
loongarch             randconfig-1001-20261118    clang-22
loongarch             randconfig-2000-20261117    gcc-8.5.0
loongarch             randconfig-2000-20261118    gcc-11.5.0
loongarch             randconfig-2001-20261117    gcc-8.5.0
loongarch             randconfig-2001-20261118    gcc-11.5.0
loongarch             randconfig-2200-20261117    gcc-13.5.0 smatch
loongarch             randconfig-2200-20261118    gcc-16.2.0 smatch
loongarch            randconfig-r2100-20261118    clang-24   cocci
loongarch            randconfig-r2104-20261117    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261118    clang-24   cocci
loongarch            randconfig-r2105-20261117    gcc-11.5.0 cocci
loongarch            randconfig-r2106-20261117    gcc-12     cocci
loongarch            randconfig-r2107-20261117    clang-24   cocci
loongarch            randconfig-r2108-20261117    gcc-16.2.0 cocci
loongarch            randconfig-r2109-20261117    clang-24   cocci
loongarch            randconfig-r2110-20261117    gcc-12     cocci
loongarch            randconfig-r2110-20261117    gcc-14     cocci
loongarch            randconfig-r2111-20261118    clang-22   cocci
loongarch            randconfig-r2300-20261117    gcc-8.5.0  sparse
loongarch            randconfig-r2302-20261117    gcc-8.5.0  sparse
loongarch            randconfig-r2306-20261117    gcc-11.5.0 sparse
loongarch            randconfig-r2306-20261117    gcc-16.2.0 sparse
loongarch            randconfig-r2308-20261117    gcc-13.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261117    gcc-15.3.0
m68k                  randconfig-2000-20261118    gcc-16.2.0
m68k                  randconfig-2001-20261117    gcc-15.3.0
m68k                  randconfig-2001-20261118    gcc-16.2.0
m68k                  randconfig-2200-20261117    gcc-11.5.0 smatch
m68k                  randconfig-2200-20261118    gcc-12.5.0 smatch
m68k                 randconfig-r2100-20261117    gcc-13.5.0 cocci
m68k                 randconfig-r2104-20261117    gcc-13.5.0 cocci
m68k                 randconfig-r2109-20261117    clang-24   cocci
m68k                 randconfig-r2304-20261117    gcc-14.4.0 sparse
m68k                 randconfig-r2306-20261117    gcc-10.5.0 sparse
m68k                 randconfig-r2307-20261117    gcc-10.5.0 sparse
m68k                 randconfig-r2308-20261117    clang-24   sparse
m68k                 randconfig-r2308-20261117    gcc-9.5.0  sparse
m68k                 randconfig-r2308-20261118    clang-24   sparse
m68k                 randconfig-r2309-20261118    clang-24   sparse
m68k                 randconfig-r2311-20261117    gcc-16.2.0 sparse
m68k                         stmark2_defconfig    clang-24
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261117    gcc-15.3.0
microblaze            randconfig-2000-20261118    gcc-16.2.0
microblaze            randconfig-2001-20261117    gcc-15.3.0
microblaze            randconfig-2001-20261118    gcc-16.2.0
microblaze            randconfig-2200-20261117    gcc-14.4.0 smatch
microblaze            randconfig-2200-20261118    gcc-13.5.0 smatch
microblaze           randconfig-r2103-20261117    gcc-13.5.0 cocci
microblaze           randconfig-r2106-20261117    gcc-16.2.0 cocci
microblaze           randconfig-r2108-20261117    clang-24   cocci
microblaze           randconfig-r2109-20261117    gcc-16.2.0 cocci
microblaze           randconfig-r2110-20261118    clang-17   cocci
microblaze           randconfig-r2110-20261118    clang-22   cocci
microblaze           randconfig-r2302-20261117    gcc-14.4.0 sparse
microblaze           randconfig-r2304-20261117    gcc-8.5.0  sparse
microblaze           randconfig-r2305-20261118    gcc-12.5.0 sparse
microblaze           randconfig-r2306-20261117    clang-24   sparse
microblaze           randconfig-r2306-20261117    gcc-14.4.0 sparse
microblaze           randconfig-r2310-20261117    gcc-13.5.0 sparse
microblaze           randconfig-r2311-20261118    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm63xx_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                            jazz_defconfig    gcc-16.2.0
mips                       malta_kvm_defconfig    clang-24
mips                 malta_qemu_32r6_defconfig    clang-24
mips                  randconfig-2000-20261117    gcc-16.2.0
mips                  randconfig-2000-20261118    gcc-15.3.0
mips                  randconfig-2001-20261117    gcc-16.2.0
mips                  randconfig-2001-20261118    gcc-15.3.0
mips                  randconfig-2002-20261117    gcc-16.2.0
mips                  randconfig-2002-20261118    gcc-15.3.0
mips                  randconfig-2200-20261117    clang-24   smatch
mips                  randconfig-2200-20261118    clang-24   smatch
mips                 randconfig-r2100-20261118    gcc-14.4.0 cocci
mips                 randconfig-r2103-20261117    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261117    gcc-16.2.0 cocci
mips                 randconfig-r2111-20261117    clang-24   cocci
mips                 randconfig-r2300-20261117    gcc-8.5.0  sparse
mips                 randconfig-r2307-20261118    clang-24   sparse
mips                 randconfig-r2310-20261117    gcc-10.5.0 sparse
mips                          rt305x_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261118    clang-22
nios2                 randconfig-1001-20261118    clang-22
nios2                 randconfig-2000-20261117    gcc-8.5.0
nios2                 randconfig-2000-20261118    gcc-11.5.0
nios2                 randconfig-2001-20261117    gcc-8.5.0
nios2                 randconfig-2001-20261118    gcc-11.5.0
nios2                 randconfig-2200-20261117    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261118    gcc-8.5.0  smatch
nios2                randconfig-r2100-20261117    gcc-8.5.0  cocci
nios2                randconfig-r2101-20261117    gcc-11.5.0 cocci
nios2                randconfig-r2101-20261117    gcc-13.5.0 cocci
nios2                randconfig-r2102-20261117    gcc-13.5.0 cocci
nios2                randconfig-r2104-20261117    gcc-12     cocci
nios2                randconfig-r2108-20261118    clang-17   cocci
nios2                randconfig-r2302-20261117    clang-22   sparse
nios2                randconfig-r2305-20261117    gcc-14.4.0 sparse
nios2                randconfig-r2310-20261117    gcc-9.5.0  sparse
nios2                randconfig-r2311-20261117    gcc-10.5.0 sparse
nios2                randconfig-r2311-20261117    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261117    gcc-16.2.0
openrisc              randconfig-2000-20261118    gcc-15.3.0
openrisc              randconfig-2001-20261117    gcc-16.2.0
openrisc              randconfig-2001-20261118    gcc-15.3.0
openrisc              randconfig-2002-20261117    gcc-16.2.0
openrisc              randconfig-2002-20261118    gcc-15.3.0
openrisc              randconfig-2200-20261117    gcc-16.2.0 smatch
openrisc             randconfig-r2102-20261118    clang-24   cocci
openrisc             randconfig-r2108-20261118    clang-22   cocci
openrisc             randconfig-r2109-20261117    clang-24   cocci
openrisc             randconfig-r2110-20261117    clang-24   cocci
openrisc             randconfig-r2111-20261117    clang-24   cocci
openrisc             randconfig-r2306-20261117    gcc-13.5.0 sparse
openrisc             randconfig-r2308-20261117    gcc-14.4.0 sparse
openrisc             randconfig-r2310-20261117    clang-20   sparse
openrisc             randconfig-r2310-20261117    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261118    gcc-8.5.0
parisc                randconfig-1001-20261118    gcc-8.5.0
parisc                randconfig-2000-20261117    gcc-8.5.0
parisc                randconfig-2000-20261118    gcc-11.5.0
parisc                randconfig-2001-20261117    gcc-8.5.0
parisc                randconfig-2001-20261118    gcc-11.5.0
parisc                randconfig-2200-20261117    gcc-8.5.0  smatch
parisc                randconfig-2200-20261118    gcc-11.5.0 smatch
parisc               randconfig-r2100-20261118    gcc-14     cocci
parisc               randconfig-r2102-20261117    gcc-8.5.0  cocci
parisc               randconfig-r2102-20261118    gcc-14.4.0 cocci
parisc               randconfig-r2104-20261117    gcc-11.5.0 cocci
parisc               randconfig-r2106-20261117    gcc-16.2.0 cocci
parisc               randconfig-r2109-20261117    gcc-16.2.0 cocci
parisc               randconfig-r2302-20261117    gcc-15.3.0 sparse
parisc               randconfig-r2304-20261117    clang-22   sparse
parisc               randconfig-r2307-20261117    gcc-9.5.0  sparse
parisc               randconfig-r2309-20261117    clang-24   sparse
parisc               randconfig-r2310-20261117    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-17
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                         cell_defconfig    gcc-16.2.0
powerpc                    currituck_defconfig    gcc-16.2.0
powerpc                         fsp2_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    clang-24
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                       pasemi_defconfig    clang-24
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261118    gcc-8.5.0
powerpc               randconfig-1001-20261118    gcc-8.5.0
powerpc               randconfig-2000-20261117    gcc-8.5.0
powerpc               randconfig-2000-20261118    clang-21
powerpc               randconfig-2001-20261117    gcc-8.5.0
powerpc               randconfig-2001-20261118    clang-21
powerpc               randconfig-2002-20261117    gcc-8.5.0
powerpc               randconfig-2002-20261118    clang-21
powerpc               randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc               randconfig-2200-20261118    clang-24   smatch
powerpc              randconfig-r2106-20261117    clang-24   cocci
powerpc              randconfig-r2111-20261118    clang-17   cocci
powerpc              randconfig-r2301-20261118    clang-24   sparse
powerpc              randconfig-r2305-20261117    gcc-15.3.0 sparse
powerpc              randconfig-r2307-20261117    gcc-13.5.0 sparse
powerpc                      tqm8540_defconfig    clang-24
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261118    gcc-8.5.0
powerpc64             randconfig-1001-20261118    gcc-8.5.0
powerpc64             randconfig-2000-20261117    gcc-8.5.0
powerpc64             randconfig-2000-20261118    clang-21
powerpc64             randconfig-2001-20261117    gcc-8.5.0
powerpc64             randconfig-2001-20261118    clang-21
powerpc64             randconfig-2002-20261117    gcc-8.5.0
powerpc64             randconfig-2002-20261118    clang-21
powerpc64             randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc64             randconfig-2200-20261118    clang-24   smatch
powerpc64            randconfig-r2102-20261117    gcc-12     cocci
powerpc64            randconfig-r2107-20261117    gcc-16.2.0 cocci
powerpc64            randconfig-r2108-20261117    clang-24   cocci
powerpc64            randconfig-r2110-20261117    clang-24   cocci
powerpc64            randconfig-r2301-20261117    clang-22   sparse
powerpc64            randconfig-r2301-20261117    gcc-15.3.0 sparse
powerpc64            randconfig-r2303-20261117    gcc-8.5.0  sparse
powerpc64            randconfig-r2303-20261118    gcc-12.5.0 sparse
powerpc64            randconfig-r2308-20261117    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    clang-24
riscv                 randconfig-1000-20261118    gcc-11.5.0
riscv                 randconfig-1001-20261118    gcc-11.5.0
riscv                 randconfig-2000-20261117    gcc-11.5.0
riscv                 randconfig-2000-20261118    gcc-8.5.0
riscv                 randconfig-2001-20261117    gcc-11.5.0
riscv                 randconfig-2001-20261118    gcc-8.5.0
riscv                 randconfig-2002-20261117    gcc-11.5.0
riscv                 randconfig-2002-20261118    gcc-8.5.0
riscv                 randconfig-2003-20261117    gcc-11.5.0
riscv                 randconfig-2003-20261118    gcc-8.5.0
riscv                 randconfig-2004-20261117    gcc-11.5.0
riscv                 randconfig-2004-20261118    gcc-8.5.0
riscv                 randconfig-2005-20261117    gcc-11.5.0
riscv                 randconfig-2005-20261118    gcc-8.5.0
riscv                 randconfig-2200-20261117    clang-24   smatch
riscv                 randconfig-2200-20261118    clang-24   smatch
riscv                randconfig-r2103-20261118    clang-24   cocci
riscv                randconfig-r2104-20261117    gcc-11.5.0 cocci
riscv                randconfig-r2108-20261117    gcc-16.2.0 cocci
riscv                randconfig-r2300-20261117    gcc-15.3.0 sparse
riscv                randconfig-r2301-20261117    gcc-8.5.0  sparse
riscv                randconfig-r2303-20261118    clang-24   sparse
riscv                randconfig-r2310-20261117    gcc-14.4.0 sparse
riscv                randconfig-r2311-20261117    clang-20   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261118    gcc-11.5.0
s390                  randconfig-1001-20261118    gcc-11.5.0
s390                  randconfig-2000-20261117    gcc-15.3.0
s390                  randconfig-2000-20261118    clang-24
s390                  randconfig-2001-20261117    gcc-15.3.0
s390                  randconfig-2001-20261118    clang-24
s390                  randconfig-2002-20261117    gcc-15.3.0
s390                  randconfig-2002-20261118    clang-24
s390                  randconfig-2003-20261117    gcc-15.3.0
s390                  randconfig-2003-20261118    clang-24
s390                  randconfig-2004-20261117    gcc-15.3.0
s390                  randconfig-2004-20261118    clang-24
s390                  randconfig-2005-20261117    gcc-15.3.0
s390                  randconfig-2005-20261118    clang-24
s390                  randconfig-2200-20261117    gcc-11.5.0 smatch
s390                  randconfig-2200-20261118    gcc-8.5.0  smatch
s390                 randconfig-r2103-20261117    gcc-11.5.0 cocci
s390                 randconfig-r2107-20261117    gcc-16.2.0 cocci
s390                 randconfig-r2300-20261117    clang-22   sparse
s390                 randconfig-r2303-20261117    gcc-8.5.0  sparse
s390                        zfcpdump_defconfig    clang-24
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    gcc-16.2.0
sh                              espt_defconfig    clang-17
sh                           polaris_defconfig    clang-17
sh                    randconfig-1000-20261118    gcc-11.5.0
sh                    randconfig-1001-20261118    gcc-11.5.0
sh                    randconfig-2000-20261117    gcc-14.4.0
sh                    randconfig-2000-20261118    gcc-9.5.0
sh                    randconfig-2001-20261117    gcc-14.4.0
sh                    randconfig-2001-20261118    gcc-9.5.0
sh                    randconfig-2002-20261117    gcc-14.4.0
sh                    randconfig-2002-20261118    gcc-9.5.0
sh                    randconfig-2003-20261117    gcc-14.4.0
sh                    randconfig-2003-20261118    gcc-9.5.0
sh                    randconfig-2004-20261117    gcc-14.4.0
sh                    randconfig-2004-20261118    gcc-9.5.0
sh                    randconfig-2005-20261117    gcc-14.4.0
sh                    randconfig-2005-20261118    gcc-9.5.0
sh                    randconfig-2200-20261117    gcc-16.2.0 smatch
sh                    randconfig-2200-20261118    gcc-13.5.0 smatch
sh                   randconfig-r2105-20261117    gcc-12     cocci
sh                   randconfig-r2105-20261117    gcc-8.5.0  cocci
sh                   randconfig-r2106-20261117    gcc-16.2.0 cocci
sh                   randconfig-r2107-20261117    gcc-16.2.0 cocci
sh                   randconfig-r2108-20261117    clang-24   cocci
sh                   randconfig-r2109-20261117    gcc-16.2.0 cocci
sh                   randconfig-r2300-20261117    gcc-14.4.0 sparse
sh                   randconfig-r2300-20261118    clang-24   sparse
sh                   randconfig-r2303-20261117    gcc-14.4.0 sparse
sh                   randconfig-r2304-20261117    gcc-8.5.0  sparse
sh                   randconfig-r2307-20261117    gcc-10.5.0 sparse
sh                   randconfig-r2308-20261117    gcc-16.2.0 sparse
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7269_defconfig    clang-24
sh                    rts7751r2dplus_defconfig    clang-17
sh                            se7206_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-24
sh                   sh7785lcr_32bit_defconfig    clang-17
sh                             titan_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261118    gcc-16.2.0
sparc                 randconfig-1001-20261118    gcc-16.2.0
sparc                 randconfig-2000-20261117    gcc-14
sparc                 randconfig-2000-20261118    clang-24
sparc                 randconfig-2001-20261117    gcc-14
sparc                 randconfig-2001-20261118    clang-24
sparc                 randconfig-2200-20261118    gcc-13.5.0 smatch
sparc                randconfig-r2100-20261117    gcc-12     cocci
sparc                randconfig-r2101-20261117    gcc-13.5.0 cocci
sparc                randconfig-r2105-20261118    clang-24   cocci
sparc                randconfig-r2108-20261117    gcc-16.2.0 cocci
sparc                randconfig-r2111-20261117    gcc-16.2.0 cocci
sparc                randconfig-r2301-20261118    gcc-12.5.0 sparse
sparc                randconfig-r2311-20261117    gcc-11.5.0 sparse
sparc                randconfig-r2311-20261117    gcc-14.4.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261118    gcc-16.2.0
sparc64               randconfig-1001-20261118    gcc-16.2.0
sparc64               randconfig-2000-20261117    gcc-14
sparc64               randconfig-2000-20261118    clang-24
sparc64               randconfig-2001-20261117    gcc-14
sparc64               randconfig-2001-20261118    clang-24
sparc64               randconfig-2200-20261117    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261118    clang-22   smatch
sparc64              randconfig-r2101-20261117    gcc-14     cocci
sparc64              randconfig-r2104-20261117    gcc-14     cocci
sparc64              randconfig-r2104-20261118    gcc-14     cocci
sparc64              randconfig-r2105-20261117    gcc-14     cocci
sparc64              randconfig-r2111-20261117    clang-24   cocci
sparc64              randconfig-r2111-20261117    gcc-16.2.0 cocci
sparc64              randconfig-r2301-20261117    gcc-8.5.0  sparse
sparc64              randconfig-r2302-20261117    gcc-15.3.0 sparse
sparc64              randconfig-r2302-20261118    clang-24   sparse
sparc64              randconfig-r2302-20261118    gcc-12.5.0 sparse
sparc64              randconfig-r2304-20261117    gcc-15.3.0 sparse
sparc64              randconfig-r2306-20261117    clang-20   sparse
sparc64              randconfig-r2307-20261117    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261118    gcc-16.2.0
um                    randconfig-1001-20261118    gcc-16.2.0
um                    randconfig-2000-20261117    gcc-14
um                    randconfig-2000-20261118    clang-24
um                    randconfig-2001-20261117    gcc-14
um                    randconfig-2001-20261118    clang-24
um                    randconfig-2200-20261117    clang-21   smatch
um                    randconfig-2200-20261118    clang-24   smatch
um                   randconfig-r2100-20261117    gcc-14     cocci
um                   randconfig-r2103-20261117    gcc-12     cocci
um                   randconfig-r2103-20261117    gcc-14     cocci
um                   randconfig-r2103-20261118    gcc-14.4.0 cocci
um                   randconfig-r2106-20261118    clang-17   cocci
um                   randconfig-r2107-20261117    clang-24   cocci
um                   randconfig-r2301-20261117    clang-22   sparse
um                   randconfig-r2303-20261117    gcc-8.5.0  sparse
um                   randconfig-r2306-20261117    gcc-9.5.0  sparse
um                   randconfig-r2310-20261117    gcc-16.2.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261118    gcc-14
x86_64      buildonly-randconfig-1001-20261118    gcc-14
x86_64      buildonly-randconfig-1002-20261118    gcc-14
x86_64      buildonly-randconfig-1003-20261118    gcc-14
x86_64      buildonly-randconfig-1004-20261118    gcc-14
x86_64      buildonly-randconfig-1005-20261118    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261118    gcc-14
x86_64                randconfig-1001-20261118    gcc-14
x86_64                randconfig-1002-20261118    gcc-14
x86_64                randconfig-1003-20261118    gcc-14
x86_64                randconfig-1004-20261118    gcc-14
x86_64                randconfig-1005-20261118    gcc-14
x86_64                randconfig-1006-20261118    gcc-14
x86_64                randconfig-1007-20261118    gcc-14
x86_64                randconfig-1008-20261118    gcc-14
x86_64                randconfig-1009-20261118    gcc-14
x86_64                randconfig-1010-20261118    gcc-14
x86_64                randconfig-1011-20261118    gcc-14
x86_64                randconfig-1012-20261118    gcc-14
x86_64                randconfig-1013-20261118    gcc-14
x86_64                randconfig-1014-20261118    gcc-14
x86_64                randconfig-1015-20261118    gcc-14
x86_64                randconfig-1016-20261118    gcc-14
x86_64                randconfig-1017-20261118    gcc-14
x86_64                randconfig-2000-20261117    gcc-14
x86_64                randconfig-2000-20261118    gcc-13
x86_64                randconfig-2001-20261117    gcc-14
x86_64                randconfig-2001-20261118    gcc-13
x86_64                randconfig-2002-20261117    gcc-14
x86_64                randconfig-2002-20261118    gcc-13
x86_64                randconfig-2003-20261117    gcc-14
x86_64                randconfig-2003-20261118    gcc-13
x86_64                randconfig-2004-20261117    gcc-14
x86_64                randconfig-2004-20261118    gcc-13
x86_64                randconfig-2005-20261117    gcc-14
x86_64                randconfig-2005-20261118    gcc-13
x86_64                randconfig-2100-20261117    gcc-14     cocci
x86_64                randconfig-2100-20261118    clang-22   cocci
x86_64                randconfig-2101-20261117    gcc-14     cocci
x86_64                randconfig-2101-20261118    clang-22   cocci
x86_64                randconfig-2102-20261117    gcc-14     cocci
x86_64                randconfig-2102-20261118    clang-22   cocci
x86_64                randconfig-2103-20261117    gcc-14     cocci
x86_64                randconfig-2103-20261118    clang-22   cocci
x86_64                randconfig-2104-20261117    gcc-14     cocci
x86_64                randconfig-2104-20261118    clang-22   cocci
x86_64                randconfig-2105-20261117    gcc-14     cocci
x86_64                randconfig-2105-20261118    clang-22   cocci
x86_64                randconfig-2200-20261117    gcc-14     smatch
x86_64                randconfig-2200-20261118    clang-22   smatch
x86_64                randconfig-2300-20261117    clang-22   sparse
x86_64                randconfig-2300-20261118    gcc-14     sparse
x86_64                randconfig-2301-20261117    clang-22   sparse
x86_64                randconfig-2301-20261118    gcc-14     sparse
x86_64                randconfig-2302-20261117    clang-22   sparse
x86_64                randconfig-2302-20261118    gcc-14     sparse
x86_64               randconfig-r2101-20261117    gcc-11.5.0 cocci
x86_64               randconfig-r2101-20261117    gcc-8.5.0  cocci
x86_64               randconfig-r2102-20261117    gcc-11.5.0 cocci
x86_64               randconfig-r2103-20261118    gcc-14     cocci
x86_64               randconfig-r2106-20261117    gcc-14     cocci
x86_64               randconfig-r2107-20261117    clang-24   cocci
x86_64               randconfig-r2109-20261117    gcc-12     cocci
x86_64               randconfig-r2304-20261117    gcc-15.3.0 sparse
x86_64               randconfig-r2309-20261117    gcc-10.5.0 sparse
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
xtensa                randconfig-1000-20261118    gcc-16.2.0
xtensa                randconfig-1001-20261118    gcc-16.2.0
xtensa                randconfig-2000-20261117    gcc-16.2.0
xtensa                randconfig-2000-20261118    gcc-16.2.0
xtensa                randconfig-2001-20261117    gcc-16.2.0
xtensa                randconfig-2001-20261118    gcc-16.2.0
xtensa                randconfig-2200-20261117    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261118    gcc-15.3.0 smatch
xtensa               randconfig-r2100-20261117    gcc-11.5.0 cocci
xtensa               randconfig-r2101-20261117    gcc-12     cocci
xtensa               randconfig-r2104-20261117    gcc-13.5.0 cocci
xtensa               randconfig-r2105-20261117    gcc-13.5.0 cocci
xtensa               randconfig-r2105-20261118    gcc-14     cocci
xtensa               randconfig-r2106-20261117    gcc-16.2.0 cocci
xtensa               randconfig-r2107-20261117    gcc-12     cocci
xtensa               randconfig-r2107-20261117    gcc-16.2.0 cocci
xtensa               randconfig-r2108-20261117    gcc-14     cocci
xtensa               randconfig-r2108-20261117    gcc-16.2.0 cocci
xtensa               randconfig-r2110-20261117    gcc-16.2.0 cocci
xtensa               randconfig-r2304-20261117    clang-22   sparse
xtensa               randconfig-r2304-20261118    clang-24   sparse
xtensa               randconfig-r2305-20261117    gcc-8.5.0  sparse
xtensa               randconfig-r2311-20261117    clang-24   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

