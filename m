Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658F6CD5BD5
	for <ath12k@archiver.kernel.org>; Thu, 28 May 2026 07:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7X1Bngct7YO4BzT4ZQN0OEh1vv2g5/BKavf/V01QcBk=; b=aB2/n4I7/kv6ZPYi8zahR0ZaWV
	LKmJ5qzp1lOqI9p6qJBfy8w7hgoU3qzgbVmJLTeA74crdxJMXDPzjYKnSbsf/sGty557Jqbx+N1aG
	g/y2RzqkR4qacdRQnv33dU/myDm77ENsNf0c0oHUCyVoiEiw6tB4GoMwJJxx/z3NO8ACvKW1GVdYk
	Am1RrGJJp7ilbwTpefMRuMX+QOfNmMWOc/WbE0dkwZebWsuDULTWu2mLc6AqSyAxHqMH+cXoM7mu+
	itikI7wpXkDL2dyomgTkWdp88n3iVhz8PzxwqA6CkCDdWxA1Q+9CRVngbMr2RYpJR5nWiOz5hKc9d
	FYkQPjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVH1-00000005Gdm-0FR7;
	Thu, 28 May 2026 07:35:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVGy-00000005GdJ-1dGB
	for ath12k@lists.infradead.org;
	Thu, 28 May 2026 07:35:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S73PGg1225043
	for <ath12k@lists.infradead.org>; Thu, 28 May 2026 07:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7X1Bngct7YO4BzT4ZQN0OEh1vv2g5/BKavf/V01QcBk=; b=QmttyIII6NDbEJ4Y
	jv6YMiyCgL3C06GKtOZkG1ejil935jwmnv9GA3d4lyhL22/JD5SKB+JuqqaoxGV/
	d5Iighy14LnEBqTCsB9SUNR+sUwZEiJqqgDKd7w4sX+gN2eo6FLGjafGTbQofGvp
	eIcPoFvnPftTZY68pSNmlon0yWcTl5KHcSndJkIfwlZkOYpCfkEIOPZVCnNJcX5K
	21YdFcaroPpV72g5z9NOX215/m1IAaNKc/5xM27LLS8hXQlfimX0mz4kGHRbvdMj
	/C8OKFlBL8h9xbUg8q2dSD310Qc3Ih5lkCjDQuQoxu9I2gINvLCw/J2Ov+rjl1Um
	bx4zvA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1stkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 28 May 2026 07:35:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso6710440b3a.2
        for <ath12k@lists.infradead.org>; Thu, 28 May 2026 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779953717; x=1780558517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7X1Bngct7YO4BzT4ZQN0OEh1vv2g5/BKavf/V01QcBk=;
        b=NXeSiS9KAej7b9yfUhepoYuBqVhGX0IFD1Ru5GJ3w3neuw/Gc6GIffj2NVhEI6sgea
         QwXJeftvC0/xgEujLuAZoki/7A903Wv1hX7Cw+jFXPPC1Zs8TW69E0vzjAFMEofJQbMN
         wtofOEHVhLg2WKn+njmhyq6mhTgF2LVN2b7uGW/D6KGB9RvhWrJubJDiwn5oTwSrMTvm
         GuRslvr5XJ5Yoe7zF9MO+Eu9OlbPFbf118Um/DetyzjHvSX/C2dJJMxH0SuOopld5B4K
         yDnr6oZHjTZCQhNeIiNKKsgj9EwvR+fTWQsiSvPH6Mp+yaoCjXbMzYBCEpvmbOnsh75q
         QuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953717; x=1780558517;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X1Bngct7YO4BzT4ZQN0OEh1vv2g5/BKavf/V01QcBk=;
        b=APZ4Vnf/WEkgrgyNaFT41lk9USJIJIPV+eFXFf2Ly6ZsF/LoimJFVpoA0EJ58TSzLG
         3yVgI7D9bQAAP+C0VWfoNmUBzSSgClqyKLV1GiRhqji5LX+guvD6oYX5QXgizsXeGeJ+
         tNklmUo+4xHfgx6De5TrY3FDojwHCExMSphbLzs4Wl7iG3ec6aPxCBp2LbBk2jy6T2dH
         i/ceOEtdpqDQggh6Rv/lzKSgt7LxG4+cOQF5UMDGDKmvgHG2nG33L2s/y5yqwcSXQXLe
         8SLPTGLjL8x9mxAbyEx/ZX65mMuF+v8MAxgIlCpSdAPxOIN5vxIcysS47AjjCVKEK8Oy
         +LLQ==
X-Gm-Message-State: AOJu0Yz7pFjdZIsY6ioT4QiD6+6e95uGAGHhfjKXAeBZO/qoGa02I7FF
	a4FC2Gsc/G3CA3H7jfUjrMFHJjWxc3jBNZaLBbOfwUJBI/4mpV0+SXGTSAh9eApYPT6qkWgTzKR
	7LqYL/vt91jPctm4ALIzMsC3QR7WGQuY+vQMa8GHEWUHYn/nxaQdrf4omqSMuJx7O
X-Gm-Gg: Acq92OEfj54iKMr8tLIBR/IgCq7ZuCxzU3hzk7tsXdu4yHoZ/O0JIp48otsolmCRupF
	3LXYQfuB2XyJ8mHiLZJeCUg4C3EYtC5eVeo7oJbxF2Gqflpa9WTnf/pzLZm7qN1Q8Ytkc3kOeRu
	IjamRjyGab3pJ0iTPoITt4k4BANVFzsP6f1Q7p0D29OlGCdjG7+m/5FtuKUeoz/Y5iZKq4id+su
	fBLGBfd2jmuAQdmRlZYoFYCIuu01NCoMUmjQvqlPFlcR+lN3Ki8nA4LrAy7M5pOr+MGQWCkS4y0
	CslrjauBqFludVQIEYnQkHF6/iuTMJUzrZvlzynAkAz1TBXyU8pwObZsq/euIk1Bxe4LL/W1KDh
	U5sTyLN5zk1Vu3rK57sLbY1wuQgm6q2uLIjWv6Rm+R9g21nGIO08/p5eGIxMGK27nMdjmN79hnC
	i59HPlw7I2oo5E8uHzdB8d/gLzm+RD
X-Received: by 2002:a05:6a00:ad02:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-8415f546346mr26231503b3a.39.1779953717493;
        Thu, 28 May 2026 00:35:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad02:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-8415f546346mr26231479b3a.39.1779953717012;
        Thu, 28 May 2026 00:35:17 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e806e0sm5056859b3a.7.2026.05.28.00.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 00:35:16 -0700 (PDT)
Message-ID: <82e84f2a-8978-4b24-b355-e46d1a002a57@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:35:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: allow peer_id 0 in dp peer lookup
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a17f036 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SnksKqQ5Byg3HTYQ0yEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: XGA-4iSRLEuqFRiZ0Qd1F7p1jNqjoeQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA3NCBTYWx0ZWRfX3bD493iE0Vx+
 Gd9xi8hxzl8VkK1enA8LvktcjPRvgLWIaVxZq5LD3NfsZMRq+f0KSsD7/aUx6lj9mFLN+RBZcIJ
 9Vh3UsGc4y+HTdYAIJ+9/ReM0pZS+a8ztItnNk/y8XtUx10y/lglyC0WDtfGfJzzBkSGwE5iAJF
 6wyfeuVff/N1g+hvN+NY9+8G73LoVKwgpDw+/YCOrxFJ9J+kglnQ6q1jtSk1U94JrtpHNZNLri6
 ARu0Iqn7c+vvck9/y6nyWHmr2V229XshYqGk4hdgGGesTYOW//CXnyZwMTCaGEFbaNf7z11TnwT
 qP24y68QYrtCghsYi/N8Gu0PpKZGetB6/nUc4KyM2AfoTKaQ6apPVdHRjfpIdvZ+vF5e2S8xLYV
 YbGz3Cv+jFBIH+m4Q11MxDeVjmKsamI3t/DR8Wo+pv81yqVzeP6u2PMIPzFvUtLSvDdR00u2XBl
 sX9iQSuWxUUnqLctNhw==
X-Proofpoint-GUID: XGA-4iSRLEuqFRiZ0Qd1F7p1jNqjoeQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_003520_550607_10E23C52 
X-CRM114-Status: GOOD (  14.01  )
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



On 5/12/2026 10:57 AM, Hangtian Zhu wrote:
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
>   ath12k_dp_peer_find_by_peerid -> peer NULL
>   ieee80211_rx_napi <- pubsta NULL
>     ieee80211_rx_list
>       __ieee80211_rx_handle_packet <- pubsta NULL, skb undelivered
> 
> The following error in the TX completion path is caused by the same issue:
> 
> ath12k_wifi7_pci 0000:04:00.0: dp_tx: failed to find the peer with peer_id 0
> 
> The error message is triggered by:
> ath12k_wifi7_dp_tx_complete_msdu
>   ath12k_dp_link_peer_find_by_peerid <- ts->peer_id 0
>     ath12k_dp_peer_find_by_peerid -> peer NULL
> 
> ath12k_dp_tx_htt_tx_complete_buf
>   ath12k_dp_link_peer_find_by_peerid <- peer_id 0
>     ath12k_dp_peer_find_by_peerid -> peer NULL
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


