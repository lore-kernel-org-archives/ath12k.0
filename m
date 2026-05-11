Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7240ECD3427
	for <ath12k@archiver.kernel.org>; Mon, 11 May 2026 03:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbKzUHT/58wGHmoxf6T9tOqHYXHEYsbOKeCSqodQo4o=; b=4APanaRrYF5mLBrluMI/HlK+wm
	3MfOkgzeRqfL5HNejdNTseZnTYEjOAwLwF032qT+Dth2zYYu5N/a9CWD+q68a442UoYbe7XfnEqWw
	z2xj8QBCIoPMparNKspEEPxGv5BWPGk6BPU94xJtlJqwF9HvZ1lfq5/HNXcu4sqeJpwZhLIgWWAKX
	l98BH6dMq3BKLYqBQiy6O0XROzDhNeKm1LJtuqEnRci4N4YrDWdorwdJiUKvTTHd+J5VcDbdvsify
	Pb2fJWlo48PZFUQev3xfTAV57UrcpaeJhoM4/KRO8jw56QXueY5DX5SiFw3jba9q0bOHw1r5ErOS3
	/TWMQHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHfz-0000000CCzO-0BX3;
	Mon, 11 May 2026 03:51:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHfx-0000000CCz3-10fY
	for ath12k@bombadil.infradead.org;
	Mon, 11 May 2026 03:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pbKzUHT/58wGHmoxf6T9tOqHYXHEYsbOKeCSqodQo4o=; b=Vcy55dnamO94UDrzH2Vf/YSacE
	bLYJOYl5xkCrqah5ll2ji2m1Kt8/H9ezrxGqcHtZM3rAKWjnevrU6PmShr+YjRyI/OfOslNikyQNJ
	xRE+sKXDsP+00ovyrPT+gXYul9eLt4Sjf6aE0c2rC5DVez6JqT/56yP70i1AViyeOX8txsaRdXDQW
	QFW/YU6JK1wxjR7sK2i93MoAOnDOiewdVOr4NSjOthrctPTnM72l9D9PlCKuA4aIwkVziN1Rx9HtP
	9JiRRYDpeCZLXFjX5xmCcCfjxLjKPEXZId+RBxgMkNMMTx/yH+MTZt/V93s5sSTyqS/L84rKqGF1v
	iCcarv/Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHft-0000000AZjY-2jUI
	for ath12k@lists.infradead.org;
	Mon, 11 May 2026 03:51:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B2b0l8886234
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 03:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbKzUHT/58wGHmoxf6T9tOqHYXHEYsbOKeCSqodQo4o=; b=QNCf7MYPWX02Xp9O
	JQudjx+gijv3kGM0dWQHAMh+UG6v7K0rVqkngM8DwyMRklihzq/28WPuZXQVCocf
	ZP1wAH8AyWsUq3d4r3LB2bfPaptMQ/i3F/jxwEooElamTonPeFdWPpmDd9pvHr57
	y2jEn7gAzP+hrp6RGyw11AOs6DB0HGtLQAvhdbPAtdnayXlAW7E6JfLJmUXw6I6M
	AXcRS6gIoeT5cHP8dMH8n7Kh4g2n++dJh7HjiGJSzRxAtxfThYFl/5SOju0C2VCI
	e8FbQHyfonh8RdFncplA9IQXCHTxHaxO8WgfwzGgkr5JFtNiHrbxywT5kEl3Tu+A
	8u+mmA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q4jnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 03:51:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so4648424b3a.0
        for <ath12k@lists.infradead.org>; Sun, 10 May 2026 20:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778471477; x=1779076277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pbKzUHT/58wGHmoxf6T9tOqHYXHEYsbOKeCSqodQo4o=;
        b=P0EjlLjKbLy70EMIkCmYm7iFvh/Mx62RKUGn02vz613DnFn8H/bfFN2myTdj8BTkMF
         /T+WeD6laNoZL1ACHpcaNVi5rdfNGjTIReAix2M6mbLV7OSif+gl0Mp82NUWCpD+HKWk
         D7v5fzjQsxPFfYug0KiS2CJVIFA+bChmoc0x0UfKQAPnFyQU0Jus8Nrpo2OZ9H6QOlgc
         /yFmLVDYEC7v6TRfgINrvgNJxdmid2SagcSORx1tP0UcslLyf9/VA5VfvFvurMhDr6PS
         fqh5mNKxVO9NVFaMLTaAFFrc5vwukKhYfk/FsnUvFncRn2Fbl9ax8nbJQZB7kbHNR981
         EUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778471477; x=1779076277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbKzUHT/58wGHmoxf6T9tOqHYXHEYsbOKeCSqodQo4o=;
        b=MjfSjnri9lAV/9DFxEXCBb13ij0rc1Q3qxiyLpoduF0m6sku5xzNgCu/S/VguR+rVl
         zku9bG9XmkFH3yh/6+42CjDYv5MEGRerTKpc+TMsMXFuBDssFzivKo6E++ATAz+EUmYG
         XTq8NCwLh3kPyi+35N8fZtq73ZzbZYfmXck0vBdKfhUlRiGfBSWumXafqrj+wM1YJtaX
         DAe09ML8M3vI2yp2gcohcIXwX017ICVZFFKOUcohWreZLzIgOaNZf3GdFE1+ZPsORxZm
         981joY8Mkdra3/p8v3VzMzl1AHqXUSgrKxV9HNCzIV3T4dLwPdwF/Xvdank3bR3z0e0s
         sGdw==
X-Forwarded-Encrypted: i=1; AFNElJ+Uy7LlLm0iy4ah3JPCQWXlAwPqOC7utrp5BbBTMm+TOzk16ulwQILA3J8Ow1axxKGBh2VhCGw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNtHoD3ew84xf7unUjjSl5OoixKL2SJZbF6/UIMRvJAGeWNDZb
	h5wmMI4sgHXs14rFXUJaHeAlmG8FUy8H3VEp8HHOf9lespfSwDd7CwtSmWpDdcU4heNxrX8uAgT
	zDqTkqgbwU5WisWdn7i6JySTeTDyng7BIsioEjT+SIV/MaPXL9D5qUFDjWYPhvRIR
X-Gm-Gg: Acq92OF2QDjQIwqiTQG/o7iFMjnSMmOztE9F8UisHhWERP3l/n3c0JqQxdfKd5AxXzQ
	8MQn5J8NMBTQoP4vEZhy/9QsSG7PHykjqU4zT86XpS+Bpyw4nFg2jdT/qAe2MZJlDAs8R1DerJR
	qc6zHg2RZAM1S/IiP6tMJmnc3+u4v2IOla12smxt2VhyGske7d3W4cJ+LGFYaRQOzFg3lL0louT
	/1i4/6fMKWsG3OL5YqyHgWlcGWWbM5MyCW0HPV2rbA+5G6ddeojcn/jmWoSMPZKlOQRB8sZuUbu
	GFMjhTpkBWwI2nFt95j2i9IPRK6u9rggtZOODn2sRe7s7nxLLL8YnpAWcZY2offvdj9BaJ+hnwj
	/yKdbgGA7RsaOB0S6IMh4LT18TN+lCdnUPzHXpUEy2N30e/6RtCvy84LuDaMbGYg6lXBUJvpK9z
	FJNHS/qvFhgwW+oV8xu9o7pVVODxr0Hyk=
X-Received: by 2002:a05:6a00:4219:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-83bb85919abmr15930622b3a.21.1778471476735;
        Sun, 10 May 2026 20:51:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:4219:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-83bb85919abmr15930582b3a.21.1778471476209;
        Sun, 10 May 2026 20:51:16 -0700 (PDT)
Received: from [10.79.193.74] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a088fsm18614780b3a.58.2026.05.10.20.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 20:51:15 -0700 (PDT)
Message-ID: <60d67218-aaf4-4639-b5e9-973e6b63bac0@oss.qualcomm.com>
Date: Mon, 11 May 2026 09:21:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Add support for handling
 incumbent signal interference in 6 GHz
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aishwarya R
 <aishwarya.r@oss.qualcomm.com>,
        Hari Chandrakanthan <quic_haric@quicinc.com>
References: <20260505143853.295368-1-amith.a@oss.qualcomm.com>
 <20260505143853.295368-2-amith.a@oss.qualcomm.com>
 <6ebbe7ef-b867-4d5f-838c-7f6224e38891@oss.qualcomm.com>
Content-Language: en-US
From: Amith A <amith.a@oss.qualcomm.com>
In-Reply-To: <6ebbe7ef-b867-4d5f-838c-7f6224e38891@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IIoG9X-6nA-eT4yqIpLvBRN0MVR2diCd
X-Proofpoint-ORIG-GUID: IIoG9X-6nA-eT4yqIpLvBRN0MVR2diCd
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=6a015235 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=-JVo_sVfTxQHn8smsngA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAzOCBTYWx0ZWRfX+B2/v6BQhvUa
 xS4dOrdst7sIZDOnRrfc4pPieno/2BNf65PekF6dSHKN66Y1Ixnmxj5zoaL0VNxVla6X6ZICQC1
 kc1hZh8+gOkNgIfxZ9P8nFxf8hsUH9ps6hrZeoWRdsqnwqgtvVkYL6XEnWwT3hJ+f6CCR0rdDx5
 o+VCcLX3u0//sxFvbYRPypW6jEXqAncUlSNeKaCOAjcSRJyQbBUuyX5VBCPBzVgj8ncSIoCKWt/
 ZcRPJMFGqaF/JXQjF+/PN+gdY8VoIXAsLMUv6b7OWv39ASq0+GVQsPDCp9NBbctt3gu08mWoBUq
 CK0TnI7S8D17iTBM3dyxttzKmlZbmy6po8SViuhrUbEaxMSQknk5G0b2Haj4MGFgcS6OdUfGJYX
 +HymbaXmck8fWnPKbn72Pl++F9Gc5extafr63qjc/3Ug68hpUGUI1FjBrhgRFsqqOyVmH7jl3fz
 ha+BtgvWeKOoMIgYFXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_045122_279687_64A3F1A9 
X-CRM114-Status: GOOD (  24.09  )
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



On 5/8/2026 11:43 AM, Rameshkumar Sundaram wrote:
> On 5/5/2026 8:08 PM, Amith A wrote:
>> From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
>>
>> When incumbent signal interference is detected by an AP/mesh interface
>> operating in the 6 GHz band, as mandated by the FCC, it is expected to
>> vacate the affected channels. The firmware indicates the interference to
>> the host using the WMI_DCS_INTERFERENCE_EVENT.
>>
>> To handle the new WMI event, first parse it to retrieve the interference
>> information. Next, validate the interference-detected channel and
>> the interference bitmap. The interference bitmap received from the
>> firmware uses a mapping where bit 0 corresponds to the primary
>> 20 MHz segment, regardless of its position within the operating
>> bandwidth. Bit 1 represents the next adjacent 20 MHz segment, bit 2
>> the lower 20 MHz segment of the adjacent 40 MHz segment, and so
>> on, progressing sequentially across the bandwidth. However, for
>> userspace
>> consumption via mac80211, this bitmap must be transformed into a
>> standardized format such that each bit position directly maps to the
>> corresponding sub-channel index within the operating bandwidth.
>> Finally, indicate the transformed interference bitmap to mac80211, which
>> then notifies userspace of the interference. Once the incumbent signal
>> interference is detected, firmware suspends TX internally on the
>> affected
>> operating channel while userspace decides the mitigation action.
>> Userspace
>> is expected to trigger a channel switch or bandwidth reduction to
>> mitigate
>> the interference. Also, add a flag handling_in_progress to indicate that
>> handling of interference is in progress. Set it to true after
>> indicating to mac80211 about the interference. Reset the flag to false
>> after the operating channel is switched by userspace. This prevents
>> processing any further interference events when there is already a
>> previous event being handled. Hence, further events are processed only
>> after a channel switch request is received from userspace for the
>> previous event.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
>> Co-developed-by: Hari Chandrakanthan <quic_haric@quicinc.com>
>> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
>> Signed-off-by: Amith A <amith.a@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.h |   8 +
>>   drivers/net/wireless/ath/ath12k/mac.c  |  46 +++
>>   drivers/net/wireless/ath/ath12k/wmi.c  | 382 +++++++++++++++++++++++++
>>   drivers/net/wireless/ath/ath12k/wmi.h  |  58 +++-
>>   4 files changed, 493 insertions(+), 1 deletion(-)
>>
>
> { ... }
>
>
>> +static int
>> +ath12k_wmi_incumbent_signal_interference_subtlv_parser(struct
>> ath12k_base *ab,
>> +                               u16 tag, u16 len,
>> +                               const void *ptr,
>> +                               void *data)
>> +{
>> +    const struct ath12k_wmi_incumbent_signal_interference_params *info;
>> +    struct ath12k_wmi_incumbent_signal_interference_arg *arg = data;
>> +
>> +    switch (tag) {
>> +    case WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE:
>> +        info = ptr;
>> +
>
> should we validate len before accessing info ? or may be add an entry
> for WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE in
> ath12k_wmi_tlv_policies so that ath12k_wmi_tlv_iter() can take care of
> the validation.
Will add an explicit len < sizeof(*info) check in the parser before
accessing info.
>
>> +        arg->chan_width = le32_to_cpu(info->chan_width);
>> +        arg->chan_freq = le32_to_cpu(info->chan_freq);
>> +        arg->center_freq0 = le32_to_cpu(info->center_freq0);
>> +        arg->center_freq1 = le32_to_cpu(info->center_freq1);
>> +        arg->chan_bw_interference_bitmap =
>> +            le32_to_cpu(info->chan_bw_interference_bitmap);
>> +
>> +        ath12k_dbg(ab, ATH12K_DBG_WMI,
>> +               "incumbent signal interference chan width %u freq %u
>> center_freq0 %u center_freq1 %u bitmap 0x%x\n",
>> +               arg->chan_width, arg->chan_freq,
>> +               arg->center_freq0, arg->center_freq1,
>> +               arg->chan_bw_interference_bitmap);
>> +        break;
>> +    default:
>> +        ath12k_warn(ab, "Received invalid tag 0x%x for WMI DCS
>> interference in subtlvs\n",
>> +                tag);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>
> -- 
> Ramesh


