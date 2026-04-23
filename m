Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02930FAD3E7
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 02:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EusW6+cevbD3/f0vvJuiSHtCTuUHKTY2wsOVgeYVOR0=; b=HQ+gaqglSQ9MS2ea2drwwyrIrb
	oSYHmhhJIQ6Im6rTXqrZZgWtkK7RMvwiAyl7D7HH3H9UhmKYY9O0EVWa9tr5YC3exxFhA7Gqzf91K
	GvLFq4w6YkXKG+aExq5RqJTbCLvKBh+eBJy6X6zWIjsbkOoGrAr7I5SSZkH6oPp72B+GKlfciPTso
	M+uGFFhZYyyxN6Ray3yAuj+5HUxmufZQs6Ib8VhatVM6Q+KOjZNlI0C/XvesMmOVsQFyywQsh0OaS
	Ch4ObFEmt2KF1S7HG9gvqFaOxlEpuTqfa8w/9Z113Ei3b/rCA34Sxby23TrP8M65Bqr4Tql2TWh9T
	rbLhh9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFk0m-0000000Avi0-2YB1;
	Thu, 23 Apr 2026 02:41:52 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFk0j-0000000Avhg-1YWZ
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 02:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776912109; x=1808448109;
  h=date:from:to:cc:subject:message-id;
  bh=42muWnoQxRlex8zfiAT7flmZhoB/N4KadQeycTYSoDw=;
  b=ZY4/QiyVjG6sRySad74dc/Z/1kJ4/1heY4fntnFtfgTt7Q4HbuBno2cz
   7UrqZ3Gc5wgHPCA1i3t6vRZgKdZgKsiKF7hm4k7e2+a5/VA6vlKQ8LFhR
   0umG4n52N3Ku0zbeCjicLHy1BD9G9YgCfErmIuhUzLnVVdCGcAHp5QSQ7
   2SirNICZ6THTr368tu1Q8gE+DfJCaog39mdliqyfZajAsKmhfELNglDur
   WQ5aLv5oTiUqqvUbcuKDFygESg4sKnds78etde3MgrH+B/QPJ8T+uclCr
   6TMOCxDH7A07atv84hm0v38dgaEB5YXyYgjTBhflY1Ltq2O/FRQ+cPsvA
   Q==;
X-CSE-ConnectionGUID: iXWVkZSWTeieQMP4dlHcKg==
X-CSE-MsgGUID: QYStYIBISZ64yoer+JGXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81482728"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81482728"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:41:45 -0700
X-CSE-ConnectionGUID: zmlAQcaETT6k3OY35s/TPA==
X-CSE-MsgGUID: TgbtEwcXSuaoYrbfD+3xgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="228182244"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Apr 2026 19:41:44 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFk0b-000000001O9-1vuY;
	Thu, 23 Apr 2026 02:41:41 +0000
Date: Thu, 23 Apr 2026 10:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-next] BUILD SUCCESS
 34a5329beee86a22a446e27eb37f06caa63479ca
Message-ID: <202604231025.U4Xc8Apk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_194149_478796_1B1B39F1 
X-CRM114-Status: UNSURE (   3.39  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
branch HEAD: 34a5329beee86a22a446e27eb37f06caa63479ca  wifi: ath9k: Obtain system GPIOS from descriptors

elapsed time: 762m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

