Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ED7C5AC67
	for <ath12k@archiver.kernel.org>; Sat,  8 Aug 2026 05:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g/58uYmwX3U4m/mKueEpgtHduQiozvw8rWfei2Xagq4=; b=PksUQbUfV/p7RwGX9FaJqgFnVE
	m36VxuP/GfUbHItobPDZkMURdDvauJutpa9Uc4J85or0Uy3ZXk5sy4gy5irxNKKRiaJ4hBQx60kAk
	wj90kbsVAGChGFsSxVTCPC6Kq4VonICGrnoigp4sufRzPpeoPBtuslGSLpSjCPNwM2pTcUqNTFzd+
	HFesqZQ+ov7y/wr+U6n1itWOxxNRVdYgxeimpphXdUIUk+OFUNKoywuBHJ+WlhzVseRxnLtzd314h
	y/977GLVCEQjJDmjvC+mRtgElvzJENjfesKG58p/Ufvsg14RfXq8QwrTrsTn5uPiOUscWIPJdl1Cj
	lYStu+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZGO-000000093m5-49YQ;
	Sat, 08 Aug 2026 05:06:28 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZGM-000000093lX-2cm5
	for ath12k@lists.infradead.org;
	Sat, 08 Aug 2026 05:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786165587; x=1817701587;
  h=date:from:to:cc:subject:message-id;
  bh=dhocffQdCgAK4ybRBDHEesVpf2nl09lAD9UBwb6/CtI=;
  b=i+eebHOd42WtgkVLf2ZnKahYSmpJ1JEOLXJd1aSrMOTKQ7m10UVOZrGx
   fTaqFUsN90fzAXQhuT6Ql2YsbFWfihNh2o0kJgR7QW6NuyOoARfRuKxlU
   gmTxCKxDL2oKhR7FG9kj34R+t03u2Z9locOXFxESLCXrrdFsrimkOClhK
   VaG1nP3meQwE2ggzxLGouB/cIgFFQNcWyKwnRdLe8d6vc5Ab1wbEByC6W
   Le5G7Blkdgi04xwX+/HQ8NuOD/Rn61AFsa9LKcG6e9tDDO78EARSBd66O
   KxJn7GwVnFU3BJr7rXIwNOlhjO0qYXWaTCLGZAPowGVdwG1SDlGB6t8iE
   Q==;
X-CSE-ConnectionGUID: LUlhifolQQeFbjnGmk51Og==
X-CSE-MsgGUID: plNKbXHhT8uqZ6KuBfMY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="85742939"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="85742939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 22:06:26 -0700
X-CSE-ConnectionGUID: CTWLAH4vRn6a5YQYanJAfw==
X-CSE-MsgGUID: YdUOfEeRRYSZ0t4u340hJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="266823858"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2026 22:06:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsZGJ-00000000Jlp-09pZ;
	Sat, 08 Aug 2026 05:06:23 +0000
Date: Sat, 08 Aug 2026 13:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main-pending] BUILD SUCCESS
 774f0bc336eb281f2750ebd3f51e2621a7bcdc9b
Message-ID: <202608081346.irXgSPlw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_220626_674903_62D9D62B 
X-CRM114-Status: UNSURE (   3.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: 774f0bc336eb281f2750ebd3f51e2621a7bcdc9b  Merge branch 'pending' into main-pending

elapsed time: 816m

configs tested: 16
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha             allnoconfig    gcc-16.1.0
alpha            allyesconfig    gcc-16.1.0
alpha               defconfig    gcc-16.1.0
arc              allmodconfig    gcc-16.1.0
arc              allyesconfig    gcc-16.1.0
arm           h3600_defconfig    gcc-16.1.0
csky             allmodconfig    gcc-16.1.0
i386             allmodconfig    gcc-14
loongarch           defconfig    clang-24
nios2            allmodconfig    gcc-11.5.0
nios2             allnoconfig    gcc-11.5.0
parisc           allmodconfig    gcc-16.1.0
parisc           allyesconfig    gcc-16.1.0
parisc              defconfig    gcc-16.1.0
powerpc    mvme5100_defconfig    gcc-16.1.0
sh                  defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

