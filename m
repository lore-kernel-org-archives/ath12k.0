Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597F1C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejXDfZiXgdUwzRJOza06PMfldWfFVq6Bwxl1/GBOZko=; b=qe1b0O0/+uzmEeBm2n5jm46VTf
	tXFHD4hD7H6PyUmlXZr4ygglbAwzeEAH7sWGl+W6USpDAAK8Jg/VVriVe4HnoC49dBHyB6pIeE30t
	2UNL4g+ODV4PC0/s8bq9RoIAqmcJAT5UJL84UiBRnVDGNYmh9dpWe1yzVhZEfdcPNTBOrlwVcspCO
	2SFCkQJj1W1i1QZ7dVks7RrFDdqdI/lVP5mPgYO7soAUf1QNXvLz19tvHXyWWQH/tYM+FtlsT365V
	xbHpj11JSimzxKOQ5T3a1n4M1bqZzYKMqpMlQ9Q4u0g/i8yS8MxolzJ7pi+KH5hhnKYjaaozoKZ7o
	ull/dgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCTg-0000000HMzq-0UPT
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 06:32:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCTd-0000000HMzU-0pma
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 06:32:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5146NrWu016316
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 06:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejXDfZiXgdUwzRJOza06PMfldWfFVq6Bwxl1/GBOZko=; b=BZsqEqEQdJwel5cw
	JU1xkQRk7i0FSYNi3eyzz/gIUPGqC+HZsbM91nfts3dSeeu3ap+HNv6J1lkRw8vb
	7bNzlPTOFHM2dNTPUBdgApJWRTJOM0/+G/IHcOdMqpvVUCaaRG9kTT+ULJjMLbI6
	/iLmsWZTw0nbEooh90KbfewFRmuph5PFLNL1FyKbwJnbFS/eyqGr4GMgIlPJ+P4H
	v2uZTJB3eCM8xaxXKtMgxSKqUbAa1ggkoDDBN0RaCOPHEfEv2RcSdMQiqRdmscYM
	2GAwo9TKHa2F11lZ2XqNgMOChOZv0gyPzm7o/2FWULZhMFAwvIhsk+UOIO8qn0S4
	MBwkLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kdk880j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 06:32:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166464e236so169785735ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738650723; x=1739255523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejXDfZiXgdUwzRJOza06PMfldWfFVq6Bwxl1/GBOZko=;
        b=gNzXPpC9aeDopF+BqvdWkAyKwUIgvesKFsfKCCVpslyNCSO7t1lA6vtHC1RmHx+kNf
         flzUgLVSkj1ifljZfeJ0dis+qciaetsLvHzwgqehN7kLogjzbGtZzfDvQUjF7WUDv4UL
         vOppbIJH5iZeFGuTZUDjOOZyxFHxbePTUyna851eoYRP5mffj4aR1Brun3oX96R+hAO7
         lbSo5rCDUIq3NmOlvp8l9vMxHE2Ac9PwAn+G71rb6PfYLBXAa/3uolczUMSr9Ufw96ZU
         04ilkolp+OLoPCaYVURNPOJWdnb3oEg3Y3O1xTRfRb5ESeE/MiuPfi0w/fXIPUJFyMoF
         SmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAHGa6iQOjY6rtPA6dCse02/5L5pIAX9/Fm5hkmckmDFjC+p5anPP0Njg7iR48kuFos0m+YrY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn0CzRMPhryMiMuNhttsaikm0DB/ZbUUUGRiNV5CpThj2ydOy4
	ECDkVsge/cXrZ7ITD+yrxJPHjyRTd6++Xg8Afq/q+a0sX0QPT00zO4DCgHUoBXSGa27EGSdEx8u
	vWD2bjsroua/04ZhIlmlZxGeU5KcnbmdRHSu9/v3MA/tkrKZw/Q5vEDea+CKp2STEXKfK
X-Gm-Gg: ASbGnctudyxUV2D74dBrqIyS1IhTGw8c0yihbKFR7cu1JimkcGR2eohwz1vduXtnlWs
	itAXClFxfduz0s63hmGo7KtxjOAthMznXdYbRGFU+3hYpZhrbnEo7DmaJG1Bw9qD6VGxIVZe0bt
	h7zxldmziBEXSqWeRcXw5djojahSZwViIfBV75JDs39IQtQ0WePdy6o5rhsLGUXQP30Gw0JIQyd
	858bSXEB/vG8PldzZ12iG099rcg9YUb2LiAsvTKB2sgfvmdJ+SQtf7g6V1CJOWxbFXrwDa+ugop
	DhGxFxQl34dQQZ9OoQBN0XRgxrxbn8b/iJustNo=
X-Received: by 2002:a17:902:d2cd:b0:21e:fe28:adab with SMTP id d9443c01a7336-21efe28afa2mr37251765ad.45.1738650723285;
        Mon, 03 Feb 2025 22:32:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxbwyPkI8o79Yk8tejCx6Qy5rP1sKmP/UkbDF5+RPS3e0OytLPrYq/FCiE31NfOr6norJfSA==
X-Received: by 2002:a17:902:d2cd:b0:21e:fe28:adab with SMTP id d9443c01a7336-21efe28afa2mr37251405ad.45.1738650722898;
        Mon, 03 Feb 2025 22:32:02 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbfe6bsm13837746a91.46.2025.02.03.22.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 22:32:02 -0800 (PST)
Message-ID: <20960f16-d797-48a8-9bd7-29af3e88593c@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 12:01:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Pass correct values of center freq1 and
 center freq2 for 320 MHz
To: Suraj P Kizhakkethil <quic_surapk@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
References: <20250204053451.2703834-1-quic_surapk@quicinc.com>
 <20250204053451.2703834-3-quic_surapk@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250204053451.2703834-3-quic_surapk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IpoZO1Opf3Q_FJv1SwlQ2v-Hbv3qtvTU
X-Proofpoint-ORIG-GUID: IpoZO1Opf3Q_FJv1SwlQ2v-Hbv3qtvTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_223205_249868_EBE5B326 
X-CRM114-Status: GOOD (  10.27  )
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

On 2/4/25 11:04, Suraj P Kizhakkethil wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently, for 320 MHz bandwidth, center frequency1 and
> center frequency2 are not passed correctly to the firmware.
> Set center frequency1 as the center frequency of the
> primary 160 MHz channel segment and center frequency2 as the center
> frequency of the 320 MHz channel and pass the values
> to the firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

