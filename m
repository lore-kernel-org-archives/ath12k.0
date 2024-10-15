Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181C0D1D88B
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWU2eU3AHm2e98dhXoxeQet7meu0aI5VB6baNUhJ2rA=; b=Bcj+4+3fE0Fz8AfyV1yVKXqLvP
	UQh5TZeRWBmmox9zi0YrnL7hggp/leOqaGegTA548sj85HaMevE3yTJN4BZyyVjfdhalHA6fTxuvY
	lTkM0wqJl5gGXJIhyGTfspAzxcWdB/oC5JpBn4hnQ4G+Q0CdDy58jZt7rajAsXKEcMiUdOA1Ff6i1
	B2SHyS4m1MpkbAAlVSZI12I8qoTESFu97roYPZOrwvOw5xoX4OScIqEhGZ6MZgnAI9BwqKdJr3Zq+
	GKr6x5MZjDQ68sK+slAk5GJz23IXTRXGWmFRPffgFUuXB5/ZlmKtH56KKyqgXU18uVS0D5mtB5/Qs
	sKsYSu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kbp-00000008tuj-3IW1
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 16:41:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kbm-00000008ttd-0VQ5
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 16:41:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F85HpB030714;
	Tue, 15 Oct 2024 16:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWU2eU3AHm2e98dhXoxeQet7meu0aI5VB6baNUhJ2rA=; b=Q+pLUzK6CoeK1xoK
	ncm7tp8jfrjfA5eV1dMgggmA8a7uK7yi9Av3agWshDqtQw2LyXDX53IwMfBC1g+O
	TYRNvNEdAaQYIqCscv8x7iY4Xk2B5yL5PIHg361yJwplgQMfLY5Xh6D2luHj1CSJ
	JccopEtt31mHUA6ecMeZS7daHP8AcOWainc3XTtZZvmWasC3IzfznRTLNlFq7DGW
	gu+OIZubrWIf5W20kG6F6UZk6GL1FgW/NgQ1EQ2SywU/08PyUzlrfi8t1RD+PH6g
	/OKVKxmswavKXEzdV/RGtvE4QRYe690vm3bx4ZcG93QCnkAVTCAPdM+Bh4nfby4G
	hclbTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy1dwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 16:41:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FGfF2P016552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 16:41:15 GMT
Received: from [10.48.240.238] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 09:41:15 -0700
Message-ID: <215f0be9-8daf-47df-b04a-b1b839451161@quicinc.com>
Date: Tue, 15 Oct 2024 09:41:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] wifi: ath12k: some fixes and clean up for
 monitor mode
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241008073534.1195-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241008073534.1195-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oLDNaMd-cGi4supoenAju65vEebxObQz
X-Proofpoint-ORIG-GUID: oLDNaMd-cGi4supoenAju65vEebxObQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_094118_311071_EF5C7637 
X-CRM114-Status: GOOD (  10.14  )
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

On 10/8/2024 12:35 AM, Kang Yang wrote:
> This patch set does some fixes and clean up for monitor mode.
> 
> v2: rebase on tag: ath-202410072115.
> 
> Kang Yang (11):
>   wifi: ath12k: remove unused variable monitor_present
>   wifi: ath12k: optimize storage size for struct ath12k
>   wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
>   wifi: ath12k: fix struct hal_rx_ppdu_start
>   wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
>   wifi: ath12k: fix struct hal_rx_mpdu_start
>   wifi: ath12k: properly handling the state variables of monitor mode
>   wifi: ath12k: delete NSS and TX power setting for monitor vdev
>   wifi: ath12k: use tail MSDU to get MSDU information
>   wifi: ath12k: fix A-MSDU indication in monitor mode
>   wifi: ath12k: delete mon reap timer
> 
>  drivers/net/wireless/ath/ath12k/core.c   |   5 ++
>  drivers/net/wireless/ath/ath12k/core.h   |  23 +++--
>  drivers/net/wireless/ath/ath12k/dp.c     |  25 ------
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 108 ++++++++++++-----------
>  drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
>  drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
>  6 files changed, 114 insertions(+), 124 deletions(-)
> 
> 
> base-commit: b9545f4570fcfebe982439de7c9106e55b4bf756

Applying: wifi: ath12k: remove unused variable monitor_present
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/core.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/core.h
Patch failed at 0001 wifi: ath12k: remove unused variable monitor_present

Please rebase on current ath/main

