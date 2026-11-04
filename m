Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61827606A328
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 05:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHTrHxQ1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCn6UWJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCp9oYv8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=; b=EHTrHxQ1GbvilJ
	1pR6WF+m3NaKMLHIySoeJ3tra4FRLly7w+lUHtJSwvzUzs5PjE7XlSI9mF/gipKWkpJn4amGb46uN
	9A2zJLXFsBscKF6AzjrgyeZ45tnmqRBMRv+tAlLb6Uf3jqykRxOfqfB+4MsKv6aN35IrJTJXoZDtf
	7TkGbidz+MoIuVVjdq7ZWnY3k+6MfqiUGwIGPZYqj68gV6TGZvQxQGmgdVsz/Sh7VZ82xTZ6TfEm5
	76Ng63PeDu7QOFxPugWewFCgTI9yQH7dOIpOHK9NNlhBlFooVdPWMSlL0cqD9ivOLuWBtfgsFAkDN
	jbBISPONPdnKBzuVH59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTUV-00000004LMB-3vbD;
	Wed, 04 Nov 2026 05:24:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTUT-00000004LLd-0udg
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 05:24:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A442CVK3300277
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 05:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=; b=NmCn6UWJ5QAd9kRO
	+GbeO0V7OSTI7SKfo6+flMchUAmW707AK0yGXc/uos+YvcgSlsSwujZyXcE6lrWC
	erctnUUDFeddim+o3y1WNcwxgZHg+q2aH1d2jQzJgpH9vSniBoebjv2GQQwptU7O
	1sC22sn6BUFL8gGMIszQ2NgC680MEnVs/TQJK7LTj775zKN8GyIB5Uew8EuGDtR4
	VqmPMLwYw+/XCpr2gVxXI6bpM9ekQk28ECwYxuunUMq6bO+zmXB8UbzpJmHY1Wrg
	4mGO9uGqxVt1164WWqFbWQy810aawBD5VB4EwuiCafB94UmZXtaM924UIHBbm88r
	ly/A1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb089qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 05:24:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso620713eec.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 21:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793769891; x=1794374691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
        b=LCp9oYv8UFWTtVgjG/WbkvFd7dUcwPiaDjiXUxiDbwhI3wHWS/eyuk713yMHijC5Id
         g3ohsLBftsAUvLPzTJlgmq20OcCHH+NxqBqcRWu56NAME5ZquhzvlDwfK4OJ2Fw9oQ1n
         ZfBbOkt/JTFB8I6rJU/k6t7exl82CgN7cPMXR1LuWMBU8rpcTpfX7w54ggH/+B0w9RoM
         dmGXSOTfqoPS/VlUKWl1l7ftWkAcGK7wA86PGI1smfS0mw20G13ec+ICYk155gFpw9NH
         +PWpzr7gkymDv1AN8xoeMpnlcvraaTsyssw7klLltNO5TwiDN0VsBAAhqxM0if/o/AeY
         75yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769891; x=1794374691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
        b=PVz1BI2Ml7gj6fo3G+DsD1Y4avUMBIciO1YEESRRsKsRhY2SnlFztBJaWnYlDe4VP1
         5+hM5FBX5liPTq88+GPwwPghUHj6vaOLioq298HwcRRXCDPPQ1MeHLv4xJt2HeQkxcaD
         tKjAoKkxYjSU6wBgV8pq5/gZ3BBk1kwBtmL3rT6OBCCzn829nHkw+lyWqWuVmsm+nBDB
         IrrONatU1tiu+bGa830RWV4EzQZgut4+xGt4qLFb0QarkBytAIaZozUlmNTbZbYyFm6O
         7wbqyvx3EA+sYxfrQGh7j78VYtRdO4CNeeEKgZSIqakLzjpi4/fMSuuO1o3OhkE8hgih
         SKYw==
X-Forwarded-Encrypted: i=1; AKwUvBxRBkU7cgwVTQHsxBWKHfSUtqcqGPEcC4eFlcZgNwQr+ULvhOfbNL5lpVUo101bz9dOuUJfXpg=@lists.infradead.org
X-Gm-Message-State: APuU4Z+4ZsyvVK4zVV0WMPYxL0dOIh9YIxXd2nTVCLVGblG9364pe9oG
	8/gotF9tu8gAl4wT/jUAtDfIEEbUYHN6BJ3w4asccWThQHJKKTjslMGgDuJhoUQJ7SpEasF37tW
	h+ZpECBSgq+pOLHJNSWeKiyHnYnNQUP0UPK6H7kd2xpxJaW6SHDFLqoDnleqR0xAq
X-Gm-Gg: AYBFou1z5NMi0aNN9LTRqPdLmeavTX7pBQP8nC84dVVmZG7J963dGG39Y0jfxFgFxWA
	MCKuvu6zYkEv6pL1cmkNBuXoQBEl6OG86tPh2po4pT8UpmAGatdkyxA/YNuogqtouUIQvEVZYVj
	J+F7lP1B2qbH0uqPwt0Vm8OLxVuuR3tgjSBBP0Uzl6Zhm12HUn4+wIEnKTgwyqddZlV+04+Suvq
	fQ4/HomXKc/+UardHjYJPA/ikkMq/ZdBZYnb4sFtD2ShJyO2SntBDHJ6Yh6CQdBf7tXOjUdPjtF
	9wqcd8SPiIq/YCrLUdfLTepsS50XTjDNNIhy0JtwuyMy42nYXUZ9KpQT49lFgZhNsKsd6Nx3UEJ
	+GP1TSXAXpVWpH29tDYUz9DXBUXOyvkmPTjCiZ4E+XkrTwy+DsaYPJa2nwoK8NsKkfWGMbfdN+W
	ErfJFUEVukmuJ766/Ft39hsjVnbLlAtQjxLsXAY4HHj/VM93LymW/777ZJU2ZML3lgl+p0DpGuN
	FU=
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1ac5cb186e4mr23305628c88.39.1793769891062;
        Tue, 03 Nov 2026 21:24:51 -0800 (PST)
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1ac5cb186e4mr23305596c88.39.1793769890221;
        Tue, 03 Nov 2026 21:24:50 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm4387310c88.6.2026.11.03.21.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:24:49 -0800 (PST)
Message-ID: <aa665b5f-a3a9-4aeb-ade4-b9b8f04952b3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:54:45 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface
 Laptop 8th Edition
To: kernel test robot <lkp@intel.com>, jjohnson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com
References: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
 <202611040318.qlss0Yol-lkp@intel.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <202611040318.qlss0Yol-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfX4u/pIpbjLtzn
 BwJvogzB1RcMQqO+RrfK0cyXdDOemi0cT+AlgO0fuULvVk4Fwdo1VzwZgGAstPa6PUQ8t52Dt+o
 WNGNzvZEB+jfRJcmkIP1tH5aDIMPBj8=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeac1a4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=sEU2oqu8ip_TAauk1soA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: 177PEk8SsunJhrgMCUKG9-TsmTz44AUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfX/QdMlTh65ysT
 E/t9C8qBevAVJ5QCUfwYog3+8k2lVlAHHW3VT/xiLRn5NSmLPKZFOftJqVvZezikMXolId7/7YL
 SBBSxYlaOPpxh2aUztlPXZWJCaGhmYHIHna0JFgic6z0UKtyg7iDcZUg+Xa5De5dUfWUmpSD1mX
 fdJ+HDsRm+IB9/trBqw262z15QzspSXsO0jJAEkm2NEVkjSKmyg+WUkvwtJ8pLJ6r3hnsVeu4E8
 +TfRbjIJ/MLrazyXDmdaOO71sWlQjsU3sYalYuRVkE8gS7wikBUuSkP2LOezTlEF6oqg/iTzqCZ
 6Vxsu6+siOFl9xGbVp2hzEcwFU5Z24Z/kN3PT4BB8AUJJysp75+8FvuQU5iC2gQ3SK+Mn0MfSPi
 Vbi3FYYL/mYnCNNQ896BTXOwmzhkEuzpIVptkLfHyGiM7c/t8AjqfeONcGp3D0LXovzyZvhLEL6
 pXS0Rcs3Tj57Mwp95yQ==
X-Proofpoint-ORIG-GUID: 177PEk8SsunJhrgMCUKG9-TsmTz44AUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_212453_288249_1D585B72 
X-CRM114-Status: GOOD (  18.33  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 1:18 AM, kernel test robot wrote:
> Hi Gopikrishna,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on ath/ath-next]
> [also build test ERROR on wireless-next/main linus/master next-20261030]
> [cannot apply to wireless/main v7.3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Gopikrishna-Garmidi/wifi-ath12k-skip-hardware-rfkill-setup-on-Surface-Laptop-8th-Edition/20261103-014024
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
> patch link:    https://lore.kernel.org/r/20261103094024.1764151-1-gopikrishna.garmidi%40oss.qualcomm.com
> patch subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 16.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611040318.qlss0Yol-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/net/wireless/ath/ath12k/core.c:91:9: error: expected '}' before '{' token
>        91 |         { /* Sentinel */ }
>           |         ^
>     drivers/net/wireless/ath/ath12k/core.c:86:39: note: to match this '{'
>        86 | } ath12k_core_broken_rfkill_table[] = {
>           |                                       ^
> 
> 
> vim +91 drivers/net/wireless/ath/ath12k/core.c
> 
> defae535dd63b1 Aaradhana Sahu      2025-07-08  76
> 5949d1910f13c2 François Roux       2026-10-06  77  /*
> 5949d1910f13c2 François Roux       2026-10-06  78   * On these machines the OS cannot control the WCN7850 hardware rfkill
> 5949d1910f13c2 François Roux       2026-10-06  79   * input, which reads as "radio off", so hardware rfkill must stay
> 5949d1910f13c2 François Roux       2026-10-06  80   * disabled. Ideally this would come from the connector node of the board
> 5949d1910f13c2 François Roux       2026-10-06  81   * DT, but that binding does not exist yet.
> 5949d1910f13c2 François Roux       2026-10-06  82   */
> 5949d1910f13c2 François Roux       2026-10-06  83  static const struct ath12k_core_broken_rfkill_table {
> 5949d1910f13c2 François Roux       2026-10-06  84  	enum ath12k_hw_rev hw_rev;
> 5949d1910f13c2 François Roux       2026-10-06  85  	const char *compatible;
> 5949d1910f13c2 François Roux       2026-10-06  86  } ath12k_core_broken_rfkill_table[] = {
> 5949d1910f13c2 François Roux       2026-10-06  87  	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
> 5949d1910f13c2 François Roux       2026-10-06  88  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
> 5949d1910f13c2 François Roux       2026-10-06  89  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
> 2d169d089ae8e1 Gopikrishna Garmidi 2026-11-03  90  	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" }
> 5949d1910f13c2 François Roux       2026-10-06 @91  	{ /* Sentinel */ }
> 5949d1910f13c2 François Roux       2026-10-06  92  };
> 5949d1910f13c2 François Roux       2026-10-06  93
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks, fixed in v2: 
https://lore.kernel.org/all/20261104051838.2912931-1-gopikrishna.garmidi@oss.qualcomm.com/

Thanks,
Gopikrishna


