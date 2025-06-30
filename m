Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A01C8302D
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 18:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXSC48WED9cdU0+IHwHkwwQRBJ5tbpCyurGpgENaj7I=; b=hbpSD9dDa2n9etHzssi5lkaMcO
	eYgD4RTdGKSR5i1so+G8KdbM/8bstvRgrK3H0xYR8gkmFF6bsZFXIAf7OhlWNYIhMalDyjFOOnvkK
	c8kHiy9jbbDPxHa27TFuBNdfjxIv8uTttBOOvhxMk++7PSQsjvsU+kl5gzqiBXHtZ81uFX0SEEX6J
	m012N8LPLwlA1wQzTEAKSmrq8JmA/Qnnl1rOQTRG8jfPbv+0hbFl9NQcip/ajcQVXb/UpPHtLcAdn
	tOrWMSHmoH3aAY73ZlE4QadWDElsU3gY9ZmQ/dFq1U/LHNlZVhS5uxTg4tsdHCCEFlwL09ZZZcvZ3
	cBqTENDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJTT-00000003Dnn-2VX4;
	Mon, 30 Jun 2025 18:43:27 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJTQ-00000003Dn5-2onY
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 18:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751309005; x=1782845005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e9L2Or2Z+AWl0PzpMP/E7A3kcDY9LygJW2AF7pQN8bw=;
  b=T+pHjuRs27calX7mlPIXwM56+dnWKguoXrl1P4hdpbY1bsDsW2AAsS3/
   +NbL+60TXAe1c/arcYgQz8DC1mWNApxKni8v1jpi2XexYAAPIGWMfkmmH
   vqLiMUNIaelp9+E20WP+lFc71Vq5A7PfMVJgVs8ajm/sh4P7n18mr4Fh1
   AWM3oNwjuyalfiX+mW30x4zCK1ISB2W+1Ma6TGIa1iIurOTkyUKjJs/ZN
   3hz5smhME/jVmNWotiixpxMef0EuAWHEeWmf+N3wsapDKildh2Nl9FZhP
   nLT7+rxhdLPY9KOhq2AomGJ3aktS8SLm1NPF+K7/zleYJ1wO3MMzBv32l
   w==;
X-CSE-ConnectionGUID: Y2Xbu6JiQNCnIbIOmokojw==
X-CSE-MsgGUID: q9DEQ66ZRPy+ZAhiSCVHGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71112256"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="71112256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 11:43:21 -0700
X-CSE-ConnectionGUID: 8zfLGR6RQj2x1iOIOjPbCg==
X-CSE-MsgGUID: tQ+X3+5WTM6pCoOTWO29LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153016837"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jun 2025 11:43:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWJTJ-000ZGo-0G;
	Mon, 30 Jun 2025 18:43:17 +0000
Date: Tue, 1 Jul 2025 02:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Govind Singh <govind.sk85@gmail.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Govind Singh <govind.sk85@gmail.com>
Subject: Re: [PATCH] ath12k: add module param to control MSI mode and address
 width
Message-ID: <202507010226.p5NvqJE6-lkp@intel.com>
References: <20250624165031.58616-1-govind.sk85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624165031.58616-1-govind.sk85@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_114324_754461_D168E566 
X-CRM114-Status: UNSURE (   9.91  )
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

Hi Govind,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on wireless/main wireless-next/main linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Govind-Singh/ath12k-add-module-param-to-control-MSI-mode-and-address-width/20250625-005348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250624165031.58616-1-govind.sk85%40gmail.com
patch subject: [PATCH] ath12k: add module param to control MSI mode and address width
config: sparc-randconfig-r112-20250630 (https://download.01.org/0day-ci/archive/20250701/202507010226.p5NvqJE6-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507010226.p5NvqJE6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010226.p5NvqJE6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/pci.c:52:6: sparse: sparse: symbol 'ath12k_32bit_msi' was not declared. Should it be static?

vim +/ath12k_32bit_msi +52 drivers/net/wireless/ath/ath12k/pci.c

    51	
  > 52	bool ath12k_32bit_msi;
    53	module_param(ath12k_32bit_msi, bool, 0644);
    54	MODULE_PARM_DESC(ath12k_32bit_msi, "Force 32-bit MSI addressing");
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

