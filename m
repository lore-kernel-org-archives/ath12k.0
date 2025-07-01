Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E49C7EE30
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLKwVrPy8P5xsiw/HOitfvrBYE0u4Z+NAYr1E1YeUXg=; b=15zt2SR9MBKxGgz5aiOtlYrIyC
	nE2x3NlIV+b0i9Fm+oStCLyY2rht2YHs46ScnrpBtsk7btKPTT8waL7yQt0le8kYcaHixWrF6Eg90
	1ZkT6QQQ+pwI2JSkNYWP/6pVBtTw3z1lB95OgQBf1efxMnQnXhvnG4B+6lGrCJfAYGRE4N3O2bLv2
	fuOiNNM3eXRYXb3LYUihpRd1DMnsCzdhXMcx+/DhBX21yaBEI9GwcBXidLLYMYCoYLzKTgVwB3cOy
	oEYc/vQnUCSPxdQxIjmUSskS/Thbkh5LHQ7tBRcVjnYx43ODXqJ0NcSakvZCxttP0StQu/mZDG0qN
	UPrG4LKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgI2-00000006QhD-279W;
	Tue, 01 Jul 2025 19:05:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeW3-00000006BeZ-1SXn
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 17:11:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gg52o028616
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 17:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLKwVrPy8P5xsiw/HOitfvrBYE0u4Z+NAYr1E1YeUXg=; b=BvDhCxycOvs406Hg
	XKSEt+OM/Xz7LknUhbQI5bZ4r+eL4AwoFQpnQuSL3z+2ploryyB1qjSHXxwE4Yxm
	xbu05lxB1sVqj9vbKM7pcnrxkqEBKMhVhEKaTcTt4gRtyo1U4TMdPglAJYMakgMQ
	hnt4Xnq1EC8a4NRRUljZAmmPIcpjB4UO1CBK8WdYe6YE+BI9YP55V2y5iuEAaev/
	KZ+FuAPcvOGPbSgrRDcBDY+mnInUtyalJWS0DSAZB3lvxQCFV7GqbnFDD6ZPfy42
	LBwTaT4dyWM6k7VHJWj8vXLQVTB6IwHwvpM2DNTpgKNdUX4sCuk6q057Pw2NOi2S
	vkYx3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvspv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 17:11:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso2641229a12.2
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 10:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389889; x=1751994689;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLKwVrPy8P5xsiw/HOitfvrBYE0u4Z+NAYr1E1YeUXg=;
        b=mC6NSJeA47nbXXSy+OcIdG9YMG6cMJBayZ0p8isw2PIoqMEUVCJDYPkQ/j9K8eG6L0
         yPqwCQqmf43AW010pWIGFMZ04FHoIpc4u8FRYx7IjzkvSbL2Xug+ihwqGZmEPtWsa1Ue
         NUyNbDIdyf4zowtwzIG3lqK1ZQi8YznTuu2DyiVOQB/Rd2qYbfv4n4S7YhbmgHoYzzrE
         OnT8qAmabZ2k8JRaFcYEBlG/FzDO4gZvmsMNyTAWlJUpATi8L9uhht2PLzfePJ8rp48C
         h5gszF9uORuScgzMYAC9n05taq4CPRUo5nls6+l6gs9NKdJdUy7uCjXqL7GXKh8K6WKP
         c92g==
X-Forwarded-Encrypted: i=1; AJvYcCWfgvy9Pmw1DVxKTrGG2bcL7wnq3jqRFnUTG32wQoC+dus1AVHCPLzOCtObHP3L8saptwkXaxM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFhSl9jLxtS6W+JNUhbcgQymW0YZOR3j6YHus1WdUv+I98Q/uj
	ET5Q4z3u7wHdEb3dMiqsHwHrQv+MWzQtJIMZ/p2osKTvO8/Ygqab6LKpXCzHR0wC3koYerOkAQb
	ce9CrDfyJAZXbbU5NWQv6ORrEdZh6jFcAJ5RG1X4Ox42Esiurtp+I0o5jLii91DxWpPUmRPhf
X-Gm-Gg: ASbGncs/SoMcwcpPjFyOqq6zLzKqCqkLGatvAST/MJ2+sKCrVi54PgICtIikqjQWVg3
	D7bkNICJcHN0eKe+AlddHEpfG30HmikoGGdKioWUq+R6UbpGiPasf0ChqcnhU7js89Bh++qSO/Y
	R1qdpR0E8Qn3y3vQy3glglltaQou0ek85m9MVi6MjP0wOhSP9iZ0fUCPThDFSisiE/91CKbulr5
	Z2JWDFWGFJwmt08/6UaODV3tIg6H2Y9OwI1o4AsoPniBHiBvHkC3Xnq+gFG0ys74kr71M9hnjXe
	xLu4RcqXtrVchG3ivSExnGGtc4Ki+6bKQpmXizFmLuZzBhqSFP+oTfLf2uhzYR6ZIsj1abkjNwA
	aWNNCpP/FGdVPKeg=
X-Received: by 2002:a17:903:284:b0:22d:b243:2fee with SMTP id d9443c01a7336-23ac43d3211mr254109285ad.13.1751389888910;
        Tue, 01 Jul 2025 10:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1X6qVKPWmnadI+fNItnBMIaARjs/GLjlFIwWamaa1inE9HiS3RpXyTjkCNyG2A8IQ9wooCw==
X-Received: by 2002:a17:903:284:b0:22d:b243:2fee with SMTP id d9443c01a7336-23ac43d3211mr254108685ad.13.1751389888273;
        Tue, 01 Jul 2025 10:11:28 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ce960sm110348185ad.250.2025.07.01.10.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 10:11:27 -0700 (PDT)
Message-ID: <a6e82fa5-8094-4ae2-b6f1-53b6e6c13e4e@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V15 0/9] wifi: ath12k: add MU-MIMO and 160 MHz
 bandwidth support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vMH2u3RZb5se7aZQl81cBv3L8Td0uwWB
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686416c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=MeVQk6Yvlubu_z84HK4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vMH2u3RZb5se7aZQl81cBv3L8Td0uwWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExNyBTYWx0ZWRfX48AE6VRaU2CH
 m15lCoNqmHL3zLfFStouWg1AK9LuuuMQ0UYA7QUPIcJFbDLtHYrVZr/v1ZIcu1V+r56p8vOdewF
 d40/jgCUXbPvXlmcDajY/c/bA6ur5bMyA1rRr6tof7cDwbn7/8VckBF2es0g5BCgQqZGwSFUplf
 c3T7G8gst2Tm1ZnaQjdD9xtcRGbALA9/IVfdfng9PWXho8jsK5NZ4QTWr2O8Ru9yhz3bVTizrmr
 sUEu8Lxk54WXmTY6JKdynYRtBk1caFmA8lYAVgMAt4VZWBi5kjMBFNygCIGr5Sh/5wG7VQ/M+Ct
 OFlVMHwpbb/1xOSH3WhhS3syBQz8MZNsInV9DALbIRd+RRk+YQw0I0IEGwidKfyPIaE0BGVTfCD
 KQxXjLPQShTOI9MhRNxWQ5B9B1/tDg43cqe6iESUYz2JYOyEMOq2xNbpjd/sEWVh1AbBeu4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_101131_399561_0027B5F3 
X-CRM114-Status: GOOD (  25.57  )
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

On 6/30/2025 6:03 PM, Pradeep Kumar Chitrapu wrote:
>   Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v15:
>  - rebased the series after merge conflicts reported
>  patch 4/9:
>  - change the fix to apply for all modes except STA mode as
>    WCN7850 expect it same as before.
> 
> changes in v14:
>  patch 6/9:
>  - cap max_nss using ar->num_tx_chains to fix interop issue caused due
>    to sending nss value 4 when firmware only supports nss value 2.
>  patch 8/9:
>  - Set the default return value to MODE_11AC_VHT160 for 160 MHz
>    to allow STA to connect to the AP even if it does not
>    explicitly indicate 160 MHz bandwidth support.
> 
> changes in v13:
>  - rebase
> 
> changes in v12:
>  - rebase
> 
> changes in v11:
>  patch 1/9:
>   - fix return values in ath12k_mac_set_he_txbf_conf() and
>     ath12k_mac_vif_recalc_sta_he_txbf()
>  patch 6/9:
>   - fix missing he_mcs initialization in ath12k_mac_init_arvif()
> 
> changes in v10:
>  patch 6/9:
>   - use ath12k_ahsta_to_sta()
>   - fix rcu_dereference warning in ath12k_mac_set_bitrate_mask_iter()
>   - change return type for ath12k_mac_validate_fixed_rate_settings()
>   - improve readability by adhering to nl80211 definitions of GI
>     NL80211_TXRATE_DEFAULT_GI. Introduce ath12k_mac_nlgi_to_wmigi()
>     for conversion.
>  patch 7/9:
>   - do not change default MODE_11AC_VHT160 in
>     ath12k_mac_get_phymode_vht() as it breaks clients which do not
>     set VHT_CAP_SUPP_CHAN_WIDTH_160MHZ.
>  patch 8/9:
>   - Use IEEE80211_VHT_CAP_EXT_NSS_BW_MASK along with
>     IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ for determining VHT160
>     phymode.
> 
> changes in v9: rebase on top of master branch with mlo changes
>  patch 1/9 and 2/9:
>   - fetch link_conf using ath12k_mac_get_link_bss_conf()
>     instead of arvif->vif->bss_conf before mlo
>  patch 6/9
>   - fetch mcs/nss values from sta->link[] instead of sta->deflink
>   - fix spelling of 'incompatibility'
>  patch 8/9
>   - replace sta->deflink.addr with arsta->addr in
>     ath12k_peer_assoc_h_vht
>  patch 9/9
>   - replace sta->deflink.rx_nss with link_sta->rx_nss
> 
> changes in v8:
>  - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.
> 
> Pradeep Kumar Chitrapu (9):
>   wifi: ath12k: push HE MU-MIMO params to hardware
>   wifi: ath12k: push EHT MU-MIMO params to hardware
>   wifi: ath12k: move HE MCS mapper to a separate function
>   wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>   wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>   wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>   wifi: ath12k: clean up 80P80 support
>   wifi: ath12k: add support for 160 MHz bandwidth
>   wifi: ath12k: add extended NSS bandwidth support for 160 MHz
> 
>  drivers/net/wireless/ath/ath12k/core.h |    2 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 1144 ++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>  drivers/net/wireless/ath/ath12k/wmi.c  |   28 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  100 ++-
>  5 files changed, 1069 insertions(+), 222 deletions(-)
> 
> 
> base-commit: c256a94d1b1b15109740306f7f2a7c2173e12072

Since there are lingering questions about the 5/9 patch I plan to take 1-4,6-9

Given that there is ongoing discussion about the 5/9 patch logic in the
context of the ath11k driver, this patch can be posted again separately when
the discussions have concluded and the correct interpretation by firmware is
clear across all chipsets and interface types.

/jeff


