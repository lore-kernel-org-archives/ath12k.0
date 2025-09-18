Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D59CAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 06:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUDNB+rsAjzCGZXjGg5vvGacZSBfr+ojqS+F0KRTTT8=; b=47TdUN0XWklahiqh3Djvd543do
	QrsJpqd+2qZbTTgVdCGFhi+nqPrcc84Wb4Ye586K3xHQbouLS30/3dP/s2U86tDNFjV3GYIzgrxFV
	njS3PEMAp05dJhUfuiKyD/WSc7fEHhoV6CXbkBMHlB47xC7GPTMc1KEUZbK51LClAu3Rzpf9WQXZY
	/aZ73SFuNHEgedQE3fRgNWMDc7lC44bbnflBIdtUyloT8J5MgLmOJViMMeVrORLTrrhq6LmYlSQZo
	UIS5H07DyssCCFpr0zIeP/t9qI19/zfzeMtOkyT5lKTvdMpmaK38NvRFhaVhHHKM7iidqfKqo587k
	Y21RBspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7gn-0000000GMsx-1W5D;
	Thu, 18 Sep 2025 06:00:17 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7gk-0000000GMsU-1azM
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 06:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758175214; x=1789711214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0old9ctTyJsH/xFzWRZPdPpfchK49uoPWBzcpSBTL70=;
  b=SVTUpv2dugzoa5Mdhn0KALjxztTYf0z/w7cDkf0rPyQjBQOFiU6PvZ5E
   FZVGRlx6caC8+qKafK1cQVY3Eaq355U05odQ5Oyw+/fQFU1kpQN9f1QBN
   ETCSXA1VbTQlwlo1E3I/jNhfzqGAgRM2uU9izvHPv5u5QgeCN5W3RzgX8
   wiJF18WQJ+6jyr3m6crdjIeX3esizgxHCfT6ABUHvkv3DDfKm5b8nDgM1
   cyS62jB/q5hPz19Cvtuh7ikfVHfzGwMt4UEUax4Yq3EPu97yr+6sFsiUx
   PIeJn/joXv5XoahbfhOhFHZf//0HVrfZVjGiUOXaGGAX3f47zkCLS6xsg
   A==;
X-CSE-ConnectionGUID: bI+peFPSSbiw+gimD7C0PQ==
X-CSE-MsgGUID: oH/+XjBZTj6M4zt/uRUIeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60606195"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="60606195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 23:00:12 -0700
X-CSE-ConnectionGUID: HqVbENHoSCCstfpcc2jBfA==
X-CSE-MsgGUID: O/WEU7TfQCO7wMt5r4e3QA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 23:00:10 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz7gd-0002oN-0f;
	Thu, 18 Sep 2025 06:00:07 +0000
Date: Thu, 18 Sep 2025 13:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 2/4] soc: qcom: fix QMI encoding/decoding for
 basic elements
Message-ID: <202509181302.j10W2wCw-lkp@intel.com>
References: <20250917070428.2909-3-alexander.wilhelm@westermo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917070428.2909-3-alexander.wilhelm@westermo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_230014_478505_6044A2F1 
X-CRM114-Status: GOOD (  12.02  )
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
[also build test WARNING on linus/master v6.17-rc6 next-20250917]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Wilhelm/soc-qcom-introduce-generic-QMI-encoding-decoding-macros/20250917-150826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250917070428.2909-3-alexander.wilhelm%40westermo.com
patch subject: [PATCH v2 RESEND 2/4] soc: qcom: fix QMI encoding/decoding for basic elements
config: openrisc-randconfig-r132-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181302.j10W2wCw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181302.j10W2wCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181302.j10W2wCw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/qcom/qmi_encdec.c:384:55: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:384:55: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:384:55: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:384:55: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:715:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] val32 @@     got restricted __le32 [usertype] @@
   drivers/soc/qcom/qmi_encdec.c:715:31: sparse:     expected unsigned int [usertype] val32
   drivers/soc/qcom/qmi_encdec.c:715:31: sparse:     got restricted __le32 [usertype]
>> drivers/soc/qcom/qmi_encdec.c:188:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/soc/qcom/qmi_encdec.c:188:25: sparse:     expected unsigned short [usertype]
   drivers/soc/qcom/qmi_encdec.c:188:25: sparse:     got restricted __le16 [usertype]
>> drivers/soc/qcom/qmi_encdec.c:191:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/soc/qcom/qmi_encdec.c:191:25: sparse:     expected unsigned int [usertype]
   drivers/soc/qcom/qmi_encdec.c:191:25: sparse:     got restricted __le32 [usertype]
>> drivers/soc/qcom/qmi_encdec.c:194:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/soc/qcom/qmi_encdec.c:194:25: sparse:     expected unsigned long long [usertype]
   drivers/soc/qcom/qmi_encdec.c:194:25: sparse:     got restricted __le64 [usertype]
   drivers/soc/qcom/qmi_encdec.c:485:25: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:485:25: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:485:25: sparse: sparse: cast to restricted __le16
   drivers/soc/qcom/qmi_encdec.c:485:25: sparse: sparse: cast to restricted __le16
>> drivers/soc/qcom/qmi_encdec.c:488:25: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qmi_encdec.c:488:25: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qmi_encdec.c:488:25: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qmi_encdec.c:488:25: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qmi_encdec.c:488:25: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qmi_encdec.c:488:25: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64
>> drivers/soc/qcom/qmi_encdec.c:491:25: sparse: sparse: cast to restricted __le64

vim +188 drivers/soc/qcom/qmi_encdec.c

   161	
   162	/**
   163	 * qmi_encode_basic_elem() - Encodes elements of basic/primary data type
   164	 * @buf_dst: Buffer to store the encoded information.
   165	 * @buf_src: Buffer containing the elements to be encoded.
   166	 * @elem_len: Number of elements, in the buf_src, to be encoded.
   167	 * @elem_size: Size of a single instance of the element to be encoded.
   168	 *
   169	 * This function encodes the "elem_len" number of data elements, each of
   170	 * size "elem_size" bytes from the source buffer "buf_src" and stores the
   171	 * encoded information in the destination buffer "buf_dst". The elements are
   172	 * of primary data type which include u8 - u64 or similar. This
   173	 * function returns the number of bytes of encoded information.
   174	 *
   175	 * Return: The number of bytes of encoded information.
   176	 */
   177	static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
   178					 u32 elem_len, u32 elem_size)
   179	{
   180		u32 i, rc = 0;
   181	
   182		for (i = 0; i < elem_len; i++) {
   183			switch (elem_size) {
   184			case sizeof(u8):
   185				QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, u8);
   186				break;
   187			case sizeof(u16):
 > 188				QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, u16);
   189				break;
   190			case sizeof(u32):
 > 191				QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, u32);
   192				break;
   193			case sizeof(u64):
 > 194				QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, u64);
   195				break;
   196			}
   197	
   198			rc += elem_size;
   199		}
   200	
   201		return rc;
   202	}
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

