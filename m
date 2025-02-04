Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1FBC02192
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfZsCyXqGKCet9CPOFT3EzVqBO5gkY3JAAt4RK6Vyos=; b=R58+y6bsz6frjdqO+VXs7tleY+
	2z9nUAV/s9VDIayakYlYoJDZ2RluECXcnLeZkzUJJXm76L2R0ksJnHinKE+EXLFzTVpkKlpBfqeql
	RHwR0r4ZZFcxWg0wfMNEFXk5iU0msSt15b+Q4PuMmWqKy3YB4w9KAC/R68wkOcBB5TF+xBQ2zEMaQ
	ZCFEMv6tFCSSPjZzqskNye5HVJ3UwvnFyCZb2Bi9mrWjdbPAFhs+QHvPSyOPXE/i48clLXAURVeSQ
	f88vUpgsRxRbnmCStMiLYmWGtay/D6NAmTCIP9IS1WnDna9DHdU+hoenfXalSAaW9ChfwX4Sf28f/
	7RuUaWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf9E3-0000000H90T-3s2G
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:03:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf9E1-0000000H8zQ-120A
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:03:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Bjv5021346;
	Tue, 4 Feb 2025 03:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfZsCyXqGKCet9CPOFT3EzVqBO5gkY3JAAt4RK6Vyos=; b=n+9/7H9akQe/WpUM
	gr5Qwf9XyVbjSzRB526dLkuthumICNJLdXC1NysdDUBfD7Eh7EWfHEZbM1Sur3Ef
	TEd39G0hRUy35UKwr3ew7UvqNb29B7ydVbmGJRt98b7NOYtPocjPox21nfMms5aj
	PcapgtO6AnL98Ae+qrquUNswhROJTgOxVL2s6pU473OySh97MhY9mHv3ffV3RiLR
	6dDmkwF97paDS5Rid+cXmEVO3AzJPV7fvu0Aa7s2RMF5B9tyUXu9gnIDXCyTiJa7
	OWnpZ6+G+g93RmufawtIrIvf9HoooYvHiErDFIkUF6gV19hXTipsZUI2W8/DnJgL
	OX08sw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k911g618-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:03:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51433frf032427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 03:03:41 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 19:03:39 -0800
Message-ID: <9a9bfc40-890f-3df5-55f2-5a6406c72463@quicinc.com>
Date: Tue, 4 Feb 2025 08:33:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 0/9] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250129105810.1094359-1-quic_periyasa@quicinc.com>
 <d96a5643-64c6-4bce-930f-f1651a09cb11@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <d96a5643-64c6-4bce-930f-f1651a09cb11@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DLFDknsgNkfYzEImH-I9A5Pl_3nmvtf7
X-Proofpoint-ORIG-GUID: DLFDknsgNkfYzEImH-I9A5Pl_3nmvtf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=952
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_190345_406519_CE417477 
X-CRM114-Status: GOOD (  12.19  )
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



On 2/4/2025 7:39 AM, Jeff Johnson wrote:
> On 1/29/2025 2:58 AM, Karthikeyan Periyasamy wrote:
>> Currently, peer extended Rx statistics are not supported. Peer extended Rx
>> statistics are collected form the TLV data reported in the monitor status
>> Rx path. Therefore, add support for TLV tag parser handling and debugfs
>> to configure and dump the collected information. Additionally, this series
>> does not impact the WCN7850.
>>
>> v6:
>>   wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>>   wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>>   wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>>    - modified the return type as void
>> v5:
>>   Removed the patch "wifi: ath12k: Add EHT rate statistics support" since it
>>   is already merged
>> v4:
>>   wifi: ath12k: Add peer extended Rx statistics debugfs support
>>    - fixed the kernel test robot noticed build errors
>> v3:
>>   wifi: ath12k: Add peer extended Rx statistics debugfs support
>>    - avoid ext_rx_stats filter overwrite in default filter setting
>> v2:
>>   wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>>   wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>>    - fixed the length calculation in the EHT radiotap procedure
>>
>> Balamurugan Mahalingam (2):
>>    wifi: ath12k: Add EHT MCS support in Extended Rx statistics
>>    wifi: ath12k: Refactor the format of peer rate table information
>>
>> Karthikeyan Periyasamy (6):
>>    wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>>    wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>>    wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>>    wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
>>    wifi: ath12k: Update the peer id in PPDU end user stats TLV
>>    wifi: ath12k: Add peer extended Rx statistics debugfs support
>>
>> P Praneesh (1):
>>    wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV
>>
>>   drivers/net/wireless/ath/ath12k/Makefile      |    2 +-
>>   drivers/net/wireless/ath/ath12k/core.h        |   10 +-
>>   drivers/net/wireless/ath/ath12k/debugfs.c     |   97 ++
>>   drivers/net/wireless/ath/ath12k/debugfs.h     |   20 +
>>   drivers/net/wireless/ath/ath12k/debugfs_sta.c |  337 ++++++
>>   drivers/net/wireless/ath/ath12k/debugfs_sta.h |   24 +
>>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 1033 ++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/hal_rx.h      |  433 ++++++-
>>   drivers/net/wireless/ath/ath12k/mac.c         |   18 +-
>>   drivers/net/wireless/ath/ath12k/mac.h         |    4 +-
>>   drivers/net/wireless/ath/ath12k/rx_desc.h     |    9 -
>>   11 files changed, 1924 insertions(+), 63 deletions(-)
>>   create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.c
>>   create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.h
>>
>>
>> base-commit: b5aeca2e66899430827b8afcad061201f3b7861b
> 
> Unfortunately some new debugfs code was promoted to ath/main and this series
> no longer applies cleanly. Please rebase & repost.
> 

sure

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

