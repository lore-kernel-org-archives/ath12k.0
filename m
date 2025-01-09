Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2ABE7719B
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d20jpSgXHWmcdbS+qzfK/jlD3QyrndY+rUzeWA8JT4Y=; b=vTdgwVly5yV8s0tY+O3ihfh8f+
	CGvYYqWUd4qJXFFeHOvS4B9OXSKwkp+kSUgE+aZUYhX27L61/fq0W42Y3cDVGrF7WlR1lNx3KN2rF
	v5rT2VAd16zHDG1lpqF4Q1GnCoiUJqbmOIeLEdB0K/hocYLU0LZH6JHnJwp1tUI+eWQ2y0aCC82xc
	/kqZJHN43b1gJnCYvZuiW/TzNfHvGKYD8aD0eWhTmCXPrVgtssHhSkfoquG7eE+Wi6reaDQ/TeXq4
	O+tcLqrokpIrRSQOR67E9Z44cKALa/DPz8r9/2MiO7TypM6CNXkx/bnzHbVHs5D80yVxTIthPQNNO
	ExUoWi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzlA-0000000DJrP-3k10
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 21:08:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzfd-0000000DJHw-25k5
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 21:02:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D7ik2009944
	for <ath12k@lists.infradead.org>; Thu, 9 Jan 2025 21:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d20jpSgXHWmcdbS+qzfK/jlD3QyrndY+rUzeWA8JT4Y=; b=Dbf7sMmqABThEAe0
	NN57cvoHdou+wIS64Aiy60u64MULu2qPbwfSJ/mjXe2aOwEEc4SXXdC/jp421VwX
	GWb0B6yMPXKyBwkE7lufkoKnG27TE81Ko3yfGf/srrLD3nd61zxDkw2l17BNrbwM
	HiF4JwDedj8BSHKueB2tCpI8cD7zMgiCuAiMR4OQYVd98wE4SKPIEi0IjzVJYQtH
	s2eXYrX0uZlEkHnC0qW6TEmkN7NoE131j7SV1ad7IqOsRJ+qZxFIR+yKKCbxfGxk
	s1st7c0byLExKkqzuHPWNV8cE1RVsSYUc0uGyrC9eMEOGsWPy2j97pEfLp4+i4yf
	Wo3L9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2ks2md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 21:02:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163dc0f5dbso24803915ad.2
        for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 13:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736456544; x=1737061344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d20jpSgXHWmcdbS+qzfK/jlD3QyrndY+rUzeWA8JT4Y=;
        b=oxtPRSZlt3ukVOPpVEcj02OACXHexS4+iZZ1Yq+Af37Bql4mn4qvSiMC6ft8lc0zEr
         +HtfutDF396sV4hJJxsTB6Rp6wxG/zZcy7FfWgHIHAhUatoN5BaFf91QwW3j1gozNxBz
         Zy60hqyUv+tww7TC3I/+CqmEetCrGIk63LaVFV8s2vxDei6lAFRXcoiu5e68HyPnrwG1
         bSVXwnT4WXJmjeeDiR5k/feUtIMk3P+6j6glN8Vo4vHLuHXoCQbSRLF4am6vOQnAe/he
         3sbCGeyYoXc/dNcJ95Rz7e6Ircq34ybhDBZ9p5V1kIvAAwPlKZHiNZDmGcGqhXXfMSTA
         gd1A==
X-Forwarded-Encrypted: i=1; AJvYcCXAhgUw1w7JB5akgwCwzmU2cGR0bVb6bEdBJMSWo4gnSHPwUaqr+cMM/nS3poJIO+kbDhzj/Mc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz51AUN7xHPxrwb1xD+orO+0iJCopn4iM31AzsiXvUH45B4pg42
	rIFjznZa6WnjCKSn3jsUofFsanscCJIpyV3G4LL854RnjfWd6nP7IEshariVCZ3AOeP9nTF2RO8
	TxynlsAB/0zLLDzFEMmJFEzHYpXCo0QtqjJRhsaeGY9msiW7Ct6nDE0ku3Gk0
X-Gm-Gg: ASbGncvwMWATa+H2CVo3mZGhkKjT1mUd9prOq7EM/r6kfnfH5YtKm2RWu/E7lSi2WQO
	M5YHpho41BFfnSUxY2RPSzjkb8bawuYEmfa+a36n984p5Pw9FUHikJCYGBzV238Q/TNp3i/4uyO
	I5voi0N6DDQsqXztuW7PDNIVUKnYQYsPpe4aYRhABrosdJryMJMq/hhpeCAv2+f24AWK9bdt9ST
	WOrsJuMJoKx7Ea0GdXUZ0pjoEqedFW7M+rk+SjpkaOshsIEY15LDUlaBW/yfaE38m9epj6RE24Y
	clDtwFh0ibo89mo72oJwBAN6bdHUaTweXgi/
X-Received: by 2002:a17:902:ce06:b0:216:5561:70d7 with SMTP id d9443c01a7336-21a83fe48c0mr130229065ad.52.1736456543882;
        Thu, 09 Jan 2025 13:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCNbfdNwzmPtgj/WGPz7kYYib0KE+MlhdotcoB7K49Gub/ExHLgm5LfFv/xccluXnL2jgA/w==
X-Received: by 2002:a17:902:ce06:b0:216:5561:70d7 with SMTP id d9443c01a7336-21a83fe48c0mr130228695ad.52.1736456543484;
        Thu, 09 Jan 2025 13:02:23 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25c927sm2083345ad.228.2025.01.09.13.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 13:02:23 -0800 (PST)
Message-ID: <b625bfc7-0229-4dad-9059-a71506a70a6a@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 13:02:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] wifi: ath12k: Factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4OZvk_evlTmfXEXakK0gqvmTUG34wFeu
X-Proofpoint-ORIG-GUID: 4OZvk_evlTmfXEXakK0gqvmTUG34wFeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_130225_544716_A8343954 
X-CRM114-Status: GOOD (  14.34  )
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

On 1/9/2025 10:35 AM, Aaradhana Sahu wrote:
> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
> 
> Also added changes related to correct pdev id access for
> fw test cmd.
> 
> Aaradhana Sahu (5):
>   wifi: ath: create common testmode_i.h file for ath drivers
>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>   wifi: ath12k: add factory test mode support
>   wifi: ath12k: Fill pdev id for fw test cmd
>   wifi: ath12k: Disable MLO in Factory Test Mode
> 
> ---
> v6:
>   -Rebased on ToT
>   -Updated copyright
>   -Added patch[5/5]
> v5:
>   -Updated copyright
>   -Fixed line length within 90 char
> v4:
>   -Rebased on latest ToT
> v3:
>   -Rebased on latest ToT
>   -Updated Tested-on Tag
>   -Removed second parameter of ath12k_core_start()
>   -Updated copyright
> v2:
>   -Rebased on latest ath ToT
> ---
> 
>  drivers/net/wireless/ath/ath11k/testmode.c    |  80 ++--
>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>  drivers/net/wireless/ath/ath12k/core.c        |  29 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  13 +-
>  drivers/net/wireless/ath/ath12k/debug.h       |   3 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |   5 +-
>  drivers/net/wireless/ath/ath12k/mac.c         |  17 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
>  drivers/net/wireless/ath/ath12k/qmi.c         |   4 +-
>  drivers/net/wireless/ath/ath12k/testmode.c    | 395 ++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>  drivers/net/wireless/ath/ath12k/wmi.c         |  41 +-
>  drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
>  drivers/net/wireless/ath/ath12k/wow.c         |   3 +-
>  .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>  15 files changed, 621 insertions(+), 90 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
> 
> base-commit: dbe50a7420e22954c747e79e72df2750d795ea77

I just had nit comments. Kalle, can you re-review?

If there are no major comments, I can incorporate my comments when I pull this
into the 'pending' branch.

/jeff

