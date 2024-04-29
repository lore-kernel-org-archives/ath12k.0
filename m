Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD58C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUV3JVycPxekOYpjyDyrJnPKorXzYimfkLXMlcfIj3w=; b=b44/TcQ8ftaCTti+gga6SXwPcP
	klMxUYqoojcJPOh4ZmA5YoBo4VU1eThkjA7vhTf9VLyHQDpqYD/bgYkx0aDcV0KNG13YFQaT8w5bj
	fzVMTAtKP+2wH/RQOqdtrCTCox5e9EjC0nRlKxnUIPL5aq+ppGrLTy5G9zV8x3/EY/TEUNM/x60gb
	fi8V8mhqkO1/GwAQ8rnx78Tl5GC5gNWdnWks0w1r9hMkVhwe+fm23Kn/DN5nopy4JJrtO6zUgkBYm
	j9cNnvLsTxc+F0oyaxfgNnXO+afpxpdzUXBGojT4NAqyeg2zSoDYG3e3Xp2Ihx4DNWS6h81YeshGR
	wVJ6m4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1YeH-00000004I1O-1sPS
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 21:34:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1YeE-00000004I0o-2T0T
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 21:34:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TFlGJ0023904;
	Mon, 29 Apr 2024 21:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rUV3JVycPxekOYpjyDyrJnPKorXzYimfkLXMlcfIj3w=; b=hi
	p7ilIJ3qiWeX0SorvyBOLS6NyN5kKe8n5jr9WxSmT5eVUd1f0x1hMfloDBiGU7i8
	Uo6XxzoNqSmjCpsAEtUPDlGxhQJBBXo9JCuPSc8y13c/eMdjagidkgwSQwcKiSPZ
	g3AT14nAlbalPY76XdyqKVaIJgmTg3SKNGpaTf6pfTOa953JXgDIP+ScWxtuulWg
	lP3lQ5p+IPdyiIwLLDEGSi357BGINdBaebQIuvlTbI1rgiLuOhj4jRv+dub3g2G5
	63Fkfv/6d6Vrl29hA+9VDp6EGbWe/ePwZl1CLQ7dAjvBVXXACqRX0p9EGPnWAh5c
	nLI3p78VLOS+RY2DirBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtbv8ap71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:34:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TLYoB6005167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:34:50 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 14:34:50 -0700
Message-ID: <adb4e20d-a6e5-4508-a3d6-9c46a1aeebaa@quicinc.com>
Date: Mon, 29 Apr 2024 14:34:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429173825.2369355-1-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429173825.2369355-1-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GOuRtY2OrP6ZReW4bshUinfzVco5eLbW
X-Proofpoint-GUID: GOuRtY2OrP6ZReW4bshUinfzVco5eLbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_19,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_143454_685687_327F3988 
X-CRM114-Status: GOOD (  13.09  )
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

On 4/29/2024 10:38 AM, Ramya Gnanasekar wrote:
> Bring in the basic infrastructure necessary for enabling htt_stats via debugfs.
> Patch series bring support to request stats type to firmware,
> dump the stats and request to reset the stats from firmware.
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
> Ramya Gnanasekar (1):
>   wifi: ath12k: Dump additional Tx PDEV HTT stats
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |   2 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  11 +
>  drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 713 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 300 ++++++++
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
>  7 files changed, 1038 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> 
> 
> base-commit: 326f8f68f28b0b831233acfabffb486a5b0f4717

testing on my laptop

good news is the files are being populated:
# ls /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/
dfs_simulate_radar  htt_stats  htt_stats_reset  htt_stats_type

bad news is:
# echo 1 > /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats_type
# cat /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats
cat: '/sys/kernel/debug/ath12k/pci-0000:03:00.0/mac0/htt_stats': Connection timed out

journalctl shows:
Apr 29 14:17:16 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: htc rx completion ep 2 skb ffff8c4e50e5ed00
Apr 29 14:17:19 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: stats request timed out

so something isn't right, at least for WCN7850

has this been tested with upstream kernel?


