Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C9C25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKvhM2KsP1CPn8UJOwwaRkdLOt3sclXUyfmhEi5+xI0=; b=PajnqbwsdpHxesq34UTnr1u+UK
	WBQUIucbO84xvvC8Gk/+BeQE20ca0TuXZAjHnVL5ItCu/xpHvxVXLTokjXCHuJ5NM3kvzWwvyEykI
	DnUUGaUlrGtRJkRysM9LHlxA7hQfpNVoXzHsY3n8FRKWcXkjENRbaQ2PilGAXKMjtZT2fG7wE/9iz
	1YrgNM8lPSISwjFDHp70W51R8LGSD0YVHltYNZqua+VU5FwpXcuiSm6q/RQW1UBGcVo7yG2G5KhTe
	3xCPoaL3mUPzGFZdvE1rniropvS9MQo3zt6bLx4GXAV70/cHbfrX6cNQ0MJSggnWGXYrzKtKjBv4X
	9kkxEsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5TcT-00000005xko-1ver
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 17:01:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5TcQ-00000005xkJ-1Jp9
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 17:01:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AF0Spf029589;
	Fri, 10 May 2024 17:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bKvhM2KsP1CPn8UJOwwaRkdLOt3sclXUyfmhEi5+xI0=; b=oI
	FlHJl2PlW7A8fPOAQtYMx0BBPzFKQHY3vhFOAYHd0xvVE7/c6bxHzbt23hVT2B0M
	0aNqs0f3cip3xKMhOdmMFRxAKLfttKnA+8B5SxQ23AaGa89qLoUQZGnYllunIHh1
	8c0dRit+dGZiDcmHKl4qqusqGaXp205Brn+G1i2YYp9a4AAG2I8m90/sbDCOkJlV
	EjfbtrncnCGbk3aflacHk/CHzzFmio/uQGmNyBBEwPDk1qksq5kL9B+BaBHnkjui
	BRa0jDHiZ3NcTSO3uV/UM9a0rT/oXcNM/qSih3F+/FhTrsIruqDNAN8oyoWmpVoy
	ucNgp2oz3+vLxx8qpwIA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w1a3c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 17:01:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AH1AGt003556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 17:01:10 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 10:01:09 -0700
Message-ID: <13d762da-ad16-43b4-b0ca-15e5e17af5cb@quicinc.com>
Date: Fri, 10 May 2024 10:01:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup
 Failure
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240510070427.206152-1-quic_nithp@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240510070427.206152-1-quic_nithp@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OkWJzsiKVG3Wt6YXFZPLAUbhrQ_VxsQw
X-Proofpoint-ORIG-GUID: OkWJzsiKVG3Wt6YXFZPLAUbhrQ_VxsQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=876
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_100114_400132_AE13E9E1 
X-CRM114-Status: GOOD (  15.28  )
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

On 5/10/2024 12:04 AM, Nithyanantham Paramasivam wrote:
> We observe intermittent ping failures from the access point (AP) to
> station (STA) in any mode(AP-STA or Mesh) configured. Specifically,
> the transmission completion status is not received at Tx completion
> ring id-4(WBM2SW ring4) for the packets transmitted via TCL DATA
> ring id-3. This prevents freeing up Tx descriptors and leads
> to buffer exhaustion.
> 
> Currently, during initialization of the WBM2SW ring, we are directly
> mapping the ring number to the ring mask to obtain the ring mask
> group index. This approach is causing setup failures for WBM2SW
> ring-4. Similarly, during runtime, when receiving incoming
> transmission completion status, the validation of the ring number by
> mapping the interrupted ring mask. This is resulting in
> validation failure. Thereby preventing entry into the completion
> handler(ath12k_dp_tx_completion_handler()).
> 
> The existing design assumed that the ring numbers would always be
> sequential and could be directly mapped with the ring mask. However,
> this assumption does not hold true for WBM2SW ring-4. Therefore,
> modify the design such that, instead of mapping the ring number,
> the ring ID is mapped with the ring mask.
> 
> According to this design:
> 1. During initialization of the WBM2SW ring, mapping the ring ID
> to the ring mask will ensure obtaining the correct ring mask group
> ID.
> 2. During runtime, validating the interrupted ring mask group ID
> within the transmission completion group is sufficient. This
> approach allows the ring ID to be derived from the interrupted ring
> mask and enables entry into the completion handler.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

should be
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Kalle can fix this in 'pending'

> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


