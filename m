Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20187E7717F
	for <ath12k@archiver.kernel.org>; Fri, 13 Dec 2024 19:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/8LC3haorSWj1p0cvkuizFi2CBeiPuf+Hslu4IHYi7k=; b=RJ9s1DUEhPEZ668jgXUo/B0Qwb
	re1Jx80eeOD06COjKNDsYnHaNRNDUfO6p+WkYHLbEo3j9PnZTZHWO64jg8FeW/1luXglkDcxlWtIN
	O9SV/lRasiJr9hiqCtqHos3szyqouIiwu2GFhV1WMdcoV5WX//1gTkJ3YK87ewIfm5ptYqa/zznXp
	noHnW5kaS16ZU2YXnBwh/+0XVVw5dIXm4Fh6Tcr6KgoazDs3P3ckO92TwEmBBznEyuXd1+vrWGQDS
	E4bqdyTttKuhtH2lTE9jVEgvihvxEicDJzhAfVQ64Mq4pOPeyGYtx2N1IYhEOwhE9tRTBYFIOC5Jm
	+mOTKG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBgw-00000004sgc-3jcz
	for ath12k@archiver.kernel.org;
	Fri, 13 Dec 2024 19:51:14 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBgs-00000004seN-0fqb
	for ath12k@lists.infradead.org;
	Fri, 13 Dec 2024 19:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734119470; x=1765655470;
  h=date:from:to:cc:subject:message-id;
  bh=JSFTGfLG4VDa0V0kkIx+zZBuXTjyxWxmkUowcMgS8fI=;
  b=la4Lg0HbO+Hvq1POmCIUtjfrlbKixrA6gJJueknjpWl7l4VHP3G3bz5A
   tYFJ74R2kiXSUUrUFq2Vi0Dhqw93Ue9DrLiIXuzAdtvVZn8/vaXTMc3uN
   HUVl7cpfUn1kQbDJr8Xhbc8VN2lbRh4klDBo/ZOr4/zxuQ2sdsHrCLt9r
   H6sSalzWmrBdlOGlZcjw39KhofWK1O6bCd5o/KizjObXaIp6J3heO2tmK
   yIA7PiUcC/RsnJrrXaCW3uQyKm5We3RQyS6DUTp7iz5yRgESPuGkFG0Qm
   /EPRnu5y+CluBj+1kPzOR3qtHB3Id0woPhNfdLFopzCrl7OzDv6+IT+2i
   w==;
X-CSE-ConnectionGUID: o506RXGYRdCSp10/Rykunw==
X-CSE-MsgGUID: 7yiHLC6ZQfiibzoWg6N6UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34454786"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34454786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 11:51:09 -0800
X-CSE-ConnectionGUID: 56MRv8frTDKZh8zd8TZR2w==
X-CSE-MsgGUID: HIL+0/yrS2GQ7Qi6Jvo3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97039059"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 11:51:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMBgo-000CNX-07;
	Fri, 13 Dec 2024 19:51:06 +0000
Date: Sat, 14 Dec 2024 03:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 e17bc29f5aafa908cdfc9750611bc9826f49cf7a
Message-ID: <202412140317.rdAs3JWK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_115110_277616_68D60C32 
X-CRM114-Status: UNSURE (   3.22  )
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
branch HEAD: e17bc29f5aafa908cdfc9750611bc9826f49cf7a  wifi: ath12k: advertise MLO support and capabilities

elapsed time: 1450m

configs tested: 59
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
x86_64                         rhel-9.4-rust    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

