Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEB8C55174
	for <ath12k@archiver.kernel.org>; Sat,  8 Aug 2026 05:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYLvcL1Uv/hrLNC+6TqaInIWAL8G/g8qrrv/VYayDlg=; b=0cGICxzc30F7eZr1ROuqYVo+9P
	xJDNYXqMH6t9c32tIicepC/5j1N8xiQ36ZBp2qv0ErBdIAW8h+ztt72V2hnDa9FhzQ8/7ypZwJY4G
	ju9SwG2mGAUK3QoElp595uQfuXRgSx1FvOKjNfsgsnjlL8VPMw9rs9nHCEYHUE73Qf3FSEsWsx2M7
	mOmpOB/tmYYtPHNOC//4OfC0XlyOm7jZKKh/f9ji1baGTzjnDUISKVpiEQaVKUmtje+jIoxz9tAj+
	yWkiOBZ4ac6EG7SgVZ48EokMalzKVNga55EpHAdaIRwGBY4IUp8qATjTidSc2H1UoYFPxWBGoOUnh
	xN2goC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZGQ-000000093mK-0KQP;
	Sat, 08 Aug 2026 05:06:30 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZGO-000000093lX-04dK
	for ath12k@lists.infradead.org;
	Sat, 08 Aug 2026 05:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786165588; x=1817701588;
  h=date:from:to:cc:subject:message-id;
  bh=S7yIjp9r38+9WUL+O2Nsf3laQA+Zdt7L02nQ8idgClU=;
  b=ZiCo+JuFaK5wyKFtA9kckuNw+ppHTNvnWVM8/aPPPSBBO2DJXXVhCf4+
   /32gCdz8Y38UZBou7mrNBKCXQVHeCKGqfqco/KUnmhugD5GBTxV2ikg/S
   McrKR9g76MccWx4nqYopjBf4/ZhiB7z3uyORxzTHW+2PSMBRYDVIlRnC2
   3qkE3ba7PhVimwTDEOGGrNLXcBVa9r2ldoe49ZQabhXRv83co9fVTRRqI
   3mZqHx9rBR6lFKmHeeE2864FSXr6F6e0B5xT6t3Hbks3oE5OvBJQEC+i8
   A/6Prhy9ZqxYmJBPvnBz2wEQTCRw0DjwkcPut/vU06McuEH8vs/vkkhec
   g==;
X-CSE-ConnectionGUID: EOErHEBDQlqTltnBOhBPOQ==
X-CSE-MsgGUID: la5ZJQwiTxW0FG4GYAqQhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="85742942"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="85742942"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 22:06:26 -0700
X-CSE-ConnectionGUID: 0L+L1ncbSPGvyLoUd/B0Ww==
X-CSE-MsgGUID: 8SznBADuTJeccpClzeusdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="292471484"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2026 22:06:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsZGJ-00000000Jlr-1Nyf;
	Sat, 08 Aug 2026 05:06:23 +0000
Date: Sat, 08 Aug 2026 13:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 498ba7d5ecc6def3d27e2b2f7d97a1b77c1f0015
Message-ID: <202608081304.3j5Ri4sf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_220628_068989_6C3253FE 
X-CRM114-Status: UNSURE (   3.58  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: 498ba7d5ecc6def3d27e2b2f7d97a1b77c1f0015  wifi: ath11k: disable interrupts during firmware crash recovery

elapsed time: 816m

configs tested: 16
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc        randconfig-002-20260808    gcc-9.5.0
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
powerpc      mpc832x_rdb_defconfig    gcc-16.1.0
sh                       defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

