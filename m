Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2B6C28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37YSkgzf76vapHfjEFdF6GlVCevcX9xaV9hoD7LO3j8=; b=GRFWGDMA6koE1wk4jEIdo9OCJx
	o8Ls7MXM9NtNcgIPActLH4tC7dCrB6Jprq5Y7TPH7OLZLVk0c8ImhmNdcnfHWOQ6BnkaBwmWw+tM2
	ijeIac/pE5hBt/yBUyil44RX07FMHg66Y2bbgSJe+6lUQdlAXyIsfzfQUfE2XlrG2lX49JVf06Njr
	yVsuL1xAjUNoqJvr8MuDojcJt18ggaWE/6UBLQmrLg59B2aKOSG9Vdr+d3CcRcRGoV+kT/R/t1gh8
	rqBTDLZibfV49CuhyuZ0qTjztvnvqw1CkPH8dObO9YMVs9+0bPrmkBoQ3ThamBb3QtTJGR47qey5Z
	3gWkK1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvsa-00000005s3k-1K5J
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 11:03:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvsW-00000005s1a-00FS
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 11:03:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324XaNi023751
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 11:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37YSkgzf76vapHfjEFdF6GlVCevcX9xaV9hoD7LO3j8=; b=T8HAu1TCsM1KAlgZ
	BGedrvrwx8ywMr7GPSHXhvLGgW20fD85+lVKftWSAz/gJkPKtcoVSfNJAHII5x39
	oljFTaUyqvNiYpHUAXX2s4lyEoU3k6lFHp+e/QkS9F8iAK4c40GWKjF0il7obeoz
	PWzZ9d/4QGBq4V67Ln7PLoCCYpuLYPh/SbliUxG6XGJrRPv3d1to3wxuKSG9QSJl
	WyTbL8zNE8+LHMgBP3vu4QwP+dHIGhWqqT/H62KMSGrhk7V05ypbYIm5DeEBpkNW
	XbkhsMlgCh4Bh5X5A7UPd2v2STCgAnik57cXRdmNCbcjRQc8CBihClsX6HHXPUyH
	mwMy6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxaps2j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:03:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22647ff3cf5so106651135ad.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 04:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591806; x=1744196606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37YSkgzf76vapHfjEFdF6GlVCevcX9xaV9hoD7LO3j8=;
        b=RZGsc74WBDkPZU+sqLDZgNjshogIcrX7k044my9cjsoj5/1sUP1ZuWk1UMVQxKGQIs
         5c2JRQ7ElHVXjFMWE32KECO18XMRNa/MJ+ZLQKfOabVehYQfV9rSIYgrDzZVC9iQvXem
         /xREL5bWMnCUouysTGQUVbtG14nElXb2NNLJ1UYuWlAhs9LsdCPqsn57xc6sNm4WAhqK
         7xPV3mqSzPrq5whqXYNiSK2hbQ8vbVx9G2yrRsJmBqShhYt6+q8ArxFmBDGue6h32TlN
         X+ol/isp/AQxvUmv7NrVxgwKlJxm2jerwOoSPD5Tr4rl9Fh4BpzE4WRo5gMUGvJX/FMf
         1xiA==
X-Forwarded-Encrypted: i=1; AJvYcCUAdfUouDgk2YehyAIlLRDEw5vYlylCRSpesZRv4yVn5oJRKRkwTV7z+U7PE1Tyni03OMzlBGY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaR/SmvtJquFDVHpNQvD+hCIJZJa3+os3a9xff7eX27ynGDSgY
	lMENDKRMtML1nPX0lsmHfdjy/zVFACLAop2XewQzdM5TfH+X2O7oPpV3UFtxtUxwKk00Paa3WFO
	7Lc9VJ+bSJuhghz1++5vSu3FpvHJrTNfNk8FgQVIMsOp11LIkcjFkq+oPbz70
X-Gm-Gg: ASbGncuMOk0LK9t5+0MFtatvVzjXIsGWWZq9bbnqMqtWcdEChaj5oeDihUTlkRNNtRi
	tt6t3H24W9+BKQibKGxudXOyCCmE4Q6olZCwIIOxtyqxYb00xI2WTckD951CWTtDpg0xOkO3TpC
	aCxlMjmAMdhV5oIhIyvbjQAuYPma33WfFQUlv22ofqVQmhXgenW84oNtR/whsWwK2Eyjss/mwCr
	ioY4dPqxh4zJlGpZw4kfCx7ElbBRPkqDsYtxbEB/3IhZEks1wI7jWeXEYQeH5D+9csqXgL/RiX5
	Y4IpGNNoLbB5FzyCiF7lSizRuPDJYC5hAUcYiAb7CRdICoL3JazYvnpRgA==
X-Received: by 2002:a05:6a00:2343:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-739c78b2e5cmr2661777b3a.14.1743591805675;
        Wed, 02 Apr 2025 04:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1I8n+e4+gxAaSRGDNttbtMFZAYntRxi4phZburqh3fpAdPkmIXvurqT6A8VcMdH+Kqi0uuA==
X-Received: by 2002:a05:6a00:2343:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-739c78b2e5cmr2661736b3a.14.1743591805230;
        Wed, 02 Apr 2025 04:03:25 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af94d063c44sm7851775a12.25.2025.04.02.04.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 04:03:24 -0700 (PDT)
Message-ID: <b8787cb8-d86e-5ae2-a6f6-debea905aee3@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 16:33:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3 1/3] wifi: ath12k: Fix the enabling of REO
 queue lookup table feature
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
References: <20250315155159.2475885-1-quic_nithp@quicinc.com>
 <20250315155159.2475885-2-quic_nithp@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250315155159.2475885-2-quic_nithp@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed197e cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Bc5PXK_X3qR6rtLNObcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oCAPlHKSixtajdrayS1MVZJYwv6p23dt
X-Proofpoint-GUID: oCAPlHKSixtajdrayS1MVZJYwv6p23dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=847
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_040328_122920_283F03A0 
X-CRM114-Status: UNSURE (   9.19  )
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



On 3/15/2025 9:21 PM, Nithyanantham Paramasivam wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Instead of storing the REO queue address inside peer entries, REO
> hardware module prefers them to be stored in SRAM which could be
> directly accessed by REO using peer_ID/TID based lookup table
> mechanism.
> 
> Fix the enabling of the REO queue lookup table(LUT) feature by
> configuring the LUT address information in the REO hardware register
> and setting the host service flags.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>

Applying: wifi: ath12k: Fix the enabling of REO queue lookup table feature
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/dp.h
M       drivers/net/wireless/ath/ath12k/dp_rx.c
M       drivers/net/wireless/ath/ath12k/hal.h
M       drivers/net/wireless/ath/ath12k/hw.c
M       drivers/net/wireless/ath/ath12k/hw.h
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/hw.h
Auto-merging drivers/net/wireless/ath/ath12k/hw.c
Auto-merging drivers/net/wireless/ath/ath12k/hal.h
Auto-merging drivers/net/wireless/ath/ath12k/dp_rx.c
Auto-merging drivers/net/wireless/ath/ath12k/dp.h

Pls rebase the patch series.

Vasanth

