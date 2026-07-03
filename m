Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BF9C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 04:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuaojvJeCpfd+fb1L4y3F4PQXD2n4Bkmi4X904ZQT9E=; b=opM5pAo9ILubV8Gg5AZ60nhItq
	I8VQP1L1cvu2aD3AIzCUMbKcAWFRPHhAZJ7KIyY6H0cdx4w7PCuYnpLco0XUd4TmA9mhXAaQa7Znn
	fqJEuXPUZ/zNc8Qh1e8lB+yaboImHEfi1eixewmKPurhvedXjnHZ+jJzCqzNV0wqr2xvDP9goilPY
	haDaBkbxCfH7RrdyBD2SjuTAhwa2RZiCRUp33AnwRHsWlYSNfW9UNn5f6pQ+ttGHzIOkfihGNW8GZ
	Qn4+ZH22fClxgYUQ3dSQcCBkzHtGlhPMB2emfUFPA2J6SLl2xm+eACaX9Rw4jE0LRoiesMl7fX2lx
	qZQuRyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfV8V-00000005xm5-22Zf;
	Fri, 03 Jul 2026 04:04:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfV8S-00000005xlj-37G6
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 04:04:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342W1l2828861
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 04:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuaojvJeCpfd+fb1L4y3F4PQXD2n4Bkmi4X904ZQT9E=; b=mYXqgeJWrZw+iqp1
	EfP+MdjWkSf+bp9Zygv4U5szLfKHGC0FopoICZ8F/Q1YAluTEkCrLx7LJSBkQT3f
	MyC58oM673XpXDfBNxW372e1z/aDdaokwtnxwBV3eTLZS7plvr+SuPmIHLN5B0IF
	NX/nvNwyOCU2CdpYOAsMWSOp5UHar6Lh1JOBwMtpLeiSLYOgHClauFBFFjkA68wK
	4TvwOHXr7DwDByeZdC/6B0x3tVC/pLsXRr2V8sZxIthsc6ZH8iym6qDy/+ggCyd1
	HdCP+wGYmaEm5Sjj7KjnJQX9o8WUskxEMMJgtThHssAPrrGusWPIk4iQpAyQ3ecU
	VO118w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5897j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 04:04:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso253031a12.1
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 21:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783051455; x=1783656255; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuaojvJeCpfd+fb1L4y3F4PQXD2n4Bkmi4X904ZQT9E=;
        b=EiY/OtirPcUjJ/ekSjolbG9duPOSprM00Z7DYUqDpHifG6uwMcvvovAm7ibnvtS4sU
         I26nwP9y6u7etmycF0GartHw/unkmONcNf6X42rIJBpFnKFvLuMeAunEzvxy0d6Df2zR
         Y4mUj5X+Bdeg6nAAnl+Bo3xvE7NpTlC65CWtryTNi4f16C/W69dwyE6H0T0iXvTpoN4A
         o1HkM/duYmBwqDpQ/h65d9fiobUclF1ShwkX16Skhma1AlYaehebx5qqUTPOW+aVpPKQ
         CL4wLNNULP5Ki/SIz9Nx/JXoku9GTJ+miG9i94xENaAUE9F/35eqcvoZiKDzkD9cv3aC
         ijjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783051455; x=1783656255;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuaojvJeCpfd+fb1L4y3F4PQXD2n4Bkmi4X904ZQT9E=;
        b=IpYzLd2xUKpZDAsgL88v7ErczBG0ZBoI27odLJp5J14tcyYHR1DLuj6TmahfSoF8j/
         NQGQWdNJffdmc7iG2iPvlDsHYEhQsKIbwe69xpFzZqMnyKnxOP1C5Qq5s6E9Dr70+hAf
         EoHKqQwEv3DxDiuUtMkf09ftLh3AxedL0TDe4Mti1zqTumSsOoq4XeyFBGikPUJlKACK
         OmLfDpoVKCRmVR+braRXJF0FEBe1gkeSDJcHZyosvyjNRZ7XYkVe3Ie8WNrLEP/Rox6A
         QAcc7l5AHAOsq6UjNOGbsuY2uaN0wtwuFefkIWXJ3eYpdnxgVwJNZuW0jrp0wap/D4nm
         WgGw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/QsKDoZXVCM8F5rgn+1Yk/yEQuYQdhSe1ztDhdf+Q3tjZZmKSKSSbglfzAmFX/lx1RmlUd+E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxs5H/YMvC2SYCGSKD+4ftPoh9PWn8ZXJFIb+x4GSLWW+gAxNS
	2Hiis8gqOVclZZL3m2M1dwfLyYOSsZ5XOdSkxqYBVeqM5Z0HNb2quz3OLz8Xh7G60hlFxr7L8WB
	HNKeYsV/ncaMmnki2OJjV+UoUPADuo3fHlVDFKBL8x5P/BE2MHUDvDX93Xc9QG2UxUfGEQZdS
X-Gm-Gg: AfdE7cmgdCK4Vcb72zhpywLgc1YF3weUPzn9sqddA/etdNYLzCxcdFjyLTB/yJ0swaL
	2C9GLymcpuDnhR0Dj5aHiDGTpCsS89VIEQpISyz7e2OwoNQetAQIV8VWgMWY2rXNHkrXkqqMut2
	Q3rGtpvXzo5bAGRHs7luUmji32GVc/njz54cF+gAMWavKLxyCNfTo4bS61F3bWhP1WqpTrviMWN
	IAXvizwHf30VudviHRBT+klMEhEk6XDEI7frkKzw/ASOn4WW6rAwaPDItIeggnD8PJmrZp+WC6L
	bn7CAc1oOONETJIsQ5sGXUeCjOY1UeBBowUum6AgSbaqHbtlpoblmpE6l+gYcCCMgpfmk8pnWLq
	inXJmR1BOdf3/onpnUatfmzaJDPKsF17B/Z0HDIpARXWAVNdHfwHm8d7Gl6LhHsX0v5qWNqq8zO
	L1v1mBhJVC
X-Received: by 2002:a17:90b:2f05:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-380aa18d19dmr9189801a91.21.1783051455212;
        Thu, 02 Jul 2026 21:04:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2f05:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-380aa18d19dmr9189762a91.21.1783051454538;
        Thu, 02 Jul 2026 21:04:14 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ccd661sm320299a91.15.2026.07.02.21.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 21:04:14 -0700 (PDT)
Message-ID: <980e1f5c-a845-4180-970d-02f6496f2956@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:04:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix MAC address copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260629-fix-mac-addr-copy-on-big-endian-v1-1-3de40f74c13e@westermo.com>
 <f4d0c9c0-6d21-4426-8403-209f77ab1387@oss.qualcomm.com>
 <akYkNQTB5DPwzYXZ@FUE-ALEWI-WINX> <akYsszdtJfrvIRSr@FUE-ALEWI-WINX>
 <cdd85c7d-976d-4bc2-8792-bef7e98afbd4@oss.qualcomm.com>
 <akZUUhopfdxb3VTX@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akZUUhopfdxb3VTX@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAzNSBTYWx0ZWRfX63ZKyZg0idsA
 GMu+XaCV0hqrSDZAsIVLiSPdRAfdlD4HNIBvb+tQCdfHTTWWHZ7HkOMBFJ/wb2P1OJtUHt6YjDP
 4Fq7FlNsFW47KneZqDE1QopkdJQ/QLM=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4734bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Iwk81yimAAAA:8 a=0cw6PLzwVsJPIFfh21UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=PqBb7rsBcpu_OT3Qf5tX:22
X-Proofpoint-ORIG-GUID: qkH11-1yueX6IFA3NkPmzc1l40dXYA_c
X-Proofpoint-GUID: qkH11-1yueX6IFA3NkPmzc1l40dXYA_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAzNSBTYWx0ZWRfXxOK2bfC5FnVV
 SQchEOajryfgOxlMruEI3GpUqTrgYq+JxVB3aSwcoXkd5opS3Byg3boRQtAglNRQYiswKbeO15U
 0ujvPbC1aVhFANQJXpR0zLk12xMhVbN7SJICwox9UNr+/36TbBKK6vOua1y+XZFlmh8svyjj/fe
 uoElC+iSigiLRaWeQqCAx09L7yTvGuIKA6KrgeSecvEA21HKcVc127Owla/J7KdeKdegfNLNYgt
 iWkxVOqB1wCuUYSrH87n1aA3CE9PxUptu4GsLFvUqlxbZetQWwt26ojygBzn9Jxn+IOxzJTkHeQ
 WptMmP1YQ5T05cc1fFaeVRUhrN+doxPkiAyrNmzL9TwfQ/0vyGU1JvFB1OQP5pGMgtFkorcb8Sx
 nK6luWpP5rQ5aVjzhGWPAq9BPNB89ClmgsRnYLNLV4tNx314kAZ9BTFmtRwaW9D3LdmUnVz9gjv
 lunDsCN7obs2kklLfoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_210416_789294_01834D99 
X-CRM114-Status: GOOD (  24.42  )
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



On 7/2/2026 8:06 PM, Alexander Wilhelm wrote:
> On Thu, Jul 02, 2026 at 05:56:01PM +0800, Baochen Qiang wrote:
>>
>>
>> On 7/2/2026 5:17 PM, Alexander Wilhelm wrote:
>>> On Thu, Jul 02, 2026 at 10:41:25AM +0200, Alexander Wilhelm wrote:
>>>> On Thu, Jul 02, 2026 at 04:12:00PM +0800, Baochen Qiang wrote:
>>>>>
>>>>>
>>>>> On 6/29/2026 3:55 PM, Alexander Wilhelm wrote:
>>>>>> The ath12k_dp_get_mac_addr function performs a simple memcpy from a
>>>>>> CPU-native data types into an u8 array. On a big-endian architecture, this
>>>>>> later results in a null‑pointer dereference. Convert the data to
>>>>>
>>>>> Alex, did you find a time to investigate the root cause of the null pointer?
>>>
>>> Hi Baochen,
>>>
>>> I am now running kernel v6.18.26, and it looks like the null-pointer issue is
>>> gone. I only see the following log messages:
>>>
>>>     ath12k_pci 0001:01:00.0: failed to vdev 0 create peer for AP: -110
>>
>> what is the actual mac addr reported from firmware in the PEER MAP event? My understanding
>> is that, without this patch (if we really need it) we get a wrong mac addr, then in
>> ath12k_dp_link_peer_map_event() we are more likely to fail the peer look up hence would
>> create a new peer and wakeup the waiting thread. But the log here clearly indicates that
>> the wait timeout, which does not make sense to me.

I think I can understand the behavior here: even if wakeup happens, the waiter in
ath12k_wait_for_dp_link_peer_common() checks the map result by calling
ath12k_dp_link_peer_find_by_vdev_and_addr(). Since the mac addr of the newly created peer
does not match, check failed. Finally we get timeout.

> 
> I have now added the following debug output for `peer_map_ev` inside of
> `ath12k_dp_htt_htc_t2h_msg_handler`:
> 
>     /* DEBUG */
>     switch (type) {
>     case HTT_T2H_MSG_TYPE_PEER_MAP:
>     case HTT_T2H_MSG_TYPE_PEER_MAP2:
>     case HTT_T2H_MSG_TYPE_PEER_MAP3:
>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.info: %08X\n", le32_to_cpu(resp->peer_map_ev.info));
>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.mac_addr_l32: %08X\n", le32_to_cpu(resp->peer_map_ev.mac_addr_l32));
>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.info1: %08X\n", le32_to_cpu(resp->peer_map_ev.info1));
>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.info2: %08X\n", le32_to_cpu(resp->peer_map_ev.info2));
>         break;
>     default:
>         break;
>     }
> 
> Here is the result:
> 
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info: 0002002B
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.mac_addr_l32: C921F004
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info1: FFFF0EE0
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info2: 000502F5
>     ath12k_pci 0001:01:00.0: failed to vdev 0 create peer for AP: -110
>     ath12k_pci 0001:01:00.0: failed to create vdev 04:f0:21:c9:e0:0e ret -110
>     ath12k_pci 0001:01:00.0: failed to assign chanctx for vif 04:f0:21:c9:e0:0e link id 0 link vif is already started
>     ath12k_pci 0001:01:00.0: invalid vdev id in vdev delete resp ev 0
> 
> Let me know if you see anything suspicious or if you need additional debug
> information.

I am not really sure about the final mac addr and vdev id passed to
ath12k_dp_link_peer_map_event(), so can you also add print below?

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c
b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 47d009a0d61f..3e8201d536a5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -162,6 +162,9 @@ void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id,
u16 peer_
        struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
        struct ath12k *ar;

+       pr_info("peer map event: vdev_id %u peer_id %u mac_addr %pM ast_hash %u hw_peer_id
%u\n",
+               vdev_id, peer_id, mac_addr, ast_hash, hw_peer_id);
+
        spin_lock_bh(&dp->dp_lock);
        peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id, mac_addr);
        if (!peer) {


> 
> 
> Best regards
> Alexander Wilhelm


