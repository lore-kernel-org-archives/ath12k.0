Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9ABC5B549
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lVzope0BgRLgA0kAk/IvueVcZPCbM4VIkuvu3kSAZIQ=; b=5A312cy4zrZTkEptjShUY2klGe
	frALH2J+ebORzjJxbTC306Ezqm3tqhwY+Hx6oEj5zAxeEyIWbOlhu2jpIBv0S4nwwXZwB9BriJTcx
	2zRcbODZJAHXf9kFNHdkDnRNfNl+0Cr+wzGHeCCtSaa54gGm96Grn7msJtbB8rSAcgAJQUUXdJUXE
	Y5IZdtsoaZqo7RjEoAyoDAkmCOVAF6Pyv3SRYTDUr6HbtOvA+dbhwSCQSXAkdfvkMOimGDGsEchHG
	F6aVPCW9ymz1wAh5lOuB2s9oLs6/nviTCuJynMmGFLR1aWpHdwcfeCnyn1UErd/JbkClqhB7ynt5W
	hqBAJpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoD9-0000000DSRy-4BRs;
	Wed, 04 Jun 2025 13:31:20 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoD7-0000000DSRd-31XD
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 13:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749043878; x=1780579878;
  h=date:from:to:cc:subject:message-id;
  bh=J4BnxE86a4Bkm4i0gU2sFXonuqeUaRqk2mj1/g3M/OQ=;
  b=Etr4HgmSsu8usO8qwxA/xXD+38Yky7VEv8RaQaoM9q/S09S9GNl3dkBb
   AYQiinKYWjUE5vFCN9LOI3OzrTZnKH5q+C7U6M4ZdxPgTVdnojPOZbrvO
   J/fotGNIBIdwbeGEsCt9jNGiZABeauKKEjPS9+PZUy4tUazUrjCdgyjTZ
   JBQSMczWSdwmVDp/4jtyJYTjzBcb4HB/B36OOWnrdRbofGFi+QvTRGwIR
   yA/OX/6JZ2A6hy3XLSuhgGi0sWB5dMWkwZGDYr+F+jdrYnksGjxm7y8Uj
   c+hoLXEWgFKpDaMbKM5TkwRYRJxtiw1NAA1xk8k6rM2BttC0FAhknN900
   Q==;
X-CSE-ConnectionGUID: sYUJ26dYSby7l/kawKYadA==
X-CSE-MsgGUID: 1JhzIoujTcej/+FDCZU+rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68561119"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="68561119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 06:31:17 -0700
X-CSE-ConnectionGUID: c0xaSx/eRYqFjtix0sJ+Kw==
X-CSE-MsgGUID: 043KJR2vQna4F0B+xuk5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="149024287"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2025 06:30:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMoCg-00039p-1a;
	Wed, 04 Jun 2025 13:30:50 +0000
Date: Wed, 04 Jun 2025 21:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 c3910de7bab78afbc106206aed5ec8e79458fbee
Message-ID: <202506042119.Wmi0XCmV-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_063117_834082_24FF7A2F 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
branch HEAD: c3910de7bab78afbc106206aed5ec8e79458fbee  Add localversion-wireless-testing-ath

elapsed time: 1230m

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

