Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02063D10BF0
	for <ath12k@archiver.kernel.org>; Sat, 26 Oct 2024 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3bTVsHVrzV9QwzoXK9aHDFpqBiyDxDEth5EsH9sxrw=; b=BBzflk6vwqxFi/zVaeFU323tOM
	oEhiV+FAOv0VX5IUWSV6mH8q3r89clDMZtJny9kMp4PXt1HdKN01txeuXOIPApDfeRd/exZwnIc/Q
	XHRQ4h2UKLPulboSEoqCl8dFaC/wpshoq2H7QBKd7YzvByt1oPz8w4/vDRIG7USk63jsaN+kUNNyR
	DBBm2dqJgrr5YXQRTz2Ep5X+wzG3uNMLG7+ql1KFc6SWTCqrX2VVfDcnMtvpUxpfw0fQYBOMAdpzm
	O1jooGs42Rzmt5Isb3YHDn6p/EgNeI24WeLGuG6AMRyku7Hs7pepdBmU++mG9PlsSUrjwNbhMBY9L
	atJRFNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4eMr-00000006Otk-2iMv
	for ath12k@archiver.kernel.org;
	Sat, 26 Oct 2024 10:50:01 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4eMp-00000006OtM-0j8p
	for ath12k@lists.infradead.org;
	Sat, 26 Oct 2024 10:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729939799; x=1761475799;
  h=date:from:to:cc:subject:message-id;
  bh=4ZoG/D1fmnVPFneGbklNqUJzI7sH/cjGz/+Swuhq8f0=;
  b=HSPoZfY80BS0rpVk3IUeBzp0GlbWAg8UTAmlm7SYFFLbtiBMuOTl9/uo
   7UmKi6+OyefLKUXLBla6tK97cLZtxbsj37qx0yzLi6bl6z+moivGOWhlj
   rFwXmLMwc55vrfeYxSUTlLoQqFIg5PaGT+0ZByOYlLx8R4MvlephDst7t
   ejJIFDD24FotvMGtwOHBEzSx+Kpv+kiOWZBbAi92V8IUhhhfzs1gZw9+s
   2C2q8x2BStMMLv2Snjjosvvfe45XaW/C51swEd1yYmBZxJpkkA9BJ+0ux
   1VDNGnhlkejguRfdJm+d2Ybuet5HbUqAo1sx8GHnUHIg4wW33yfex1FYu
   g==;
X-CSE-ConnectionGUID: nM/wfZzBQ9u+gjWIr5dx/g==
X-CSE-MsgGUID: +RRsM3+5S3K8OH8GHSRckQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="32464825"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="32464825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:49:58 -0700
X-CSE-ConnectionGUID: d9CgAbuJQ8Srhzo+1slN6A==
X-CSE-MsgGUID: XiPy7E+rReGCIdbBkm+Qkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="80797383"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 03:49:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4eMl-000ZXM-1A;
	Sat, 26 Oct 2024 10:49:55 +0000
Date: Sat, 26 Oct 2024 18:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 cdad737160571a98cc4933a62c9f2728e965ab27
Message-ID: <202410261838.esG7fzyG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_034959_250242_039E6113 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: cdad737160571a98cc4933a62c9f2728e965ab27  wifi: ath12k: convert tasklet to BH workqueue for CE interrupts

elapsed time: 882m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                 allnoconfig    gcc-14.1.0
alpha                allyesconfig    clang-20
alpha                   defconfig    gcc-14.1.0
arc                  allmodconfig    clang-20
arc                   allnoconfig    gcc-14.1.0
arc                  allyesconfig    clang-20
arc                     defconfig    gcc-14.1.0
arm                  allmodconfig    clang-20
arm                   allnoconfig    gcc-14.1.0
arm                  allyesconfig    clang-20
arm           aspeed_g5_defconfig    clang-20
arm             axm55xx_defconfig    clang-20
arm                     defconfig    gcc-14.1.0
arm              gemini_defconfig    clang-20
arm               h3600_defconfig    clang-20
arm                mps2_defconfig    clang-20
arm              pxa168_defconfig    clang-20
arm64                allmodconfig    clang-20
arm64                 allnoconfig    gcc-14.1.0
arm64                   defconfig    gcc-14.1.0
csky                  allnoconfig    gcc-14.1.0
csky                    defconfig    gcc-14.1.0
hexagon              allmodconfig    clang-20
hexagon               allnoconfig    gcc-14.1.0
hexagon              allyesconfig    clang-20
hexagon                 defconfig    gcc-14.1.0
i386                 allmodconfig    clang-19
i386                  allnoconfig    clang-19
i386                 allyesconfig    clang-19
i386                    defconfig    clang-19
loongarch            allmodconfig    gcc-14.1.0
loongarch             allnoconfig    gcc-14.1.0
loongarch               defconfig    gcc-14.1.0
m68k                 allmodconfig    gcc-14.1.0
m68k                  allnoconfig    gcc-14.1.0
m68k                 allyesconfig    gcc-14.1.0
m68k                    defconfig    gcc-14.1.0
microblaze           allmodconfig    gcc-14.1.0
microblaze            allnoconfig    gcc-14.1.0
microblaze           allyesconfig    gcc-14.1.0
microblaze              defconfig    gcc-14.1.0
mips                  allnoconfig    gcc-14.1.0
mips             db1xxx_defconfig    clang-20
nios2                 allnoconfig    gcc-14.1.0
nios2                   defconfig    gcc-14.1.0
openrisc              allnoconfig    clang-20
openrisc             allyesconfig    gcc-14.1.0
openrisc                defconfig    gcc-12
parisc               allmodconfig    gcc-14.1.0
parisc                allnoconfig    clang-20
parisc               allyesconfig    gcc-14.1.0
parisc                  defconfig    gcc-12
parisc64                defconfig    gcc-14.1.0
powerpc              allmodconfig    gcc-14.1.0
powerpc               allnoconfig    clang-20
powerpc              allyesconfig    gcc-14.1.0
powerpc           holly_defconfig    clang-20
powerpc          katmai_defconfig    clang-20
powerpc     mpc832x_rdb_defconfig    clang-20
powerpc      mpc866_ads_defconfig    clang-20
powerpc             ps3_defconfig    clang-20
powerpc        sam440ep_defconfig    clang-20
riscv                allmodconfig    gcc-14.1.0
riscv                 allnoconfig    clang-20
riscv                allyesconfig    gcc-14.1.0
riscv                   defconfig    clang-20
riscv                   defconfig    gcc-12
s390                 allmodconfig    gcc-14.1.0
s390                  allnoconfig    clang-20
s390                 allyesconfig    gcc-14.1.0
s390                    defconfig    gcc-12
sh                   allmodconfig    gcc-14.1.0
sh                    allnoconfig    gcc-14.1.0
sh                   allyesconfig    gcc-14.1.0
sh             apsh4a3a_defconfig    clang-20
sh                      defconfig    gcc-12
sparc                alldefconfig    clang-20
sparc                allmodconfig    gcc-14.1.0
sparc64                 defconfig    gcc-12
um                   allmodconfig    clang-20
um                    allnoconfig    clang-20
um                   allyesconfig    clang-20
um                      defconfig    gcc-12
um                 i386_defconfig    gcc-12
um               x86_64_defconfig    gcc-12
x86_64                allnoconfig    clang-19
x86_64               allyesconfig    clang-19
x86_64                  defconfig    clang-19
x86_64                      kexec    clang-19
x86_64                   rhel-8.3    gcc-12
x86_64               rhel-8.3-bpf    clang-19
x86_64        rhel-8.3-kselftests    gcc-12
x86_64             rhel-8.3-kunit    clang-19
x86_64               rhel-8.3-ltp    clang-19
x86_64              rhel-8.3-rust    clang-19
xtensa                allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

