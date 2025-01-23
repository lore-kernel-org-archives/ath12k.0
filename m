Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2BFC0218B
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3az1RKU17qwjiOPGrZkVior54Yx4OI9sSB4ahewp44=; b=jQXLf5sDDKXpA7pjKJF7osnIYI
	uhJtM2ge7bbJ2/ANnH/InlfcZkPMSSmRmIryGTHJjRJjAHYOz6fLLG6k7bYhFbeCB37zlHziSnDxL
	bm1aKcHbwvDLE16fXEPChr4Mv/ri5vBceyxrWoKda+RXQ2WFAebdUTXl4057mKn8KmAD5JSg6GQEO
	HBnnsfqOgKaMw2xCXaXRDK799dqhTNHxVOYm+CEuA7PY5iuNcnkFx9ibapTZYyTVTglQo9pWZctcb
	1qZdtsFrmVw63+qS4/P9AFu1hhfyEDqTykCwSqrVZh4wO5bCr6wKNR51iniR/NB89i9PtDEQBgk6Z
	gV/4Zd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0og-0000000CuVW-1BhK
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 17:16:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0l0-0000000Ctkm-0VwY
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 17:12:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA7qZo011234
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 17:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3az1RKU17qwjiOPGrZkVior54Yx4OI9sSB4ahewp44=; b=aPbocEG43Lzi6hRy
	Q1EjDsZ88n7tVcr24oKDA9eMzFoXg7r0VR7p+mZeXyZN11RGK7ujRv9v3txHA/v2
	yESOe/bnDYHPxn6OtoJExcWktW+ZAS8cgul1ubpfLVi9gRI4CkuOl62dtLH0MSA+
	eWfj/sE7yoDObSHVVrZ7zInev/5bCPhDXEbaWALczfsEc5sEsgz072VLWoCuuOEL
	v30QNAeAfvYz6472+9CFGCxOoFeA2U2wgxW1liwVY3i7a9xppLlEWQbTVjwr8IV5
	hg8jJyWjR0hMKq0CxyYAWCzMtAODDJCRWfCLNRVeouYhslbBoZK0BAo8pA6fZHbX
	pm/fXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bkr8h0r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 17:12:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216717543b7so29040875ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 09:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737652360; x=1738257160;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3az1RKU17qwjiOPGrZkVior54Yx4OI9sSB4ahewp44=;
        b=dax3SK7Qnc5H2KowaNs8PYtasFvXPmknHDTOgR28b8iYTqLoZG7sDQTcgNIJCMlGD7
         vPPt3iCdnqkNYWIJRVgEi1FQtREiPjsEJ+9hFWui9kaNX5OiqUvtgKfeIvo7/9zNXl7Y
         r5Ls03h2wDjkQcYN0HFjt3xRJHU944scG6IqIVHuLb/gR3csHRmm9lhouNpjzogBC683
         HvQbYAcV8LTTQnTlgmXpdEDlne0CQt+Is+HCWFe0eSrKL83/paClbuWu2IdjQPhygXf7
         ObsWkDD+9sdOwkC/Qo27vHnNaQwlCVUFnc4EYD2Tt1kVOAjPW0/sGWUmKsgBWFdB2GtA
         jHFA==
X-Forwarded-Encrypted: i=1; AJvYcCVYxlLI15FsWOpxJcaLv0GtpWKzDDcluQlSqTNVrk89jxRKamIQ//jEXcre9J806f+EeUnvDCM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9aMvl8bVluoCHA6g88T4LR8virH5iAN+5QBYm4ln1ov8XHnB3
	4vTAftGx0Qb+31ZCMLw8aUHmVo4r0zq0sgn24A4LCbxrEWV3LeUge0ZaJ4phMcpMA8qtv9b3Pr8
	6aIZzmz4XShJKLFweDzk1WKfbU6IQhZ9RJFqmylwrJB55g8Zrz/xzkMf8Oq82
X-Gm-Gg: ASbGncvyJZf+5TRju+/FAduluLNsPQywCtEPtl8smLXl9gPg6z/ZTfLQEWpYaAKnAYB
	jeKN1YW1dQ7NrM37v0+w8coQkW4hFUJCU3NbHhENi03z22DictNtZRcx+DXtSkqdgcBdiLQnPQS
	yh+DyNmvmd3+0GrXva2KvmQAXCcwqkgt8PUEThX+j7oxCRwlE1zDx7zLFeQFsx/G8g5nfJtnkc+
	eLvNoYGfLz7HzOzLNiHnjyJ8aHokLUkN/AoLXCGMwVIu0+74Rv/X2GQSXsOP8LKVENqpIrqJ9fq
	9z3MC29evwuumD7qdA8Zi5AUQe7dwdVUeIm5HlLI98qE9+itMMLG2cHpLia02LI=
X-Received: by 2002:a17:903:2290:b0:216:5e6e:68cb with SMTP id d9443c01a7336-21c3540d18cmr423745125ad.16.1737652360411;
        Thu, 23 Jan 2025 09:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2Q1Ks0mnL3M2R9V9Lg+xPeJhjuHsVJ1yl2ugFUokMhKI673ryaHT2sM/t/6MrSM2ggR2uuQ==
X-Received: by 2002:a17:903:2290:b0:216:5e6e:68cb with SMTP id d9443c01a7336-21c3540d18cmr423744625ad.16.1737652360030;
        Thu, 23 Jan 2025 09:12:40 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414e2f6sm1294225ad.197.2025.01.23.09.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:12:39 -0800 (PST)
Message-ID: <d39befa5-58cd-4052-a71f-c632462ccce0@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 09:12:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-current] wifi: ath12k: fix handling of 6 GHz rules
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250123-fix_6ghz_rules_handling-v1-1-d734bfa58ff4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250123-fix_6ghz_rules_handling-v1-1-d734bfa58ff4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8f2hYhjFUZXRvYbBaeyjmI5oAF1bBuJg
X-Proofpoint-GUID: 8f2hYhjFUZXRvYbBaeyjmI5oAF1bBuJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_091242_187181_0941B739 
X-CRM114-Status: GOOD (  11.92  )
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

On 1/23/2025 8:21 AM, Aditya Kumar Singh wrote:
> In the US country code, to avoid including 6 GHz rules in the 5 GHz rules
> list, the number of 5 GHz rules is set to a default constant value of 4
> (REG_US_5G_NUM_REG_RULES). However, if there are more than 4 valid 5 GHz
> rules, the current logic will bypass the legitimate 6 GHz rules.
> 
> For example, if there are 5 valid 5 GHz rules and 1 valid 6 GHz rule, the
> current logic will only consider 4 of the 5 GHz rules, treating the last
> valid rule as a 6 GHz rule. Consequently, the actual 6 GHz rule is never
> processed, leading to the eventual disabling of 6 GHz channels.
> 
> To fix this issue, instead of hardcoding the value to 4, use a helper
> function to determine the number of 6 GHz rules present in the 5 GHz rules
> list and ignore only those rules.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Cc: stable@vger.kernel.org

Note that an upcoming linux-firmware PR will bring in firmware that triggers
this issue, so want to get all affected versions of the driver patched before
issuing that PR.

/jeff

