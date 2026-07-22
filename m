Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F77AC44539
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zeu4OxUf2I9+8S7fa2UG8kLQ9l6xQboc70iBQdHsMi4=; b=SFDDITdLuJ6gNIPYMSsCrEB2U8
	YXVrUnxaslOuXrgDN1G/qXqT4UfqfEnC+CvZ6zl117gc1/wq5wbgpu4TTObpxM8BkvxXX3ylVKMHS
	YResDeeMtUXFT50tiNxgQOPti8hdp1eNg0JGs2U5mIi7ZTWj93Q+Pi6VhmCXU1Fvd6v/UEgQMIU41
	22GBR3BB8pZAYyyuETgiC1NGiPTBo5dRfKJIgvuLWJfgQ4JWfcyyfl0wlj2crmCeEAbO+THSKuA7g
	/HVfseagH+YOrNEmSXyDnEX7BOvbni5nCscGOi6Wn2VkEi7PG+2CkTDGLDeSEXvHn0eXp/yfyMDqB
	6kYJCqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWCM-0000000BmPj-0Vx9;
	Wed, 22 Jul 2026 12:37:18 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWCJ-0000000BmP5-2lsM
	for ath12k@lists.infradead.org;
	Wed, 22 Jul 2026 12:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784723836; x=1816259836;
  h=date:from:to:cc:subject:message-id;
  bh=kPZa9PKdLXy3tL2wKYd0QeqwM1bP7Aa5eRyMieO1jLA=;
  b=j0CEU74CewJ8NsWC5rb6C/AhlmOAQoi4qUamTfS3j821lPbP1xIRJaAJ
   UJDPLVuFOs7XKNcGCYNxI32exllnfCsKjx6qj/QMR6jIEOR55qCKXgF9i
   7Alrzbl2RRFOB2T6zJmy52A8Wdpr7zcxVgOzmIDEl/sLb/A/eojAkVqAy
   hhfYn0K7MM/rMFtes/HiYFKgTPyA7sG2NiDkw9+4D8kiPxWpBTYz92I0H
   MUGkPSFoWhGxCMJIMw0ol2gi3/iC2vomh/VqAfDny7wNm1I5mkgGzEKnq
   ziGo5zRxyJls2TIlHqFKz25Vjkd/7IQ5prF1awRXv3K7lg8Qkfmy7bJBC
   A==;
X-CSE-ConnectionGUID: So3A0PaWQhWzgGD8FbJslg==
X-CSE-MsgGUID: thbVg7kzRXicZBTANxdkhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96729073"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96729073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 05:37:15 -0700
X-CSE-ConnectionGUID: p3dmWlTdQXKgSF1ESc2GHQ==
X-CSE-MsgGUID: aEN5y/oqQGSjAUPb71QgyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="261637119"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 05:37:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmWCF-00000000YjJ-21Xt;
	Wed, 22 Jul 2026 12:37:11 +0000
Date: Wed, 22 Jul 2026 20:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:master] BUILD SUCCESS
 623bf56a9f0906d780f46ae110b47212ac3406ec
Message-ID: <202607222041.MWrsWEs3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_053715_718203_7F1CBA03 
X-CRM114-Status: UNSURE (   4.18  )
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
branch HEAD: 623bf56a9f0906d780f46ae110b47212ac3406ec  wifi: mac80211: Fixup merge between wireless and wireless-next

elapsed time: 797m

configs tested: 47
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc        randconfig-001-20260722    gcc-12.5.0
arc        randconfig-002-20260722    gcc-14.3.0
arm        randconfig-002-20260722    clang-24
csky                  allmodconfig    gcc-16.1.0
hexagon    randconfig-001-20260722    clang-24
hexagon    randconfig-002-20260722    clang-24
i386                  allmodconfig    gcc-14
i386       randconfig-001-20260722    gcc-14
i386       randconfig-002-20260722    gcc-14
i386       randconfig-003-20260722    clang-22
i386       randconfig-005-20260722    gcc-14
i386       randconfig-007-20260722    clang-22
loongarch  randconfig-001-20260722    gcc-16.1.0
loongarch  randconfig-002-20260722    clang-24
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
nios2      randconfig-001-20260722    gcc-8.5.0
nios2      randconfig-002-20260722    gcc-8.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
parisc     randconfig-001-20260722    gcc-9.5.0
parisc     randconfig-002-20260722    gcc-8.5.0
powerpc    randconfig-001-20260722    gcc-8.5.0
powerpc    randconfig-002-20260722    clang-18
powerpc64  randconfig-001-20260722    gcc-8.5.0
powerpc64  randconfig-002-20260722    clang-24
riscv      randconfig-002-20260722    gcc-10.5.0
s390       randconfig-002-20260722    gcc-11.5.0
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260722    gcc-16.1.0
sh         randconfig-002-20260722    gcc-16.1.0
sh               sdk7780_defconfig    gcc-16.1.0
sparc               randconfig-001    gcc-16.1.0
sparc      randconfig-001-20260722    gcc-15.2.0
sparc      randconfig-002-20260722    gcc-16.1.0
sparc64    randconfig-001-20260722    gcc-11.5.0
sparc64    randconfig-002-20260722    gcc-9.5.0
um         randconfig-001-20260722    gcc-14
um         randconfig-002-20260722    clang-24
xtensa     randconfig-001-20260722    gcc-8.5.0
xtensa     randconfig-002-20260722    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

