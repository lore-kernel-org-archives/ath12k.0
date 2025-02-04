Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87644C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aJyJcuP119WmaSVesxA87WNqjtRvg+EFnMREFJQ9kk=; b=InfPwfO+hNeGZ0CB6bcbGISsfC
	3YjyFCNJHqS2H2ufDzJP/q6TobOm7Sv+Frx3IWapnWEah4ikxrupGVdJxFhtUX0gl0KMHdBA4iICr
	I24VP6PlFgNcAb0x/KqsU53lDh6EV9InIaEUlfWuf/9wIIuT08LKmVr8eGbuOeJxENm5rJe5FndZT
	pTxzvqwR3l8UnkQXbJfH1zWlVP37sP26n0a4EcjUuG3nO/Va9o/tamYLF4iXvGG01zHrBX+dtBM07
	zy46caeSg8DiFdu6hKnokrpaxomkl+RbOVXSY4PsRn5ACAbfl+nX7WU0NiRo0TRctKjMEClMapRiJ
	7IzB34ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA1e-0000000HCJk-1G2T
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:55:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA19-0000000HCIt-420n
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:54:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IaWqE008687;
	Tue, 4 Feb 2025 03:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aJyJcuP119WmaSVesxA87WNqjtRvg+EFnMREFJQ9kk=; b=mLqocqq9N0oUKUVD
	NqD1fjAVl2psib7C2yK66ubuDrawAN9lb36ymPTPIWgo6SvbJfRzURkHUbElgMAe
	eeawOka+zbtlXdOodiFP4Z+TjSNdEDEbDQCDckNwACg0tYa3m3fASvdepNHko/j5
	yHd/BESybhXPrDOJc+6MU9hJ3D6NuP1x2v800E7laMVcDRAEw5NQ/r5TdT0RyV+I
	cQ798lAKlMfKtyNkZ43AmVEirSBRUUlNNiE5lKqob2rU60L0ImwDpqUeHIEbjCXZ
	riFpx7GQ53x9qgYEXPXyBj3Q7qL5MNY0Lb4a4Wy8cNvMB2ReRT5VbnBt+9V0Ldyq
	j170Eg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k37u10cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:54:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5143sUFS015498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 03:54:30 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 19:54:28 -0800
Message-ID: <88fd703a-75e3-1d47-79d6-313c0c56e036@quicinc.com>
Date: Tue, 4 Feb 2025 09:24:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 0/9] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
Content-Language: en-US
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250204035022.3227100-1-quic_periyasa@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <20250204035022.3227100-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ykkp1ArRO4qCqcGQTGNTngs6SyVlaEhr
X-Proofpoint-GUID: Ykkp1ArRO4qCqcGQTGNTngs6SyVlaEhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=976 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195432_118796_99C6763E 
X-CRM114-Status: GOOD (  13.88  )
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



On 2/4/2025 9:20 AM, Karthikeyan Periyasamy wrote:
> Currently, peer extended Rx statistics are not supported. Peer extended Rx
> statistics are collected form the TLV data reported in the monitor status
> Rx path. Therefore, add support for TLV tag parser handling and debugfs
> to configure and dump the collected information. Additionally, this series
> does not impact the WCN7850.
> 
> v7:
>   - Rebased on ToT
> v6:
>   wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>   wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>   wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>    - modified the return type as void
> v5:
>   Removed the patch "wifi: ath12k: Add EHT rate statistics support" since it
>   is already merged
> v4:
>   wifi: ath12k: Add peer extended Rx statistics debugfs support
>    - fixed the kernel test robot noticed build errors
> v3:
>   wifi: ath12k: Add peer extended Rx statistics debugfs support
>    - avoid ext_rx_stats filter overwrite in default filter setting
> v2:
>   wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>   wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>    - fixed the length calculation in the EHT radiotap procedure
> 
> Balamurugan Mahalingam (2):
>    wifi: ath12k: Add EHT MCS support in Extended Rx statistics
>    wifi: ath12k: Refactor the format of peer rate table information
> 
> Karthikeyan Periyasamy (6):
>    wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>    wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>    wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>    wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
>    wifi: ath12k: Update the peer id in PPDU end user stats TLV
>    wifi: ath12k: Add peer extended Rx statistics debugfs support
> 
> P Praneesh (1):
>    wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV
> 
>   drivers/net/wireless/ath/ath12k/Makefile      |    2 +-
>   drivers/net/wireless/ath/ath12k/core.h        |   10 +-
>   drivers/net/wireless/ath/ath12k/debugfs.c     |   97 ++
>   drivers/net/wireless/ath/ath12k/debugfs.h     |   21 +-
>   drivers/net/wireless/ath/ath12k/debugfs_sta.c |  337 ++++++
>   drivers/net/wireless/ath/ath12k/debugfs_sta.h |   24 +
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 1033 ++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/hal_rx.h      |  433 ++++++-
>   drivers/net/wireless/ath/ath12k/mac.c         |   18 +-
>   drivers/net/wireless/ath/ath12k/mac.h         |    4 +-
>   drivers/net/wireless/ath/ath12k/rx_desc.h     |    9 -
>   11 files changed, 1924 insertions(+), 64 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.h
> 
> 
> base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9

Ignore this series, missed patches

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

