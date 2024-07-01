Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C9BC2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 23:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUBhcNEImxlod/dV7kan7xcxdhN5NaGpplFn9g+i3c4=; b=eJKloqhLs23oVPmOUbq4xAlJJX
	YHj9PLjlxTjkbPPRKkoTqqzLuK5qG86efUhreZvV5TiJL5I4vk3d0FSKvKlY/qMTOqp9G5gURwDRS
	7pMDOwRYh3jNfmtph2UJFMoD7h5PfieTwFVxjcIbDP0oiT4nyPOvLT/NMTKa9vC4pVzZSe2xnvx21
	0iFJVWh3fXjW7ddoUT2jUbRuAbqYKYwb9Qtsz8vuBumYqr0JHunzc9RnMfw4oRH8nXA+GKIAwRl+C
	OvgqRBqgH1fOwcAS9YyfyOUMAlU2nqJLWYgU6uYdMNDlh/csk6lEj9TM/E8USLgO7docjFjtcPHJ2
	yfy6+j1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQes-000000056LX-0xyv
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 23:42:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQep-000000056Kb-47oE
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 23:42:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461LPEgA028596;
	Mon, 1 Jul 2024 23:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUBhcNEImxlod/dV7kan7xcxdhN5NaGpplFn9g+i3c4=; b=chYDLryaZAhAdaPQ
	XULVO/dC4/edaV0ejj05z4XuRqhcH9dxjyivSTTtzJP43FzVXIfmxcdylYc+Cxye
	/eGags9YqcUbcOc518lNQ1g9zeBb39gcHtnVxTykZb0F617WpgrlNWPZQYqx6rEX
	0bivWPCvqYPXoMzVJVgRniy9ZhWm6ZmAtajzYWVqdeBC3yVHuVg6c86xASOoPtOE
	AfAbHoNHSw1uwoWT6lPWZoHVcFAXIq5pXEAMi4DqHorpMrUot818UdiKjPHLrTGm
	pN01SjbwXRQpSBzujH9QFZrFNZMK3q1lQJzIejUf5i0iDLw8wwyEiF9CZzUvJY7i
	OW3lnA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029kh5m9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 23:42:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461Ng1Vr004095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 23:42:01 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 16:42:01 -0700
Message-ID: <99f5c1d0-5586-4790-bda1-198cf7682472@quicinc.com>
Date: Mon, 1 Jul 2024 16:42:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] wifi: ath12k: Introduce device group abstraction
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
 <20240628095139.292952-7-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240628095139.292952-7-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qqECejiUXVjmA8LjmtcfbmLLDh062pcq
X-Proofpoint-ORIG-GUID: qqECejiUXVjmA8LjmtcfbmLLDh062pcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=778
 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_164204_194143_4DDC3ED7 
X-CRM114-Status: GOOD (  20.50  )
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

On 6/28/2024 2:51 AM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, single device is probed and once firmware is ready, the device
> is registered to mac80211. For multi-link operation, different bands of
> different devices or same device would be part of a single wiphy and for
> this, hardware device group abstraction would be helpful.
> 
> Hardware device group abstraction - when there are multiple devices (with
> single radio or dual radio) that are connected by any means of interface
> for communicating between them, then these devices can be combined
> together as a single group using a group id to form a group abstraction
> and register to mac80211.
> 
> The grouping information of multiple devices would be based on device tree
> during device probe. If no such information is available then a single
> device will be part of group abstraction and registered to mac80211 else
> multiple devices advertised in device tree are combined and then registered
> to mac80211.
> 
> For device group abstraction, a base structure named ath12k_hw_group (ag)
> and the following helpers are introduced:
>         ath12k_core_hw_group_alloc()    : allocate ath12k_hw_group (ag)
>                                           based on group id and number
>                                           of devices that are going to
>                                           be part of this group.
>         ath12k_core_hw_group_free()     : free ag during deinit.
>         ath12k_core_assign_hw_group()   : assign/map the details of group
>                                           to ath12k_base (ab).
>         ath12k_core_unassign_hw_group() : unassign/unmap the details of ag
>                                           in ath12k_base (ab).
>         ath12k_core_hw_group_create()   : create the devices which are part
>                                           of group (ag).
>         ath12k_core_hw_group_destroy()  : cleanup the devices in ag
> 
> These helpers are used during device probe and mapping the group to the
> devices involved.
> 
> Please find the illustration of how multiple devices might be combined
> together in future based on group id.
> 
>                 Grouping of multiple devices (in future)
> 
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
> In the above representation, two devices are combined into single group
> based on group id.
> 
> Add base code changes where single device would be part of a group with an
> invalid group id forming an group abstraction. Multi device grouping will
> be introduced in future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



