Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30047C53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cNhqSY74ocg0KiTw6HSMMDoftP7pSQoRLh0TIJ8ddcw=; b=wbp7anGflQKyS8m+snBnMArdRG
	rG7zRtrqr56y4u29aejgnw+B2YtzqTutDTmgGzQK7jIUnSMyfeBUmlfrc+bkJMkytPN71dzSDYk0I
	MCVWmk/hpvNOFYPY9OE7dbu4NRfAx00v5fKYJHuWwWUsX43CKQYX5C2706nZi1ejew3ixsH4YFxay
	wjoxbz4cAB73Lc8djJqpK33/pwYvOqTp48RLoK0a6Xy5AzK8TC4POXEvJ0XrtI8E+2SwHoqoHCo67
	ignnAmMNgJF2Xo0LkyeVzrZ5CjOpUIF7TeAqEoFANGXarBD1LHYnO4889aclz9QlgqpWywTnsDomu
	4IMSKgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9XZ-00000008rHB-1Z4F;
	Wed, 29 Jul 2026 19:02:05 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9XX-00000008rGr-1vpX
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 19:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785351723; x=1816887723;
  h=date:from:to:cc:subject:message-id;
  bh=NitgL/p9ddFWCuPbKtjwwFu3S1SGllmYhRaeFaljtJU=;
  b=ORVCF1k4vwHCiprOl8xRPXHN8j0m03/wbtMwul8qYDyjf79wlqGRZg8p
   R3oifYhQ2OZ6HU8CXe2CzwVlKCVMSSsWdKz3HgStGr9YGwMt+hrpLaSzY
   rCHb4DvZX8M+YMcGv7JM2WEYIL9gOpNQaCZUIsFEuDLGtrT46fVKlWm9X
   si0aoS2oO1O6L87/W+tAm571dzJ+bQBuoPIs7LdQAvJJlbMCwcoOuiDko
   J+L/HJlR/D/7oYUT7NwebpHuMGSqEHeaUb08AXhXlH4y0DGMrf2UiXQgs
   T4gRufCIZwDq88kkTNkFrmn2Q9uIHIVNZ+WS5/3s/vkOzEboJnacwKJWM
   w==;
X-CSE-ConnectionGUID: GC151b8gTra+1WkJREx1jA==
X-CSE-MsgGUID: QLcPuu1tQuesKr+eFt3bvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85841114"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85841114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 12:02:03 -0700
X-CSE-ConnectionGUID: 2XibNZaPTeCZEL7DI2+1Qw==
X-CSE-MsgGUID: scjqdSS9ROeYOWjZ1i7osg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="265130828"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 12:02:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp9X1-00000000fbX-1niC;
	Wed, 29 Jul 2026 19:01:35 +0000
Date: Thu, 30 Jul 2026 03:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:for-next] BUILD SUCCESS
 c6ab3b1dfa3e62dbf42c66121037de460a182642
Message-ID: <202607300332.uGPxby6c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_120203_569962_5B012CEB 
X-CRM114-Status: UNSURE (   4.29  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
branch HEAD: c6ab3b1dfa3e62dbf42c66121037de460a182642  wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate operations

elapsed time: 94m

configs tested: 14
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
alpha            defconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
arm     spear6xx_defconfig    clang-24
csky          allmodconfig    gcc-16.1.0
i386          allmodconfig    gcc-14
mips       ath25_defconfig    clang-24
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    gcc-11.5.0
parisc        allmodconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
sh               defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

