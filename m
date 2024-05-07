Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C927C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsKaPD6RPSR0w5SeJG2VRD4+aO19po0YddELXxlZHSU=; b=qnsRxjr4DJxt7ntxvxBk88qao/
	TL32y+jeAXu26s3W6iw6izdNCorW+PCJ++o+Xa66lV7dfpNaiLGuj+fLamj0FOg8rlZ/IhVOnQD50
	/usJw0zCwgDJ8mX7KjFTo1XklrO+mJ03c+ps/D+0kBioESZLa7rRLXsKJHxzMY1gQGseaML75XSKy
	7v77I23i/EbYAz3CaiWzdxYjup0F6riyY/P/1ZI0EXyaOYVZsnNPPuVegBXxoKgwMIgjXgeTynnxQ
	5RwSbMNtWYqCRNeL+CaVOHVFMl+BLfKSbxvYFw7NsHpedNCEi3uT8bhiDZ6gdRLWWOCjstdsVW2ZT
	qKK7DOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4D9J-00000009g0t-36K5
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 05:13:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4D98-00000009fvY-2pXF
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 05:13:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4471aifQ032375;
	Tue, 7 May 2024 05:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NsKaPD6RPSR0w5SeJG2VRD4+aO19po0YddELXxlZHSU=; b=I/
	qFILjfRU9RBlYwWga9YHuwn3IbIVvUkmGjS2dtX82/7MKnPusVM10dTCWOllAxro
	dmTDjFTsAmMYWuVdq5lwocmCOdYh71LvJT24gTw9I3Vf5EU9IxudBwWiYTLtoMO7
	eFXdrbBaiwsnbNcKme0EgBpK4Kza8mgTes3/ZYLNOZw7BpYXZ4YmiLHcNac1QiTG
	ZxYoZ4oyrbmvHUzbrMUyrfTYRZ51c49+UxOEM74UESQxFgV9DcS7LM4sWTT2Ta0B
	zphTlUwokuPDWJ316R1E8nTWfDB/XrgVIqhpltTqok4+RCyeV16TuloYErYTZZ9/
	nVsCQ7hR+a+3BE4E7ljw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xy15ehf68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 05:13:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4475Dhox014608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 05:13:43 GMT
Received: from [10.152.206.169] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 22:13:42 -0700
Message-ID: <e8fbf5d5-eb47-079d-2cab-835c1a5c8039@quicinc.com>
Date: Tue, 7 May 2024 10:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v3 0/8] wifi: ath12k: Introduce device group abstraction
From: Harshitha Prem <quic_hprem@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Harshitha Prem <hprem@qti.qualcomm.com>
References: <20240506173943.1747037-1-quic_hprem@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240506173943.1747037-1-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b7SIgUoQCnxLdyz4uC6fVMtHQ_JFMuEI
X-Proofpoint-ORIG-GUID: b7SIgUoQCnxLdyz4uC6fVMtHQ_JFMuEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=963 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_221347_007303_A8BDA6CE 
X-CRM114-Status: GOOD (  21.98  )
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



On 5/6/2024 11:09 PM, Harshitha Prem wrote:
> From: Harshitha Prem <hprem@qti.qualcomm.com>
> 
> To support multi-link operation, multiple devices with different bands say
> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
> an abstraction to mac80211.
> 
> Device group abstraction - when there are multiple devices that are
> connected by any means of communication interface between them, then these
> devices can be combined together as a single group using a group id to form
> a group abstraction. In ath12k driver, this abstraction would be named as
> ath12k_hw_group (ag).
> 
> Please find below illustration of device group abstraction with two
> devices.
> 
>                   Grouping of multiple devices (in future)
> +------------------------------------------------------------------------+
> |  +-------------------------------------+       +-------------------+   |
> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
> |  |         (Dual band device)          |       |                   |   |
> |  +-------------------------------------+       +-------------------+   |
> |                 ath12k_hw_group (ag) based on group id                 |
> +------------------------------------------------------------------------+
> 
> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
> device 2 has one radio (6 GHz).
> 
> In existing code -
>          device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>          (5 GHz) will be registered separately to mac80211 as phy0 and phy1
>          respectively. Similarly, device 2 will register its hw (6GHz) as
>          phy2 to mac80211.
> 
> In future, with multi-link abstraction
> 
>          combination 1 - Different group id for device1 and device 2
>                  Device 1 will create a single hardware abstraction hw1
>                  (2 GHz and  5 GHz) and will be registered to mac80211 as
>                  phy0. similarly, device 2 will register its hardware
>                  (6 GHz) to mac80211 as phy1.
> 
>          combination 2 - Same group id for device1 and device 2
>                  Both device details are combined together as a group, say
>                  group1, with single hardware abstraction of radios 2 GHz,
>                  5 GHz and 6 GHz band details and will be registered to
>                  mac80211 as phy0.
> 
> Add base infrastructure changes to add device grouping abstraction with
> a single device.
> 
> This patch series brings the base code changes with following order:
>          1. Refactor existing code which would facilitate in introducing
>             device group abstraction.
>          2. Create a device group abstraction during device probe.
>          3. Start the device group only after QMI firmware ready event is
>             received for all the devices that are combined in the group.
>          4. Move the hardware abstractions (ath12k_hw - ah) from device
>             (ath12k_base - ab) to device group abstraction (ag) as it would
>             ease in having different combinations of group abstraction that
>             can be registered to mac80211.
> 
> 
> v3:
>    - Removed depends-on tag of "wifi: ath12k: Refactor the hardware recovery
>      procedures" as it is merged to ToT
>    - Addressed the deadlock warning seen during rmmod.
> 
> v2:
>   - Rebased to ToT
> 
> 
> Karthikeyan Periyasamy (8):
>    wifi: ath12k: Refactor core start api
>    wifi: ath12k: Add helpers to get or set ath12k_hw
>    wifi: ath12k: Add ath12k_get_num_hw api
>    wifi: ath12k: Introduce QMI firmware ready flag
>    wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set to mac_register api
>    wifi: ath12k: Introduce device group abstraction
>    wifi: ath12k: refactor core start based on hardware group
>    wifi: ath12k: move ath12k_hw from per soc to group
> 
>   drivers/net/wireless/ath/ath12k/core.c | 433 +++++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/core.h |  87 ++++-
>   drivers/net/wireless/ath/ath12k/mac.c  | 108 ++++--
>   drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
>   drivers/net/wireless/ath/ath12k/pci.c  |   2 +
>   drivers/net/wireless/ath/ath12k/qmi.c  |  10 +-
>   6 files changed, 534 insertions(+), 115 deletions(-)
> 
> 
> base-commit: 2c4d8e19cf060744a9db466ffbaea13ab37f25ca

Kindly ignore this patch series. Updated cover letter in next version.

Thanks,
Harshitha

