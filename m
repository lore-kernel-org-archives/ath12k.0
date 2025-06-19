Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695DFC7115B
	for <ath12k@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZePDO/8sG0YdU3YHcFxnAOlHbTMITMJ/juxHwf5oqs=; b=IKtdKOGp44zmN9k/g6naXqeun/
	E9VEIc4qxQi/eETi6FW67xg/aI814tc9fFCYjgVwGfs99AurfCCzkpiDl9Wxj2uIFapReoD84nNM+
	ueOfJ8PZsYfMhIevdbUJ/UAifQR2gXWFyy5GL8PkzTsZiqxxukAEqqqS+H22Wa9q61wSGgPtOgrvN
	UXgBbn720ZlK10QbWpSbF9NkXwTWC8RgH8L2MFWZHi7jqPpbM2XqhkWh5v4QrWtsBuZm2I7AG2ako
	JSdQ6MlboUfhap+af2sz5ZbTX5fsHygPlztf4H9RIxvNCLPxm92W9uR12FUvvVRE0mPa1i5WK2OMf
	8Crkcb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7U-0000000DtSx-0WIX;
	Thu, 19 Jun 2025 18:36:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGzm-0000000DNu9-0OhH
	for ath12k@lists.infradead.org;
	Thu, 19 Jun 2025 15:16:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JCDNsI005635
	for <ath12k@lists.infradead.org>; Thu, 19 Jun 2025 15:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZePDO/8sG0YdU3YHcFxnAOlHbTMITMJ/juxHwf5oqs=; b=IjdoxiO3Sdncsz3Z
	3a7hbS5ySM5j8pHpzwCcWiiJqnCwV2OlenCeS/Ixjvjk0IBAhESqWNVKRzlQTCyo
	DuXLT/ZIoayx4YF1/LFjqc4v8q8YzZuKSBEJkB6UP6nAKyS6TMd5mwzCisDyVpJB
	wv3nS1KtBfUZ/UwBW/JRzfirlX3CYCBwBskwXDy7B5EYmuX4k3YuZNXK8EzRcdQR
	VbPWpmM1HuLahoOkBrLURlFq6+8VbXaDuCRjjj8iYT0Q+A75ETkRATho33Y+ciD8
	dfrTaC48GkdRoufenasDcmU1xkUo9Hrn95L3aLVQJ2LVGbLqiwCNUkCNX0QtmW/f
	pBidMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvkkht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Jun 2025 15:16:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31c8104e84so642321a12.0
        for <ath12k@lists.infradead.org>; Thu, 19 Jun 2025 08:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346162; x=1750950962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZePDO/8sG0YdU3YHcFxnAOlHbTMITMJ/juxHwf5oqs=;
        b=FVFmgKPEY/T4IBogqepDlB7qybKDNAt/pMl9ViYWOY7c/wwMsrOaxuUsHOikksNsII
         Tg7ozPsFNsKNu8YqeWCEGjJ+/6Ftkk37CRPKOaX4cDAcx4xUxHwo6IvTnYKV2cXoHzN1
         VX+Vi6pHz+t1Ho0oDO/JIciumuY41RfYYFAvG12YSro4StaITk28xNkMnKO7x7oSz7SO
         KwjUXA9CT9lcJ8FckhB3dQtdAWautgbW+YkFExUR8O5Rso+djh6LuL5zCWse9LcS4lXs
         XGo/MMYd4IoFMqLvZLlu5Zo0h5xdhFfgoWQeTa2frugV8BPglsJbO8TrFdNu+80yHyN1
         DE+A==
X-Forwarded-Encrypted: i=1; AJvYcCWnMkpbX64G1VyVyYlgD2KAnkH4/YNVUj/Z+gLoCUVoHCzhkF/bpn+nfXdbkHRwF+SdzK2DhJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYn2pMIcpNf4+Ja90ceIx0EruF+hvoWY4r5jxmx8hwHAAY94Ly
	3ylDTQDuUeA+tAjDzl+/W2C2Vp3Y0XDjT81mvSqTKfrh33UUL0vuWP+AdldhWstIDw3ea2mE36P
	owlhQNcLgyePpK1s2i772nAIzji4HmSPQQTdIAecz2zYWuZIa87qCNv0kJl291QZ9
X-Gm-Gg: ASbGncuZ6Ql1uFQZ2y1E7I2/XVW1lIRqewfDxuQXuiyErEDmLZGZuJ67rPt4ci4vy0f
	q2/GfIzLGX4qhMu8yvv24K45mOpBN4iZy6suFVvjfU5nvBC/uSKAf6ISgxUY7ereQGFuB5BG5XM
	BTDlMgjBgrZ2hvuj+GzGx5x7HKw/h+Gunp5zxQUiiKyRlwhKmsfnx29RtUgwOqB1jLz+uv8WHnW
	CjuHBxucXTPc8p0cD3tX0Ck55jtVrZ0YzxkMswNuTjR0KDy/WffGPItE01N9BigEHys1S+ATobU
	oey2pvZT4c0veHXQ8N40jX+Xb78CxE4m5Gvdlwc8uADvSZavuvrDOZDch7DuUYu+rahXkdw=
X-Received: by 2002:a05:6a20:1a87:b0:220:96:11f6 with SMTP id adf61e73a8af0-2200096124amr9755117637.37.1750346161992;
        Thu, 19 Jun 2025 08:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq9RjBSQThQ08iVcBCPQDNPqsFAVA47zGCGsJ+0Gyl2tT/bxkUTY09tXQ+bAqgPKlf6W6XlA==
X-Received: by 2002:a05:6a20:1a87:b0:220:96:11f6 with SMTP id adf61e73a8af0-2200096124amr9755075637.37.1750346161503;
        Thu, 19 Jun 2025 08:16:01 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.222.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626376sm104476b3a.85.2025.06.19.08.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:16:01 -0700 (PDT)
Message-ID: <a7626e7b-6308-c4d0-8d0a-0d80914841a0@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 20:45:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: handle regulatory hints during
 mac registration
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyNiBTYWx0ZWRfX7BgkSZUXbUwG
 +y58W878/UsLi65O3UvIiNXMVg9Cq3BUmJ/+ERYZwrvvmjentrfzWxx7fP/cnd+ZwqrWr9HpokY
 C2rB1uZwXJpwlxOkBs55/MBCJNpummfP/1nNysQZuBvX8OH3UwCHl4DzXKeGI0BQACTyeREJAyx
 dVvreEcvm4LJ8cvBozuYborWlXQyn0cB9RP/NGmCvGJsou8bVLe+8QuuashIPtcIByOrgPx4DHf
 03jk47QttUHsu/y1+raWfyaU84xKgZLhYTeDUdqxeAsobAH0sDcsW2DnN/rhJjpVObsLI74keJu
 24BUhJGIXTR16Phe0lxvC3B0gVcOAH7nk82FEKnc7LMy7CfF0+dRpJcMndX4zO8dnz9hXh0y9gx
 BdhWaS6TsRaGOT3cLfNWlarwxRhrBbuA/AmS3pvSE1b9TR7FpcuFgvNQIL7GCqRo/hdt8St3
X-Proofpoint-GUID: wV6RLlJc3ZGomjinLxHSFVPlXM9YPTgx
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=685429b3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=W/7+BeFhbfycsskxpRlngg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=oTJZ3fvRTWoEDzZ0YNoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: wV6RLlJc3ZGomjinLxHSFVPlXM9YPTgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_081606_258268_ABFD8CDA 
X-CRM114-Status: GOOD (  21.39  )
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



On 6/17/2025 9:05 AM, Aditya Kumar Singh wrote:
> If a regulatory notification is there in the system while the hardware is
> being registered, it attempts to set the new regulatory country. However,
> ath12k currently boots with a default country derived from the BDF. If this
> default country differs from the one provided in the notification, a race
> condition can occur while updating the regulatory information back to
> userspace. This potentially leads to driver having the incorrect regulatory
> applied.
> 
> For example, suppose the regulatory domain for France (FR) is already
> applied, and then the driver is loaded with a BDF that has the United
> States (US) country programmed. When the driver finishes loading, the
> regulatory domain shown in phyX still reflects the US regulatory settings.
> This is incorrect, as the driver had already received a notification for
> FR during hardware registration, but failed to process it properly due to
> the race condition.
> 
> The race condition exists during driver initialization and hardware
> registration:
> - On driver load, the firmware sends BDF-based country regulatory rules,
>    which are stored in default_regd via ath12k_reg_handle_chan_list().
> 
> - During hardware registration, a regulatory notification is triggered
>    through:
>      ath12k_mac_hw_register()
>        -> ieee80211_register_hw()
>          -> wiphy_register()
>            -> wiphy_regulatory_register()
>              -> reg_call_notifier()
> 
>    This sends a country code to the firmware, which responds with updated
>    regulatory rules.
> 
> - After registration, ath12k_mac_hw_register() calls ath12k_regd_update(),
>    which copies default_regd and passes it to the upper layers.
> 
> The race occurs between the firmware's response and the execution of
> ath12k_regd_update(). If the firmware's new rules are processed before the
> update call, the correct values are used. Otherwise, outdated boot-time
> country settings are exposed to userspace.
> 
> To resolve this issue, introduce a completion mechanism within the hardware
> group (ah). Trigger this completion whenever a regulatory change is
> requested from the firmware. Then, in ath12k_regd_update(), wait for the
> firmware to complete its regulatory processing before proceeding with the
> update.
> 
> This ensures that during driver load, the default country is processed
> first. However, before ath12k_regd_update() is called, the new regulatory
> notification will have already been received by the driver. As a result, it
> will wait for the firmware's regulatory processing to complete, and only
> the final, correct regulatory domain will be updated to userspace.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

