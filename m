Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C2ACF8851
	for <ath12k@archiver.kernel.org>; Sat,  5 Oct 2024 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PCso79n17X/N8JWteRLQfO4Sql9Xx75+fjCbLJQPrpw=; b=hT4lmlKENP1Z640Ke/RYdRQOP7
	XE1SDw5RjflNN99eT+HriZKlVCxNzgjneq7C4NPRg6gVlyw5BmEjmmydTxG1U1FgpuWWClGq6KNOv
	UGdB1GsrrzIpJEY2RuJbb1DyqNWeseP94yR8TOiqolUs5h+XIiqBB0GXiWOz4FLmM6ebmwyU6NCpx
	Vk4I6lIIC4jUydkydCsN5ToN5T0E1L2u9s7S14jqoWaestiQRjlZe6J0QVyx/ElXJVDCqPTuJQiSQ
	h7LYx5uBs+gIQpCiHZP59qKvQ18Y+Aac82LhVxOIq8O5GRe3FMq4v6mqm4RrHJVjKYLs51UpKfXLn
	0iXdwIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swyPc-0000000Eshm-0GFe
	for ath12k@archiver.kernel.org;
	Sat, 05 Oct 2024 06:37:08 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swyPY-0000000EshK-3uRS
	for ath12k@lists.infradead.org;
	Sat, 05 Oct 2024 06:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110225; x=1759646225;
  h=date:from:to:cc:subject:message-id;
  bh=nq5xzcaxIiiycwLyZyGmd/0AI56U5eH81Di+nGv5Fsw=;
  b=TKHad1z02h8Q/QmYANwmdbqd/+1g25K+8mOSlxaxlkydC4xUthyqy9LL
   VXRgoWaCY0kk3ixNpVdbmuOtRmMhHD6OS66ey8N2nLZW0cowIozbtpt3t
   aagstyNncbaU6b6plLTY9f+aD9d2e5FnY5KIcB8EPkn/Z1MsYFziEK/7w
   e0Pd8B/3ofmqA9rXIQnmmgpcLr0mqy+q6IliG16oN0tKb3Mb6VUCkQgca
   eoeC5vslxxLEBbgQEExSpvI2vZfVSyDumFV5l2u8uqmHjYrPtwNu85q22
   j35n13czDduWRZ0U2PMfSRmGYSi025rj1yGN58EsR4+yydIEEGJqpEIbo
   w==;
X-CSE-ConnectionGUID: YQSueNuXTcS0id5CR3V0Lg==
X-CSE-MsgGUID: YDsY9ir8Smy+CMD6EnKqPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30216889"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="30216889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:37:00 -0700
X-CSE-ConnectionGUID: XCb6phO+SnWNrtjVvOuTYQ==
X-CSE-MsgGUID: wYjH5MMoRZWMknmBrWhcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="75165282"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Oct 2024 23:36:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyPQ-0002f8-13;
	Sat, 05 Oct 2024 06:36:56 +0000
Date: Sat, 05 Oct 2024 14:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 4ad14f50820745f9c2f425ba07ca8431bf2409ed
Message-ID: <202410051412.gXtD1pG1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_233705_194285_B501F095 
X-CRM114-Status: UNSURE (   3.47  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: 4ad14f50820745f9c2f425ba07ca8431bf2409ed  wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work

elapsed time: 1079m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-14.1.0
alpha              allyesconfig    clang-20
alpha                 defconfig    gcc-14.1.0
arc                allmodconfig    clang-20
arc                 allnoconfig    gcc-14.1.0
arc                allyesconfig    clang-20
arc                   defconfig    gcc-14.1.0
arm                allmodconfig    clang-20
arm                 allnoconfig    gcc-14.1.0
arm                allyesconfig    clang-20
arm                   defconfig    gcc-14.1.0
arm64              allmodconfig    clang-20
arm64               allnoconfig    gcc-14.1.0
arm64                 defconfig    gcc-14.1.0
csky                allnoconfig    gcc-14.1.0
csky                  defconfig    gcc-14.1.0
hexagon            allmodconfig    clang-20
hexagon             allnoconfig    gcc-14.1.0
hexagon            allyesconfig    clang-20
hexagon               defconfig    gcc-14.1.0
i386               allmodconfig    clang-18
i386                allnoconfig    clang-18
i386               allyesconfig    clang-18
i386                  defconfig    clang-18
loongarch          allmodconfig    gcc-14.1.0
loongarch           allnoconfig    gcc-14.1.0
loongarch             defconfig    gcc-14.1.0
m68k               allmodconfig    gcc-14.1.0
m68k                allnoconfig    gcc-14.1.0
m68k               allyesconfig    gcc-14.1.0
m68k                  defconfig    gcc-14.1.0
microblaze         allmodconfig    gcc-14.1.0
microblaze          allnoconfig    gcc-14.1.0
microblaze         allyesconfig    gcc-14.1.0
microblaze            defconfig    gcc-14.1.0
mips                allnoconfig    gcc-14.1.0
nios2               allnoconfig    gcc-14.1.0
nios2                 defconfig    gcc-14.1.0
openrisc            allnoconfig    gcc-14.1.0
openrisc           allyesconfig    gcc-14.1.0
openrisc              defconfig    gcc-12
parisc             allmodconfig    gcc-14.1.0
parisc              allnoconfig    gcc-14.1.0
parisc             allyesconfig    gcc-14.1.0
parisc                defconfig    gcc-12
parisc64              defconfig    gcc-14.1.0
powerpc            allmodconfig    gcc-14.1.0
powerpc             allnoconfig    gcc-14.1.0
powerpc            allyesconfig    gcc-14.1.0
riscv              allmodconfig    gcc-14.1.0
riscv               allnoconfig    gcc-14.1.0
riscv              allyesconfig    gcc-14.1.0
riscv                 defconfig    gcc-12
s390               allmodconfig    gcc-14.1.0
s390                allnoconfig    clang-20
s390               allyesconfig    gcc-14.1.0
s390                  defconfig    gcc-12
sh                 allmodconfig    gcc-14.1.0
sh                  allnoconfig    gcc-14.1.0
sh                 allyesconfig    gcc-14.1.0
sh                    defconfig    gcc-12
sparc              allmodconfig    gcc-14.1.0
sparc64               defconfig    gcc-12
um                 allmodconfig    clang-20
um                  allnoconfig    clang-17
um                 allyesconfig    clang-20
um                    defconfig    gcc-12
um               i386_defconfig    gcc-12
um             x86_64_defconfig    gcc-12
x86_64              allnoconfig    clang-18
x86_64             allyesconfig    clang-18
x86_64                defconfig    clang-18
x86_64                    kexec    clang-18
x86_64                    kexec    gcc-12
x86_64                 rhel-8.3    gcc-12
x86_64      rhel-8.3-kselftests    gcc-12
x86_64            rhel-8.3-rust    clang-18
xtensa              allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

