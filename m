Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4B4CD6E49
	for <ath12k@archiver.kernel.org>; Sat, 30 May 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyCgsZKUkbKisu6PZiCRW4u11DF6cixRx/fFwaOBVgM=; b=u8ABpL0+nQksbtlF19FMiwOoAd
	AGx3dTOq9JbwCHgfx0sX6YFgsugnSSLdtmuwmfluFKIQJPdLrTeaMru0p42A/y78IFwlv2fV1iJhE
	fmTjvD0ljLGfQalgGYMWKTGLEELEpYMfwx4F6xUgsgxMAxGFLe6/IqxD1qAfYjEEx1HJ+81jrjcui
	YOnTdQFBXGUwXlO9sb/cGbrntBNMurDGcdUOvoOQx0nsOGhPxDRWN18LSsiYQlDVXrvMGG8H8MZ92
	adj9MJfQlTn2QKtWI4U743U3yb9NF6deLey5zUOt8/FzB61mUa5NN1SjYkxauBPLSVu/qOHL54CUp
	tSnqEm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNKZ-00000008xUB-0o7J;
	Sat, 30 May 2026 17:18:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNKX-00000008xTp-1HBC
	for ath12k@lists.infradead.org;
	Sat, 30 May 2026 17:18:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOaNU3353234
	for <ath12k@lists.infradead.org>; Sat, 30 May 2026 17:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyCgsZKUkbKisu6PZiCRW4u11DF6cixRx/fFwaOBVgM=; b=TeeJShlpyf9NBi7/
	ulfWrsa/PqmDCNoM0ZIqsKIdnkAFdlrLK6sBtlu0E68aD8+/IA9B+N8DjKaZJBKL
	it76n6LVH9Hnv+cFjZGiMyltOUZLZ/XjpA4MymnICz+9mz4seIIR+x37MxUL9IpL
	OHAZ75mOmj2MkxBfCH0p+Ddoo7L9X0WY7SqL3TlRUUOcI2WFt6AHO0x5KQgfADlt
	tQeF31NkfZb9IP48MAGfJ1wg8sE9xukDcm0C4aJG4S9rsPtSjSHI3jochsoVD39+
	jPlgr9Wnht1o41OE1geascPePcdcSLg6MYZMzts4pb52PbFp0lI/z1YSrkaoByEy
	1PZhXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2h9b0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 30 May 2026 17:18:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so2037499a91.2
        for <ath12k@lists.infradead.org>; Sat, 30 May 2026 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780161515; x=1780766315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyCgsZKUkbKisu6PZiCRW4u11DF6cixRx/fFwaOBVgM=;
        b=JCMjrBl5PdnnGjgWh3Lk11en8tjgGWkX41lkW57389d2hDK7TgHUYXKmKHF9Dm+tDW
         hdgmTODRQnmyBNgOaqRgImFT2SLZvkFRKY1auKdTJvgh6KYlg8bmF7ra010RLZH8Uhuf
         4vzcMmXIeBMXDZB8nkqwtozZwYpj/F7Ovj/lDr5YLab6nZ4JX9SUE52pvdKoTaiFFY1G
         s3tlao+wsU30shG6q8hMd87Szi8cQz/vOD7h5IAhq/OYrS32IYgSU0EyJ7vMUL3AQ3/r
         U6PUcRlsrPIfNb0KZA+IkDLo69a+LHq3H9NqtdwzUEqN666CQJhyjjoyBvprSyNdOB+y
         FO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780161515; x=1780766315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyCgsZKUkbKisu6PZiCRW4u11DF6cixRx/fFwaOBVgM=;
        b=sTJQV0Shge8yJNosBfGGvENVh26CQE9rtmb+wdAPSMk0HiGwzGnKCPiwbuyxHmHA7c
         3XSWDJsUXPeoDG8XmwQTxfmJHX1x1L2U3Bi8qh6SBOOqmCq4w3A+XoR8olP9N1KABbz7
         UjCePyYlUdKQ9/XKSF1oaD2siJQd/rlT0QBcSB/poFlUHpdGdQZ2+dbMCDIQzyOu6yJc
         uyKbZrfQiUcu/0lWgWM0Wk0StbvQty1OYdN5dRY+caUMysh+IwhCH1a5wYhOun/HJ06n
         AQnzMp0ruIZ0fhLHQS0qBRuC/tihQoUkoZ+3vMJ9nZ3k66D+aL02FdCb4TA1Fa2N7em1
         3hDw==
X-Gm-Message-State: AOJu0Yw72MYfX4NbwiOi1bzGJqeLGyWUVARrLFRtce5T49yeBoQN2BTD
	7yDACjIhl59YC179b2Ku8tKbYuDbEUuw/uCqLkTSHpo0AnDBAlFj9IONwJTMSEOtECdLnHVKIVE
	bMZBB5x/1phsNuXHzrIozYrl6PBEqUh7EHJre8zWrhI9RH5ceiwr1ctRqGCKjCXO/
X-Gm-Gg: Acq92OE5ZfNGwA3jIn7+xvWXtuknxd0PG8BxJ98TcohCAYEe2nTdwTndr2IQ/svtT14
	VrBINOQ8YLFWZMgy8uk9xqFSOEAitQo+z4XPxywMG0tYVNp/8alCZiHCWD3r8FHSPDAanOvFUx7
	z5JvJBzchTMsN2tP0ccmFboKeGoC1x6W3UwMqY2XwhDWBki/bSrKKQ2C/dkUT6Ptceyn1FSI5F/
	BgoBNzoJzg8n/Y6Pjo0OdqBXTL0XpRN8F+x4+2R0YdTVs5DFUuzRULGopOIoUtXNBTitrR3ZMw/
	EAkFamGc+G2tOO2nvjelUsmSwnr3e7jt1SuvONUHHULhPLKDJ9MkBrYETN+INEjq5HyJTabKzPI
	Ph57zA2MMyOI0zHlC4jxOqC5qlU7QvjY9m6oZJLhiIemKCCnDoI0czE4rhYtd3VWiNm7Ju5a5rc
	tp
X-Received: by 2002:a17:90b:580b:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-36d66d436cfmr2889917a91.5.1780161515028;
        Sat, 30 May 2026 10:18:35 -0700 (PDT)
X-Received: by 2002:a17:90b:580b:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-36d66d436cfmr2889893a91.5.1780161514535;
        Sat, 30 May 2026 10:18:34 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc65e7afasm6873219a91.1.2026.05.30.10.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 10:18:33 -0700 (PDT)
Message-ID: <419a2eaa-7bf0-4a36-bc68-b769188613e0@oss.qualcomm.com>
Date: Sat, 30 May 2026 22:48:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: allow peer_id 0 in dp peer lookup
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE4NyBTYWx0ZWRfX1MtRcNDGlC7h
 0RKxHN9MZPJhfOwvr6RFuWE6tyE5t5VZMMYtnvz9+01MHYaULFVeO2Xlllb5New+sdu4ZFLXCSu
 ppJEWO2PCD0ssl7EbFYH9m6AfZtdQh8ZVB3uH8L92/kEFqm//RZAisFtEjlYJM6RIZBLsFwQquI
 KGSHJLYHdaJv8ZXF/BVc4E96fP/mtCu9nmXUt6TMK1H6slAp0yX67PQGOIs09r6JnztUWEjf86P
 aowSohQm94y70FN44efF2vEb/WovCrblkvqUnALDzfCrwffKAhET2s+yK/gdHXOOc6ksbauZt/X
 9M1pXbcRHfH8LQgvUGteimiP25SJumqZraC64mnznALXxdMF1q0163uwRBqwgFyk03nToZDb8TR
 xtr/kzjiB0WNBCFgtJOWwLctHhCEUqyyGg88/jlD/BsddHOrr6QdQXKCFJgBUBFdTfuy/TpicHj
 WZVbB3qwB2NlDGsVrAg==
X-Proofpoint-ORIG-GUID: dDHYHBMTL9bE7mjAJn3G8QxdJFVaHpbO
X-Proofpoint-GUID: dDHYHBMTL9bE7mjAJn3G8QxdJFVaHpbO
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1b1beb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SnksKqQ5Byg3HTYQ0yEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_101837_467793_F43B22DA 
X-CRM114-Status: GOOD (  14.90  )
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

On 5/12/2026 8:27 AM, Hangtian Zhu wrote:
> For some chipsets, firmware can report HTT_T2H_MSG_TYPE_PEER_MAP2 with
> peer_id 0 as a valid value for mapping ath12k_dp_link_peer to
> ath12k_dp_peer.
> 
> ath12k_dp_peer_find_by_peerid() currently treats peer_id 0 as invalid.
> When firmware assigns peer_id 0, peer lookup fails. As a result,
> DHCP OFFER packets are dropped in __ieee80211_rx_handle_packet()
> because pubsta is NULL.
> 
> ath12k_dp_rx_deliver_msdu() <- rx_info->peer_id 0
>    ath12k_dp_peer_find_by_peerid -> peer NULL
>    ieee80211_rx_napi <- pubsta NULL
>      ieee80211_rx_list
>        __ieee80211_rx_handle_packet <- pubsta NULL, skb undelivered
> 
> The following error in the TX completion path is caused by the same issue:
> 
> ath12k_wifi7_pci 0000:04:00.0: dp_tx: failed to find the peer with peer_id 0
> 
> The error message is triggered by:
> ath12k_wifi7_dp_tx_complete_msdu
>    ath12k_dp_link_peer_find_by_peerid <- ts->peer_id 0
>      ath12k_dp_peer_find_by_peerid -> peer NULL
> 
> ath12k_dp_tx_htt_tx_complete_buf
>    ath12k_dp_link_peer_find_by_peerid <- peer_id 0
>      ath12k_dp_peer_find_by_peerid -> peer NULL
> 
> Fix this by allowing peer_id 0 in ath12k_dp_peer_find_by_peerid() and
> rejecting only values >= ATH12K_DP_PEER_ID_INVALID.
> 
> Also update peer_id 0 handling in monitor path:
> Always call ath12k_dp_link_peer_find_by_peerid() in
> ath12k_dp_rx_h_find_link_peer() to fetch the peer, including when
> peer_id is 0.
> Always store peer_id in ppdu_info->peer_id in
> ath12k_wifi7_dp_mon_rx_parse_status_tlv(), including peer_id 0.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

