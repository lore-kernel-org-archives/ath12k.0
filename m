Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD528C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aq6TBwc51LH5Mew9JVDw6URTUq6CcWxDYoLHE7QMsv0=; b=v1Idd4NehLC/YuA6XVsvEuD9+G
	QtIizF9Zh70gsaayqwzKO7ClLN4LcxlWE2/+7zkJy7wt+Ml1Zu0K+QAwfcKy0+8m+f4hk9Vqr5DLV
	OcwVD5nzyWjRgneEQy/2etYu8s7Co+UyZTcKhz41v8ThC5l7FT/yIL9F28IMySKKAtMVAxtoBrEyN
	daQEFl+wXpL5u4XBxlXPHda+FlEiTK6sAP9g4Jx5vS7qgCLnhiycWsJFGhtD8FTiYgvN7niNOwGwn
	+MukaadggQQI7vZaV9tbZKdNNkkmT6Cpm2s0IbkvafC9ic3FMsw1dHOgIiLD5wsqEZN/ZosZqdtdR
	usr2fEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY2k-00000006Fnp-2khy;
	Fri, 03 Jul 2026 07:10:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY2f-00000006Fmr-23JA
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 07:10:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635reYX3087996
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 07:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq6TBwc51LH5Mew9JVDw6URTUq6CcWxDYoLHE7QMsv0=; b=oI1GY7pIl1HvWLR9
	sGyhg/5WXqmZMAQk4Ux3hUFN2ngP2MVS7mHV3JjFmM7vuyLue4zsc1pPDtfwRNAy
	kdihSJV4jyJObCP10IdlGr4n4nJlLAwHu4lbHNMHxZmXxFPEfiPOvZIkFKtuL6nH
	4obE31mEIDjcRak06TVEGoTSklRZ59tRSJQgPYp1Sg2wma1v/zTiNkLJRt1w9kgE
	5uF4ZdvQpuOzoYyRjtxZhwdLFuxJyaV9cvvf21HwD4RnPvWZD6V+5QNWIpbobtBY
	WrZpqWcPXxlVJ2bcsiwkXh36PgZT7hC3G2Fp2lzjHviGiMNwY+XL/L/td+0EdAUS
	pyoH2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s253sqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 07:10:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c81c7421abso7922145ad.0
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 00:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062627; x=1783667427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aq6TBwc51LH5Mew9JVDw6URTUq6CcWxDYoLHE7QMsv0=;
        b=DNiAtePXatEF9uZWo+JDTwGkrIoboNyDSyBAixA99iKevuHs67Mu6+0fyJ5Jp4adML
         mhK2BPIQIFqidnuvSwMoGlljkW8Ma1UzeFaxgSSkgMpcNrnRpm99lh/H7JACBRlo51BH
         1HJJw+Kbn+U0FkJP3DhbeZ7vjqIBQS/l/P0t/5t7Us+suOPS5i4qHxrZJTaxb3uoerKO
         LMCVranIE/mejddHQzzzCc/9ki55GRtji6CjvjbxEdsEFM6hiOkTm9Q0a/0zwcreGOs8
         uUGomAhndT7Q2jYpmRWVip2w6AyNP+4rFOyLWHHcT8woPfoETgVmVedofpxnMZq2WSeL
         9Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062627; x=1783667427;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aq6TBwc51LH5Mew9JVDw6URTUq6CcWxDYoLHE7QMsv0=;
        b=SKuAI6ENi5lIHfCx3sCEZYdosc3TulkwQR3+RgV1o05lP0vFzUj1gcbOOPy1BMz1SA
         Ovj/iA8paxKSXToEvPRRmr8DBRdfZsX6kl/XDXFtBOo/qnUKFT/ABZo4Oipu1z5xgsN0
         s099zfVy1cUAHok14KLtrVI5BSG0Bw1CdmI3vun0svZjbV1/ioeAOkUukyy3969xq6Qa
         kfBQo1ZK+EXLkenecKdyJPz9joK8Zy9fFLtUPziy02DCWa6M7puzja0xDW9ye1BtKOl6
         Ik1B6peUf7LCJGyoPy56suVBVrcycpmCxHwvtCT8UWY/wRrikrdhwq1sXTC4QrjS3p/A
         Ju2A==
X-Forwarded-Encrypted: i=1; AHgh+RrESWdzuF7699c1K/JWqPGM4yx21sNPEGl7KcyriiliikLrGPaFoctA0oA9U6Q8n2/7v3AudsU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDavgSGfAzvRP4qSQS/6ruKYCEr5PWyZsCkdDPpM6zH5rcQyNd
	qw0CF7pqsu+jhsetD+SjSeCD+sfiAlhDVEWRTxzzcDXDPEGOS/8tyTQxxlbjlwLc6M/XA7JwhNM
	A36y7jguJQD+5oK9i7sCGC9vk/MU/iap75puG5GCq6JrtxUkAt9g39+SDN0V3seK5
X-Gm-Gg: AfdE7cmNLoFBwDp5Vs2eMNpleHxdkYFJZ0FDT6si9SwbQ2ht1PKrSCugqT7maBAVKO+
	nl2QWTCAIW/91uNu9FC7VYBfM4kvMX2OVScnYJwM0jzfODl/huLoUYGGUpSnefdQjvgUr6a+7tn
	NNZknra8FadarhHMt3kT7j4mITmywseJ0eXr7NKzg5wlTl7O8ryb1xt49cBNLOqiMkVxIY6hgsZ
	JdG+JzcjrlenFDSTDuJF6JFRBH/zYou7If8I1vtRQULPxmaeYkr3RxgGQU1HrK8dJLRPB+AS6Ku
	QNYOxV16huvC9WRSZ+fw7KsZbuwr5pmHLRR6nhpuPhhpnDh1pBoKyted7U00VPwczuyhRTfbh3/
	WFw484vzg13XgzndvaelZMGPyl7+YxhUsRrtTYkezYCMb5GZ3NfgvLxpAcTYRFeafrXwNKCtfW+
	h7WpEjqJSJ
X-Received: by 2002:a17:903:234c:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2ca911121e5mr88935175ad.4.1783062627442;
        Fri, 03 Jul 2026 00:10:27 -0700 (PDT)
X-Received: by 2002:a17:903:234c:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2ca911121e5mr88934765ad.4.1783062626960;
        Fri, 03 Jul 2026 00:10:26 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad78a9f83sm4888795ad.83.2026.07.03.00.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:10:26 -0700 (PDT)
Message-ID: <606bc37c-45ff-41d3-8f0f-942c3009c4b4@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:10:23 +0800
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
 <980e1f5c-a845-4180-970d-02f6496f2956@oss.qualcomm.com>
 <akdYU_Lejd2FZeIN@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akdYU_Lejd2FZeIN@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a476064 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Iwk81yimAAAA:8 a=L-SkCVRlKA2wWS2LGbwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=PqBb7rsBcpu_OT3Qf5tX:22
X-Proofpoint-ORIG-GUID: _5wcqD_gRejY4xLsvnkbgvigY-AiphYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX5aywUgvCYK9H
 qwhzBAxIePs6D22xm6BrbCTAVa9S/u32OcrSboZourisUOdc8/j5rrK+YnqtZXcYpPElvF19fvB
 T0SV7n5jNIhubWFNZVhv4VEwAOipcDipTK8loUWxRQX7UrbZpkwBHdHo4twWI5ZrzLNmH5mrLW/
 7tR/zgrtSAsJVlkoRicJ+1S9QH+QFygEL9t4j4MMoPvwA8yxmdnCtIXfX6waK2d3YBex4g/Y7IG
 joksGtsxVbCgs8KZdIh2qYrCk50gUeLGxIqYDuUH7626kR44M+71EmHoZF2lfIEmLy1HQ3zKcOc
 g+/nbw6ukrMyHmQdIyDwHdESlqwGG+cWv0tdqoVOczoWIEE6bq/8e94QS55XzSNuuaP88o38vc7
 d0bQG5qj+aLZ2sC2FPrxLCrbavS68RZhgLMTP3jX1Kq7ZhyA6TE1LT/1RawmoLCvyMFEW8Eh84T
 cBHi1SC8n0N9l4Gel3Q==
X-Proofpoint-GUID: _5wcqD_gRejY4xLsvnkbgvigY-AiphYQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX521gK4n0grGZ
 pnGh75jGLWaAyYPeXxjQBS8/N6V+WPvea/rxUZKFag2hNBbQGDt3YUO7Rk20RoBsVdKStbccR5k
 C3gcTml1slmr081X1NYiVw6pMUbGyA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_001029_659643_4DBCA0F1 
X-CRM114-Status: GOOD (  22.89  )
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



On 7/3/2026 2:36 PM, Alexander Wilhelm wrote:
> On Fri, Jul 03, 2026 at 12:04:10PM +0800, Baochen Qiang wrote:
>>
>>
>> On 7/2/2026 8:06 PM, Alexander Wilhelm wrote:
>>> On Thu, Jul 02, 2026 at 05:56:01PM +0800, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/2/2026 5:17 PM, Alexander Wilhelm wrote:
>>>>> On Thu, Jul 02, 2026 at 10:41:25AM +0200, Alexander Wilhelm wrote:
>>>>>> On Thu, Jul 02, 2026 at 04:12:00PM +0800, Baochen Qiang wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/29/2026 3:55 PM, Alexander Wilhelm wrote:
>>>>>>>> The ath12k_dp_get_mac_addr function performs a simple memcpy from a
>>>>>>>> CPU-native data types into an u8 array. On a big-endian architecture, this
>>>>>>>> later results in a null‑pointer dereference. Convert the data to
>>>>>>>
>>>>>>> Alex, did you find a time to investigate the root cause of the null pointer?
>>>>>
>>>>> Hi Baochen,
>>>>>
>>>>> I am now running kernel v6.18.26, and it looks like the null-pointer issue is
>>>>> gone. I only see the following log messages:
>>>>>
>>>>>     ath12k_pci 0001:01:00.0: failed to vdev 0 create peer for AP: -110
>>>>
>>>> what is the actual mac addr reported from firmware in the PEER MAP event? My understanding
>>>> is that, without this patch (if we really need it) we get a wrong mac addr, then in
>>>> ath12k_dp_link_peer_map_event() we are more likely to fail the peer look up hence would
>>>> create a new peer and wakeup the waiting thread. But the log here clearly indicates that
>>>> the wait timeout, which does not make sense to me.
>>
>> I think I can understand the behavior here: even if wakeup happens, the waiter in
>> ath12k_wait_for_dp_link_peer_common() checks the map result by calling
>> ath12k_dp_link_peer_find_by_vdev_and_addr(). Since the mac addr of the newly created peer
>> does not match, check failed. Finally we get timeout.
>>
>>>
>>> I have now added the following debug output for `peer_map_ev` inside of
>>> `ath12k_dp_htt_htc_t2h_msg_handler`:
>>>
>>>     /* DEBUG */
>>>     switch (type) {
>>>     case HTT_T2H_MSG_TYPE_PEER_MAP:
>>>     case HTT_T2H_MSG_TYPE_PEER_MAP2:
>>>     case HTT_T2H_MSG_TYPE_PEER_MAP3:
>>>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.info: %08X\n", le32_to_cpu(resp->peer_map_ev.info));
>>>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.mac_addr_l32: %08X\n", le32_to_cpu(resp->peer_map_ev.mac_addr_l32));
>>>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.info1: %08X\n", le32_to_cpu(resp->peer_map_ev.info1));
>>>         ath12k_err(ab, "[DEBUG]: resp->peer_map_ev.info2: %08X\n", le32_to_cpu(resp->peer_map_ev.info2));
>>>         break;
>>>     default:
>>>         break;
>>>     }
>>>
>>> Here is the result:
>>>
>>>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info: 0002002B
>>>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.mac_addr_l32: C921F004
>>>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info1: FFFF0EE0
>>>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info2: 000502F5
>>>     ath12k_pci 0001:01:00.0: failed to vdev 0 create peer for AP: -110
>>>     ath12k_pci 0001:01:00.0: failed to create vdev 04:f0:21:c9:e0:0e ret -110
>>>     ath12k_pci 0001:01:00.0: failed to assign chanctx for vif 04:f0:21:c9:e0:0e link id 0 link vif is already started
>>>     ath12k_pci 0001:01:00.0: invalid vdev id in vdev delete resp ev 0
>>>
>>> Let me know if you see anything suspicious or if you need additional debug
>>> information.
>>
>> I am not really sure about the final mac addr and vdev id passed to
>> ath12k_dp_link_peer_map_event(), so can you also add print below?
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c
>> b/drivers/net/wireless/ath/ath12k/dp_peer.c
>> index 47d009a0d61f..3e8201d536a5 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
>> @@ -162,6 +162,9 @@ void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id,
>> u16 peer_
>>         struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
>>         struct ath12k *ar;
>>
>> +       pr_info("peer map event: vdev_id %u peer_id %u mac_addr %pM ast_hash %u hw_peer_id
>> %u\n",
>> +               vdev_id, peer_id, mac_addr, ast_hash, hw_peer_id);
>> +
>>         spin_lock_bh(&dp->dp_lock);
>>         peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id, mac_addr);
>>         if (!peer) {
> 
> Sure, here is the output:
> 
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info: 0002002B
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.mac_addr_l32: C921F004
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info1: FFFF0EE0
>     ath12k_pci 0001:01:00.0: [DEBUG]: resp->peer_map_ev.info2: 000502F5
>     peer map event: vdev_id 0 peer_id 2 mac_addr d902298bM ast_hash 5 hw_peer_id 757

what is d902298bM? are you using Linux? seems %pM is not properly formatted in your
environment.

>     ath12k_pci 0001:01:00.0: failed to vdev 0 create peer for AP: -110
>     ath12k_pci 0001:01:00.0: failed to create vdev 04:f0:21:c9:e0:0e ret -110
>     ath12k_pci 0001:01:00.0: failed to assign chanctx for vif 04:f0:21:c9:e0:0e link id 0 link vif is already started
>     ath12k_pci 0001:01:00.0: invalid vdev id in vdev delete resp ev 0
> 
> 
> Best regards
> Alexander Wilhelm


