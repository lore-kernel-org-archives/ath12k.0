Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6CCC83F1B
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDp/O3ehLB+CLtgKuQLHMZIn/0MuBoVaZj/hDdqLYTk=; b=08xGPQIBGGfvsVg3Svpoi6NyTk
	G6UAwVMBuRFjX4Hj2bBkrPxontsGmZqNWPRf9XDOLu/Z7kIu1qzy8zNGHJvktG6WB8t4uD5sEQ4ex
	thu5XtYHXoafuGQcztnRd65bWgOO3tQUZBT0obhdhHjaYKLEvQlXPBd3tfdp4Ngk+yFJuJDp0D+/8
	SVv1hQovA+xm8Ved40PEfMVIgBpUhgdJbAKWY+uognIYFS8LmXLZwBRm3ma2d3iw1dCiNzN16zNto
	ke/S/Er7TOAdGYwF7Tcf+/oAbta+Bz6hy22yS/4FljdNTNfDdQHq4s+sfN28PhOSfAgYNj4Mbdw+u
	XLcyUUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKdi-00000009h9V-49zx;
	Thu, 17 Jul 2025 09:10:54 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucK41-00000009aNd-3lBl
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 08:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752741242; x=1784277242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yLCrBOZm7Q9yTCeRS40yaLfmpTFicj1UCMT0A5NRQmA=;
  b=ODKxsleIIt5onbxows0CWPgLc9kfVKPpFYWnx+OFAm724iQ3EgU5P1I2
   OuuInsMB4mWMtSxZGe38r4uQdWgdexa2AARHVC/hiGU0GGuBUb7J4F3HE
   gM8MU922U5D60enpcnl7Hn9YfJR/W+cENHUhuFqmK4rK7DNECmjMy3pPV
   UY0faATer/o8smECil9wjQIu33vzUxeJQa3AKXU/8ZzIqjfKkxrwAeLiO
   F3iGIt6mYLVaravU1HYs7Tduep3JDX1FvV4qDr3I8UUcWqfJYRHzqlLx4
   JzUre0/SeOlehFGwLK5/pBHEfSQi5k5vBcn9lNWbkfBQqQPMiclduNhoI
   w==;
X-CSE-ConnectionGUID: hV7AIbX+Rl2DQPl/nJ2Gow==
X-CSE-MsgGUID: kHy9ZSR3TIGEsf/g8+xn3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66456969"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="66456969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 01:33:58 -0700
X-CSE-ConnectionGUID: BZcksriHRYi9EJu3ijnb3A==
X-CSE-MsgGUID: kJOhJ3oaRfqvVgtmVOxesg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="163265703"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jul 2025 01:33:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucK3s-000DNP-0o;
	Thu, 17 Jul 2025 08:33:52 +0000
Date: Thu, 17 Jul 2025 16:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 11/11] wifi: ath12k: fix endianness handling in QMI
 response
Message-ID: <202507171640.30pUvpPv-lkp@intel.com>
References: <20250716075100.1447352-12-alexander.wilhelm@westermo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716075100.1447352-12-alexander.wilhelm@westermo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_013401_984921_0CB29D6E 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on linus/master v6.16-rc6 next-20250716]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Wilhelm/wifi-ath12k-fix-endianness-handling-in-QMI-host-capability-request/20250716-162058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250716075100.1447352-12-alexander.wilhelm%40westermo.com
patch subject: [PATCH 11/11] wifi: ath12k: fix endianness handling in QMI response
config: mips-randconfig-r123-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171640.30pUvpPv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250717/202507171640.30pUvpPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171640.30pUvpPv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/pdr_interface.c:612:22: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/pdr_interface.c:613:22: sparse: sparse: restricted __le16 degrades to integer

vim +612 drivers/soc/qcom/pdr_interface.c

fbe639b44a8275 Sibi Sankar           2020-03-12  549  
fbe639b44a8275 Sibi Sankar           2020-03-12  550  /**
fbe639b44a8275 Sibi Sankar           2020-03-12  551   * pdr_restart_pd() - restart PD
fbe639b44a8275 Sibi Sankar           2020-03-12  552   * @pdr:	PDR client handle
fbe639b44a8275 Sibi Sankar           2020-03-12  553   * @pds:	PD service handle
fbe639b44a8275 Sibi Sankar           2020-03-12  554   *
fbe639b44a8275 Sibi Sankar           2020-03-12  555   * Restarts the PD tracked by the PDR client handle for a given service path.
fbe639b44a8275 Sibi Sankar           2020-03-12  556   *
fbe639b44a8275 Sibi Sankar           2020-03-12  557   * Return: 0 on success, negative errno on failure.
fbe639b44a8275 Sibi Sankar           2020-03-12  558   */
fbe639b44a8275 Sibi Sankar           2020-03-12  559  int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_service *pds)
fbe639b44a8275 Sibi Sankar           2020-03-12  560  {
fbe639b44a8275 Sibi Sankar           2020-03-12  561  	struct servreg_restart_pd_resp resp;
a161ffe4b87772 Tom Rix               2020-08-19  562  	struct servreg_restart_pd_req req = { 0 };
fbe639b44a8275 Sibi Sankar           2020-03-12  563  	struct sockaddr_qrtr addr;
fbe639b44a8275 Sibi Sankar           2020-03-12  564  	struct pdr_service *tmp;
fbe639b44a8275 Sibi Sankar           2020-03-12  565  	struct qmi_txn txn;
fbe639b44a8275 Sibi Sankar           2020-03-12  566  	int ret;
fbe639b44a8275 Sibi Sankar           2020-03-12  567  
fbe639b44a8275 Sibi Sankar           2020-03-12  568  	if (IS_ERR_OR_NULL(pdr) || IS_ERR_OR_NULL(pds))
fbe639b44a8275 Sibi Sankar           2020-03-12  569  		return -EINVAL;
fbe639b44a8275 Sibi Sankar           2020-03-12  570  
fbe639b44a8275 Sibi Sankar           2020-03-12  571  	mutex_lock(&pdr->list_lock);
fbe639b44a8275 Sibi Sankar           2020-03-12  572  	list_for_each_entry(tmp, &pdr->lookups, node) {
fbe639b44a8275 Sibi Sankar           2020-03-12  573  		if (tmp != pds)
fbe639b44a8275 Sibi Sankar           2020-03-12  574  			continue;
fbe639b44a8275 Sibi Sankar           2020-03-12  575  
fbe639b44a8275 Sibi Sankar           2020-03-12  576  		if (!pds->service_connected)
fbe639b44a8275 Sibi Sankar           2020-03-12  577  			break;
fbe639b44a8275 Sibi Sankar           2020-03-12  578  
fbe639b44a8275 Sibi Sankar           2020-03-12  579  		/* Prepare req message */
26bc7a6a0beed8 Len Baker             2021-08-08  580  		strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
fbe639b44a8275 Sibi Sankar           2020-03-12  581  		addr = pds->addr;
fbe639b44a8275 Sibi Sankar           2020-03-12  582  		break;
fbe639b44a8275 Sibi Sankar           2020-03-12  583  	}
fbe639b44a8275 Sibi Sankar           2020-03-12  584  	mutex_unlock(&pdr->list_lock);
fbe639b44a8275 Sibi Sankar           2020-03-12  585  
fbe639b44a8275 Sibi Sankar           2020-03-12  586  	if (!req.service_path[0])
fbe639b44a8275 Sibi Sankar           2020-03-12  587  		return -EINVAL;
fbe639b44a8275 Sibi Sankar           2020-03-12  588  
fbe639b44a8275 Sibi Sankar           2020-03-12  589  	ret = qmi_txn_init(&pdr->notifier_hdl, &txn,
fbe639b44a8275 Sibi Sankar           2020-03-12  590  			   servreg_restart_pd_resp_ei,
fbe639b44a8275 Sibi Sankar           2020-03-12  591  			   &resp);
fbe639b44a8275 Sibi Sankar           2020-03-12  592  	if (ret < 0)
fbe639b44a8275 Sibi Sankar           2020-03-12  593  		return ret;
fbe639b44a8275 Sibi Sankar           2020-03-12  594  
fbe639b44a8275 Sibi Sankar           2020-03-12  595  	ret = qmi_send_request(&pdr->notifier_hdl, &addr,
fbe639b44a8275 Sibi Sankar           2020-03-12  596  			       &txn, SERVREG_RESTART_PD_REQ,
fbe639b44a8275 Sibi Sankar           2020-03-12  597  			       SERVREG_RESTART_PD_REQ_MAX_LEN,
fbe639b44a8275 Sibi Sankar           2020-03-12  598  			       servreg_restart_pd_req_ei, &req);
fbe639b44a8275 Sibi Sankar           2020-03-12  599  	if (ret < 0) {
fbe639b44a8275 Sibi Sankar           2020-03-12  600  		qmi_txn_cancel(&txn);
fbe639b44a8275 Sibi Sankar           2020-03-12  601  		return ret;
fbe639b44a8275 Sibi Sankar           2020-03-12  602  	}
fbe639b44a8275 Sibi Sankar           2020-03-12  603  
fbe639b44a8275 Sibi Sankar           2020-03-12  604  	ret = qmi_txn_wait(&txn, 5 * HZ);
fbe639b44a8275 Sibi Sankar           2020-03-12  605  	if (ret < 0) {
fbe639b44a8275 Sibi Sankar           2020-03-12  606  		pr_err("PDR: %s PD restart txn wait failed: %d\n",
fbe639b44a8275 Sibi Sankar           2020-03-12  607  		       req.service_path, ret);
fbe639b44a8275 Sibi Sankar           2020-03-12  608  		return ret;
fbe639b44a8275 Sibi Sankar           2020-03-12  609  	}
fbe639b44a8275 Sibi Sankar           2020-03-12  610  
fbe639b44a8275 Sibi Sankar           2020-03-12  611  	/* Check response if PDR is disabled */
fbe639b44a8275 Sibi Sankar           2020-03-12 @612  	if (resp.resp.result == QMI_RESULT_FAILURE_V01 &&
fbe639b44a8275 Sibi Sankar           2020-03-12  613  	    resp.resp.error == QMI_ERR_DISABLED_V01) {
fbe639b44a8275 Sibi Sankar           2020-03-12  614  		pr_err("PDR: %s PD restart is disabled: 0x%x\n",
fbe639b44a8275 Sibi Sankar           2020-03-12  615  		       req.service_path, resp.resp.error);
fbe639b44a8275 Sibi Sankar           2020-03-12  616  		return -EOPNOTSUPP;
fbe639b44a8275 Sibi Sankar           2020-03-12  617  	}
fbe639b44a8275 Sibi Sankar           2020-03-12  618  
fbe639b44a8275 Sibi Sankar           2020-03-12  619  	/* Check the response for other error case*/
fbe639b44a8275 Sibi Sankar           2020-03-12  620  	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
fbe639b44a8275 Sibi Sankar           2020-03-12  621  		pr_err("PDR: %s request for PD restart failed: 0x%x\n",
fbe639b44a8275 Sibi Sankar           2020-03-12  622  		       req.service_path, resp.resp.error);
fbe639b44a8275 Sibi Sankar           2020-03-12  623  		return -EREMOTEIO;
fbe639b44a8275 Sibi Sankar           2020-03-12  624  	}
fbe639b44a8275 Sibi Sankar           2020-03-12  625  
fbe639b44a8275 Sibi Sankar           2020-03-12  626  	return 0;
fbe639b44a8275 Sibi Sankar           2020-03-12  627  }
9b09c0f289c5a8 Unnathi Chalicheemala 2023-09-22  628  EXPORT_SYMBOL_GPL(pdr_restart_pd);
fbe639b44a8275 Sibi Sankar           2020-03-12  629  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

