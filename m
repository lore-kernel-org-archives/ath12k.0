Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C5C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rinhOYxPbeUtP98TRNY7Po0KWhqCod5fOaW9iO+6Mx0=; b=C5T3HqkBSsKjvfHSFPdRu/wbff
	isGhzsZYDAhH3oZp+5kDILY2t5W1S8Ch/0ZrQP1CBTQVTbi9d9DxGcYb40VTTYo7YIswXp3V1/NkE
	68xCsjbNDCo6PcGRbyCDU+3PHrhsh63LK6Fh2ldn9WT6IjJBw+iBB7+J8SBi9EKxoc2lyNMNZeVVV
	thly5/fVEAVepXZ69aDma0zG3oGU7XGhlu6DzFvsocXoYgutyR4Cc3hAdeA3hHGERSy3sYpDdP4Xq
	uJe4gSeEzKwHBQWTCWAhKz3VHGR6A9+q071Glfcw4Ori//MzgbUbpu8o/FdB0dUHp9zWy7y2riaaj
	MmHapyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06pG-0000000AI0B-1boj
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06pD-0000000AHzE-2zqq
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:40:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PI9gv3016114;
	Thu, 25 Apr 2024 21:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rinhOYxPbeUtP98TRNY7Po0KWhqCod5fOaW9iO+6Mx0=; b=Ju
	Cju+Y8G9Vlfg1+aTBnXB7gmIiCu7x6zzaw0fJYrfaX+0xfLg2LcrlkA327srPgSE
	BDWIvWZF/eUd3zkQ3JvuVwYJAaSZxNdWj53a2jBICZs8gPE+WMa4sUS/AC+okMAV
	MwjoYsl+UPN1vRuEUbVbiddouKSqDIAYG63ThykoZukw+TrjYw1X5ZJiUzfAXK6Z
	wHaZTX98l2rgb0wZ41O1teyjdwJOGmkNVvVFpjCWRe71qqSOc1n8+P+8CoXTRF0B
	vRie96WUsB69r/LANe0oTVeeikUY3eoVxAJMr+KqSteKPHrDPsJ6/2FkPFvrnRSz
	ALhFVBojfiUZ2gGo0GGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqengksrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:40:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLeE5r010980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:40:14 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:40:13 -0700
Message-ID: <a02ee04a-23af-4103-bb0e-2b989a59342d@quicinc.com>
Date: Thu, 25 Apr 2024 14:40:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] wifi: ath12k: move ath12k_hw from per soc to group
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <20240425055759.1181165-9-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425055759.1181165-9-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v_mNK48RAJIXyHq1Qzp58ILt4XEeib5D
X-Proofpoint-ORIG-GUID: v_mNK48RAJIXyHq1Qzp58ILt4XEeib5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=934 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_144015_812462_F455B26A 
X-CRM114-Status: GOOD (  17.97  )
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

On 4/24/2024 10:57 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, hardware abstractions (ah) of different radio bands
> are tightly coupled to a single device (ab). But, with hardware
> device group abstraction (ag), multiple radios across different
> devices in a group can possibly form different combinations of
> hardware abstractions (ah) within the group. Hence, the mapping
> between ah to ab can be removed and instead it can be mapped with ag.
> 
> Please find below illustration of how mapping between ath12k_hw (ah),
> ath12k_base (ab) and ath12k_hw_group (ag) is changed.
> 
>         current mapping of hardware abstraction (ah) with device (ab)
>             +------------------------------------------------+
>             |  +-------------------------------------+       |
>             |  | +---------------+ +---------------+ |       |
>             |  | |ath12k_hw (ah) | |ath12k_hw (ah) | |       |
>             |  | +---------------+ +---------------+ |       |
>             |  |                                     |       |
>             |  |  +-----------+ |   +-----------+    |       |
>             |  |  | ar (2GHz) | |   | ar (5GHz) |    |       |
>             |  |  +-----------+ |   +-----------+    |       |
>             |  |          Dual band device-1 (ab)    |       |
>             |  +-------------------------------------+       |
>             |    ath12k_hw_group (ag) based on group id      |
>             +------------------------------------------------+
> 
>                 After, with hardware device group abstraction
>                 (moving ah array out of ab to ag)
>             +----------------------------------------------+
>             |   +---------------+  +---------------+       |
>             |   |ath12k_hw (ah) |  |ath12k_hw (ah) |       |
>             |   +---------------+  +---------------+       |
>             |  +-------------------------------------+     |
>             |  | +-----------+     +-----------+     |     |
>             |  | | ar (2GHz) |     | ar (5GHz) |     |     |
>             |  | +-----------+     +-----------+     |     |
>             |  |     Dual band device-1 (ab)         |     |
>             |  +-------------------------------------+     |
>             |   ath12k_hw_group (ag) based on group id     |
>             +----------------------------------------------+
> 
> This decoupling of ath12k_hw (ah) from ath12k_base (ab) and mapping it
> to ath12k_hw_group (ag) will help in forming different combinations of
> multi-link devices.
> 
> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
> device 2 has one radio (6 GHz).
> 
> In existing code -
>         device 1 will have two hardware abstractions hw1 (2 GHz) and
>         hw2 (5 GHz) will be registered separately to mac80211 as phy0
>         and phy1 respectively. Similarly, device 2 will register its
>         hw (6 GHz) as phy2 to mac80211.
> 
> In future, with multi-link abstraction
> 
>         combination 1 - Different group id for device1 and device 2
>                 Device 1 will create a single hardware abstraction hw1
>                 (2 GHz and 5 GHz) and will be registered to mac80211 as
>                 phy0. similarly, device 2 will register its hardware
>                 (6 GHz) to mac80211 as phy1.
> 
>         combination 2 - Same group id for device1 and device 2
>                 Both device details are combined together as a group, say
>                 group1, with single hardware abstraction of radios 2 GHz,
>                 5 GHz and 6 GHz band details and will be registered to
>                 mac80211 as phy0.
> 
> Hence, Add changes to decouple ath12k_hw (ah) from ath12k_base (ab) and
> map it to ath12k_hw_group (ag).
> 
> Refactor the following APIs to help simplify the registration based on
> ath12k_hw_group (ag) rather than ath12k_base (ab)
>         * ath12k_mac_allocate()
>         * ath12k_mac_destroy()
>         * ath12k_mac_register()
>         * ath12k_mac_unregister()
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


