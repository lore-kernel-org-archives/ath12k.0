Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27A8C53219
	for <ath12k@archiver.kernel.org>; Tue, 28 Jul 2026 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOuGRv14cYKG+wn2zmuxiqHqCSQOTP9wT54dUBRfhf8=; b=A9ejom3DnNvqVlm4M8JYsBQ41U
	Z89WaCO0wmS8cHx0zg9TG09bOQL2cLKqE1JNHX4mq2oriYJWo4gfv0dllcvu1oWqDiQzzaDBGYTCg
	bAw5y47HjxKmmGV7X27gpw9LPRcKBRJx+gG7zt7SpMuCSZVTuyK3YAWTiuQY7dmClGkLuTIAhrm5X
	HWfnFEY6SzFwIcD6BSEX7AwTyfirbIX3AiJOoR414KC8TAV4NvBostU5Dg9IEUndhE5drnCJezRJQ
	okSI/vBmmIpIpTqYQ3TG2/z0sVnyrn7/drCof467bw2cRFYPbeipb53zv4vOHELWRuDUV5BCoAXDD
	wbY+P75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogrJ-00000005EP1-2JuH;
	Tue, 28 Jul 2026 12:24:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogrG-00000005ENy-45Q0
	for ath12k@lists.infradead.org;
	Tue, 28 Jul 2026 12:24:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBIAQ32735026
	for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 12:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOuGRv14cYKG+wn2zmuxiqHqCSQOTP9wT54dUBRfhf8=; b=N3JMg5N7DrJLrCjI
	foTumEjALLWc4ddbD9S1BqnTLMbUjPeFc8BdezY1TfRx/dr46jy/GcpXGd+Nr+Dw
	JgMih4wwg+KbMk4fz0Ka0K9XizmWyXv/3RQPbYUNs0LkkJEec4+cCOGWnoSDZWBa
	Xh0/5fSSnlTWxkLXm1xjJYRnn7F8y6y7RMMdewLyVhgHcrXwm5MirJyAIyVI5wwn
	+LoLMz6uI1czLhYmMK4+Gpq+lJnqdaMVlc0xA+b6KHYsBDAUpaI/Fnre8xiz2Izp
	mEUb8oDbvXMExTffU6IYiMWIFcYS5TybAXGhn0LBhaPd1LLUsBg/KmznsexZT96b
	lFVhgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsv6cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 12:24:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so4553932a91.3
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785241469; x=1785846269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOuGRv14cYKG+wn2zmuxiqHqCSQOTP9wT54dUBRfhf8=;
        b=D7icc2SXVng5YqKImYMvWEoIaeDJw+Ze4a3DswsGTDDnpbgb0ucluMsjFrn9bR22Jh
         O8OEwsSRWWkJMDUsvwVl9Kb//obrJSrGda1aSQPloG5MwTT6aoXA3XP+oRjz+FqYwjcM
         owAjGuJ8X4YYrwAbcp2Ul3cdQ+/8vQy80xgQ8L86O9QmN0Jzi/T+x8lj0l2U3r3pMYU/
         EGesv+Kcl3VySYlFV7ULglgxbKMfYmkFjHLS9wOLM+68gARzZW3RtXyUVs3vBXYpIbEj
         iZrhD5iaeNB2jx5bMSb4V5gp57PPzgVV7DSEJb+Mbio4dMZRxozPYAQy7IciYVxFIhOx
         imBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241469; x=1785846269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOuGRv14cYKG+wn2zmuxiqHqCSQOTP9wT54dUBRfhf8=;
        b=cRbeybaxYwzHZwWr/EyNcahg8xI4a5CLuT0OfSXoamXJTAXXM0HeYtFSQpN9RdlXYU
         CInPwTuimcBQsEEdHqlpGX4/Sf1P6qCx9+EE1fulD3VcAqW96Hb/POr8zhmqGQz6oXVe
         i6Ux4PVJRhFfptWRMWaopi11Pr0XEA3o8meXil/cVYbg15GdQPv6AM66ndCMOzzfEbpO
         ldx7ZGOdYtk3V13QX4hsYCoHyvSAWm7UMiJDUL0tPBw+kffBRN99nDMN3wLzZCP6fWWp
         MRUNwE/I3QTFoWYAojQyTPIIGK3JjSGP+uS54X8BLtvsn++gcOI5Y+pbtzAz+L7zKAV+
         43wg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1tQ91Eu00Iw0dH74d7qbRn0a5Z5Nf5Mj+La+nv87kfoZ6rehT9ElQkSn/5Fk/pzYS3ZWKgEI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yys95AUPwpKWq8GU1XZRi7P7OnNQhUUwY938Uo4fmEOL4TQ9hFk
	JvJe3/ZmlV+aWXMqgqBYXZ20pGW67HLcfNvl8kBlZenGKcF9dRHoF0VNxc++A0KZHfCb9xu/NKC
	eBusmdZTYBvMBE5TKJMJ1NegYVMBuiTc60QdGknFRpyuHS/nbOwsjH3YQlyFWaK2b
X-Gm-Gg: AR+sD12MBWCeBJE9ss+itF8XZaZJTJYE5se+OFTntkpEyDkyCm/e/ja42n4GznXReqH
	4DJkZ88TOmMAyqnyU8arKnxNkLKovxVkfzXi0JAX0V4pzOGqVf3xQHZCs1emCJe3bjIFPAHNLuq
	92yLGLjK+z6yWZOrr65kFoU6PW11FgZe3OkPjBXUOqxkJOgE6E7oKfZmCR/K5df2sq2TY34mq7o
	KSI3CN71Wd6cIFi5NsSogw/yJpyGXPT3ux6rV8Tr7wX94YWfCwu420ZrvYmURmKTsUubLfSk3wj
	WqosMcBJkLycejHgnk1REK14NbyLdkABcYPS8aZ1pPpsCxfkNPs8Q7TiViHcfo1UkBsGFrGuWY1
	i6keo2j2NOqvVnarSvRX9caUGXT94OAw=
X-Received: by 2002:a17:90b:1b06:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38f6a4810c0mr2405578a91.38.1785241468990;
        Tue, 28 Jul 2026 05:24:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1b06:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38f6a4810c0mr2405538a91.38.1785241468283;
        Tue, 28 Jul 2026 05:24:28 -0700 (PDT)
Received: from [192.168.0.12] ([49.207.202.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6414383csm1225455a91.13.2026.07.28.05.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:24:27 -0700 (PDT)
Message-ID: <b0265df9-a937-48c8-a191-061077b46f28@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:54:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 6/8] wifi: ath12k: track per-ring RX
 sent-to-stack count
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
 <20260723125448.922361-7-pardeep.kaur@oss.qualcomm.com>
 <c455a465-254c-48e6-9183-7b67d4b76dc1@oss.qualcomm.com>
Content-Language: en-US
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
In-Reply-To: <c455a465-254c-48e6-9183-7b67d4b76dc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfX1RztbFhGodcD
 nXgv0oGN1uOvBtf/O2fq7GOyPqYXxZYSoTZNub90S5Ymu1J6qoFm2slKf4vs+kfo8+6/oNxcsVW
 GD+osR2wogUPVN9377GNPJL1totw7Ea/jLHu2SBk0cMHDuxH1VC2OS76/3UXJZPMNbo7yZifp3D
 AGvVkqEYsHO96im35KCBMwtcXULqYiLfagYJxC3Lp4OW/+BRYzoNVhFFXBCD7Xh/ToHzEp0oHPr
 fTZd5LJJXNdZpdxQpDerrlLxcug6R1uU/EIg+BEVbJpKJIbfg7dTbEJsCe7It00wqCZQkWP2LDP
 29vwXynTsSDwmUboI3+Pb37NYbo78DlAfyaIMNIHojXjuxcgB4kM9JPnqflX4V68icD5Ow43t4M
 jSv/zXnHe5mZduHkxTYK6m+GwOniA6YoEVbnIZrLxdP0vGfGvDt8xy56tvWbLrrTO1KIHClYrbt
 EUy6aC3sQcOr5xgbrKg==
X-Proofpoint-ORIG-GUID: 5R79Zw4PLcPFq4az3MfeQpCmFvE5SCR8
X-Proofpoint-GUID: 5R79Zw4PLcPFq4az3MfeQpCmFvE5SCR8
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a689f7d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=wDio1FLaKedB3uI5tWxtsQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5FGsjyyMLv1_ifA18zAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfXx2wySOCCUnmc
 sRrlO72vNgCDz6U5+7wHCX63ti6EjhDGH6NCilBua4GuI6pTVXlepTZOIcBKoBr/swjXw/X95ou
 d06A/rn5O+2DTCybZf4glr3F1ChZHvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_052431_128626_1EB7003D 
X-CRM114-Status: GOOD (  14.22  )
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


On 26-07-2026 21:41, Jeff Johnson wrote:
> On 7/23/2026 5:54 AM, Pardeep Kaur wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
>> index b203513d63cc..33c4c89eefb5 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
>> @@ -651,7 +651,10 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
>>   			dev_kfree_skb_any(msdu);
>>   			continue;
>>   		}
>> -
>> +		if (likely(ring_id < DP_REO_DST_RING_MAX))
>> +			partner_dp->device_stats.sent_to_stack[ring_id]++;
> My review agent had the following finding which I did not try to validate:
>
> sent_to_stack[] is incremented on partner_dp but reo_rx[] is on dp — this
> splits correlated stats across two devices' debugfs files in MLO
>
> In a 2-device MLO group, ath12k_wifi7_dp_rx_process_received_packets()
> increments partner_dp->device_stats.sent_to_stack[ring_id] (the msdu's
> originating device), while ath12k_wifi7_dp_rx_process() increments
> dp->device_stats.reo_rx[ring_id][device_id] (the ring owner).
>
> Reading /sys/kernel/debug/.../device0/device_dp_stats shows reo_rx[ring0]=N
> but sent_to_stack[ring0]=0; device1's file shows the reverse. The two counters
> meant to track the same traffic path cannot be compared from a single file.
will handle this with adding the device_id and ring id
>
>
>> +		else
>> +			WARN_ON_ONCE(1);
>>   		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
>>   	}
>>   

