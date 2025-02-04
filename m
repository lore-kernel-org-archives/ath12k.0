Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7CBC02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNHZx50E0oAdF81Dys7PSkfk7xthq/gSaPIvplbxxGY=; b=FqRjW0RTrDEEG3KMRtEmS9hPtX
	xeWoKwRD6jYG69QcXGMkAvvu6k+1OpfVFCbTNovvoq6cC5+nzMrClvcVC1F1gCf3PAuIPJqh0nJWQ
	80rZZN7G1g+c30aLUdxxdYfnxyrclOhZtNbSewZ7gyyN6pSRMqQL1l5LX0kCNpFrntxafDIejW+6Z
	Q2TWQQXePkN8XGrMgs2TxmDAYSRopeZXMCcenlC3LTvl9P8QiuKtZ2F2VytHkrse7/ntQPsL6pYfq
	FDfXXQ2qkQZuIXwoDf+RqiVwOk/1DXdpIU5spULb1tyHHopiQU4TTN9rL0rfXZ05QI9W93/EvKIx9
	8lveKN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRQi-00000001haz-3wNb
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 22:30:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRQg-00000001haf-3098
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 22:30:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Cs3c4025953
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 22:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNHZx50E0oAdF81Dys7PSkfk7xthq/gSaPIvplbxxGY=; b=mPpqvyZGF4rW7ghy
	6EHLQA+EVraYL2rJj7UkWBxJleex3jZQmtpJpS5009uMECPh99QLoAONWMEj1FVO
	x2hgOWwQikGglgJxh/Ow9GEBed651NWuZF/7+M5RMX2tLsGRW0aFEbkT/7shjWNO
	H51IN2Ggk/QDj8iXbYCs/U79m1kgZsZS3Irtibe7vYY5wbHpH2zQ2Qu7b1mhh9n4
	mnmiTFOgGSoSDBAgAh8n8Wkf7Y3Loc8aUT0WsbciHjcTCxCXpB/NO/OLBRdtVpfz
	C+oM8SAtFY5tEkldD9k+YPhGxULGrhEkKiYXFb7ju3fLcilEXFfcPFRc6iBWtf1T
	neLyjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kka9sb9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 22:30:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163a2a1ec2so212190075ad.1
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 14:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738708200; x=1739313000;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNHZx50E0oAdF81Dys7PSkfk7xthq/gSaPIvplbxxGY=;
        b=PgiXuw7+nT0Phy5QviHvClLKsLPXgaqFUEcehRvr6TBrBdj0KDa5UBGloqMoCWYHme
         j0ElchO7tmWoCkHn0e/yGEX6K3xhvQoLu87Frpw3+PbPaW8xp6lcdhnceu+zMaYr/dgv
         DuJNvFcKfKGr8ehJzjNHRJswDBtQHFg1mg+vVhmZ5F0cHRfWGgvv1p+00ky9/I0MYQsW
         zstgxiOJo7If8o2w4321Rb5mam2YRxnn81qBg/q4l6ZbXNFhSoOQ2K2JpkrakPbz1NfF
         MXvolNifF8NXmVrAcCz6g7tVKuRHchbBxEhwarFHYxcVELiT1NZunaMt8KkjtT26be3e
         sBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHEsa4DclaxsNSttYYs+VckGG0m1zDoDFcaYmDdbGq4xZR7pNxo8tLkRXnY6fw/6y2dP4Ys0E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyC9pbr2XHat2NfGAfRBt8XQA13ILAvDfblahVrf0c5bwj/kiLQ
	PYtfcclOXlEwbmnb5xVlz251KvSBKXBI+iTrpWP9zR24iQT1XS+pxX4MgbwXUTyrSn8/gPGYUgp
	SfK/LnX8RL4xKwFTGWMxl1uHo1VGUl+Al85Rv0dHMSmzfyoqsPyDNCShq/4Gt
X-Gm-Gg: ASbGncvgpqxI7UclsJZUSE8CrzREhOsIATich9Xg1zPiFEic27MKD+4K3KhgjHrBCh/
	bCHL0t9hgvXZIN9xBf6/cfytc/xq7xidVstyBpWdtFxuyz6NBkU6BRyC7QY4k6W/ObUURBknc/v
	6ndGzr/cB7CtIdeBK5WVpQ3cRS6JWRtTHbL+Zbv7gldUyJRLwG7UpA+8cBQVCFTn0s01HSTq5Ml
	fhZkUSbm5ofDDtbb/w1/TPv7IizoKV26PuW4FypNKkCA/Z7ObdBTp592wWC8rh8sgOYiBmgkxtM
	ETSilc9v1P7K4re3dLMLv8ck4AKDfm5Cy0QzYfZUCk/LeSg6UwUHJT9K+EndPmJM9EDs5aM95Q=
	=
X-Received: by 2002:a05:6a21:6e41:b0:1e1:a885:3e21 with SMTP id adf61e73a8af0-1ede8814a98mr861427637.7.1738708199798;
        Tue, 04 Feb 2025 14:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFou+uiIKHx6A9HwbAswemIiqgsr9G+zNT75FmH4oHmygoIUW46rpy98BkHvvzCTzyV5NNAw==
X-Received: by 2002:a05:6a21:6e41:b0:1e1:a885:3e21 with SMTP id adf61e73a8af0-1ede8814a98mr861400637.7.1738708199460;
        Tue, 04 Feb 2025 14:29:59 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cebbcsm11292656b3a.130.2025.02.04.14.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 14:29:59 -0800 (PST)
Message-ID: <414ca414-d6a4-4228-acb3-dde4bb71624d@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 14:29:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV
 parsing support
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
 <20250204035718.3227726-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250204035718.3227726-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3rCXNNyaUBL_9gNNFqjcQaYlwsPVw8Bo
X-Proofpoint-ORIG-GUID: 3rCXNNyaUBL_9gNNFqjcQaYlwsPVw8Bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_09,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 mlxlogscore=947 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_143002_884702_9781CCCB 
X-CRM114-Status: UNSURE (   8.27  )
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

On 2/3/2025 7:57 PM, Karthikeyan Periyasamy wrote:
> Currently, monitor is not enabled. However, in the future, the monitor
> will be enabled. Therefore, add the necessary HAL_PHYRX_GENERIC_U_SIG TLV
> parsing support in monitor Rx path, which help to populate the EHT
> radiotap data.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

Normally your S-O-B should be the last tag. Any tags you collect should come
before it.

