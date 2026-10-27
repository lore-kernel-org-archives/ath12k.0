Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A82606A31D
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 00:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/M7KMui;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y037Lem4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6hDI00K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=; b=q/M7KMuisur3jX
	wddC/CqP1UxhHYDyOP1LJVlFkSeM9phL7myRuILHAttrCeDhBVnVC0PcF/tiVaCvymcyq+4KjmRzm
	pd28LpMdAL9EBpGB8yacWZSNqKJZ3vlY0KPO4em9htcpKc+KYDklHbb7/WMDS86ls9Mq+N3TYNydL
	TeFLkFNDFuvHoi0Wjqc5g7LomI7UMj1Q4SvYwu/JAbJ/NE6bdIAmbdwB8GnSEHW1LeTHkGaNUm7x+
	38y3ui7WZ6UXT+m/g4zoI+dp/Lv4UXzg3eSmn/tZuc0cGWupgQTINIvzKNHGPK6E7MSVdDWO2VYVT
	QkHmvqQzXhzo8KxF3Jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVLn-00000003YGO-1eBx;
	Tue, 27 Oct 2026 00:47:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVLk-00000003YG2-1ycZ
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 00:47:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QMPaqg870367
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 00:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=; b=Y037Lem4XbcYDRHx
	N7xk1Q+i2uzWcHZApOM30dPCzAuOJPbeqV9T8Ms/lfqgEUJ52nIOXfP6UOGjtbB1
	Nmm2MARYkg5ugoLJ1FrpSrFGmQneQuP+hjMX32bKtGyj5d52kMMrc82Pjm6UFZkC
	6CAeuwQ3v57aUUmILBBDzP9j3atsu4BfmhVHh6RzI31/kGqhhoyXreUBWfgfddLE
	0fZrl31/+9xSyRGpEvmJdfh1qUdpb0gWFLwCZvbyAQccaDCcnUjpqOnZUwIBg6Sw
	12Ui6jCdnkVefJkLiZvCOl1Y4NmLzIei6tI0kH4h58KpbdvQ0AqProqE5W3DCNew
	9TRbEg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s933dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 00:47:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so63376eec.1
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793062054; x=1793666854; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=;
        b=G6hDI00KNi2MvEoeHM9OHgcC+4DJKAPHIzKYfztGtqkeTqtD/7PjDElXBBjgS6k5XO
         xe1DMPZk7R9lk6alppS9LDGO2JVDUb7SYKZIVHTkfTH0s7GodsmlQIMgQegJ71/n1myI
         1cYkD3+P9amDGnfhPt8/I63DU9ipwSJuliExMSbJwbadvwchw6jXiPdqVzheLKs1mQFP
         cZz+vY9zfqqUsSR7VpvY2WlyknxDULI4+oojxtbW4NB5rgrLCZViBpBuU6QTPsdK5W3R
         zDD2ZRar7whLjHfhrxjGS9x2DtWmJfMYiFLQNNMRZOFHddz6BIbc+27HGIq2Zk7LtwXs
         ON4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793062054; x=1793666854;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=;
        b=WEzOAmWfwuaBqQCRZFGUMD2P3emN7ExmNq9c6yVED0v75NmaaLLhnOEBeqHc9QmCfl
         Zxpbb1MpOZ8DqG/nm1u/MmfuxFZkMHbhhKgcBGpjQCDO9RpoxBAnTStmrSU5j1q7B3BV
         ihdlLM8dNY60wcWLa0+sIwT5hpFeaHxepn8V5EDX81RGpW8OlRkmqFzs48HeBGUdI7iD
         1tPWZyBL7eoeP1Q+06VBRH8gEafg8rh+Z2eA7OFa7W20eIddJX3c+xbF3fFWB/qo5agq
         qpjN+OY2P/+Ejh1baIeiSoHBD5JFtbZCBNsobuBBULxZZUun0wFNVHu1Kb/EmGJcrION
         w3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkPXyLVTtkVXwCtT6/SSPpN/G1rfL2YC5jlZk6Usel1AiXsGbE1nsVoCBTDFtAQLTkkBKkFUo=@lists.infradead.org
X-Gm-Message-State: AFq9FYL3KDheIY5wTo4APOz/9vtWOngE3oat0hUECC4iRi5kBOCgktwa
	foAAJ4wNxjUWAeC8MIQThZgNO+t12xk4S6JuJak1FmMG7MSOZIeVP5eU309jtvSbEemlgbSJ+/O
	0JhRoJ21XoiiVjGtAZYIewkClDI7V4dBKzIJMwFmZCrNSz07pHw7XwAXYRKEqLGc1
X-Gm-Gg: AYBFou3L+Qu10JXq6ZPLUJxPYJKxZp/ay5EnDHei1jVKWX/tlw8CAJLYlzoP2jGbgeD
	6RnjD8QjnniYDAeBBXF0+Ya7wobkS1Wl49JZSzhGsd8eUWid03qwuFHF1tNoSNKeIxdYed+YTER
	IMF4rLimamrXnlWPtGVeNUvx9JZCk1eS369AbD2nPqcsPjxqQRFeeczBW/1vSGX80F7ObMZF7/2
	05CNtWkpsCMUMPlqe86NFgxbD9kHv4pxsEuyfAxvQS2iaG5kVh3kvvV7mpEfEWGg4uWETYoH74L
	S66JVNC0ToH5PNB34dKeYeKjxurhLYVP23jba8PGsJqIa/2yvTO0Fg9Zj30SSn2aXPDEyHhp25u
	rYkaKQ6+4kPccy/M3JPsXvMvalMKs6oygRahOD971oFS+wduYoEHlNlHt1Q==
X-Received: by 2002:a05:7301:dd89:b0:369:9eea:cd25 with SMTP id 5a478bee46e88-369e842d28dmr12705668eec.7.1793062054240;
        Mon, 26 Oct 2026 17:47:34 -0700 (PDT)
X-Received: by 2002:a05:7301:dd89:b0:369:9eea:cd25 with SMTP id 5a478bee46e88-369e842d28dmr12705631eec.7.1793062053486;
        Mon, 26 Oct 2026 17:47:33 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm29144011eec.21.2026.10.26.17.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 17:47:33 -0700 (PDT)
Message-ID: <7ada1074-9c84-4708-b5d6-9790b9f6f3c5@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:47:31 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
 <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAwMiBTYWx0ZWRfXw5cJZenamIJE
 pcGWjGZBi44CDg0k4bB4aD2Cu+AweNmmE3ru6y82VEY4fw6kzgylVUEaxYdkbjo0dMtuwB65Iwf
 YiRYxUYjqXs4QNpZ03Da51Ty17Bu3cY+E/+dvq5zSy/nW1ytC6sl+rduXdMdSLnak+u4WhXWBIe
 9shkSOK5WdYLjpcrN/ym49557JinE5mUqi+19BAG0CvAAYM9uWw6sMhCB27+7TVM0FmFe0XQuH8
 7OIdU0UCqG2R6lLmM86mpmWeN0q0AaIwX1ga4nKveq+tmxdrzcz9RPpitcI3mU/zk5BKrngz1dF
 UgSS1KLvphrJZf2bEAc+VBdDdg6yzOu7Q1ccJwEfnO4ElUYntZ9q+Xe3xRmW10WMh/MaIEku/G9
 azu1irh9/skV27oMeoYQnjxTKEf4Kni7ANGiYP0sGGO6YsstFJ5k+YDxZ5BYs6HwYqvorhLy6gN
 P5CtKHlRIa0lXQCZFMA==
X-Proofpoint-ORIG-GUID: wrtnmOBSVsMDwuu-MH3DgCAGX15Yamk2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAwMiBTYWx0ZWRfXx9cetIXRYkP8
 w7urty7WdZp+5VRkYzIiSZ5/IjtACRKAq8Zg34ZShD9YX5F5/IbmBforc1L9LhqzvEEvFAs5PdD
 j9RFff/9RgbI3JykamIGM6pdrivIvQw=
X-Proofpoint-GUID: wrtnmOBSVsMDwuu-MH3DgCAGX15Yamk2
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adff4a7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0oYm2DgIxsn4U9MLWVAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_174736_833312_C16210A6 
X-CRM114-Status: GOOD (  14.30  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 8:44 PM, Shawn Guo wrote:
> + Jeff
> 
> On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/23/2026 10:43 AM, Shawn Guo wrote:
>>> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
>>>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
>>>
>>> [...]
>>>
>>>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
>>>>> the ath tag (working). It lands on:
>>>>>
>>>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
>>>>>
>>>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
>>>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
>>>>> and works.
>>>>
>>>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
>>>
>>> Thanks for confirming!
>>>
>>>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
>>>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
>>>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
>>>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
>>>>
>>>> maybe I should submit a patch mandate this rule.
>>>
>>> I'm more concerned about how we would fix the regression for 7.3.x stable
>>> kernel.
>>
>> we can try to ask stable team to backport 15f7603b69a8 ?
> 
> Ok, I can do the backport after the commit lands mainline, assuming it's
> part of Jeff's PR for 7.4 merge window.
It's in Linus' tree now
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=15f7603b69a83a0acc7fcc8992ecbea6110f9424

Would obviously need to backport the entire series:
https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/

/jeff

