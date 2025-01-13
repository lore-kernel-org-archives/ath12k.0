Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888BEC02184
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXde1w5kelBQI0tygiDvTjNW7ZPGIES67vcDwSi0qjw=; b=MlBzAQWG4u0AO7/Uz4XaDDgNNU
	80gC1bXzjNCDNlSvbIqsoOktcFKmBU4gQKdVzL+rmnLu/4GqDEFdSSPfRLJQcwz+8VxsbCEkoZC9P
	WLvGokib9mUOOuqE84ri1t0Xh1WTk5rIfNJqudSiD+30+4/KVq1FAm26GBXOhQuedGMlIzetSR5xz
	Mwjwu+UcTOvszZy3xAA9SCYSitCnIiseMUwFz8iLO3SWO6SVElDCxUh+UsSlGqq4prUYEU0IgVe3P
	aaGxhCMLuypMeaQ9tHbxhXGprdPFj/ck6ZXQg5Z+QNX2ToNsxh4fH/JfJAYFt13KeVrCAtovrfDX4
	ttBLck7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ30-00000006MrU-1KIS
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:24:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ2U-00000006Mjn-1rYH
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:23:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DC0vV0000748
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXde1w5kelBQI0tygiDvTjNW7ZPGIES67vcDwSi0qjw=; b=UHPowSBj12iXa2H+
	3BwNbs9AHbPsFn8vmwYwSAw1ej4vilBphI5zLX6ywTFhyjNj9HRkVPTFxU+0wVe+
	+MFNExZNcMSvzKQA5eX9GgiUlI/VhlDXNuAtMsqTib4rMEs0GQ07zg/SY8xPaxoQ
	aoTuvGxCQAvOXjXAvtCxMddSOxOHzPawPJMxOLcu1PE3HxVOaGSxYq2rWgXO3O/x
	vVDuXAP78fmuCXB9wSk/2b2ZioXsfg2fwitTfgVsSfUoLiWhh87u9Y3gTM1TTZBt
	XYRJARosQavNACC/KkSqUIpGLao/Ij49yEniEaZvJ9yGyibwlhF7mYxnZQ+sNHc1
	iM/3Sg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452f914sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:23:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166f9f52fbso142314975ad.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796232; x=1737401032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXde1w5kelBQI0tygiDvTjNW7ZPGIES67vcDwSi0qjw=;
        b=SNPvud3Q6lgEG2KzSzblz1BDVumZA/wy3V2F8t+T5TlOejux5ciydLcDnVHqyfur/U
         b635YABwlJ5rrZ13ovwTV5gx8ileQcaQCkNqUXuu6mcO22O2GdniR2LzF+INQrFT2z4V
         t3cIiIsvmKXa/9Je0Or/rKtJRoHp3mrQEn3/Tffz2JPV14oZRl09CtKxUuEN3A/ZK7di
         kRoiOg9ji6XyJCaqbHbgIq7fivbjjVCWzdlmQtOvgy8OF9FMqhjUEcXrTV1/5Wi1o+i/
         LvPzC4+mw7OiF85Dk3srermauQDXtTw3VaAGt8/8BudzpzAPYk3ByLgJTO03w+D9v3sS
         MpJA==
X-Forwarded-Encrypted: i=1; AJvYcCX1g7rJb4lqr0tH1O8kp0bXeAmHTFKlzUO6CeRRaYtha8fD1aC3T/DvVXbh6FBtnmM3S9YPekE=@lists.infradead.org
X-Gm-Message-State: AOJu0YynYnsCcwWXjSdLfbTFyO9Tx55XWX2SjPg16+IxWHFGNfzrSwCz
	04aKEPKiPgqpI+fhncODE3QLJuVRV2+PecSkiGv6BWX5CWXDnubeDbV/21J+4KCZifVcbvF07UI
	PmQEwo7QEr1X+V2xFU28OHGlxUzOauojlIDONplV6znCb80u6bvVhvRnZf4Qu
X-Gm-Gg: ASbGnctwsCpPrd5mxpFPuJ3+3POsL7VOhR6aUJ3Z8G+LZmun//izDxnL/QvNkXh7CQ8
	jdaIAuoLedSz4bAvczTumT055sRD5YsbIXeBIhfby40ElrpWzgNRcqcOwZRPUSwdmPJh93/AMVj
	wcBhFUqWhKWBLKVQP/s+E1cKXFxjzgX2fnAax9Dp036nv7Sk/Zy3A5BBFymg7SGmyLWLfNdOudF
	2KyBmPQ5F9oOwm71iVtVZosB3407Qj4lwi9OTk13J4ZGrPgyROJA3P6Nrb7B+Xc/kG3YPxlV0Mw
	IqtpulL2890yUvsiZEPEQfd8BxzHGbT6A5II+BENY6Sm6Szilg==
X-Received: by 2002:a17:903:2301:b0:211:3275:3fe with SMTP id d9443c01a7336-21a83f5243cmr121124885ad.17.1736796232143;
        Mon, 13 Jan 2025 11:23:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXldcpH+05wO8UMutlychiEfsS4TSMNdLeLT/myX2snP2ooR13NCLU5K/VFffyts1ZTb8e5g==
X-Received: by 2002:a17:903:2301:b0:211:3275:3fe with SMTP id d9443c01a7336-21a83f5243cmr121124475ad.17.1736796231715;
        Mon, 13 Jan 2025 11:23:51 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f925sm57436325ad.61.2025.01.13.11.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:23:51 -0800 (PST)
Message-ID: <f2d2a1a7-8cc9-4c42-9788-9a6e12df212e@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:23:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] wifi: ath12k: handle ath12k_core_restart() with
 hardware grouping
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-8-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-8-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YQd3bWK8DYSj7MOkfsh8Gn5_y3UxSZD8
X-Proofpoint-GUID: YQd3bWK8DYSj7MOkfsh8Gn5_y3UxSZD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112354_606837_A2D64E02 
X-CRM114-Status: GOOD (  11.18  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> Currently, when ath12k_core_restart() is called and the ab->is_reset flag
> is set, it invokes ieee80211_restart_hw() for all hardware in the same
> group. However, other hardware might still be in the recovery process,
> making this call inappropriate with grouping into picture.
> 
> To address this, add a condition to check if the group is ready. If the
> group is not ready, do not call ieee80211_restart_hw().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


