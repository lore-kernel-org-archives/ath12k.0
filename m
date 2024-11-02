Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D223E677EC
	for <ath12k@archiver.kernel.org>; Sat,  2 Nov 2024 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PqN00BkkEBwUqCK1x9p0xx8vYNFIxw47ShLo2rNm4NE=; b=P14f7lbgpTHSgUlhEBWWcecmq6
	7kEEnpDvt4Y+JB4n4LbLWZUu9p0rLk40UEIWN5g2mvb5jHoCg06/GRMGtp3zPfdFXeWP2VsvzTqKs
	gDaBvA1iPuI8RqSi/muuE+KgTlYyidPr0hfUz0VdTt9zXygLeTQ2Pe34CIklIs/f1CTS/Qw/hhqIS
	e4NnDJRRJdbTlDcay3ZWqPp1/csRetDeDvv7XN3G3fqW7OkzifD33H8jQeEorzVLkVwGJ/VZuNXYX
	y8JuWjTA51uT/N7p+jqgobqnf/aSZLrMy79ZgbffMjJ+8BzhFSvUAzr7OLDI8ON3Eu3r49aUrcZPt
	Lw8CmkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t77hR-0000000997L-0cyH
	for ath12k@archiver.kernel.org;
	Sat, 02 Nov 2024 06:33:29 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t77hO-0000000996s-1Emn
	for ath12k@lists.infradead.org;
	Sat, 02 Nov 2024 06:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730529206; x=1762065206;
  h=date:from:to:cc:subject:message-id;
  bh=26/8RIq61/jKL9pYMKEYFkplxEnj8EW2ZeCx+Ky0rVE=;
  b=XacwnBY2Zzpknc1PmgGLDugx5cZu24V+ts4vmM4Y5cVpD3+NCPUAnKfo
   VfynfHpeYzsTStY6j0FPuNf0dqmY9E55Be3vKStIodjlFYyhzh2MR25dV
   OPoEzkhO4nJbht5L2U094cl2quqDBgU+WOQvJihuKWyZKEQy9XWRqUwJD
   tUX8OLDXj8KZ4HrqZw9U7Yt/BHvPM5Vmtg1c/4nbdOEY2KMykszh77GYM
   0/AbRQCeGxyDU7+KUI/SC/RX+zNN0I6FtkgigLa3r6D8cVttSZVQ4ADY4
   SvRPxBarAmDKyjY/EzhzmS6csoTtmRIIrDFR69LCN/xQ6cYCS+eVXOtC/
   w==;
X-CSE-ConnectionGUID: erFSvRK6T/yVJwLbXZ4aYw==
X-CSE-MsgGUID: cXzMT0ftT128fqRzebsdgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="40868968"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="40868968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 23:33:20 -0700
X-CSE-ConnectionGUID: Sr88mDz+SPGwt0t1fKXgvQ==
X-CSE-MsgGUID: ZwZWPheoQ8u9jQk0nJQ8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="113943142"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2024 23:33:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t77hE-000iVh-1x;
	Sat, 02 Nov 2024 06:33:16 +0000
Date: Sat, 02 Nov 2024 14:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 fff1e80a66d5e4cc6e689950a59219ea8185e498
Message-ID: <202411021443.Z3jpFZoo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_233326_372515_30D9C35D 
X-CRM114-Status: UNSURE (   4.10  )
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
branch HEAD: fff1e80a66d5e4cc6e689950a59219ea8185e498  wifi: ath12k: Add MLO peer assoc command support

elapsed time: 744m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                      allnoconfig    gcc-14.1.0
alpha                     allyesconfig    clang-20
arc                       allmodconfig    clang-20
arc                        allnoconfig    gcc-14.1.0
arc                       allyesconfig    clang-20
arc              nsimosci_hs_defconfig    gcc-13.2.0
arc                    tb10x_defconfig    clang-14
arc                    tb10x_defconfig    gcc-14.1.0
arc                 vdk_hs38_defconfig    clang-14
arm                       allmodconfig    clang-20
arm                        allnoconfig    gcc-14.1.0
arm                       allyesconfig    clang-20
arm                  bcm2835_defconfig    gcc-13.2.0
arm                     dove_defconfig    gcc-14.1.0
arm                imx_v4_v5_defconfig    clang-14
arm                 multi_v5_defconfig    gcc-14.1.0
arm                 mvebu_v5_defconfig    clang-14
arm                  s5pv210_defconfig    gcc-13.2.0
arm                    sunxi_defconfig    clang-14
arm                    tegra_defconfig    gcc-13.2.0
arm                    tegra_defconfig    gcc-14.1.0
arm                    u8500_defconfig    gcc-13.2.0
arm64                     allmodconfig    clang-20
arm64                      allnoconfig    gcc-14.1.0
csky                       allnoconfig    gcc-14.1.0
hexagon                   allmodconfig    clang-20
hexagon                    allnoconfig    gcc-14.1.0
hexagon                   allyesconfig    clang-20
i386                      allmodconfig    clang-19
i386                       allnoconfig    clang-19
i386                      allyesconfig    clang-19
i386                         defconfig    clang-19
loongarch                 allmodconfig    gcc-14.1.0
loongarch                  allnoconfig    gcc-14.1.0
m68k                      allmodconfig    gcc-14.1.0
m68k                       allnoconfig    gcc-14.1.0
m68k                      allyesconfig    gcc-14.1.0
m68k                  apollo_defconfig    clang-14
m68k                 m5307c3_defconfig    gcc-14.1.0
m68k                 m5407c3_defconfig    gcc-14.1.0
m68k                m5475evb_defconfig    gcc-13.2.0
microblaze                allmodconfig    gcc-14.1.0
microblaze                 allnoconfig    gcc-14.1.0
microblaze                allyesconfig    gcc-14.1.0
mips                       allnoconfig    gcc-14.1.0
mips                 bcm47xx_defconfig    gcc-13.2.0
mips                 bcm63xx_defconfig    clang-14
mips                    ip22_defconfig    gcc-13.2.0
mips                    ip30_defconfig    gcc-14.1.0
mips                 omega2p_defconfig    clang-14
mips                rbtx49xx_defconfig    gcc-13.2.0
nios2                     alldefconfig    gcc-14.1.0
nios2                      allnoconfig    gcc-14.1.0
openrisc                   allnoconfig    clang-20
openrisc                  allyesconfig    gcc-14.1.0
parisc                    alldefconfig    clang-14
parisc                    allmodconfig    gcc-14.1.0
parisc                     allnoconfig    clang-20
parisc                    allyesconfig    gcc-14.1.0
powerpc                   allmodconfig    gcc-14.1.0
powerpc                    allnoconfig    clang-20
powerpc                   allyesconfig    gcc-14.1.0
powerpc               arches_defconfig    gcc-13.2.0
powerpc               arches_defconfig    gcc-14.1.0
powerpc                 fsp2_defconfig    gcc-13.2.0
powerpc              mpc5200_defconfig    clang-14
powerpc             mvme5100_defconfig    gcc-14.1.0
powerpc               pasemi_defconfig    gcc-14.1.0
riscv                     allmodconfig    gcc-14.1.0
riscv                      allnoconfig    clang-20
riscv                     allyesconfig    gcc-14.1.0
s390                      allmodconfig    gcc-14.1.0
s390                       allnoconfig    clang-20
s390                      allyesconfig    gcc-14.1.0
sh                        allmodconfig    gcc-14.1.0
sh                         allnoconfig    gcc-14.1.0
sh                        allyesconfig    gcc-14.1.0
sh                      espt_defconfig    gcc-14.1.0
sh          kfr2r09-romimage_defconfig    clang-14
sh                   r7785rp_defconfig    clang-14
sh                    se7619_defconfig    clang-14
sh                    se7712_defconfig    gcc-13.2.0
sh                    se7750_defconfig    clang-14
sh                 sh7757lcr_defconfig    gcc-13.2.0
sh                 sh7785lcr_defconfig    gcc-14.1.0
sparc                     allmodconfig    gcc-14.1.0
sparc                sparc64_defconfig    gcc-13.2.0
um                        allmodconfig    clang-20
um                         allnoconfig    clang-20
um                        allyesconfig    clang-20
um                      i386_defconfig    clang-14
x86_64                     allnoconfig    clang-19
x86_64                    allyesconfig    clang-19
x86_64                       defconfig    clang-19
x86_64                           kexec    clang-19
x86_64                           kexec    gcc-12
x86_64                        rhel-8.3    gcc-12
x86_64                    rhel-8.3-bpf    clang-19
x86_64                  rhel-8.3-kunit    clang-19
x86_64                    rhel-8.3-ltp    clang-19
x86_64                   rhel-8.3-rust    clang-19
xtensa                     allnoconfig    gcc-14.1.0
xtensa                common_defconfig    clang-14
xtensa                   iss_defconfig    gcc-14.1.0
xtensa                  virt_defconfig    gcc-13.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

