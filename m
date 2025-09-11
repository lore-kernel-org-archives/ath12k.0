Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5F1CA1016
	for <ath12k@archiver.kernel.org>; Thu, 11 Sep 2025 03:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9R+iVaTiIoWbj/VWEXbxWnh0hqwQQZCdTzJNbtwrUc=; b=K4Tj5a6JXd095vgAPydA6Pq4ij
	pyKskeuLggxnL4dFeTxRQ5KgYLtlGEPa1rKzogmXTE9L/0o5O2bV6waBDG+rNwELLvB4RsRJuJILF
	T4opZzxaoxF3sW0J9MoSBTS809OMqD0WJwUlAp9cDc47SquhPU8V4bj6NQrxSXDvsYPVPg5XQvrrl
	BxXpICaW9POTrkQI4siD/73pHX5vSy2U04RV9SN7797//MtCcaFN212nDozebE5ZjjzsHcKGJnI1i
	KvfBlejtOsHHx8N0tehhHSkL77Z4JDcLNZ1ZwVYgl8a4/MhkM71tYBST7pHj3zlB8bkJUo65kWHUk
	Fx3GmxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwYDQ-00000000ekD-2NFz;
	Thu, 11 Sep 2025 03:43:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwYDO-00000000ejK-02L2
	for ath12k@lists.infradead.org;
	Thu, 11 Sep 2025 03:43:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J1sm027351
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 03:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9R+iVaTiIoWbj/VWEXbxWnh0hqwQQZCdTzJNbtwrUc=; b=nLuZjxG/fu6BcwLj
	KYfK4JCAgrOQxBViHMb2nLg4l6SrPYJf2cHGOHHfhAPgg8mNNDvGc2ddkL6md88h
	EJZ4Rco1Un1k/3Srpo4lxerAl/SU0CY0pezkDlbastH4yD2XC4VY9fPiLZ4WhUxX
	se2NPOdZr8tidDRmXw2mNfVXapDibQVCCCjNgqz4HZSanuVfYCN1ZVQMe9QLBHuM
	ueDj+zMCb2IjxUfEN5HJht+boLUfzlsY7w6n8CYgpBJ+0g7M+wqJSqQfih5YwUeG
	UkEGFe16OozZLTb032WxUCiPtSJITXWHl/DTejUGIDyE4nUs1YMxATAZOn35xRSH
	x79ATA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h14ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 03:43:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2490768ee5fso2026795ad.3
        for <ath12k@lists.infradead.org>; Wed, 10 Sep 2025 20:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562196; x=1758166996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9R+iVaTiIoWbj/VWEXbxWnh0hqwQQZCdTzJNbtwrUc=;
        b=aoX9j/f0CJ1786WPz6bxQkfskhtvhjhMeFJsXAb+3/uVL4H3vD0X/NUORo0b6w5E1D
         4SPHZDiAm1FPTSl6dAdAJnXK0grhfUFK2TTK4UIXGeFB2/osbyaRei7Io27ljvoYo1fl
         m5NH1mBwzcIoe7vJoBHWPjvpyjT3CgL9gm+Kqi6Y2Zh98MIdWRZZ1bCwwJX7RFE3SzWe
         jmnyxGLhLqavFJ4L94V20yn4j+D4Osw5IZCMJ2VTaEnWUhGf7nQI1CUbKR33l9nvtljy
         EaTAsg6sgG3soGqfhSbGawAGZhc5/AaT1aIq40aEOCgzFulgnp6/8rKs3x8IT27yuFir
         wCQg==
X-Forwarded-Encrypted: i=1; AJvYcCUNf7Dej3bcP3N9rHOE9D8H+RwYXQxjuFLbVtqWul19OAn/tr+wN3c6COtAJIub7vXX27BUtzw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwivbU8E9dwCCxfsDpaMe7GGmzpdsMyRB+7SWYAw9t9TGht1SHD
	+F9RirRRyl4bQ+4c0GgOXbEwROYoILjOytPXBl3pzt6ls8GEs5A0T7UY5RmZ4IBes75XDkccjD0
	/1+MHJ+groJZn+GmCii6TWhUpfrHjwraim1WHJGqaXCfPufYnLeqKPl9d5vRJT5IY
X-Gm-Gg: ASbGncuwpBPQegItjkEMQP1Jx9l7I8qWsPsfGafz5JxImPP5kZHCC+cOd4KOEDWmM47
	2wOOakdhBYskTcnW3YzTKNPomLE5L/L5yrbInniYVsJpqbhlzRbqeuueu7J1HbClJORKBLpH6Pt
	+8npeImIZ5jm/wyXvDnpEx3nqShN8bQTinc/e5EvwOhmJ+dv79S7sUt0rkZRpUKL63ujZ0V5SYy
	Pk12nADrXRUN5lALzzm57tZc2TDlEjsD81j1zhfeDwpUqzKZT2JfZs5Mz12At6ptN2jA/DyGPfT
	8p5s69x9Q9TIy7pmsZTeWNoisg3DXq7x38XkS7mudKEc58TwZF4Q3ukYIXY0hQ0ly5z2LMjLvZe
	ibTp+7g==
X-Received: by 2002:a17:903:3d0e:b0:24e:8118:cc1e with SMTP id d9443c01a7336-25172483d47mr258421295ad.45.1757562195698;
        Wed, 10 Sep 2025 20:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQRs3ibxOwoAiwmu6gZL6Gl3YffwQrSmQLb85j3TEkiuKeqOreHsGB6ocbzV5kysvQklbXA==
X-Received: by 2002:a17:903:3d0e:b0:24e:8118:cc1e with SMTP id d9443c01a7336-25172483d47mr258421075ad.45.1757562195199;
        Wed, 10 Sep 2025 20:43:15 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ae293cdsm3057935ad.114.2025.09.10.20.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 20:43:14 -0700 (PDT)
Message-ID: <958e1af5-b528-a157-0314-f81e20209845@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 09:13:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath12k-ng v2 0/8] wifi: ath12k: Improve hal APIs usage in
 rx path
Content-Language: en-US
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YC966a-7n-VVCA594Ft8NTLwt8nFHSEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX1D3ueHtRFStG
 UxmyydSsmJae722GP8nk4dCpFVm4L0JIBc4lbOxi1OBC9DM8LX/LfhViQ1Q558BK/rV3CfUXEyP
 agNkWmM8XyIEYI1DjIDqB9oXQRSjpPnY0ZMGI+ghTa/7Hghsmp3y77agAlZZmnBSdNaKzMT4JZ+
 XwU7b4byUZwlGtFm/5PqId9lZEuqjKVYQ4nD7UgvBOtuv6UrEOKuElZ76Qgk6/qMaaxa/h95TSY
 JjA1Wb7HGpnWfp1M2KbkE1FJ3FwxH+QTA9gXbgAjikDkMiXr6ytrwTY0Oie6OiukZqtSKDxbPEM
 D/6hn5LpeMpnNtYdz8sgOEjnUxbvfvOzqBVfleX4ephpBsR5bAc+5jPkm4XmOZDjQGOSAMC/OI2
 xN8DubE1
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c24554 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nnDDZHBImGbq5RFmGnAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YC966a-7n-VVCA594Ft8NTLwt8nFHSEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_204318_056498_41567FF5 
X-CRM114-Status: GOOD (  16.19  )
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



On 9/10/2025 11:44 PM, Ripan Deuri wrote:
> The existing usage of rx_ops to reach the hal_apis at multiple places uses
> function pointer indirections. In order to avoid such multiple function
> pointer indirection, extract the required hal parameters in the rx path
> right at the beginning and store them in a structure which is then
> leveraged by the rest of the rx path.
> 
> Move remaining rx_ops APIs to hal_ops to simplify hal API usage.
> 
> Also, make compact tlvs as default mode and remove the non-compact tlvs
> as they are unused. Since there is no need to maintain multiple versions
> of tlv extraction APIs, move the rx_ops callbacks to hal_ops.
> 
> ----
> Changes in v2:
>       - Update commit messages in patch 1/8 and 7/8
> ----
> 
> Pavankumar Nandeshwar (5):
>    wifi: ath12k: Remove non-compact TLV support from QCN
>    wifi: ath12k: Replace ops with direct calls for rxdma ring mask
>    wifi: ath12k: Move hal_rx_ops callbacks to hal_ops
>    wifi: ath12k: Add new infra for the rx path
>    wifi: ath12k: Change the API prefixes to ath12k_wifi7 in tx/rx
> 
> Ripan Deuri (3):
>    wifi: ath12k: Move the hal APIs to hardware specific files
>    wifi: ath12k: unify HAL ops naming across chips
>    wifi: ath12k: Remove hal_rx_ops and merge into hal_ops
> 
>   drivers/net/wireless/ath/ath12k/Makefile      |    4 +-
>   drivers/net/wireless/ath/ath12k/ahb.c         |    2 +-
>   drivers/net/wireless/ath/ath12k/core.c        |    2 +-
>   drivers/net/wireless/ath/ath12k/core.h        |    2 -
>   drivers/net/wireless/ath/ath12k/dbring.c      |    5 +-
>   drivers/net/wireless/ath/ath12k/dp.c          |   31 +-
>   drivers/net/wireless/ath/ath12k/dp.h          |    1 -
>   drivers/net/wireless/ath/ath12k/dp_mon.c      |   36 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  128 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |  204 +---
>   drivers/net/wireless/ath/ath12k/hal.c         | 1048 +----------------
>   drivers/net/wireless/ath/ath12k/hal.h         |  106 +-
>   drivers/net/wireless/ath/ath12k/mac.c         |    6 +-
>   drivers/net/wireless/ath/ath12k/pci.c         |    2 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.c    |   19 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.h    |    5 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  501 ++++----
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   74 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |   49 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |    8 +-
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  369 ++++++
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.h   |   35 +
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  161 +--
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   82 +-
>   .../wireless/ath/ath12k/wifi7/hal_rx_desc.h   |    7 -
>   .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   13 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |   18 +-
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  364 ++++++
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.h   |   32 +
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c   |    2 -
>   30 files changed, 1452 insertions(+), 1864 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

