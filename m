Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA4606A319
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TSECVIof;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaDET+z2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ef9+Nw1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=; b=TSECVIofV3jT8t
	QZ0Q5pmN3YNgfU5K6Bz4LOuOs4vJxsmdMWxYSDTcCe7Lmn5iiRMX9n1JQMhUgSjett8TfeX1OlL18
	p0nDBW/Z8HiUlvksGLZxhnL6rDYvr9CfBgX0JMslG4BrxM2MGjp6wyR+UtyA2CndicQPXqMaFffsv
	sK8uFJSDtS1WGr6ydhkZDXTZJuP3o5ktM8rpouBk73ZcH+J1CHMcaWgIEot+DNgafrNSMWoigkG1q
	WfX54hqFqnrGZjZ5g3rMTydaSFh9O9JXVN/EkEF5NIExnGHLE5bjXTme7f6HcuNtWYV8rtQ5CgKXx
	MoLv26gkS4Q4HQrfZHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqXI-0000000Dyf0-4270;
	Thu, 22 Oct 2026 11:00:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqXG-0000000Dye6-2AHH
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 11:00:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xpkR317736
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 11:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=; b=UaDET+z2B6Wm/Tl/
	c2YSwGwenIEBpibmySjrKLSrKR4hv/K8MyWg696uyqs+tclMvvoEJ6zGKHGQxcBI
	+d8QC6ZatvL4V38ziy0G+22dZ4oYnXJed+JH34854VVjGp7GTT1aqWYGO3ziHZSe
	tEHr3iGexgVH2roHaVz2bucKKKunKbbmOCAPaODOMRKtCacqlt1qs1CSxtvbqTiq
	HdzmqC4XZRT9P+qeQ4gH+5km1QYYjduTP3rztXZktG1kUeHOYH+3rgZ0U3IRr9jF
	qyx3RIWZv/JGCrW05HG83zhDS6iFfXQlXJwzcQjeifK4+htayLlxme/4sTphU2k/
	WFgzCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajecm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 11:00:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1819958a91.2
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666837; x=1793271637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=;
        b=ef9+Nw1ayWjr10G9qKSl7q9mTTk28ZF53m/nF+9XBR5h8g3ud0rxOCGY4T16Xvv22F
         3e29zI3ixTKto+O5ca7tHQUnSnvnUrmvqcK5CIMUJC8mWehEJXsBWkAZqTLrNfk/TrA5
         HF69LDcxvQD7cD4y9EX7IoJgCA3JhtDKo3efSpJTARx6z5A7B1kx1n+SHH/4vGfIqapi
         iAunA3L6yFuuL95wJ0w2eAz/M3zQDAT0pQ8R1aHe52FpMIVjl8h0TJ/GW9UXmCphuMLu
         GmP7b3U//UMZpaVync4QUE0sYfcWv8sRhIpxljqWC6kSqee8YBpIGezHOPNne648BFyD
         s/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666837; x=1793271637;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=;
        b=IQarJz6PcW3l1J4gktRuO1WP4N3DQspsjBvYhyzymJ9wEm044f8zKqsy5+qe951BPU
         ouz/2KOgHAdgIa/UTy4DLUiaevHpPjtyXGQ+ZHL8jDnOhYDqEN78Una5a48LrOlaR06o
         KzjSscZVBgyF82p7ES+UlIrDvzdv1kQpS5EX2B3dp1sScHlATrzseFUfgNGueRV2DBRF
         y/3ET5Oz0kHW94reZWkSH/OJvl0HLMLTRX/9nQuVQ2T4JQvjpstflyzowI0zZtN4iO2b
         AQXFbBgYsYI18/TGMzrrTPMMrZU5CSiqX9oKGFNs3hqhLk3GiPzvbUC1YMUfkia7KRBt
         et5w==
X-Forwarded-Encrypted: i=1; AKwUvBw1QfglzIIerCSSoGI2KHaefb4uEluu1dCaijCF53kn5i+tSXOCspbew7D50D15Vqw66zzeCc0=@lists.infradead.org
X-Gm-Message-State: AFq9FYL1rN+EN3PQw3sjIF3pz7h5Y8DihwNpj0Az+GXykf+ntY5kVB/w
	FuJ0y94nRxBSkHwPt+911+EhjMpPRhwzl2cnxOpDFNCcqDJvHgLKejams3K8J5fOvdDXnJ4NdgH
	aBq3BM5HkRhAetITbwsvO+lsaE09JgMy8ZQuK2XdzZU6CoytE2NFFNm3KScIhoxYI
X-Gm-Gg: AYBFou0M7L500SNc+08TrEz9zRrnDfLgw/1t/gP5Yy2i3b1+OsKg+SQnMfk0GetJ1wP
	rUDqCAOD7ks6O5LQ8i757H3oMkIFae2piKMlvEvPxaIsLKsa4bB3f5XiGOccI98eRl2Tt6B3q6q
	tF/kp3Y9YklMc2AeIGsn1Vna4dZUo3x2+08uwfTxXXzuUXPFUdduMr0Z2mCKz+hagSq5BIWLYwT
	7ibAQJOBDV0OV/2H/d0yRLw1dsWZmYJqvgR1T36FZKV8jUXzZaAi0FOfzB3hijweCs5iiMIT/bI
	AVjUTKB/YB23k1puqUVhPU5ktLd8yMaGGAWaP89xLxaeFu+oRPQnYb7siCj470kFegHHDHdeggn
	dTJX4NxFi5ZJo27337FHxz9TKtyNHPy+8opjSd2F8Sg/gYQjB25h7o+GLd+9ie/Qlg2ZvJs9i
X-Received: by 2002:a17:90b:2c90:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ad86dcacf8mr4085343a91.8.1792666836400;
        Thu, 22 Oct 2026 04:00:36 -0700 (PDT)
X-Received: by 2002:a17:90b:2c90:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ad86dcacf8mr4085282a91.8.1792666835602;
        Thu, 22 Oct 2026 04:00:35 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm3793372a91.1.2026.10.22.04.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:00:35 -0700 (PDT)
Message-ID: <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 19:00:31 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXzr9PJiSEKU//
 agYIBXT2TfCfWdJn8rKDINJgJSLEvW9bvhZ+HSoQxkX58mds036/zBr2Irqf67Qp27IoPlLyACt
 uEnqgq+IzjDd6zJaRQ0sLu8hdAakf0HgD3wM0INF/vl4ZOCiNqQQ6rnHfrAXdTDA24ccPDcjEyx
 fmE3dnNKdLBO3uqhQ3x/x1KL2njXo8xe8dVNrMaeqfC+iWYKiCpSJz1Z2Wx+eOjtQlUY4WFTPKt
 kjf1u/OK6VsffhL6mT4zakNwxjR4UmppwImCxBrxUUQ87//XdMDMc+Ws0Zgoe38OshB2U+8SPxP
 shU/c1al2sNrTVQhQeZnsoRgoVk5vYBFpHqyyLAXl9A1hVHrauqM4GGGLWpKFmw91OUJD6qSIhP
 0q/F1m7Df0WGdko9ckPov/4oKZeOZkG50X/WJwQn6ISdwdtoxEpZKkGmHjHUnPQh31LjGMpobDk
 TK76Fk84t+ZSvyDf6pg==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9ecd5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z4Rwk6OoAAAA:8 a=NbhQ5tqkUGBw_Ouk81MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: FO07rxaQWAig9l5dsFsulUUX_tg0Xo1j
X-Proofpoint-GUID: FO07rxaQWAig9l5dsFsulUUX_tg0Xo1j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX72WkPvG5humk
 ARGCGpntKwZ00VQOLz95NYj2/KUCAmsuR9GVuPHZY4t3VpHgKpGFT7Y4nnx/vMQP1UkoXoxxZ4X
 llfV/fW9nZRjXbodBJVZJJ8fEy7S44c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_040038_564951_378E4E20 
X-CRM114-Status: GOOD (  27.68  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/2026 5:20 PM, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/20/2026 4:53 PM, Shawn Guo wrote:
>>> + linux-arm-msm
>>>
>>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>>>> For WCN7850, MAC buffer ring size is updated to 2048 in
>>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>>>> to increase peak throughput.
>>>>
>>>> But during the RX process, a phenomenon can still be observed where
>>>> the throughput drops by about 30% from its peak value and then recovers,
>>>> and this behavior repeats during RX.
>>>>
>>>> After increasing MAC buffer ring size to 4096, the data rate drop has
>>>> gone.
>>>>
>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>
>>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
>>>
>>> FYI, in case someone else runs into this: with this change (merged in
>>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
>>> working with the older firmware that Debian trixie still ships
>>> (firmware-atheros 20250410-2):
>>>
>>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Probe and firmware download succeed, but every WMI command times out
>>> once the interface is brought up:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
>>>
>>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
>>> reverting it on v7.3 brings WiFi back with the old firmware.
>>>
>>> Unmodified v7.3 works fine after updating to the current linux-firmware
>>> image:
>>>
>>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>> On Debian trixie that one is available from trixie-backports
>>> (firmware-atheros 20260916-1~bpo13+1).
>>>
>>> So nothing needs fixing on the driver side. I'm just leaving this here
>>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
>>> kernel upgrade knows to update the firmware first.
>>
>> Hi Shawn, thanks for reporting this. I just had a quick test
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
>> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
>> any ath12k warning.
>>
>> The firmware images I am using comes from the first commit adding WCN7850 firmware:
>>
>> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
>>
>> and the md5 values are:
>>
>> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
>> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
>> c79c410d585360000c0490f16fda43e2  ./board-2.bin
>> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
>> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
>>
>> can you share the md5 values of your images?
> 
> Hi Baochen,
> 
> Here are md5 values of the old firmware shipped by trixie firmware-atheros
> 20250410-2.
> 
> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin

this is different from mine, can you try mine?

> 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
> 
>> and have you ever tried the upstream mainline
>> kernel or the latest ath.git tree?
> 
> I'm not sure what you mean by upstream mainline kernel, but v7.3 should

I mean Linus's tree

> be the mainline kernel released a few days ago.
> 
> On the other hand, I just tested ath.git tree at tag ath-202610191908,
> and it worked with the old firmware. So it seems there are some gaps
> between v7.3 and ath kernel.

can you share the exact tag of v7.3 kernel? is it just below tag?

commit c03c1a14507dfaf8b856c2608f9ac216021fc222 (tag: v7.3)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Oct 18 13:14:58 2026 -1000

    Linux 7.3

diff --git a/Makefile b/Makefile
index 0dc1a9f4e63e..c61ea07ee505 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 3
 SUBLEVEL = 0
-EXTRAVERSION = -rc7
+EXTRAVERSION =
 NAME = Baby Opossum Posse

 # *DOCUMENTATION*


> 
> Shawn


