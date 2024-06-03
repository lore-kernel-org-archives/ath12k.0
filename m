Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07BC25B75
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 04:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hREzmyQrAyx/aNr3ngY3Hr79mdhAFG+MQzcBek4ghY=; b=yR6NlsFgNaGqFoj8JNHUfoDBAi
	Pf6/JXVqTzRE52TxlJEOfH7Dqzyo485kCjYckRpn0/50HXgfZPPo6hgsT2jJ2TVn1kKZ8Oxk2XZ8W
	N9SIroPO0On1MxHi0Bvph6sbrHg8aBXn2Pf4KnAhyJht8xUdu0JrR+nWPa3p7waT/4e7DeMRScnlh
	5wLRe7U/VukGEoRJOdrKns5vYare5yKvw2q8tGnK4V4X4jI2INmjW6jU0bAaFs3TvVsiVUHUdMOM6
	iMOmXkBAU0zQkA14pobxXmkO1oajAQO8arT5k1KtT78JlolagCJfZ02ynFhjtGH5jG86tUIzQxRMp
	UDNTNO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDz14-0000000FZcq-41Gz
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 04:09:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDz12-0000000FZcQ-0Uuw
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 04:09:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452NVKPq022462;
	Mon, 3 Jun 2024 04:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hREzmyQrAyx/aNr3ngY3Hr79mdhAFG+MQzcBek4ghY=; b=eXjfWyT3wU3ahI9X
	mrnZ7+5peOHA3FXoDUT7H7aVhKROcO9M2wsgWXq0C5MQo72aaY+eDy5l4uwChDVq
	VBJ+kzn3+J/CfCS9JP1TWwvVYD8TJxHpHKzWPRRZDjbHR5DHp2j1TDhwBGi5Kxf1
	APYrd7KmhDiLqsUJU1prW2yESMu6r+YHu8JY8OsFH/w5jAcPUGPTdKQQHXeSstSD
	zQ0Dso09lR6Nq6pQVnbtyUwN4cM9RT4qnnzFaqzPjAlxMdXcChu+skExTbu/tqPp
	xbYiYbQ628THF7DW7VDzbJIKtorm+0DkaQ9ZdcN1xNyMXr1kcmJGhxZX12kAjdV+
	BE4m8A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5t2s7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 04:09:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45349hsO005525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 04:09:43 GMT
Received: from [10.152.203.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 21:09:42 -0700
Message-ID: <ff3e8af7-92df-4274-abf4-3af1559bd29c@quicinc.com>
Date: Mon, 3 Jun 2024 09:39:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] wifi: ath12k: Add support to enable
 debugfs_htt_stats
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240531202545.2021028-1-quic_rgnanase@quicinc.com>
Content-Language: en-US
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <20240531202545.2021028-1-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VBTky8kqIHPJIRdAk4ecErTqgy92O_JK
X-Proofpoint-GUID: VBTky8kqIHPJIRdAk4ecErTqgy92O_JK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240602_210948_268228_6DA1B373 
X-CRM114-Status: GOOD (  12.78  )
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


On 6/1/2024 1:55 AM, Ramya Gnanasekar wrote:
> Bring in the basic infrastructure necessary for enabling htt_stats via debugfs.
> Patch series bring support to request stats type to firmware, dump the stats
> and request to reset the stats from firmware.
> 
> Schema with one ath12k device:
> 
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
>         `-- htt_stats
>         |-- htt_stats_type
>         |-- htt_stats_reset
> 
> Dinesh Karthikeyan (3):
>   wifi: ath12k: Add support to enable debugfs_htt_stats
>   wifi: ath12k: Add htt_stats_dump file ops support
>   wifi: ath12k: Add support to parse requested stats_type
> 
> Lingbo Kong (1):
>   wifi: ath12k: Fix Pdev id in HTT stats request for WCN7850
> 
> Ramya Gnanasekar (1):
>   wifi: ath12k: Dump additional Tx PDEV HTT stats
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |   2 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  11 +
>  drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 714 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 300 ++++++++
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
>  drivers/net/wireless/ath/ath12k/dp_tx.c       |   8 +-
>  drivers/net/wireless/ath/ath12k/mac.c         |  61 ++
>  drivers/net/wireless/ath/ath12k/mac.h         |   3 +
>  10 files changed, 1110 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> 
> 
> base-commit: 2580be9ee6f5d97d6763b5d4ae4f9c0383fdf130

Please ignore the cover letter. Patches got missed due to mail issues.
Will be sending incremental version for the series.

