Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA25C3600C
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDimoZo2P8VTxqz540h+sEpytFpZLIuPSm9TIjGfcG4=; b=xalaThM84zrSN2znxW2Ss/X85p
	Q3kiuGSTKAnWxMc1uq63iVMAhcXp7pO/WAdbu4aB6iV102n/jD1PtKEC1e0GWcsp3Ftm+cStILNV5
	ULSXoCN3bzwTbmxK0b0m9YmEPMn5KKxmqi6ePj2MhPuVqQL+rIxiGjRwOadWijFIBAtRJil8O45eS
	v0RlfysAkmKSAKk/Yi2tiCoWDBCbKSaiWszQ+D/qxJZSuOHQ1tb0ATRCrUQOvyWH7l51n31est3Qt
	7sNSyfCE50ZF0JIpZATc1eUw0VCgLYJkgaKvOIpmCMdNittWRLB0ixlI3Xjz/NQ+nzm9znp7kcmyR
	0PKDWy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzQ8m-00000001i8O-3uSN
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 01:10:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzQ8k-00000001i7w-13jk
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 01:10:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKCAJc019398
	for <ath12k@lists.infradead.org>; Tue, 1 Apr 2025 01:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDimoZo2P8VTxqz540h+sEpytFpZLIuPSm9TIjGfcG4=; b=A+qk9vhylXZ1gzmg
	qWcxBJ98aWtlhgypR694U3Ill/9B5Gq1GezO9AXqBcMZnRG/cSOU6oss+VhqRgqy
	QHcL+wzGwP3twXwI0K2UPmK12c/c2dnekbOVRzRoi9WbcEpG2Awk+Qv0MbZInEIk
	Ah/m7rsKR6Z+fwN/UxtDSlb7uHs0ik2NDm7SgAG3B8lkPJbtNNPm78h5Wd/lPccH
	P+g61VNS1b3V1nBTTQ3SZqrN4vB1kZUWOecK2jO4SndoJFS+DB1LdVNFpsPAMZYm
	a5S1To3NUaTBXI+yjbcwQt8xOBy2gRXB98A1zeHafT/I7UL7lRsDFcpjB76AlyK2
	scda9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1vn8h7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 01:10:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso9706614a91.1
        for <ath12k@lists.infradead.org>; Mon, 31 Mar 2025 18:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743469801; x=1744074601;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDimoZo2P8VTxqz540h+sEpytFpZLIuPSm9TIjGfcG4=;
        b=Tip8Rpn/RTUw1UYl9X/Oer7ehfX2Qa+EissCEO1ElpQEGBpBRwpuSUjZxh3vxxp1zY
         f71M/9VY0fxdlAaZs59cWFtRMqjbiQxceqY9sVLJ2pZHlubJzNifCLTjWqh05Xx7idUd
         pcMB29m9vnJnfO9KkmiCCMp2pHB5GKK/YFOz3tCG+Xkao++1pNvr8f6R8lObH3F6tEh2
         Fb/K4XW6E/v3j6jjgZcjGw9R883Lj6LcbMZ+Z468b9tjBvp5YTQonjjwb1nIqD1glsU8
         fdZCJj7j5vNqYLCYK9jEMY90ZtrimWI2ujzDnm5/648Uongdfm3xhcNaIk8KvZmy3cM/
         MKPg==
X-Forwarded-Encrypted: i=1; AJvYcCWDObm4LMGzvvh04gXHlWuR5PjArmSinnfmJ8CZPCbT8oLTNJBFDZvtzNwkBDyr+aVhk3AqrYc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx87TiHnV5qdSU4l+hMHGo9uPMgB9iPduoIjnY3bK3zUrasP5KK
	qgrJqPg6mKvgIZim5fxUM4DlUyCRyGQDBTFZ0+lx5BmVnf0u/S+GDP7pFPJXxO0WBmB6PNRrBM6
	DEVIFE0ggWL9/7y6gmiX/uorULsKFhp3SSJPcIFBUFGP4EZLNcoG/q2CmxvfW
X-Gm-Gg: ASbGnctD9BQTUd0m87fOYsrXAZdt3Ov6Sx75U5yPA/YT9PtlP9YOdJ7xZpJ/xeQSijE
	Em1t6hxPjcWf3UThiJsSaYhAzykFUsN9/iXnGPV2KXxXvhAYVeDkxjMedaU6NzMRuOLtH5j0un0
	b1pYc/p9OIbywwKqkqLl7Pw+ZrDGLWHYidpBF35Np9FFED3Pj1J9oKw840iiMx9vRiHNkESjKj3
	Tj1nExOOd8iiD/kw/uWb0jd6QB/DQLVmMj6ZBEDNkS5sa0BLrK8oOaLr0tZyYwxmyjhUf0dNJiK
	ZTk4MsgvBDiwEevPdXlVJX7jw1AmtY9GxaQBJylFL1TSIB5GSpHX9CyQNHYb0his8dgCQlX1pTn
	JH0pjmppb
X-Received: by 2002:a05:6a20:9f44:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-1feb5bab130mr22933182637.5.1743469801196;
        Mon, 31 Mar 2025 18:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNu+DeS/1piz9ZEhssl3P21WFLNtbVOHc7sE2xwL9HKaCDg3GuAyZ8Ge15Gm05dotzWpb9Cw==
X-Received: by 2002:a05:6a20:9f44:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-1feb5bab130mr22933137637.5.1743469800684;
        Mon, 31 Mar 2025 18:10:00 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69f6f2sm5848712a12.30.2025.03.31.18.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 18:10:00 -0700 (PDT)
Message-ID: <d4ed05c7-41a3-4f99-89f5-72d2f8050b24@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 18:09:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250220213025.2722206-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250220213025.2722206-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UL3dHDfy c=1 sm=1 tr=0 ts=67eb3cea cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=TUzAd_iuidMRmLO4f4QA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ox8YRepTFCnA0WWxkEk8r9CeDHyw2G8x
X-Proofpoint-GUID: Ox8YRepTFCnA0WWxkEk8r9CeDHyw2G8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_181006_480386_CF3FB941 
X-CRM114-Status: GOOD (  19.13  )
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

On 2/20/2025 1:30 PM, Pradeep Kumar Chitrapu wrote:
> Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
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
>  drivers/net/wireless/ath/ath12k/mac.c  | 1141 ++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>  drivers/net/wireless/ath/ath12k/wmi.c  |   24 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  107 ++-
>  5 files changed, 1069 insertions(+), 222 deletions(-)
> 
> 
> base-commit: f22471c17f5849b2f20e2c56ec9fcd9dd8d5bf28

Sorry, this has been stuck in my backlog, and now it no longer applies.
Please rebase.

Applying: wifi: ath12k: push HE MU-MIMO params to hardware
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/mac.h
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: push HE MU-MIMO params to hardware


