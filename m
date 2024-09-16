Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8548EC3ABB2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAn1dccEyNvSmIiQbJH+mNeUF6aSrh3q+8IsjU/G9YA=; b=dKtslawfyk+gOFZN4N55b21P3N
	seKMYQGN+mNxkYFNgbuimaQZ1FESVR+nQ9LvLrrzGAFhZ6zfUbAiM22IPrt3SZyIQx7QJRXPAJI+7
	7y1e7EDeQ8YYIkYJyq09JAU/JcIj1EBUzk8szPyv/2yRTAl6MptBu6IO/X0wrictv3reKBHIpZoDP
	jrJsKXVRR7fdEo0WK3+SUkCOxou+0EokHflB7ilEp4dx5yOv4ziTAuJzaUKMjE5KBb+bwD4byvs1R
	yW1kDTtk/aMI9JgHpaUF/CnilT3ftYTpPg9hkp2Ab1mC3Wu1/QYUwX6Qc7Qk451AzfTz5++As7igR
	qtp+EzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq7Xl-00000003Uy4-0U5B
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 08:57:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq7Xi-00000003Uwq-1Z0t
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 08:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14E735C035B;
	Mon, 16 Sep 2024 08:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F93C4CED0;
	Mon, 16 Sep 2024 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726477029;
	bh=ekIfkTBH1YkKfcfFqoPdycnczXkAzZOROa7HJSmDzKM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fnTBfkLxLu3qBcEtw+wbiixzC8iKnms2d7ERZXaPKqt1+zT1GIY/z9lpjK4W9KS93
	 juHSdMjcW9a8V3qLs6evE7lXRYn4QR68tCjQje78EzROzxPXo3r6K8Ryl6ZOOjT+6z
	 TOSOMkL1Q2pGHDu03e7WwazEfXNJ1rNcSNP67HZWuQ7/lPNuXJ85c6VLkpLmIzQtwe
	 I/WSCOxBK3SADE+1dJzXqEKxwGfSBPzV+JS0xcbVmKVlQpvUEF3zwvG9tyI98RO73X
	 m0ugKDBq5bppHTqOfxeNoKYLU2csbQCCG1AjSTX+x1wFYD4OEYaXZeRnyfUOF94uQr
	 c68Ssqu662iFw==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Sriram R <quic_srirrama@quicinc.com>,  llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,  Jeff Johnson <jjohnson@kernel.org>,
  ath12k@lists.infradead.org,  Kalle Valo <quic_kvalo@quicinc.com>,
  Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: Re: [ath:ath12k-mlo 38/63]
 drivers/net/wireless/ath/ath12k/mac.c:3981:8: warning: variable 'ret' is
 uninitialized when used here
References: <202409151853.OfodBWj3-lkp@intel.com>
Date: Mon, 16 Sep 2024 11:57:05 +0300
In-Reply-To: <202409151853.OfodBWj3-lkp@intel.com> (kernel test robot's
	message of "Sun, 15 Sep 2024 18:30:54 +0800")
Message-ID: <87ed5kdli6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_015710_521840_AD0326C6 
X-CRM114-Status: GOOD (  12.90  )
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

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
> head:   8f61af03fddc0a30bdf49e06a13eafff3cec91b0
> commit: 0b9b7a1eece8952bde6e7f3c764e20a5ee11d3f7 [38/63] wifi: ath12k:
> modify link arvif creation and removal for MLO
> config: x86_64-allyesconfig
> (https://download.01.org/0day-ci/archive/20240915/202409151853.OfodBWj3-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20240915/202409151853.OfodBWj3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151853.OfodBWj3-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath12k/mac.c:3981:8: warning: variable
> 'ret' is uninitialized when used here [-Wuninitialized]
>     3981 |                         if (ret)
>          |                             ^~~
>    drivers/net/wireless/ath/ath12k/mac.c:3931:9: note: initialize the variable 'ret' to silence this warning
>     3931 |         int ret;
>          |                ^
>          |                 = 0
>    drivers/net/wireless/ath/ath12k/mac.c:4434:8: warning: variable
> 'ret' is used uninitialized whenever 'if' condition is true
> [-Wsometimes-uninitialized]
>     4434 |                         if (WARN_ON(!arvif))
>          |                             ^~~~~~~~~~~~~~~
>    include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
>      122 | #define WARN_ON(condition) ({                                           \
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      123 |         int __ret_warn_on = !!(condition);                              \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      124 |         if (unlikely(__ret_warn_on))                                    \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      125 |                 __WARN();                                               \
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      126 |         unlikely(__ret_warn_on);                                        \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      127 | })
>          | ~~
>    drivers/net/wireless/ath/ath12k/mac.c:4467:9: note: uninitialized use occurs here
>     4467 |         return ret;
>          |                ^~~
>    drivers/net/wireless/ath/ath12k/mac.c:4434:4: note: remove the 'if' if its condition is always false
>     4434 |                         if (WARN_ON(!arvif))
>          |                         ^~~~~~~~~~~~~~~~~~~~
>     4435 |                                 goto out;
>          |                                 ~~~~~~~~
>    drivers/net/wireless/ath/ath12k/mac.c:4390:9: note: initialize the variable 'ret' to silence this warning
>     4390 |         int ret;
>          |                ^
>          |                 = 0
>    drivers/net/wireless/ath/ath12k/mac.c:9114:8: warning: variable
> 'ret' is uninitialized when used here [-Wuninitialized]
>     9114 |                         if (ret) {
>          |                             ^~~
>    drivers/net/wireless/ath/ath12k/mac.c:9068:9: note: initialize the variable 'ret' to silence this warning
>     9068 |         int ret;
>          |                ^
>          |                 = 0
>    3 warnings generated.

Fixed these as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

