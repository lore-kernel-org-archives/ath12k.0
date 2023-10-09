Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F7DE95A9E
	for <ath12k@archiver.kernel.org>; Mon,  9 Oct 2023 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54Lk/7yIu0Xps+TMJy4icCGhkpMRSwlRoDHDCpuk9lA=; b=AIpvn86E/ieqBN
	2TR0o6UxuMPS3jecttRWIDb0zrxn6AUvcmX6DWlA9htB/P/jnuzdYDu3659jQ1RBQEUtM+JIHp9jj
	TDbO9d6X/s34EXnQMDKA6crJb5jWf1d3a60ihqdyG6S53Zp6SpuOhDwB6lVgGDXuoCqYxJzcDnpK9
	N9alYWhByy3+Jo/ObiX0NAQVufgnT1KitGDQivIu9WUfdCvi1rZeyOZIbw8hRhXTZuVOnwXvfxtga
	ArIjOu5+sharJf9T0BpIv9ptHbNow/qAm4SC18ufFlmu0FCoGm/qOwfnZXRiQfZtvvwz3yJPlChWU
	umLT8HbZ949IEXwQeNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpskH-00B85H-1u
	for ath12k@archiver.kernel.org;
	Mon, 09 Oct 2023 16:04:37 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpskF-00B84Y-0Q
	for ath12k@lists.infradead.org;
	Mon, 09 Oct 2023 16:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696867475; x=1728403475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xVGqlS7LaCbb3n5Sy3qivv+XPMNzDr8YRZEIm/seggk=;
  b=FoUDW0n21zs/IXiShyoN34MqPKFdfGHFPCebTS8WjGicwHpWhQtteVza
   uWxoH7vjXvmKjaoALkzgAKPxWtUH9LYJ99aNjS5hqS8grrGhkzo4hxpfB
   VBbnPrAi8gHrVUpVZMD4Qv8l2hP/Q35LcbkMmmNFUgEs5Bhedzz9c5Q/5
   7gH5ZybC9VzZ8lStNGoG6s4+O9po9EKPLm7cBoyMhy3EiOGyMfqSs6Ioi
   +U86WrUTcEKYcxygCmKz9wUzXUATqzN9BsNd60BK9yrkpNqN30BTxYHtu
   9/mzeJ/q42KlxpY1VgvR702cAgwlDcCTtnje9p/Y/tA0aVSFMfjOlo9+6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363527662"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363527662"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 09:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084361024"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="1084361024"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Oct 2023 09:02:56 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpsib-0000Ku-2u;
	Mon, 09 Oct 2023 16:02:53 +0000
Date: Tue, 10 Oct 2023 00:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
	kvalo@kernel.org, quic_jjohnson@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	quic_lingbok@quicinc.com
Subject: Re: [PATCH v5 1/4] wifi: ath12k: add TAS capability for WCN7850
Message-ID: <202310092349.fe3kN7bp-lkp@intel.com>
References: <20231009090149.247211-2-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009090149.247211-2-quic_lingbok@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_090435_202580_2CB68545 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi Lingbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3b961e3a412d9d4b70418f53d07847af0a7ea376]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-add-TAS-capability-for-WCN7850/20231009-170444
base:   3b961e3a412d9d4b70418f53d07847af0a7ea376
patch link:    https://lore.kernel.org/r/20231009090149.247211-2-quic_lingbok%40quicinc.com
patch subject: [PATCH v5 1/4] wifi: ath12k: add TAS capability for WCN7850
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310092349.fe3kN7bp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310092349.fe3kN7bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310092349.fe3kN7bp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/acpi.c:109:6: warning: no previous prototype for 'ath12k_acpi_remove_notify' [-Wmissing-prototypes]
     109 | void ath12k_acpi_remove_notify(struct ath12k_base *ab)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ath12k_acpi_remove_notify +109 drivers/net/wireless/ath/ath12k/acpi.c

   108	
 > 109	void ath12k_acpi_remove_notify(struct ath12k_base *ab)
   110	{
   111		acpi_remove_notify_handler(ACPI_HANDLE(ab->dev),
   112					   ACPI_DEVICE_NOTIFY,
   113					   acpi_dsm_notify);
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
