Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA990C83F34
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 17:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgvxWWyVvTJ0A/brnx15ep/Xmqt8vfg6//oEmPNRL10=; b=fc6DsvkTe/EHCpUCq8jSKnr0NO
	CF3oxKRpsUvVbxtKbBIfQUf7w0blYR7MAykdprQWu3J8n3E13XXW4WgUNlxIpAkHdWNFpMSus5oOt
	fGWVcIwAjsMwxlh/85E9FTMewKin0awVJ5fwHmnK4k1etYnR1qMVw+2BZYiwqsESujRlOOBpIrqP7
	a8Q9NziUjrqUgISlknda4mkN08/gIZr6zNUx+rG6u9p8fSbBiBBvLZmRqVX4p+xuUpAqJTq7n+0Pm
	JZ1D9DbCUapBjVqP6v58r8jzg3yfLgBTLi28kWoFsCyoM9HtxPWAJOao6lrcmANUb+M1AoTBsYxYn
	LKBRbSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSXY-0000000AodR-2xKj;
	Thu, 17 Jul 2025 17:37:04 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR1k-0000000AZAg-1r11
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 16:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752768008; x=1784304008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozatPYm8SkCRErUJZAqo7DV6TZZ+7eY1RkGwfl3kkqY=;
  b=gBMpdII8leJoqx20gWOm0EuFjd9CWG8e4hcSyECr8ZTM8StgkccOpdFR
   GtbUpI2y909DxEb5SnvvYk0ZN80R4ZqsIe1x5joJY1LI7h87VpDNitki4
   CjV5wRMYkVKt/hcQA9aLZaiFuVQQ5Co5pbXmBxezZkWPPecjviZQf2yil
   pRIpXBvzBEsB20ozg34NjNC1n6Uf0s96qMmAFWqn5vNPNfVQ8fLUSM5rV
   WmlDhWIFpZrgsvtOx3BNO+dYCe0P0D2c34KMMnpLPd2pQI12dUchpz2+N
   rmoI012qH+d3Sv521yYRVs5JbLrAz6uIuDu3UfiVUP1lsyhBjCgSQz2l2
   Q==;
X-CSE-ConnectionGUID: oWn6QWoAR+OesfiC00O/rQ==
X-CSE-MsgGUID: VzfpZlaEQbOurPQtxM/O0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="77585772"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="77585772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 09:00:07 -0700
X-CSE-ConnectionGUID: r095Z+45RpqpTaJi1g3AEg==
X-CSE-MsgGUID: Nm1YwRngSc+K7tDnca0fbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157501256"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jul 2025 09:00:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucR1a-000Dmh-0F;
	Thu, 17 Jul 2025 15:59:58 +0000
Date: Thu, 17 Jul 2025 23:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/11] wifi: ath12k: fix endianness handling in QMI bdf
 download
Message-ID: <202507172333.LZcmFwWs-lkp@intel.com>
References: <20250716075100.1447352-8-alexander.wilhelm@westermo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716075100.1447352-8-alexander.wilhelm@westermo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090008_548845_7FCA2515 
X-CRM114-Status: GOOD (  11.17  )
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
[also build test WARNING on linus/master v6.16-rc6 next-20250717]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Wilhelm/wifi-ath12k-fix-endianness-handling-in-QMI-host-capability-request/20250716-162058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250716075100.1447352-8-alexander.wilhelm%40westermo.com
patch subject: [PATCH 07/11] wifi: ath12k: fix endianness handling in QMI bdf download
config: alpha-randconfig-r122-20250717 (https://download.01.org/0day-ci/archive/20250717/202507172333.LZcmFwWs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250717/202507172333.LZcmFwWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507172333.LZcmFwWs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/qmi.c:2996:37: sparse: sparse: bad assignment (+=) to restricted __le32

vim +2996 drivers/net/wireless/ath/ath12k/qmi.c

  2919	
  2920	static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
  2921						   const u8 *data, u32 len, u8 type)
  2922	{
  2923		struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
  2924		struct qmi_wlanfw_bdf_download_resp_msg_v01 resp = {};
  2925		struct qmi_txn txn;
  2926		const u8 *temp = data;
  2927		int ret = 0;
  2928		u32 remaining = len;
  2929	
  2930		req = kzalloc(sizeof(*req), GFP_KERNEL);
  2931		if (!req)
  2932			return -ENOMEM;
  2933	
  2934		while (remaining) {
  2935			req->valid = 1;
  2936			req->file_id_valid = 1;
  2937			req->file_id = cpu_to_le32(ab->qmi.target.board_id);
  2938			req->total_size_valid = 1;
  2939			req->total_size = cpu_to_le32(remaining);
  2940			req->seg_id_valid = 1;
  2941			req->data_valid = 1;
  2942			req->bdf_type = type;
  2943			req->bdf_type_valid = 1;
  2944			req->end_valid = 1;
  2945			req->end = 0;
  2946	
  2947			if (remaining > QMI_WLANFW_MAX_DATA_SIZE_V01) {
  2948				req->data_len = cpu_to_le32(QMI_WLANFW_MAX_DATA_SIZE_V01);
  2949			} else {
  2950				req->data_len = cpu_to_le32(remaining);
  2951				req->end = 1;
  2952			}
  2953	
  2954			if (type == ATH12K_QMI_FILE_TYPE_EEPROM) {
  2955				req->data_valid = 0;
  2956				req->end = 1;
  2957				req->data_len = cpu_to_le32(ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE);
  2958			} else {
  2959				memcpy(req->data, temp, le32_to_cpu(req->data_len));
  2960			}
  2961	
  2962			ret = qmi_txn_init(&ab->qmi.handle, &txn,
  2963					   qmi_wlanfw_bdf_download_resp_msg_v01_ei,
  2964					   &resp);
  2965			if (ret < 0)
  2966				goto out;
  2967	
  2968			ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi bdf download req fixed addr type %d\n",
  2969				   type);
  2970	
  2971			ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
  2972					       QMI_WLANFW_BDF_DOWNLOAD_REQ_V01,
  2973					       QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
  2974					       qmi_wlanfw_bdf_download_req_msg_v01_ei, req);
  2975			if (ret < 0) {
  2976				qmi_txn_cancel(&txn);
  2977				goto out;
  2978			}
  2979	
  2980			ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH12K_QMI_WLANFW_TIMEOUT_MS));
  2981			if (ret < 0)
  2982				goto out;
  2983	
  2984			if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
  2985				ath12k_warn(ab, "qmi BDF download failed, result: %d, err: %d\n",
  2986					    resp.resp.result, resp.resp.error);
  2987				ret = -EINVAL;
  2988				goto out;
  2989			}
  2990	
  2991			if (type == ATH12K_QMI_FILE_TYPE_EEPROM) {
  2992				remaining = 0;
  2993			} else {
  2994				remaining -= le32_to_cpu(req->data_len);
  2995				temp += le32_to_cpu(req->data_len);
> 2996				req->seg_id += cpu_to_le32(1);
  2997				ath12k_dbg(ab, ATH12K_DBG_QMI,
  2998					   "qmi bdf download request remaining %i\n",
  2999					   remaining);
  3000			}
  3001		}
  3002	
  3003	out:
  3004		kfree(req);
  3005		return ret;
  3006	}
  3007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

