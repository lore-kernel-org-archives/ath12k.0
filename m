Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F2FC02185
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxwHosu5EHHWe+1t1iq/g+ZUE0hsaNPNud9AmIZfvIw=; b=kjpBihnsCAibx6V1b8tOHQfhLg
	mWLCZELRI49Sxz+t+2i76QpmmC5fLe/pzbnoJHhdfODlwOXzNPOZO/O2RUDoFm0xMTlWiK9hf/IYe
	UQ6+8XDGEaNAJHuD7wxEdB0aHSAS4W/U+2AAy3eB0XXLjTfLIuAldDDeh/cntXXNDt4bHzW2kdlfs
	JL+weVbPs59Y9YXMPah+PRCap/DmGE9zQatbvR1f0ZaaztU2q+9LPodkAigJ6XVXSrV7ff81S9pDF
	Z476KMp6gMnOhhTMduYTBamzuOMviYCgtcK7z048TYb9RjagBbiGc2e8dN2I5ddE8v7j43lu14CF/
	VXaVk2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA34-00000007KbI-3w1H
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 08:55:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taA12-00000007K3T-2FfH
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 08:53:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Yq05021243;
	Tue, 21 Jan 2025 08:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxwHosu5EHHWe+1t1iq/g+ZUE0hsaNPNud9AmIZfvIw=; b=MSMT6ocJ/YGE1S91
	ILPXaeZ3yjb38D3USaVO5gZ46bejYjrPXxqf0NoU+9HtywBmef3AApYsAMKTTYZx
	VJAIGULPUhKaxYSsdEryZ12blfYs07/tCprOXdsFQpmUl8nnlRppiTMXxBC9XVXP
	b29fc3dMmDwMcqi1RJ4O0FAzIPjV1SLYtL3vX7JLhJFy7DWuEAy+9gN96UXdtKyz
	4T/U0vNEZF+kR6zi2x25UU9N1RkRBiqwVRixf6z4LCGHNXsxfpfEzFtbrQy3m9be
	mdBTMdNYvJRsGKzs7GA1kZEZ73ZOKR4YRS1wbBm+5rrcJpzTfpe1z8OmJc8AajX8
	3IkhFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a7nt84e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 08:53:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L8recx019110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 08:53:40 GMT
Received: from [10.216.5.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 00:53:39 -0800
Message-ID: <7bf33a7e-c77c-a99f-bffe-2501f0971b2e@quicinc.com>
Date: Tue, 21 Jan 2025 14:23:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: add support of station average signal
 strength
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250117172819.3357534-1-nico.escande@gmail.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250117172819.3357534-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LiEixLcghfOGp1IaXfdhLekU0M7XznZ_
X-Proofpoint-GUID: LiEixLcghfOGp1IaXfdhLekU0M7XznZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=760
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_005344_586595_952BB113 
X-CRM114-Status: GOOD (  13.04  )
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



On 1/17/2025 10:58 PM, Nicolas Escande wrote:
> This adds support for reporting to the kernel the average rssi. This is
> done the same way as it was done in ath11k. A simple ewma (with the same
> parameters) is updated with each rssi update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h   | 5 +++++
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
>   drivers/net/wireless/ath/ath12k/mac.c    | 5 +++++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index ee595794a7aee..9408d8a528580 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1,3 +1,4 @@
> +

???

Always ensure a clean checkpatch run.

Vasanth

