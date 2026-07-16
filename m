Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1162C44507
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 03:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFX+OJ/1oshvDa+Pc/cNDMC2F33/ca4F/GRPh3niRF4=; b=noQdSAyeom/sWF4eQxY/0ipywW
	GHJ5c1LLbvstpdol8lkr3JjTKN+lD5Jp2wZVAzTBb3tL7CwF4seWrFVRraCYX8FArGHus7oG5YmQj
	9lT1OX1FEdijJWXyuP7RnpUSKnyw5tFh3hbbSnLrCAlHxe6X6rvIwNY8h7qOg9iAASltmJ1GVzVCw
	q2+dvEwCIHhx7YcEFz89LVgjO+YpCYgyoC41zyDap80bxTKIwqAAGoflBtuizpgpIoqOEa2ZySC7T
	/Y9Ca8wuRnkFzX4ZoWtnEb/+3+mYUFbXfc4+4jiCxBMNPxcBCF8F4Q2L5+wtbPy9MTIzAg9Zh/0FM
	qmcJV0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCV3-0000000GKDw-07Tz;
	Thu, 16 Jul 2026 03:11:01 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCV0-0000000GKDa-2kKl
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 03:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784171458; x=1815707458;
  h=date:from:to:cc:subject:message-id;
  bh=p0GcQLU/VEXQbpz3As9SQnEaZyCZLUbC4f0+RsmB2Js=;
  b=ZzE5u+ymahAXmA+VCwelnJFc07Z30CWTHTy+n1hSnd1wFPBBTDHe2N+G
   YbPkue4UhoIds2W5BtSWpa7IyxlQ82i1Tj8JekRdRvx/RbjrabbieoHaD
   LD27zJZUdcCQ+S+QLWut09CwW5fhxftLGR4yhWVQe22RhsZDuvkMj2yHa
   nMDypvUmscuXc6U2lb0XHKmOJOs4huhwlOBP4VMgV3YQnIUfKKmQ/fhcI
   eLDK791yGRsU4KJaTshHawbbfJ2eajoxY29NkETMXAf4TP9wvrzjh5uvD
   zMwgw4hWki/00lrIHcSJ9x7MNb7efgTtZGdchmGOnuPnqgUcG0vwDzSe6
   g==;
X-CSE-ConnectionGUID: INn/P6QLRwWxQ38YHu2XLQ==
X-CSE-MsgGUID: OSSV2gsfR0a9foMDZqqlpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88648746"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="88648746"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 20:10:57 -0700
X-CSE-ConnectionGUID: r5g059fERPu5cAsPZ4SxrQ==
X-CSE-MsgGUID: IwoC5pJxQs6hGYWI8fU0MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="251945364"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jul 2026 20:10:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkCUv-00000000OGA-2klt;
	Thu, 16 Jul 2026 03:10:53 +0000
Date: Thu, 16 Jul 2026 11:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:main] BUILD SUCCESS
 d53596236d27bc5cfb0f8566a85e79b67421f0f4
Message-ID: <202607161144.BZzSVwzj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_201058_713667_5C9E48B0 
X-CRM114-Status: UNSURE (   3.74  )
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
branch HEAD: d53596236d27bc5cfb0f8566a85e79b67421f0f4  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 61
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-16.1.0
alpha                  allyesconfig    gcc-16.1.0
arc                    allmodconfig    gcc-16.1.0
arc                     allnoconfig    gcc-16.1.0
arc                    allyesconfig    gcc-16.1.0
arc         randconfig-001-20260716    gcc-14.3.0
arc         randconfig-002-20260716    gcc-16.1.0
arm                     allnoconfig    clang-17
arm                    allyesconfig    gcc-16.1.0
arm         randconfig-001-20260716    gcc-8.5.0
arm         randconfig-002-20260716    clang-17
arm         randconfig-003-20260716    gcc-12.5.0
arm         randconfig-004-20260716    clang-24
arm64                  allmodconfig    clang-23
arm64                   allnoconfig    gcc-16.1.0
csky                   allmodconfig    gcc-16.1.0
csky                    allnoconfig    gcc-16.1.0
hexagon                allmodconfig    clang-23
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-20
m68k                   allmodconfig    gcc-16.1.0
m68k                    allnoconfig    gcc-16.1.0
m68k                   allyesconfig    gcc-16.1.0
microblaze              allnoconfig    gcc-16.1.0
microblaze             allyesconfig    gcc-16.1.0
mips                   allmodconfig    gcc-16.1.0
mips                    allnoconfig    gcc-16.1.0
mips                   allyesconfig    gcc-16.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-16.1.0
openrisc                allnoconfig    gcc-16.1.0
parisc                 allmodconfig    gcc-16.1.0
parisc                  allnoconfig    gcc-16.1.0
parisc                 allyesconfig    gcc-16.1.0
powerpc                allmodconfig    gcc-16.1.0
powerpc                 allnoconfig    gcc-16.1.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-16.1.0
riscv                  allyesconfig    clang-23
s390                   allmodconfig    clang-23
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-16.1.0
sh                     allmodconfig    gcc-16.1.0
sh                      allnoconfig    gcc-16.1.0
sh                     allyesconfig    gcc-16.1.0
sparc                   allnoconfig    gcc-16.1.0
sparc64                allmodconfig    clang-20
um                     allmodconfig    clang-17
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-22
x86_64                  allnoconfig    clang-22
x86_64                 allyesconfig    clang-22
x86_64                rhel-9.4-rust    clang-22
xtensa                  allnoconfig    gcc-16.1.0
xtensa                 allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

