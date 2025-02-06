Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E294CC02192
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 01:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSKI5OTGEOmNuHcZ8xP6spzjksvlzMnal5VI6r0xExM=; b=3ymxG7CeWN/fOUF3pJOJUremAf
	7N6o6u3+CQdsLjxkK8l6IE8gMFriihGo+rAApZQr8/Y78TwLDIg/cWIynfPkr8w4epMGt+1q/XdXO
	fzbh8fWCl4KB30GGg8CTymdvTk/RUJJpJkXGQxL6SO5ENmynvfFhX19thpCM+hx2fewojHBDTqbCj
	nptlL+OJt++aOfOXuc3ZZFaFr3R9J9Pisf668nUKnquJwh5vwSabPJxKEv2O6rbnu5aSBUFXOlxAC
	So1MgcPZ0R+DQA//7+ab+i3txebJxUYU/Eg3rdVk36IhVPpNKxdVTvUCEa0x9vnllI0668iq2sZld
	48ZGYxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqNt-00000004xxL-2LTp
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 01:08:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqNr-00000004xwz-3YxH
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 01:08:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Nri9E030504
	for <ath12k@lists.infradead.org>; Thu, 6 Feb 2025 01:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSKI5OTGEOmNuHcZ8xP6spzjksvlzMnal5VI6r0xExM=; b=BfaLEPGDiA8NUSnX
	1uBvJEPyZWhJLOEXs7xfbIhaTaLvMEscZYhMCjlPDpHGTVy3HjZiKgdBIpOnDkBg
	wTe9gb9s/W2DNLBG+WxPafs/ZhLFr1+b4pCT1r6qXsd4y2joOYvHd+DEIVvfs/lN
	cJqHDy92VtjK4y0gJzxHeYAo1aoP6hvmRY5qLpchPDbKC6sYvUufeVM3DUPjyVvX
	nVIDaiYn+1YfohUfTjRyxyb8On9YTFeVBHalzGWYaZMOfrGitBpyVCJZI3whWS5j
	H+WQqi3LNRua71XSPXAtcY+N2ZD/ttwjEjw1aDSvcu07u4M1PFjZtUBsl7JSA7P2
	fJEi4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mj2dr42x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Feb 2025 01:08:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9fbe0215bso743172a91.1
        for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 17:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738804125; x=1739408925;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSKI5OTGEOmNuHcZ8xP6spzjksvlzMnal5VI6r0xExM=;
        b=iOmnGtWPdqTLjHUv3ij3CmZFsIvLKwfDGPsvVptxgvlqAjEjm7L6Hpiw51Q6yc1vVP
         tGKuj0dXssLa58ZS/Q/ITuC+mL1osD5we3P+b9QXwU5Ub+R7+gKbYcpHZjBWZa4hXaGC
         Pwwf4nusZpeAGoICYM811Usx1oftvKx2tjJ7Z+40HEhnax96jOrCUnRGEb9nxoVlvX0L
         4TdFjEPphPiPkBIyXi6FsyY/K9IbpWlDny9r729Gby4mfUvzkKPfaCAx+sIsgPmC4sI4
         VWVX1/YHPcY2M2l4NnpWdj+BG/HblWHle8C7VuSQN5XfDYkXaIpBiYXYBc7NuMDM+lkN
         sN2w==
X-Forwarded-Encrypted: i=1; AJvYcCVegVNSy58INhstfEgufE9sGRbv3ALi/a9AxhVmn5h3wvfYDi8U9f68sJtbE1KwJsjNWysn/Io=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcmDp8rgYlbDCrUhhRjuiZ2QGjWA5DOejtnBGEWemqEOeGZuy0
	T+KksfeOnZU4rix0aOZKnavx1/7vBUfIvRTVhOwjF0ftWfYyuLwA3Q0m4BoMEsFrukv8NyweqVR
	ayATCoaZQgKpiBfAZpFIDzjETy3shKILRH4OaIYnSjRT9Sc7xpWommaXoLL3gguHLo51W
X-Gm-Gg: ASbGncvOLQyZg/ThmiFkPwReyuclIDNpSYRMiGNk6mxydF0P5J9mBhTDfxZxL3CS5Gv
	ONk/QDdGO6JRpbai+hnbJ0zHmkvm4wlcEVT+wTFNXiLYlfv7pBM0mjB2S9QtDmZ0fRRHkFMyjUG
	WtL9gkP3p1ekGsbIXqJLNFTvIyA4U54rZsqE1obWg7AAHsv3KGkO9s88GxmgEtPR7V/8uxkK0ha
	VEKAJgzutBLscXKmHYcdzBWevZCJW/tkoFbaw1pRdL4rs9WnxvAOnEX1gLC+7B6BugPyO1SPoi9
	1iFK1yRGpjnKUZljOmqu7/xeM3VXsIvOlvAHFTihpwR8AZxUhqqKxq19P6WCp89pfQEr/V6q4Q=
	=
X-Received: by 2002:a17:90b:4c4b:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f9e076c892mr7798299a91.13.1738804124942;
        Wed, 05 Feb 2025 17:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuAT3KmV1QhMxNYRxDWR1/Y1QEtRgjBu7SdPS/4gE7rOYEHur9cc3LT1ThUP5CPqKAJxAMOQ==
X-Received: by 2002:a17:90b:4c4b:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f9e076c892mr7798269a91.13.1738804124549;
        Wed, 05 Feb 2025 17:08:44 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d7a5acsm2335028a91.14.2025.02.05.17.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 17:08:44 -0800 (PST)
Message-ID: <924677f8-b1bd-472d-aca6-60d23899e455@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 17:08:43 -0800
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
 <414ca414-d6a4-4228-acb3-dde4bb71624d@oss.qualcomm.com>
 <0f7885ad-a360-2ff1-eb0b-51454de2eeb0@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0f7885ad-a360-2ff1-eb0b-51454de2eeb0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 04ou_02_o01D4hMenEW0s2o1SkJWHIfY
X-Proofpoint-ORIG-GUID: 04ou_02_o01D4hMenEW0s2o1SkJWHIfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=971 clxscore=1015 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_170848_010789_12711095 
X-CRM114-Status: GOOD (  11.21  )
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

On 2/4/2025 5:02 PM, Karthikeyan Periyasamy wrote:
> 
> 
> On 2/5/2025 3:59 AM, Jeff Johnson wrote:
>> On 2/3/2025 7:57 PM, Karthikeyan Periyasamy wrote:
>>> Currently, monitor is not enabled. However, in the future, the monitor
>>> will be enabled. Therefore, add the necessary HAL_PHYRX_GENERIC_U_SIG TLV
>>> parsing support in monitor Rx path, which help to populate the EHT
>>> radiotap data.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
>>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
>>
>> Normally your S-O-B should be the last tag. Any tags you collect should come
>> before it.
> 
> Oh my bad, if you want to re-spin ?
> will fix it in the next version of the path.
> 

yes, please re-spin

