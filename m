Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE2ACAC59A
	for <ath12k@archiver.kernel.org>; Sun, 21 Sep 2025 15:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BcyiXVOLrFFLaG69hQhyJZaCCjXwDYKkjxz8rJH2NRw=; b=mxiYzUbaioSWY5Y9D30RjpZzYZ
	j8dQV121mEO9gm1uwgQEHtyQwIzD8ccSQqI7cLpr4J659iamUDbncq1lIxBwu76fBVCHx5g3E1HeX
	lUFRwoyC2euBhZIOl9R//YwMf55xOUI8zVJyJCqi0di6qzqqy3QePqR/j6A/BXj1IQDffvaFJcT01
	2ueHzDvxQkrCHOKbJ+Aa0MSy6P7EKeSTmA+tLXPyv0YHrVWJ4rgFUIMnC+8qCKav8mh60I0VO53Go
	gi/Ah8Nw9q4MpnMukpXwcrTTiK4JaaaGHwdsiWijqzdk/qv2PrujhWyKrWLut3NgCoapEtj4gYpyz
	gDmnlKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MEA-00000007fjl-0hLO;
	Sun, 21 Sep 2025 15:43:50 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ME7-00000007fjJ-2Xi5
	for ath12k@lists.infradead.org;
	Sun, 21 Sep 2025 15:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758469427; x=1790005427;
  h=date:from:to:cc:subject:message-id;
  bh=WKquFTHSGY9gLJXqLUFS76B5CMfTO1NCUl5GWQMWhZs=;
  b=Unng1vlMQri0GH43oAOp47BocPtr1W+WmFnhENY1+MjavG1jVMNBh8lz
   iS74NBt42BVkYomeLsAVGLmW+gkVC3wa2lJ/AeAV0/DUnDavwtVO1F0T8
   iDrOLdNpSCfoOsATcXxvd31asbx+KMHPSP34KWQ0Mvu8zzNmNDlNpIjDZ
   dcLLta1KdNnjibzkLB1L0Dlai5TUQrDTYgIU3+dWIbRDo7pvQnhOREPlZ
   sLmLdm+D84oymRriCN9341X1pZeciuEhuVhbKaHrmjBja8eSJf4/nW2rw
   +02Nehf7cOlsc0WH7iZDZgpMU3WwDyTQXw04HvHjDEHSjRTYbmrhjitwo
   Q==;
X-CSE-ConnectionGUID: ecB4VZbESGaS5viXA7bmgA==
X-CSE-MsgGUID: aD/77fC/SkSt8AM2jncdTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71373142"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71373142"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 08:43:46 -0700
X-CSE-ConnectionGUID: 21VCrmnQSGSy5jKPtghe8Q==
X-CSE-MsgGUID: 794L3XUxSBWVUBydVl84ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176347071"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Sep 2025 08:43:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0ME2-0000pp-0i;
	Sun, 21 Sep 2025 15:43:42 +0000
Date: Sun, 21 Sep 2025 23:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 38cf754c15eeb0d80fbf52c933da10edb33d7906
Message-ID: <202509212358.Rd4NeXH5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_084347_692665_8CD64376 
X-CRM114-Status: UNSURE (   3.79  )
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
branch HEAD: 38cf754c15eeb0d80fbf52c933da10edb33d7906  Add localversion-wireless-testing-ath

elapsed time: 1410m

configs tested: 58
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                 allyesconfig    gcc-15.1.0
alpha                    defconfig    gcc-15.1.0
arc                   allmodconfig    gcc-15.1.0
arc                   allyesconfig    gcc-15.1.0
arc                      defconfig    gcc-15.1.0
arm                   allmodconfig    gcc-15.1.0
arm                   allyesconfig    gcc-15.1.0
arm                      defconfig    clang-22
arm           jornada720_defconfig    clang-22
arm64                 allmodconfig    clang-19
arm64                    defconfig    gcc-15.1.0
csky                     defconfig    gcc-15.1.0
hexagon               allmodconfig    clang-17
hexagon               allyesconfig    clang-22
hexagon                  defconfig    clang-22
i386                  allmodconfig    gcc-14
i386                   allnoconfig    gcc-14
i386                  allyesconfig    gcc-14
i386                     defconfig    clang-20
loongarch             allmodconfig    clang-19
loongarch                defconfig    clang-19
m68k                  allmodconfig    gcc-15.1.0
m68k                  allyesconfig    gcc-15.1.0
m68k               atari_defconfig    gcc-15.1.0
m68k                     defconfig    gcc-15.1.0
microblaze            allmodconfig    gcc-15.1.0
microblaze            allyesconfig    gcc-15.1.0
openrisc              allyesconfig    gcc-15.1.0
openrisc                 defconfig    gcc-15.1.0
parisc                allmodconfig    gcc-15.1.0
parisc                allyesconfig    gcc-15.1.0
powerpc               allmodconfig    gcc-15.1.0
powerpc               allyesconfig    clang-22
powerpc           chrp32_defconfig    clang-19
powerpc          redwood_defconfig    clang-22
riscv                 allmodconfig    clang-22
riscv                 allyesconfig    clang-16
riscv                    defconfig    clang-22
s390                  allmodconfig    clang-18
s390                  allyesconfig    gcc-15.1.0
s390                     defconfig    clang-22
sh                    allmodconfig    gcc-15.1.0
sh                    allyesconfig    gcc-15.1.0
sh                       defconfig    gcc-15.1.0
sh             dreamcast_defconfig    gcc-15.1.0
sh          magicpanelr2_defconfig    gcc-15.1.0
sparc                 allmodconfig    gcc-15.1.0
sparc64                  defconfig    clang-20
um                    allmodconfig    clang-19
um                    allyesconfig    gcc-14
um                       defconfig    clang-22
um                  i386_defconfig    gcc-14
um                x86_64_defconfig    clang-22
x86_64                 allnoconfig    clang-20
x86_64                allyesconfig    clang-20
x86_64                   defconfig    gcc-14
x86_64               rhel-9.4-rust    clang-20
xtensa         smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

