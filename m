Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2746C79F8C
	for <ath12k@archiver.kernel.org>; Sun,  6 Sep 2026 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vD/01HXTFTH/UUz8apcBf5jNpXWOvh5DlfqAdtVyraM=; b=ZVjcw3wH2PcakZ7sfbYzJKnril
	zNf3OtkTnGxYrckdhbCgmafyQfViziHieAXNyDmuv73APpdZIpfOgIdV76P8bq826MAw9LXsTqP3g
	xOuoG+iifGvBscsDaSL7pUP5ZYzKUDUL6UXIkMSoKLO7u3SZrYg5Qvs9TfXdy6eIgfmOZ0i+COyvG
	3gavkvKxQ+fSJ4XRGD3FaD+XQtGoYTcor2PkxQoXh923KSungfz05KnlYk8FK+S7OK4oWXDVzCcT7
	mH1QPoCJbrVcBe9rBcFu1jt5dB92bGxI9niaahK4EA8nJ3IoR2zV3tQ/YNDSRVKPMVWk07OxBHKzt
	qQm1VTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37Pq-00000004oh0-0sZU;
	Sun, 06 Sep 2026 07:35:50 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37Pn-00000004ogd-2N8M
	for ath12k@lists.infradead.org;
	Sun, 06 Sep 2026 07:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788680147; x=1820216147;
  h=date:from:to:cc:subject:message-id;
  bh=IOcRcy7DmsJSNG4azC+c6Da9hWOhtq62D5+IHoCMsNM=;
  b=ge9zz25AJjlFOOllF81IPmTJQuYJPalWK+X0lG5DtyWzNb2079VtcCgf
   4fbEvcpaGhgO02w5Qan+E3qPaTvUXBkIuIBplmiawNBR/u0rOwFkE3RDG
   IkgQQZ59R7RZNYJWHl3uBEwdq3uQnH4SO0vPp0+iSc1aHTzp23BdRSFnA
   T6x+Gk1v6Jbg3m3d1E4d33BlrlIgJ/HORB1fA7S+EZzsArA6RjjzCB7BD
   3MpqntnoshXVj58c4KghxfEJeKDpYyDHissEzj5yJDpbh3DjkTvVpsJMO
   FMKYCswNJxOQwm3y+VPjPgsqt8GPNd6BBKoRSMZsFX92dHxKpbv7XeLBZ
   g==;
X-CSE-ConnectionGUID: 2upCQ6rORIav0vUxkxMhnQ==
X-CSE-MsgGUID: nrfBGqNuROmbf476Jo/Ucg==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="111893025"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="111893025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 00:35:46 -0700
X-CSE-ConnectionGUID: 0isx+rgvQS2Dns2AY2w1zg==
X-CSE-MsgGUID: M5ZGu2ueRoqvHAJTmYIsbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="269916053"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Sep 2026 00:35:45 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x37Pj-000000001Tf-1jw1;
	Sun, 06 Sep 2026 07:35:43 +0000
Date: Sun, 06 Sep 2026 15:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 ac38b483e5aacffecdf0c91f7d767ce6284cf57d
Message-ID: <202609061513.jNJ6HtLd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_003547_697917_A04212E0 
X-CRM114-Status: UNSURE (   3.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main
branch HEAD: ac38b483e5aacffecdf0c91f7d767ce6284cf57d  Add localversion-wireless-testing-ath

elapsed time: 3607m

configs tested: 65
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

