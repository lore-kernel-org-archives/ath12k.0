Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BA2C47258
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GIrl/SmW4ZjjHE6j7O6SjR+Wue61KRzdfe3ijAPxjw=; b=0J4Nr8ZW9sORC7ZLBFUEs9fhGH
	ql4Na8lRPZYf5TT2o1xta4Yh9NkIszgWc6vFlGUhMF+Rv1CpVvZVJknHWcR6PHKQyaQq+DhOrTfVC
	3zaqG713bkwaDEMHa8qWBecdGjHEurgYN0gUJX5GDZ/h5ApBJh7P0gjNajk96zn4TL+xgJjWGcVAu
	hcXpcahXP8C6WANwyLmNT4xhZIm0C/owBVhALs2VPli+SbjDQZ4Nc9J73gHbBmwY+g8BjRbXP4siQ
	4w+KnfAPlr/Sv67FNv3DN/9f+zV/kzz6wN4Om7u7/xcpVrns5JveX4kCBxvS3kaufECAq45fAEqK9
	s96IO2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHna-00000005R3r-2D7x
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:07:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHnV-00000005R3B-3fD0
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:07:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VJOeKe010853;
	Wed, 31 Jan 2024 21:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2GIrl/SmW4ZjjHE6j7O6SjR+Wue61KRzdfe3ijAPxjw=; b=Iq
	f6BJpD4YpEtPASSWwvDLAcBsoVrs5tQMLcMlo+qjPDz4y/S6zwKVKDcjNgq+15fd
	AtO+X3xnJm6dVMmQxHOIKq875wBrnzKqzkxJ3tZgtu/McBWJ1ZMg0N6mXpYZzASp
	ufB/aSQFRn3eM0r7KeidIDVv2yG7++Te73EmMLge+G7nbzhpS6Vtn7D4i//g6QqU
	qZKIS7I7maxZGIHZrbUfwf1YDb+Q/2C+LNX6cq2TTWsEu98xIqPxXVFYFDe4/wKG
	wyqkuTrr4CMLoy7OkYvourME3EWyiDvxMrZ+dY8V/qCmsqE1hkIxIdJwV9RL14zO
	Fz+yuc7yWkyJ47VV81dQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyvb5g762-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:07:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL73RR032544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:07:03 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:07:03 -0800
Message-ID: <8f764296-4920-47ef-a361-91748ed72d59@quicinc.com>
Date: Wed, 31 Jan 2024 13:07:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] wifi: ath12k: split hal_ops to support RX TLVs
 word mask compaction
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-8-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-8-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Gx4XDesbJNwNu1dVbhF02RUN-jH4GstG
X-Proofpoint-ORIG-GUID: Gx4XDesbJNwNu1dVbhF02RUN-jH4GstG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=911 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130706_068148_56337E1F 
X-CRM114-Status: UNSURE (   9.62  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> With word mask subscription support, the rx_desc structure will
> change. The fields in this structure rx_desc will be reduced to only
> the required fields. To make word mask subscription changes compatible
> with the older firmware version (firmware that does not support word
> mask subscription), two different structures of rx_desc will be
> required for the same hardware.
> 
> Most of the hal_ops are directly related to rx_desc.
> 
> Hence, split hal_ops into operations that are independent of rx_desc
> (hal_ops) and the operations that are directly dependent on rx_desc
> (hal_rx_ops). These hal_rx_ops depend on both hardware and firmware
> hence move them out of hw_params.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


