Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1627FD32D9A
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4OGbvprDpRd0FdPbS3WFzPLC3KRMu899scFQRbxCrfc=; b=Mxmwvon7npV/2TUHZq2nujVJep
	4LggQl+GvJlu3auv1sRkbV6ps8fi2GZMOYVO0NJFXeBUqECJzRW/LRGinpCUYddYjQdOlw4EK3UAc
	a53V4c1Y4nBlhymAXNf0hvTbYFrxyfj4kFsppx2BnVc+FZdOMuWICdeQWeGsAG1nn0bzFfIrliqk8
	Z5g+kOPW8KoU6LNrFaFhy7KsHw75G0o6I7+OZ3VWD/57QqeySO+JhCaiTbRyYOsi4b+/XdcbTslgU
	tXMlh+aXF/xEZNpdB5fIyM7H6NOYoxotIMT9Y5eSffchvKUjq2VFSr2qqm2jhn5JNZT879Qomht4+
	z1mOoR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApva-00000003Nm7-37jF
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 12:23:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApbf-00000003KRX-0th9
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 12:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731412970; x=1762948970;
  h=date:from:to:cc:subject:message-id;
  bh=zU08P3ukFmM9hW96hWPAlyMgVEuZWTaitLgapdVNbT0=;
  b=fIhDcFOZK38Mwj5U8hO449yh611L5vycyqfBa3B5VawLVz2FiAqKhY5X
   yyP1O8pxtXdx6RvQ3ZZxJ3NKl7ncW53hfjHLLJHT/kDdTN6SWfnuPxQln
   +wAGIplx5U3lcT0Zr7FMYP8NgOiV8SK9ecZbcYJ1bJFNUGpAX/Z9w++5l
   J0fzLeRIan2vf8guCtAwU0YpHQSIXJngn6HRYqk97NYEGInkxmyliSEHp
   QYamm8wwvklFiFuJteVJj557tUjoDVtVVQZBA+VuDEpkkQnqb50f244Qs
   6XTtRPtjNIaTEt46bTCCv3U78f9jcoatxzRW7zaP1tY85nfp2BSkMoUYe
   w==;
X-CSE-ConnectionGUID: ULDavMSKTHm0fJLzr7AuNg==
X-CSE-MsgGUID: RFsfdUXLReyrddkB2A0NBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="30643676"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="30643676"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 04:02:47 -0800
X-CSE-ConnectionGUID: wwLTf7L8T5O9wdB4gONHZw==
X-CSE-MsgGUID: jZBY+LfaQz6Qr7XYECYpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87807891"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 04:02:47 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tApbY-0001GO-2J;
	Tue, 12 Nov 2024 12:02:44 +0000
Date: Tue, 12 Nov 2024 20:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4751f3d2ab0324a39837d60d30dd1bdc28f3c6ba
Message-ID: <202411122051.mL5xb4ac-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_040251_290256_26598D4D 
X-CRM114-Status: UNSURE (   4.32  )
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
branch HEAD: 4751f3d2ab0324a39837d60d30dd1bdc28f3c6ba  wifi: ath11k: miscellaneous spelling fixes

elapsed time: 1019m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-14.2.0
alpha           allyesconfig    clang-20
alpha           allyesconfig    gcc-14.2.0
arc             allmodconfig    clang-20
arc              allnoconfig    gcc-14.2.0
arc             allyesconfig    clang-20
arm             allmodconfig    clang-20
arm              allnoconfig    gcc-14.2.0
arm             allyesconfig    clang-20
arm64           allmodconfig    clang-20
arm64            allnoconfig    gcc-14.2.0
csky             allnoconfig    gcc-14.2.0
hexagon         allmodconfig    clang-20
hexagon          allnoconfig    gcc-14.2.0
hexagon         allyesconfig    clang-20
i386            allmodconfig    clang-19
i386             allnoconfig    clang-19
i386            allyesconfig    clang-19
i386               defconfig    clang-19
loongarch       allmodconfig    gcc-14.2.0
loongarch        allnoconfig    gcc-14.2.0
m68k            allmodconfig    gcc-14.2.0
m68k             allnoconfig    gcc-14.2.0
m68k            allyesconfig    gcc-14.2.0
microblaze      allmodconfig    gcc-14.2.0
microblaze       allnoconfig    gcc-14.2.0
microblaze      allyesconfig    gcc-14.2.0
mips             allnoconfig    gcc-14.2.0
nios2            allnoconfig    gcc-14.2.0
openrisc         allnoconfig    clang-20
openrisc        allyesconfig    gcc-14.2.0
openrisc           defconfig    gcc-12
parisc          allmodconfig    gcc-14.2.0
parisc           allnoconfig    clang-20
parisc          allyesconfig    gcc-14.2.0
parisc             defconfig    gcc-12
powerpc         allmodconfig    gcc-14.2.0
powerpc          allnoconfig    clang-20
powerpc         allyesconfig    clang-20
riscv           allmodconfig    clang-20
riscv            allnoconfig    clang-20
riscv           allyesconfig    clang-20
riscv              defconfig    gcc-12
s390            allmodconfig    clang-20
s390            allmodconfig    gcc-14.2.0
s390             allnoconfig    clang-20
s390            allyesconfig    gcc-14.2.0
s390               defconfig    gcc-12
sh              allmodconfig    gcc-14.2.0
sh               allnoconfig    gcc-14.2.0
sh              allyesconfig    gcc-14.2.0
sh                 defconfig    gcc-12
sparc           allmodconfig    gcc-14.2.0
sparc64            defconfig    gcc-12
um              allmodconfig    clang-20
um               allnoconfig    clang-20
um              allyesconfig    clang-20
um              allyesconfig    gcc-12
um                 defconfig    gcc-12
um            i386_defconfig    gcc-12
um          x86_64_defconfig    gcc-12
x86_64           allnoconfig    clang-19
x86_64          allyesconfig    clang-19
x86_64             defconfig    clang-19
x86_64                 kexec    clang-19
x86_64                 kexec    gcc-12
x86_64              rhel-8.3    gcc-12
xtensa           allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

