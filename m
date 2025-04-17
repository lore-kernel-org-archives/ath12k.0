Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494F6C369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCpJDEnYU6sGpBaesuuZWJ6MbHU0YyqaOAWM+ZszPNA=; b=bLHFNGGkgKllsnKWcVe6IfijuW
	mk/fdAeMOA2xkeni4p0yAw3uthsQQVJ3gF1KWeU+ppiC7VuPbd6AlLAtSQQ7NVX4LI0yMCcvRiJZi
	U9k2deS+ACsrrfg2HTS45LB/UQI8FbaZNEjNMq6NpPCMlZOZF7f5aQHJJr+cKreudH68xMzeFnWsG
	wrb40cSRImpnJ+prJefzr7yxYNmI7LTPJeC+tAgXVd8GRdro0i1YrW6Imgpf74LyHReCgSHBRLJ2+
	ggljhOowKWtKXDRP9FnAcbqNlZVs6n4k22QuKph6HQCFwuqBfAGS7bu69y7cMQxlxW56hlP6aETsJ
	jhC+Ko1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5H5v-0000000BhTX-3L2K;
	Thu, 17 Apr 2025 04:43:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5H5t-0000000BhSe-2ak5
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:43:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMFCsO020644
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCpJDEnYU6sGpBaesuuZWJ6MbHU0YyqaOAWM+ZszPNA=; b=IvMX+PMoNxjTTjp7
	HATSb6oMbHeAjH5oOYlj1LPYIag8DB0nBp9rBWuUDTp0elAJFjhK+OZ7I41ybjRT
	gKtuyJP8f4448RJmyWd6U+Fj8LVpW6QS+1gzlBtBuxm+erW/R0w26OhnD1OODa4K
	uPrPZ/bEIhrbK0c2Xbzemm3oeMJ65Nsab5Kb+YeC7l/QDcLm0WLj2Jiage8J0WFO
	0NyjhFrVMDHSIPlCjzEHovOhNuQz9PIosjbtPrtuAEasyC1C5/NsYfZ2OfwUYkhK
	WZ0A3oZWg54wMScld/4XpHEEsSFCKq6KA+rvKsW6CxLlECidif/iD/E7Cr2rKUS2
	NH7mVw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wnnsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:43:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b048d1abbbfso390670a12.0
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864999; x=1745469799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCpJDEnYU6sGpBaesuuZWJ6MbHU0YyqaOAWM+ZszPNA=;
        b=k7WLLbaMZm5M1idRT+vODOo3ccA2Fy2KFIyBnO8rVJOGv53xDDGFxFB9ibfnuNfW9v
         jNjEWW4qZan5rweYIC4Tp9mR3EQioN36jcexDBCt1UaKUmtIu2ZxhzqliiE6Ty/ZiakQ
         fdeQBYlxhm1WuNmsw+m2OxEE4htiR1Xg0wETphGvMuPq3v5NFrYR7Bd1dO5RBVaMDTWL
         BNrgaW9iQlyQ/Sbalikm+uRbDx1KTvpjWOoKijswNIwKOfCjr3ZC45D/nzwxA4BunHnQ
         UibX7dqKTx5AdfiE67WLOXQJ6K0HCNwxQ4BrSavV/WCt7dr2srku/s/A2aPRKZwhp0/u
         XZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCW41tVwxLcFVDhJUIgWaabkdQdh9IFbqUu+fjRLEMcwhAZNHc8/Kf3n6798mTNEmG8Q9rA/hHM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9M7hDrcGkn7uEIgcQObuKmtz3+XmOK0JJKSIKjrr2PuTJa7JU
	SX4b4xalPw3dJ9ytk2HT0jakwFdgHyPp/ZiZCs15QNk/gSGsxDAg/Smz2rtY03t2jeoFgcG4DuM
	yeLr4NAvIaZVBsjir+fsGM3YVZggqO6sT4VMHzHjAJaErqawPpmijP9TfR2kCs0jyk2XW
X-Gm-Gg: ASbGncsqPkGnhtdJUEcVpT71oDYCNg9eA6ZbsTOW2zujaamD3q7uxHxYcqD6dzrc6VK
	xfIEOT6IMx+K9OAY3hBTMn9E3a9fJSfK3X0B+pzHDOsovuQtzw9bgmuuMsaGi/smWP17QQ/8VPq
	k45plUsFqCLFGcZ8BDSWbSpZM0ZTwPOKPQJfs7DZb8ElitL3M0LDXzS9D8WZ0KgXp2eCxHkE17X
	9Wjc971z3+6KVCsR8xHAWWPeVVIxsKQA6fGm4tqU+3S62qS+DoLKkAwXYrofByRSffImSPXhZNd
	+lwN6WwKRSe3Sdu/1Ukj7pgcuzUtn3Pjo9XmzJpKw2DihvmOgSAB3A==
X-Received: by 2002:a17:903:1aaf:b0:224:1781:a947 with SMTP id d9443c01a7336-22c358de2cdmr73234105ad.21.1744864998727;
        Wed, 16 Apr 2025 21:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErlshvBjFj0x5OLjuHcdiuSjlSiKknrO2d3yqj1ktoI0dScojOvPI2IeEpuD9mvPI+1SvmWg==
X-Received: by 2002:a17:903:1aaf:b0:224:1781:a947 with SMTP id d9443c01a7336-22c358de2cdmr73233835ad.21.1744864998336;
        Wed, 16 Apr 2025 21:43:18 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1ee39sm23789765ad.104.2025.04.16.21.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:43:18 -0700 (PDT)
Message-ID: <2ead024e-464c-2399-28b0-d40b8d32e21f@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:13:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Avoid allocating rx_stats when
 ext_rx_stats is disabled
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250409052647.81955-1-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250409052647.81955-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=680086e8 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=6UfVyIx_0tLuMFyWIHAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ByveUwLu4ctrMzwCkpZwM8eXZjsRFhhe
X-Proofpoint-GUID: ByveUwLu4ctrMzwCkpZwM8eXZjsRFhhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=749 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_214321_779536_4F6CCA1F 
X-CRM114-Status: UNSURE (   9.99  )
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



On 4/9/2025 10:56 AM, P Praneesh wrote:
> Currently, driver allocates the struct ath12k_rx_peer_stats for each
> station regardless of whether ext_rx_stats is enabled. This structure
> is populated by the monitor destination ring for both single-user and
> multi-user scenarios when ext_rx_stats is enabled. However, when
> ext_rx_stats is disabled, this allocation is unnecessary and results in
> additional memory consumption.
> 
> To address this issue, allocate the struct ath12k_rx_peer_stats only when
> ext_rx_stats is enabled through debugfs. This change prevents unnecessary
> memory allocation. Additionally, ensure that the station dump RSSI is
> updated irrespective of the ext_rx_stats enablement.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

