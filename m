Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABF6CD342F
	for <ath12k@archiver.kernel.org>; Fri,  8 May 2026 06:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFBuui+wGCwe3wsLc6JIAOYifQN8Kjh7VqLeN4nLlPc=; b=qw6MQaq+OTAQifkHcu3r3hqrM1
	582lZOUXahcmhry5M4MY5PeOxTxWpvT/a06hSjM8nQztyVpMe9ybjyxQj2WkE/g2Q5emP2W88ykUK
	L2xPVQy/pjrlhyc7qYgzegvTUT5gBvUnGfb+xrz0l6WAR9MIfgFWaQbbXoIE4OFKOFmTEfzHnjMWJ
	vftC6WWsQYtQz99uzYtZoACwhZSIJQ2woFGiRRSE5Cvxj0nDPiGfYrOcIXVH8hateSURdibywb/uX
	dRhZbzqGsbiFlsJUAju0b7n95yALsVI4v+flhuuEGDiIBFk6Nou6tMOTDSMkAsGcmO06gGxkvaMCV
	KT3eFBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLETD-00000005hvZ-0JNJ;
	Fri, 08 May 2026 06:13:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLETA-00000005hv0-1rVd
	for ath12k@lists.infradead.org;
	Fri, 08 May 2026 06:13:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64859HEG2531395
	for <ath12k@lists.infradead.org>; Fri, 8 May 2026 06:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFBuui+wGCwe3wsLc6JIAOYifQN8Kjh7VqLeN4nLlPc=; b=BRPvAEkSE0HdboLr
	tar18Loxy6uWSOgI1M/OidFVpKR6wGoRgOWRBf+mU/qKPdPz2sDnTUfp1UEC/BoG
	n1AzFojOIv2SbVEAQFG12vpe+kIh+V9h81FHxvwjUm1AZmDKyZ9lU1UMa6xMIkmd
	Zeg6ZA1GB7rmqKnGV6EVOKw4pns2lpB55fIrCujIl+sBTHKlVT0L2nfoD/eGF9PG
	swaY1zzr39zJqqLMRX53TjHZJEsPZxU6MXbM6oGc7ViO755lQWea+wZxRCa7jaPV
	LcLaa6kGLbhhpH7wwi2i4pmu6pR32wWd9j/bLRuNugvukqlN6H4mX49D+GXJ0tAV
	Rhugyg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9sy1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 08 May 2026 06:13:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c797efdaa9cso867416a12.3
        for <ath12k@lists.infradead.org>; Thu, 07 May 2026 23:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778220831; x=1778825631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFBuui+wGCwe3wsLc6JIAOYifQN8Kjh7VqLeN4nLlPc=;
        b=azTxBPosvKG+BZ+p2IK5cJhl9TnE4FMViTcrmHyQiilSAwygFLOzdGHES9cWOS8yD4
         o85F23l7dUBbtuAGjXXS6GaAmN4M+o9vJReuREKqec3FTawsckGMczShCAPxuZEKgyKZ
         3Gc/mNDdaxssYzt9qgLOH0ynJIxdH8RY9dQAPdnvzkGM+LhtURau7O75dc4qvfh/eJHp
         o3WX+pig8jlV0XMBkd9zMHXqCEf5Nth79jT9GOCo6e52I6SYGx3ujrmhUo9R8zMZ7tiV
         LxwYgHNXhKvezdiqwsvyUn4oUJUbeuYN0yJfYylukaY/+S3O+u80L1z3qjHrAh1m9dCT
         Ofag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778220831; x=1778825631;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFBuui+wGCwe3wsLc6JIAOYifQN8Kjh7VqLeN4nLlPc=;
        b=CgAOb9OGmxy/EKJeaKSGg4Q53eWCPDl6N+77IBBiJXAo4SRUo45jP61ZpxlBP3tgYP
         hcUwVbjKu8I8gh+9j2fV9GM5tUwZT4aERflmDryxsgwlJruKe+RDRJ3NY/hZWWEJLYFP
         c07Sf6YhBXfH45rjOWSl05qh+sGFn760rj/tTOfHaYjrTm0ddvG0U5zHwXU4ytPeMK9U
         Z3q3cCtlBhZuhcAL+mPOk5/LrVpbcTNBr3vaoFP+ZMrhY6+hjtgZ3jowlpOZUMYLjxHW
         N63mdRdLrt2NlCnVRB9Vj4ZDgLtIxHg5UBLcLgWh1j/4szCR96Y3diLMWVJmrtV6IYgI
         O8DA==
X-Forwarded-Encrypted: i=1; AFNElJ/neata7lP6jPOnAa8aE3BQ54dBZyjeqzHJm+1ukf0evX58gpjCUAQF4AyGZL+fTqmHDDbjuJE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLY1DVUZxFKGKq9jGrwNJxm0vV5oVIlUR/ZLyvDqBOj6wZmaUl
	SKgt2ZkN9EBCscLa5ZqNA3EB/G9OT8W/nGatKzuxSHc8wr1Rz19nm4HlZMzFEbWahTIpaB5ufAn
	1qbxKxtt3TwJ4h8txsIVOR54HYpBR15VTZLBcapWFwDcMtJ7OiwUI2fqfwpUxFFlB
X-Gm-Gg: AeBDievjtJz2cnHqKLJSSV+4Tkwx+Is8h54epWDHCJYsfTPbKMmbPxnF26jLTEQ/f2y
	HTOgjvZFopXyeJfuFlY2LDCt8wWYhZ4sYfncW/7yfBQyUdq/46oplHm8+zWsxW3BNSmNYy3YGjD
	+V6JF44VAen6TB5NjkaWaf+pekz14guaFYmGTc+nb8MsFBxpa1T0uB08+wuDhakN9PcknrOMUqH
	MKIhCHgTo37cQ2zx+5nXH/qBIz75FQ4TjgzdtFhQg9sAkPpaqMgAMBTxYM88dyGv3/FQv/6doYA
	RfPnkTlmhDBOcJLFAXz3ZP4GAUzJrKVjcb+Ik0Dc4/t8+TbcYcKTLZY5DnpHwqlh+JEFklVxVSH
	sAJu5XT7TxTDje3MOSR7KVVShq+2ekQEx4eeeXa2R6ZHiuM9zj4cn+neT7xCJAg==
X-Received: by 2002:a05:6a00:10d2:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-83a5e23c9abmr10450486b3a.35.1778220830498;
        Thu, 07 May 2026 23:13:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d2:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-83a5e23c9abmr10450457b3a.35.1778220829939;
        Thu, 07 May 2026 23:13:49 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm14718219b3a.49.2026.05.07.23.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 23:13:49 -0700 (PDT)
Message-ID: <6ebbe7ef-b867-4d5f-838c-7f6224e38891@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:43:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Add support for handling
 incumbent signal interference in 6 GHz
To: Amith A <amith.a@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aishwarya R
 <aishwarya.r@oss.qualcomm.com>,
        Hari Chandrakanthan <quic_haric@quicinc.com>
References: <20260505143853.295368-1-amith.a@oss.qualcomm.com>
 <20260505143853.295368-2-amith.a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505143853.295368-2-amith.a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tgFLMOBSGJ9eas8x8DOprZgg6VpLrQo0
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd7f1f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=IYzlEOER3vfPUB5pnoYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1OSBTYWx0ZWRfX8Gep6yFJ1y63
 9Im40u5Y+o6Mge/s6zW215m7o/HK+31c4+XaRdCIyJo3JgM5O9nFJq02a5wilhaCFIXSFDphS4V
 9+h9EulR3r0tGszONKaUxpoj+ckIrwdjsBlIs4qK51Phk/WcXAw7EZggQZOeqNBABiFwcaE6Qzt
 kxgHdsYCyI4GUhd17kLNE14MC87911IEU6kQemMeSTqw+avqzQU34zDjg9Qxd3pcGj/zjVlQMjk
 1rxu3Agwa/ZFYg91rXjsvF0aBGhyCF+tfCPE269narTQR5Zvyyw2W+uE5+gr1RrQ0IBKqCI0n15
 DdtWpswUERUaeQDj41BUYN0djqnR+ph1tnuo+wjOzZI/clNLVL9O0PB/lFpEp7UZNXX/o3Ryt0l
 og/XT4zJjh5oayq8RORdP/JC38VR45UK8eB2fAHiwFl6Zf+kf+WBa3J0pTqAuk7oZ9mWgkHqvuV
 TVQFo9AcAxyBMkfBu/w==
X-Proofpoint-ORIG-GUID: tgFLMOBSGJ9eas8x8DOprZgg6VpLrQo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_231352_513734_416CBD8D 
X-CRM114-Status: GOOD (  25.50  )
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

On 5/5/2026 8:08 PM, Amith A wrote:
> From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> 
> When incumbent signal interference is detected by an AP/mesh interface
> operating in the 6 GHz band, as mandated by the FCC, it is expected to
> vacate the affected channels. The firmware indicates the interference to
> the host using the WMI_DCS_INTERFERENCE_EVENT.
> 
> To handle the new WMI event, first parse it to retrieve the interference
> information. Next, validate the interference-detected channel and
> the interference bitmap. The interference bitmap received from the
> firmware uses a mapping where bit 0 corresponds to the primary
> 20 MHz segment, regardless of its position within the operating
> bandwidth. Bit 1 represents the next adjacent 20 MHz segment, bit 2
> the lower 20 MHz segment of the adjacent 40 MHz segment, and so
> on, progressing sequentially across the bandwidth. However, for userspace
> consumption via mac80211, this bitmap must be transformed into a
> standardized format such that each bit position directly maps to the
> corresponding sub-channel index within the operating bandwidth.
> Finally, indicate the transformed interference bitmap to mac80211, which
> then notifies userspace of the interference. Once the incumbent signal
> interference is detected, firmware suspends TX internally on the affected
> operating channel while userspace decides the mitigation action. Userspace
> is expected to trigger a channel switch or bandwidth reduction to mitigate
> the interference. Also, add a flag handling_in_progress to indicate that
> handling of interference is in progress. Set it to true after
> indicating to mac80211 about the interference. Reset the flag to false
> after the operating channel is switched by userspace. This prevents
> processing any further interference events when there is already a
> previous event being handled. Hence, further events are processed only
> after a channel switch request is received from userspace for the
> previous event.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> Co-developed-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Amith A <amith.a@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h |   8 +
>   drivers/net/wireless/ath/ath12k/mac.c  |  46 +++
>   drivers/net/wireless/ath/ath12k/wmi.c  | 382 +++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h  |  58 +++-
>   4 files changed, 493 insertions(+), 1 deletion(-)
> 

{ ... }


> +static int
> +ath12k_wmi_incumbent_signal_interference_subtlv_parser(struct ath12k_base *ab,
> +						       u16 tag, u16 len,
> +						       const void *ptr,
> +						       void *data)
> +{
> +	const struct ath12k_wmi_incumbent_signal_interference_params *info;
> +	struct ath12k_wmi_incumbent_signal_interference_arg *arg = data;
> +
> +	switch (tag) {
> +	case WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE:
> +		info = ptr;
> +

should we validate len before accessing info ? or may be add an entry 
for WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE in 
ath12k_wmi_tlv_policies so that ath12k_wmi_tlv_iter() can take care of 
the validation.

> +		arg->chan_width = le32_to_cpu(info->chan_width);
> +		arg->chan_freq = le32_to_cpu(info->chan_freq);
> +		arg->center_freq0 = le32_to_cpu(info->center_freq0);
> +		arg->center_freq1 = le32_to_cpu(info->center_freq1);
> +		arg->chan_bw_interference_bitmap =
> +			le32_to_cpu(info->chan_bw_interference_bitmap);
> +
> +		ath12k_dbg(ab, ATH12K_DBG_WMI,
> +			   "incumbent signal interference chan width %u freq %u center_freq0 %u center_freq1 %u bitmap 0x%x\n",
> +			   arg->chan_width, arg->chan_freq,
> +			   arg->center_freq0, arg->center_freq1,
> +			   arg->chan_bw_interference_bitmap);
> +		break;
> +	default:
> +		ath12k_warn(ab, "Received invalid tag 0x%x for WMI DCS interference in subtlvs\n",
> +			    tag);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

--
Ramesh

