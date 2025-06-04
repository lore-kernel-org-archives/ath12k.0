Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A737C5B543
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 11:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3YzDQOIWkxXBk4DvbWSKwSKTyQcoc8uJgKLqpE1iEkw=; b=YogH4dx4JemSQonF3i2K5Ppv+y
	ta0bKMRXevGUykbHnLgD6DitYU2D3lPwE6e8z6X5QoxFCjbK2y6tPmzsr6AQ9zVhTm47BiF+KVGnO
	RzPxOPaWyejNui+DYSzGg9uU6Img/iR/gPj0YfNRGm2NXsZmLeHCF0nzJBw1FSL4s9DdO1CL+SXu1
	XVuojlHC0QDXtyWSf2kJYFNjMqNr6W2HuQI9T08UrNEwdq+2TM9BSlsGcJSC3N5A7VCEWuwZEUkIH
	aWNLXwBnErxOQMR+L5TNrfrvdTtQkFxuU8MOdTWt5yogaUUdAewHGWonMo70oVA2oJ5qyUZ9hnyY2
	sSxZ5Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMm62-0000000DBpi-36qP;
	Wed, 04 Jun 2025 11:15:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMm5z-0000000DBp6-47CW
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 11:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749035748; x=1780571748;
  h=date:from:to:cc:subject:message-id;
  bh=ZvO8bYvblu1CEh1sYHQejN4+NyxmTkcvohp+7GJzD0E=;
  b=bEpE033Z5eFZY7OXLSBpJJGIFY//umEH6fomQ+WHocUYyrimF2VAj9fL
   g/x7+SQMT6RnDbWf97Q8jCODxcBuNn9N7X9MbV9qZME2o8C2hByxYt0zT
   11kqxY0NFiWjwawP2A3Dxa+B5RL+pNIUkU8bIGRuLBrPMRe1kpbXg8bAY
   XdzdPbJfxOdw0NdI8873niuRt/PFKVDI40A1ef+iZYtrPU3ohAfAOoGAj
   zl2x7koEwxlKjayb9JYbOyiv0RcIYrgUFs3M/kFpn0lq2wNujpKsoOelg
   e45OUQmFFPu+YSl/ZoKTUmRmgFFpvglV7R4GZHJGUYZ+bQA9vzhvkvBUJ
   A==;
X-CSE-ConnectionGUID: 0UC3yH7+QYq2qCaN8H6OFw==
X-CSE-MsgGUID: TukyL80cTY6Ht5/eORM6Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51254425"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51254425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 04:15:42 -0700
X-CSE-ConnectionGUID: nbpRmXmmR5uj1btc01Rkcw==
X-CSE-MsgGUID: fA1vNOirQbi7cCQTehe8fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176026168"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 04:15:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMm5q-000353-1J;
	Wed, 04 Jun 2025 11:15:38 +0000
Date: Wed, 04 Jun 2025 19:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master-pending] BUILD SUCCESS
 7e348220eee2ae82572cbe89c3a77d6659f137e9
Message-ID: <202506041929.Hx3rcyY7-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_041548_023839_DD9F23B1 
X-CRM114-Status: UNSURE (   3.85  )
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
branch HEAD: 7e348220eee2ae82572cbe89c3a77d6659f137e9  Merge branch 'pending' into main-pending

elapsed time: 1095m

configs tested: 35
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allyesconfig    gcc-15.1.0
arc          allmodconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm          allmodconfig    gcc-15.1.0
arm          allyesconfig    gcc-15.1.0
arm64        allmodconfig    clang-19
hexagon      allmodconfig    clang-17
hexagon      allyesconfig    clang-21
i386         allmodconfig    gcc-12
i386          allnoconfig    gcc-12
i386         allyesconfig    gcc-12
i386            defconfig    clang-20
loongarch    allmodconfig    gcc-15.1.0
m68k         allmodconfig    gcc-15.1.0
m68k         allyesconfig    gcc-15.1.0
microblaze   allmodconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
openrisc     allyesconfig    gcc-15.1.0
parisc       allmodconfig    gcc-15.1.0
parisc       allyesconfig    gcc-15.1.0
powerpc      allmodconfig    gcc-15.1.0
powerpc      allyesconfig    clang-21
riscv        allmodconfig    clang-21
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allyesconfig    gcc-15.1.0
sh           allmodconfig    gcc-15.1.0
sh           allyesconfig    gcc-15.1.0
sparc        allmodconfig    gcc-15.1.0
um           allmodconfig    clang-19
um           allyesconfig    gcc-12
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64          defconfig    gcc-11
x86_64      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

