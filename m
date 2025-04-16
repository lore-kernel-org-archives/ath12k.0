Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B9C369BA
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c78LnrTp8qvX8Bx5aesz/R6PctldqwCYeHndy417HQA=; b=XHHcmwnwD7vG5wIuJrXARouF4C
	ZIz0ZmwEYrxSiURLLScT4ZHjKNvXucALK8A0PWaolj36fRLPSii4BwKoydEJYMopLU4D50kT963Uy
	xAsPfdB8AvSUhWJNqYijJMRFuLrFEXNepiKehYj2YTM6Y/PTveFLUqJwwlQG6OGXqidKBmRiYpwVe
	UeBZEt23NR2/6xCSBGqHw4tU/nqTp3rUjNQ6EaR0c8dPj2BBSEDRRr8r6V4WW6JS5qH8Tuhq59KPA
	tEhIuTmzpAf9YHWhKD5YV+8JJtYO5mnkHix68DIPY5Jgv0snXcD1gvu4FR/bLRdcwnx0dsb1AbBXL
	d9Pl/48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55a2-0000000AF4z-1P7K;
	Wed, 16 Apr 2025 16:25:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54oo-0000000A6St-2DB0
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 15:36:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mGlt007042
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 15:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c78LnrTp8qvX8Bx5aesz/R6PctldqwCYeHndy417HQA=; b=nl9IIZ4aBWb2HaJC
	sY3STxFqPyArDzHZQOOLc5KeW6RQLQosTKM9bpzrCLjCvKBs/1P5v0mScnD0lFwT
	BuTShn3G080zYn0eE1Mdw22YSLXFfnSvt09CxG07aLICCcbu0FswbmPqpni2GmW2
	3RgAW14fzJKsNXKlKqe+Pot0VJRXjSLAM4hFVnLpzy+bwginPKagnBXDrsrjC9Ed
	EFaZjVKKdmiQfZXtjE98w8xyiUcc0UyDTDxzaMjuApQyvFhG89+1H6AKuWEa/GZI
	8u3kDTtdKH+Nv1IVo1+oT3/lWwt95afBSyxAUsfDiMAA7mSa0dc2/tSS7X84GjLj
	10DJ0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjkxnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 15:36:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3032f4ea8cfso7198999a91.3
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 08:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817812; x=1745422612;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c78LnrTp8qvX8Bx5aesz/R6PctldqwCYeHndy417HQA=;
        b=VEPP3K9tkniXZ+SLUVvTdT3PxjhHBF8rDYAEmoayB24WneUsoeUL0QpmGuoM1VSRxN
         WlAr1QYUcGK4lk6AWlDhCjXE/S+WJCmpJukpGvJ+fFLeLBsAITVfimGYGW30cbG35XCy
         qrNah8O4+JqjQJoZj8gi4Qo9ELnbGOnU4iM9OdFlDZtvwsYZ45LZMhZIAxPz9dGZbB7u
         evsLilWjwHza+sMmmJqntqxwfKYAMlSJz/L08ZOCQdMU45lLGeHmVMZvTgLQsluFb4ph
         EL1y0+KCM1B/8g9sGovArOTw0vI9DMCGIklFc2gvsiHE0aqvXFwRE7ckrgDSdorCUqKF
         Gapg==
X-Forwarded-Encrypted: i=1; AJvYcCVR6WyGl9x37MbTB47lruaS7HdsSPoEYNxZMOHRCuYCwiBIUdBXnrWYuhVzGLGPuyer4FCwcjg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu4vPhK/EPVo4bskFzNLwRudhoOptgNEDGJpv407BxFNukwWtS
	RhkUUiRxZanGehpGsc0Qn99uLzwAEIiEG7LfGupFNe7LK8LiBIcAn3HZbg5NFrZssPcCfyU8P1H
	iUmaS1HbamHB+1P6LePn9aDz1jW77LH4KGlj+E48Z5coVlI+nPZpLJCpWUEqL
X-Gm-Gg: ASbGnctkY4/hxLOsO0FSAWBaqYGTuNEL0+9/hzONabGMT5tdcKq5HyCx3wSOuhY/Q1s
	GLIAVeUpCSmd+a5vSWBjZ8q1fSVK8ZUs2yWFeO9ceOKQe8LtL70PiTx0z4Ie71BG7G3fCa9PznT
	/zFopSdCeqVXlKLMKP5gsObDsAiVG3P2ugZqivMJzaZRhUtYaBkZU0II5c9jF2/ZLvSGCHpe8Q/
	EPph6++iXonyqO0zhxc0LPoinPecSs+NVckCEVwLGjbP5f9HVIWuizVk3OYKyR0IoKCiuu8mCSX
	DWH2V3wmOMpQ9/GfMheRthWhW6x62staM2AnrtxJese50lwAStgadWP8umCMPuAhnVU=
X-Received: by 2002:a17:90b:6c4:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-30864167feamr4008191a91.24.1744817812138;
        Wed, 16 Apr 2025 08:36:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKPdIhuLdVvaJY3YwngnADlYsQ47zNzelQAlI6OUXwZBAf6r6y1dh5qlR4Nz/ob+K1uF5UYQ==
X-Received: by 2002:a17:90b:6c4:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-30864167feamr4008105a91.24.1744817811343;
        Wed, 16 Apr 2025 08:36:51 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcad31sm15514165ad.186.2025.04.16.08.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:36:51 -0700 (PDT)
Message-ID: <d3a04a1b-5020-44c0-9bec-2d1c2014b6b4@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 08:36:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: read country code from SMBIOS
 for WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250327021403.1577-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250327021403.1577-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a4n3ZRJ6KBkVejaGsZFZBW6qOox0uluh
X-Proofpoint-ORIG-GUID: a4n3ZRJ6KBkVejaGsZFZBW6qOox0uluh
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ffce95 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Ft5rZQkPytZ3RTzrGcYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=910 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_083654_715230_92ACB545 
X-CRM114-Status: GOOD (  12.90  )
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

On 3/26/2025 7:14 PM, Kang Yang wrote:
> Read the country code from SMBIOS and send it to the firmware. The
> firmware will then indicate the regulatory domain information for
> the country code, which ath12k will use.
> 
> dmesg:
> [ 1242.637253] ath12k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
> [ 1242.637259] ath12k_pci 0000:02:00.0: bdf variant name not found.
> [ 1242.637261] ath12k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
> [ 1242.927543] ath12k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-02582-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
> 
> Depends-On:
>         [PATCH ath-next v14 0/4] wifi: ath12k: add 11d scan offload support and handle country code for WCN7850
> 	https://lore.kernel.org/linux-wireless/20250327020527.1527-1-quic_kangyang@quicinc.com/
> 
> Note: This patch is an old patch in public review written by
> Wen Gong. Just resend it for him.

This should have had a From: header that shows Wen Gong as author.

I've fixed this in the pending branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=336569497f976fac962933fc6995eb8778c41b47

/jeff

