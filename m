Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE75C0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 21:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsBELOAzAmi91oOTDqCPwhUTrs/cBmvIh9U2AqPhsV4=; b=ZUO8y9bB1WHmze0ZbqNZm7tm1F
	cCalAVCLDefIbS4/UTDc4vxtxDGrYvuFY8OG0ax7cDzp+FREXBIBggFJhdfSgcfQr/FXwko5hMQoz
	mACyH7DxfJORUFyVitZ6fftLeAFUMMP8VoHRnT1xvmwGs7I5WIMYPNK4z1zxFdM8478xqy/oRULHh
	p2orGKAbC8U7/I9HlgwQ0Wb/F2t/2bUKXVy/IN5WVAoUbQ12P6JPd1y8eLrVc6xCQyVD6EwAoInyc
	71sTNQd7Geu/WYtYVE6j2kaDoZpjqMsX6itACKGlkIgYl4wsmE+J/FXVs4zcRUBYygqbjbDbl4J8Q
	ZjPpSV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyxf-0000000BVef-2nnd
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 21:54:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyjb-0000000BTz1-0hXZ
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 21:39:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDKwPf016179
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 21:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsBELOAzAmi91oOTDqCPwhUTrs/cBmvIh9U2AqPhsV4=; b=N8Yz4maYutS92ld4
	oiImLuhDQI+ZTUR0L7NHBMHW8Mk989Dq6TTp+NgYnSzu1Q63v8VpB3QCAMgwU14b
	GqiD23DPjG9QmjKmW3ilxeSIVyevRUCzDd9L5HaPFOxJ7UVagkdRAg30DV2C0d2F
	BuWD6GOurRuNIKSZQTxaHVSEsinqa8H67Zl6b3fF3L2u02VL3bGBzMC1bMQUxGKh
	bq9aiXj/Nrx+Rje7IUgCrXvIiB2+G4DnMoDZF5LW1bS/y7MkF7rpfx2flQLqUyD4
	4T4UcmL68Vu50OcH2etH1HBngcalPxb5tHLiWg9s4Rwnudc8idLosfVjvtjvZ6xS
	0+iH5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyau92s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 21:39:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21632eacb31so34289885ad.0
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 13:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738359568; x=1738964368;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsBELOAzAmi91oOTDqCPwhUTrs/cBmvIh9U2AqPhsV4=;
        b=ZaaRiBTki/TzJGcaFnwCyWbHbJm2G49fatZ6Ga9jR47qS84IarBbtSgDE/sDmeToxJ
         d48aBWI6kNifJiuNangTe/KV0bFKpMD5G/5I+5I1fbmNsZyosKahXESNc+gJcS+TKrHP
         qSuoghyxI5AMjbuE6r5rkFnFAuOZiVAYxHlegJqNpRHJwDEB5SV5bQmEHB6JzMeIWAeU
         rZzQzzRjgfuAEpl3XxYZGw1Ce+W/yccDz+s1Rg5eF4H8xwqhg+PHrW0HwXuHP8wCtgRo
         +LHA2lcsyZdmWhKVbIL45+mBvXW3gkOGW6K9zXreyZ6HBGFmFvudE5/F1U0QLxXfV8cf
         x1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPHev8gv24CX81ujqtPgXep/HXHYdN7E3s9ujixvhXkMusFSZTtT0W3wORtstj39ZLTMgXJTE=@lists.infradead.org
X-Gm-Message-State: AOJu0YztcyPJn31rA6LQzb3KUUz1deXZqCxvd/6ecFkHGw6PB3DZDVBE
	ZMehuI45BO93kZp/o53fsM1d89/vlVwIm890qpIcug/QUUER+v83IWoJHCUa9mB8KZQpkbQBLP/
	ZOJaP9Nz0uLPy7TlQ2s/tlZdESLOeb3bulq8Ttgh5W0PCMKsouDC1n9idIp19
X-Gm-Gg: ASbGnctP69w0U6BKi4jhoOlv1p9FUK7Yc9+/ODOYmny3euy7shkt3BcWHrg49sPqfzR
	7txAYrIysnX9pMTTasLemYL7rxugFd2WGcJd+yPz93oiF/T+mg1hFRNY4q7tYK+bhjHBHqQhmfX
	+28F0YSsmhXkgbFBuM9F/2Q1rwW2rZyhxDu/GtnvBxwYArM+sM6GNQg8fiR0R55iWzqkUyGinzV
	zJ3NjVW3QdVx3qx22ZgXIvWy9zBMaLil9B42+/LkQeLkKGjIIf0UWWZcB+ZZdio8lxZ/0JFx3sn
	59a6b0lIIxcPM0ErNu2DVj5gwXGHf3amHg+r6XgZCJKpMbHiPYDd3envUUXz+7/BHgUpB+Yslw=
	=
X-Received: by 2002:a05:6a21:4c11:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1ed7a5f8e53mr19300019637.17.1738359568559;
        Fri, 31 Jan 2025 13:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwpggz2ICAr8nYuwVwTHu1Ml+iC4KmwaetLS/6mEBQsZid9/Fn+yvA4EcSaeP0IQqDC6OlPQ==
X-Received: by 2002:a05:6a21:4c11:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1ed7a5f8e53mr19299992637.17.1738359568135;
        Fri, 31 Jan 2025 13:39:28 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cd801sm3759463b3a.123.2025.01.31.13.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 13:39:27 -0800 (PST)
Message-ID: <7d1ea897-6d8c-455d-a6ed-d8f0b52b6c1f@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:39:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: add support of station average signal
 strength
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org,
        Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org
References: <20250121093834.25132-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250121093834.25132-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E-JpzEkmNI5H0RvgiGoRwFLgUjDLFkdq
X-Proofpoint-ORIG-GUID: E-JpzEkmNI5H0RvgiGoRwFLgUjDLFkdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=978
 clxscore=1015 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_133931_357378_DF3DB95F 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On 1/21/2025 1:38 AM, Nicolas Escande wrote:
...
> @@ -10054,6 +10055,10 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	/* TODO: Use real NF instead of default one. */
>  	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +
> +	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi) +
> +		ATH12K_DEFAULT_NOISE_FLOOR;
> +	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
>  }

This conflicts with new logic that came from Lingbo Kong:
79e7b04b5388 ("wifi: ath12k: report station mode signal strength")

Can you please rebase?

/jeff


