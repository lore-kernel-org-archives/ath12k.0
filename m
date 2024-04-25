Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB008C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnRbJXSxeNX8PopLX+osZshnJCS8R10BWeACc7pKCPk=; b=FXdm84I626r3j4LqmCO/LOTJC/
	nHg5v5qguVe3fxHbXUhvR3MrapK4KLe9a/Vcdk/mLve347kT5iue3eyzohf2wEQ4tkk02GIt6kvjg
	n6bZ1AQs+kKM7dxL37rcm4hvipT5h1VrPEumCmsc8NpmTTqaZagxUSRGuhCD7RNLiTDJRc48C4oen
	1e2fiKLaKvvJU8gtRknxb2Tq2avzbwWb3UeBzX+rJu+wr0Up1GaCU4k+8bI9X/U/WJOoaD4VpQN83
	P9QLMNLu49AYS8R4ZG3uzkbttc7megeCTYpuFCEN3apouJ/jpWwL2okQKKZ9wNN292nvp2V355ONr
	uaFim1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06d4-0000000AFrY-22Rv
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:27:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06d2-0000000AFqn-1MC0
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:27:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PLOaZO021753;
	Thu, 25 Apr 2024 21:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EnRbJXSxeNX8PopLX+osZshnJCS8R10BWeACc7pKCPk=; b=d9
	6MU8ot+xcPtlBLDvIympZae28P/P/O8gjNbMTCuaGC0GwARmLZGoxjwn8LKsgupC
	Vyx5GciuZrUE8EjPEbaNSy4BwDGi+OciALvsQVCfxf9uBqfOX1qulPz4z8Ss6pc6
	abHsDiNv6Wy9fzf/UkthT0x0n+lqlBGRfcM5OFjSTVZLFewgWR9jiERgADT1gDmQ
	+tzT7EPAUt/EY0ck6Vlg7D7Bti2ZheB752YUo3sEDsKAZC23bHjLn5kFjOsJDwIh
	/NFPXJ0B0Q+jhNvmat4XgET+j9gbO0uRR/nnhVrc5hMoXBiCXbp+cXsDSEYV5YHp
	GYmiyt4LouC5pCGfU33w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkkqwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:27:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLRcZt014449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:27:38 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:27:37 -0700
Message-ID: <65dc71bf-3385-4bef-8a4f-955457734e1e@quicinc.com>
Date: Thu, 25 Apr 2024 14:27:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] wifi: ath12k: Add helpers to get or set ath12k_hw
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <20240425055759.1181165-3-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425055759.1181165-3-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: od0SGSRxx1EL-rzRTHdYDTbYIZoLCeaW
X-Proofpoint-GUID: od0SGSRxx1EL-rzRTHdYDTbYIZoLCeaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=611 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_142740_512747_9EB5F680 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
> Currently, one or more ath12k_hw is part of a device (ath12k_base) but
> in future, it would be part of device group abstraction (ath12k_hw_group),
> i.e., when multiple radios (ar) across different devices can be combined
> together in a device group (ath12k_hw_group).
> 
> In order to facilitate the above transition, introduce helpers such as
> ath12k_ab_to_ah() and ath12k_ab_set_ah() to get and set values of ath12k_hw
> respectively.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


