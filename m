Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E16C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMRuDMCMN+0Lx3D+OcNdIJJXhCZRAJFIDfDyf6HMhYY=; b=C6abud7bk+npG/j/atbBJUObBI
	GXU5UF8BN2AblUFVwBRbaLI9WgQNCeCrrBjlLmU0rAldq14zXCSdGWKJqkxuWSaLOvgoqYnhm2Tnv
	A8Nlm7OsaNa7yQJCZjH6bsaII44xs+GJE944LaO9Oo1cq2ITaYrGYoNqS4pPk616tzcSzTrw5Hx/a
	QPjGFx2ifDgcjPrru/02HOe+dHsRtzuX9jCXJSSmWW2akryEx5YmsRx731BXcQMdKiKucmYXzMI6l
	6o/Yo6++6C+48JCLysODsn6ysWqq4v7o4Coj9ruBdOaU9HXHlljk3fEQ++BW0GPtaX65MnHK1aUy2
	ObKq1CwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLHG-00000000mk2-0yil
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 18:05:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLHC-00000000mhE-49xA
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 18:05:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43CEtv30000767;
	Fri, 12 Apr 2024 18:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JMRuDMCMN+0Lx3D+OcNdIJJXhCZRAJFIDfDyf6HMhYY=; b=Om
	/aul0LN7qiosg7BSaV4XxVuo0Oeh5JcCaonckwQ0qUw0fF5fpQvtjH+VdNOwOhHD
	m9uqVqk00d6+NQxJ/IVVatVA3bk7SWryXq6ENULYHz2VdU2hhy+taV/5YyLQSNbp
	djfnBa8r08FhcTocaPrhByWZrdUxDCyyd1OhgLRufuCBOc45YyutPXLevXscJAgU
	RzWrVo7pW3um6gEgmSdbiYq3kF0pLYAAc4N1WHSD4qgyKM29b0RTHrXQUYmBEXIf
	vdF9Ztq4BWM4BqB1krTQ/kQf+quQfYV9thb36Ts8x+hx3M3LiG0QbhAO5hZC60yc
	4nUpP5KOZOkRbtcSVIFw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xf06phcem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 18:05:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CI51VC031991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 18:05:01 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 11:05:01 -0700
Message-ID: <aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com>
Date: Fri, 12 Apr 2024 11:05:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] wifi: ath12k: support suspend/resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KZeWdr7L3bQiJ0ZCM1ODAk1vOJQzig1y
X-Proofpoint-GUID: KZeWdr7L3bQiJ0ZCM1ODAk1vOJQzig1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_14,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_110527_417897_6E14DAE7 
X-CRM114-Status: GOOD (  17.07  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> Now that the MHI&QRTR patches [1] are merged, we can add
> suspend/resume support for ath12k.
> 
> The whole design is quite similar to that in ath11k: firmware
> is powered down when going to suspend and powered up when
> resume, this makes hibernation work as well in addition to
> suspend.
> 
> To summary, this series first does some preparations in the
> first 8 patches. Then in patch [9/10] suspend/resume callbacks
> are implemented. And at last in [10/10] we enable suspend/resume
> functionality for WCN7850 because it's the only chip supporting
> it for now.
> 
> [1] https://lore.kernel.org/linux-wireless/20240305021320.3367-1-quic_bqiang@quicinc.com/
> 
> Baochen Qiang (10):
>   wifi: ath12k: rearrange IRQ enable/disable in reset path
>   wifi: ath12k: remove MHI LOOPBACK channels
>   wifi: ath12k: do not dump SRNG statistics during resume
>   wifi: ath12k: fix warning on DMA ring capabilities event
>   wifi: ath12k: decrease MHI channel buffer length to 8KB
>   wifi: ath12k: flush all packets before suspend
>   wifi: ath12k: no need to handle pktlog during suspend/resume
>   wifi: ath12k: avoid stopping mac80211 queues in ath12k_core_restart()
>   wifi: ath12k: support suspend/resume
>   wifi: ath12k: change supports_suspend to true for WCN7850
> 
>  drivers/net/wireless/ath/ath12k/core.c  | 108 ++++++++++++++----------
>  drivers/net/wireless/ath/ath12k/core.h  |   4 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c |  48 -----------
>  drivers/net/wireless/ath/ath12k/dp_rx.h |   2 -

My Qualcomm Innovation Center copyright checker reports:
drivers/net/wireless/ath/ath12k/dp_rx.h copyright missing 2024

>  drivers/net/wireless/ath/ath12k/hif.h   |  14 ++-
>  drivers/net/wireless/ath/ath12k/hw.c    |   2 +-
>  drivers/net/wireless/ath/ath12k/mac.c   |  28 ++++--
>  drivers/net/wireless/ath/ath12k/mac.h   |   1 +
>  drivers/net/wireless/ath/ath12k/mhi.c   |  91 +++++++-------------
>  drivers/net/wireless/ath/ath12k/mhi.h   |   5 +-
>  drivers/net/wireless/ath/ath12k/pci.c   |  41 +++++++--
>  drivers/net/wireless/ath/ath12k/pci.h   |   2 +-
>  drivers/net/wireless/ath/ath12k/qmi.c   |   3 +-
>  drivers/net/wireless/ath/ath12k/wmi.c   |   1 +
>  14 files changed, 175 insertions(+), 175 deletions(-)
> 
> 
> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9

patch 6 of this series conflicts with:
wifi: ath12k: add support to handle beacon miss for WCN7850

So I was not able to take this series into my local verification tree

patch 7 of this series conflicts with:
wifi: ath12k: fix mac id extraction when MSDU spillover in rx error path

So this conflicts with a patch already in the pending branch

So FYI at some point you'll need to rebase.

