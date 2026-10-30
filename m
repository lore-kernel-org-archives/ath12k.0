Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A0606A325
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VRMfvlFW;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QC9oMBS1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oU9+QWZ/ooaoo9Azu7ItkRA3xoWEnag17GIoK7+w+80=; b=VRMfvlFWF5FhYr/1NHKmqLNopa
	sUWurYaeG3F/32nV/LYBdgUoAZJs+QrKHRiloU/8DX5zwrowBkt6TAu/eW2zQAqTkKie1bvrpwWVd
	o/O1+8WUceD5wXvJH43pKrlRrLrqLEGRz8O7K5C8fBUNYT3egKRQkZ3OHaAp3ZYLZLhENppMr8SO+
	6aHskjYEY8xEAL3gtkvUaFLqygZEGQnMOtnph6wJEiQq6g+PoEQBWCERC3bz1Z3PDyJmQkDqLTtNp
	f4/vMb7D7ZLIlcdeUAWGrbGzS0yOD3UAzB8VhZSjJLToTasPhkLo2tr0lgc22G6HGH3kdirj/C9Cd
	7dU+C4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp9i-0000000C5Qp-26wl;
	Fri, 30 Oct 2026 16:08:38 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp9f-0000000C5QW-3JsG
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 16:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793376516; x=1824912516;
  h=date:from:to:cc:subject:message-id;
  bh=kIjKtabcQrGu6NErY9oWOBtAN5i2ECkKwF+nB1iftAU=;
  b=QC9oMBS1uvsZpCQpqa3G/Ii0H87l4NWvICpqhPkpw0qWL2ZKIaRXzVvG
   FM63CQi85FhqUxI9gGilKD3LbSXGNNZPbFdFH9MmGfnrI6uklynh83KqZ
   tXE4GhhBG9CQ9drzS7a/DcECuwPuDDL0RT5Qd4hIyBe3WGtREDGu9x9oC
   cVZjhhvqPQhnxyR6hTokUUkY/TtCWlNmDCmcZ4RNzrGXqPpJagDARqAtY
   a6kiWSoLoaajXwi/C3909ZwsNlvgcAzyrFaWxdEp5ZE6BjqVSl/XmL3lW
   CsF4nG0qmpzgj6hzOGFWOLJNKjEC45kOUd/Bq4/bEIE0qcXxt4EsMHbwv
   w==;
X-CSE-ConnectionGUID: xfCf519xTriitgCE20Ub2w==
X-CSE-MsgGUID: yQ6MbyFjSLWZdAgcCmBIxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2021103"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2021103"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 09:08:32 -0700
X-CSE-ConnectionGUID: 9z8fW2fhRKC/gnEZ+7eEXQ==
X-CSE-MsgGUID: Z69oG9YqR1qVSSMDN+dzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7311025"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 30 Oct 2026 09:08:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMp9Y-00000000bxU-2GTl;
	Fri, 30 Oct 2026 16:08:28 +0000
Date: Sat, 31 Oct 2026 00:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:ath-current] BUILD SUCCESS
 fe74d991f3387febfd57b65c7383d2d49e14e19a
Message-ID: <202610310003.g4gW40rh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_090835_902473_DBBCFBB3 
X-CRM114-Status: UNSURE (   3.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-current
branch HEAD: fe74d991f3387febfd57b65c7383d2d49e14e19a  wifi: ath12k: set MSDU payload correctly

elapsed time: 851m

configs tested: 44
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-16.2.0
alpha       allyesconfig    gcc-16.2.0
arc         allmodconfig    gcc-16.2.0
arc          allnoconfig    gcc-16.2.0
arc         allyesconfig    gcc-16.2.0
arm          allnoconfig    clang-17
arm         allyesconfig    gcc-16.2.0
arm64       allmodconfig    clang-24
arm64        allnoconfig    gcc-16.2.0
csky        allmodconfig    gcc-16.2.0
csky         allnoconfig    gcc-16.2.0
hexagon     allmodconfig    clang-24
hexagon      allnoconfig    clang-24
i386         allnoconfig    gcc-14
loongarch   allmodconfig    clang-19
loongarch    allnoconfig    clang-20
m68k        allmodconfig    gcc-16.2.0
m68k         allnoconfig    gcc-16.2.0
m68k        allyesconfig    gcc-16.2.0
microblaze   allnoconfig    gcc-16.2.0
microblaze  allyesconfig    gcc-16.2.0
mips         allnoconfig    gcc-16.2.0
mips        allyesconfig    gcc-16.2.0
nios2       allmodconfig    gcc-11.5.0
nios2        allnoconfig    gcc-11.5.0
openrisc     allnoconfig    gcc-16.2.0
parisc      allmodconfig    gcc-16.2.0
parisc       allnoconfig    gcc-16.2.0
parisc      allyesconfig    gcc-16.2.0
powerpc      allnoconfig    gcc-16.2.0
riscv       allmodconfig    clang-24
riscv        allnoconfig    gcc-16.2.0
riscv       allyesconfig    clang-24
s390        allmodconfig    clang-24
s390         allnoconfig    clang-24
sh          allmodconfig    gcc-16.2.0
sh           allnoconfig    gcc-16.2.0
sh          allyesconfig    gcc-16.2.0
sparc        allnoconfig    gcc-16.2.0
um          allmodconfig    clang-17
um           allnoconfig    clang-17
um          allyesconfig    gcc-14
x86_64       allnoconfig    clang-22
xtensa       allnoconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

