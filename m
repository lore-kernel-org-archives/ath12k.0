Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF95C25B78
	for <ath12k@archiver.kernel.org>; Wed, 22 May 2024 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaEW2RwChTqcSG2V2838+X9xoazzhKbh2gYoqTqXVE0=; b=Ru6hignkLaR/x8k6ZnpLnAsKoZ
	wO0GBfWmkmzqPnjwP3dKgJDxQs2V1Ia1NY46n+qD0kKDAGy/AG5Tb0m4AEXo6p1BV2oP+/Zf2EOcC
	+Kncnn3WXvP+TKudZOEgOD/LHCvECt62vd/E1lY7MTzVmIDLpe9S860u9G4oFMtsnr/Y53FDBjUTB
	H6N5lP36DCx7ymGCShbSBmxjiiPYSLehNJfFtoe+E6sIK7ZMLx3BlyIe+ggXr1Q8uD/PDQ7X87/1a
	jaUs3nawQIoJ7hck1baGRkifmSKYqbXnZgl8jVhSj0lKa2b6K4gmf0rCXQjW0fHvhARZ5oglqSVbj
	c3aZf5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9s6O-000000041bQ-2RTJ
	for ath12k@archiver.kernel.org;
	Wed, 22 May 2024 19:58:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9s6H-000000041ar-45as
	for ath12k@lists.infradead.org;
	Wed, 22 May 2024 19:58:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M97KEc011664;
	Wed, 22 May 2024 19:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NaEW2RwChTqcSG2V2838+X9xoazzhKbh2gYoqTqXVE0=; b=FF
	t0qZcGhbrgTIXH2bEyAC42AupLXmsE+57S/dMoCcU56IQ6fI61LnbYD41JUWCL3m
	dB2OyaTB3bXecKMNquoIVAFE6DlsMpWO9Ei7vroFbVwQPye6QP/OQNpfcdhWtslw
	pwCCFt+PcGiVK/V4Q0+mGNeqTaBBkwh9yrphDiyWnTUyFq11GLyDXztESCG98uI/
	ovu67l1jcDhkUf7AlPIsQLb/vZsjkVTSTpuaRuDwdjvz7ia6ogP2Tr7uh6n1kw0C
	KYiheYuIfWjfZdvdPonK8fsRbJaUQPpBUOQz4Y57n8E+o/v1fpWY7M8MvuKn+AaW
	7TlMsEtv2wbLIc9hnivw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pr2stsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:58:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MJwBoN030619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:58:11 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 12:58:11 -0700
Message-ID: <d981696e-0ce2-43c2-8877-68ead0743dd3@quicinc.com>
Date: Wed, 22 May 2024 12:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] wifi: ath12k: move ath12k_hw from per soc to group
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240522095439.2596989-1-quic_hprem@quicinc.com>
 <20240522095439.2596989-9-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240522095439.2596989-9-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e1iHA0LGAbCBbx9EAe9ylllYolk_H6UG
X-Proofpoint-GUID: e1iHA0LGAbCBbx9EAe9ylllYolk_H6UG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=968 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_125817_782428_DCF6528E 
X-CRM114-Status: GOOD (  17.57  )
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

On 5/22/2024 2:54 AM, Harshitha Prem wrote:
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


