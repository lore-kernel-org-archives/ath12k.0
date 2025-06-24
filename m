Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F4C7EE33
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CIC6F2TgBTiUQosur3Gy/0wuMc5QfoQv/wFdQbYOcn0=; b=ziyJio4aP7ACGX4xVNXBrXtCGi
	P3JIv2M54tn/Gm+2B+P+TIvN5hyVsofQvfyi9eqhhgW6sUJmQjzMQ94DeenC0+HTdWA7NqOIhivLz
	lbDToGRxfhszEqCo4ElYpc1shiBVXcYEgeCguc5MbD3pFrEa1T94TTrfFDN/VqgLTi2xl6086YiIX
	Q3+riKa1V2JBD/A/Yx3zEsneCA6pRVS/NazU+UgHI0+yyEX7AFmsbPJPM0W/7hqKvxzHL02v+i2bN
	/SP9wNgt0exS/uSv47a0JvXQC4kgMwQKo3teOWF75LpYaQaiCm7hYPKzWxQ6tlpzNVuJSRWo5a7i6
	U+UbTJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jE-00000006fRk-0lOA;
	Tue, 24 Jun 2025 19:54:48 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU69o-00000006EhO-05JK
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 16:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750781160; x=1782317160;
  h=date:from:to:cc:subject:message-id;
  bh=T33YhHkp10K1XddWL2h1HTEC9YYZKGHaoD9tqgyHUOY=;
  b=n7/U+TortZe41zucP3nUkSlnx8Yl9MY6/pdk43Kb++hK1S3sGiJWQHQz
   ZCZ9p8RynunRNjzY5pLo5HsebPsDcb9yLxZDymT4/yBWh9DkJO+P7nx7O
   khylmckT4b56abJfnctnxm75pQeeKCRO/wif0FdzUJSi0avaalFw6IMKl
   KoJcblQFZhovFxP/tyj4aVMrU6nij0Yf/i5XALGrUtmKswho9TaQs2lbL
   jtjYAbAnfto++E7LGbgZnNpSoCa+McGV38nPJzcey3AH/+NxTqDq4mK0K
   N7j9ZiQa6S7CCKIc5CZBIFI/FIpXpDjmpR+qy8PeQ5FIK8f/N0FEpCynZ
   A==;
X-CSE-ConnectionGUID: pMjOb28yRay26eWAGnX9CA==
X-CSE-MsgGUID: xE9rqrrITryTuddnvigwPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53167470"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="53167470"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 09:05:57 -0700
X-CSE-ConnectionGUID: 2YId8Bb3TWW2s4IMfohdWw==
X-CSE-MsgGUID: bgbuVawsQBm6H/mjGqg5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="151561331"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jun 2025 09:05:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU69R-000SIw-0H;
	Tue, 24 Jun 2025 16:05:37 +0000
Date: Wed, 25 Jun 2025 00:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 e9efdcce074c55be396ca45add336121549bdcbc
Message-ID: <202506250022.HZYb5FKm-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_090600_074470_F915EAA5 
X-CRM114-Status: UNSURE (   3.93  )
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
branch HEAD: e9efdcce074c55be396ca45add336121549bdcbc  Add localversion-wireless-testing-ath

elapsed time: 1455m

configs tested: 54
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
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

