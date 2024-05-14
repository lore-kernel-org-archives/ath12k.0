Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3F1C04FFE
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dO4K+V4nu1bVx/veardWvikwZFhFihIRf9GHQlsVk2s=; b=Fz6pEA69xvn24+X4HfQTt0jyv9
	0vu/MN2XDSDb1FDBmn1jHCTUd0qxeGPD2ruS2uNh3moxbkZH2UWCUY2sSEjkMoy9FdvbMV6MzAMB1
	pCmoxY/vekuWfBB6si38tIRxatHm4vPDb8c2N/8tx3XkoIq/CiD6ZCWuhID146sNUpav2ez/N3rDc
	PcA5LUi8v95MIiG8K2hKHGwPfb62/6Ek99lfgU9pWXdyoGkGBF15NOLvS9G/34j0lSBCtOW5dwa5p
	LQIyI8Irmi6nvjNsfPh5qtY3jtzKlMg/bKCFeXmxOESvJTAS03eWjZe33xvOx+Gj6C8IL1QraIgKC
	3vFM4gmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sgt-0000000G6an-32TY
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 13:59:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sgn-0000000G6aH-1tzo
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 13:59:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EBqCFl025313;
	Tue, 14 May 2024 13:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=dO4K+V4nu1bVx/veardWvikwZFhFihIRf9GHQlsVk2s=; b=F8
	13lmfNLDnAOYAzWrUV6U6ue83J4S4yu/g7PZuTS+4VMp3r5OzbSVfwDEzEYX+pSR
	usKWHSe/Ezir4WX0EnVDfOFLS9WTDnW1EFD9ZtJ+sK/KZWjz+pH4PlM7lmkq8Gtr
	nGaDmih0TyqdnmUGEIfq5P+jS2KrdQ1rxN/y9V+LhaBTbWIKUe0+QQp1oIMNzWVf
	ySiix45gBQXLsKFS95n9QEaB/aNm74G5N8twApz9hfbFKq8IU3q2EZqtN7Vnc2Ld
	W1XYbxeckbCznpCjQ+05IZxDf2etkpw+dg3Mydqr7a/Wzse/UKUj9OJWDjZZgwAk
	vsXrXFkC/R2oixwbYzIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f40a27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:59:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EDxUci028559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:59:30 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 06:59:29 -0700
Message-ID: <762aebb1-2bd0-4445-a51f-fea81eb952e0@quicinc.com>
Date: Tue, 14 May 2024 06:59:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] wifi: ath12k: prepare vif and sta datastructure
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240512110251.4062260-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240512110251.4062260-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SbTUH9OdExusxTeguGganpVtdFpDf3i9
X-Proofpoint-ORIG-GUID: SbTUH9OdExusxTeguGganpVtdFpDf3i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_07,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=766
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_065933_655120_B8326E0E 
X-CRM114-Status: GOOD (  14.23  )
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

On 5/12/2024 4:02 AM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> To prepare the driver for MLO support, split the driver vif and sta
> data structure to scale for multiple links. This requires changing
> the use of arvif and arsta to per link and not per hw which can now
> comprise of multiple links.
> Also since most configurations from mac80211 are done per link,
> do refactoring of the driver functions to apply these configurations
> at link level.
> Add the required locking changes to synchronize the usage of these
> per link objects.
> 
> ---
> v3:
>  - Rebased on ToT
> v2:
>  - Rebased PATCH 1/3 on ToT as b0afabc4d7e0 (wifi: ath12k: add support to
>    handle beacon miss for WCN7850) has introduced few APIs that use
>    arvif.
> 
> 
> Sriram R (3):
>   wifi: ath12k: prepare vif data structure for MLO handling
>   wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
>   wifi: ath12k: prepare sta data structure for MLO handling
> 
>  drivers/net/wireless/ath/ath12k/core.h   |  85 ++-
>  drivers/net/wireless/ath/ath12k/dp.c     |  21 +-
>  drivers/net/wireless/ath/ath12k/dp.h     |   3 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c |  14 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c  |  16 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h  |   2 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c  |   9 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.h  |   2 +-
>  drivers/net/wireless/ath/ath12k/mac.c    | 856 +++++++++++++++--------
>  drivers/net/wireless/ath/ath12k/mac.h    |   9 +-
>  drivers/net/wireless/ath/ath12k/p2p.c    |  17 +-
>  drivers/net/wireless/ath/ath12k/p2p.h    |   2 +-
>  drivers/net/wireless/ath/ath12k/peer.c   |   7 +-
>  drivers/net/wireless/ath/ath12k/peer.h   |   4 +-
>  drivers/net/wireless/ath/ath12k/wmi.c    |  12 +-
>  15 files changed, 681 insertions(+), 378 deletions(-)
> 
> base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
This series still LGTM

