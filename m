Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0721FC47DB3
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSmWxBVvc2xkcIX+gkx/UVrUWEErF1uF9lLFMiteliw=; b=R4+xLXVGAtD7e5ChLcnZtStrh4
	6/LjbuTetMtkmuhQnA2sdgVV6r+fe8MaBzy1Ldum8ZnD2ilznet84r8FNNXNeoMrSC5fEKf1qIzZD
	axx9jA6tMSPajJYxzkkhXriisjKLF9J4bzq5gcpQX3qTIhtrlUh/RcMN5xXwUqNqNnIrg8TdV4W2e
	zKDARt2fLOqiSsgctpTeNUWWzdcvWEFxeme03Sq96coDL6ySPDpCKRG9abXB0C9Fg4r7ORmShqNal
	yLvQ7+5GoAgqUTFzEACqXM7RpPlWHpqsf6RKY4j/fBqxi7JlmxgsuKovT+LJjzUPU7v+EPn1erYii
	guGTWeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHlA-00000005Qfq-2yHk
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:04:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHl7-00000005Qez-1RXd
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:04:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VKIWTu002947;
	Wed, 31 Jan 2024 21:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VSmWxBVvc2xkcIX+gkx/UVrUWEErF1uF9lLFMiteliw=; b=Fo
	vGJSHJR9BSy1xHAsRlsvM+Z5hTi1Q5hOkqvl0ClYGRdTVk44QxEaU+nCOrHc45HL
	x8cfljH2bfWHCeB6jmW57F2tfzg1mh9lxiJkHGYqMNHFmIH1xelBiHoqdMyeGSaN
	OKTG+BxyDJ8WFmM/ApiekunRiSuJXDfe09uT9Wi7XNHL1FIQKx0FKbejN5lUWzNL
	h3kjvO99SeuF+WWovhwXujcExQQs589ndh6TujIs/9kko8yFQfSJXUT9eOvnujj2
	xwvsQw697GAkgApBXe0eRaIT15bsx0MNyhj0XC1W2oP1XB/krDUyZr9Wipj2W5f0
	Vd4DHWQU5ECMsPxDQm0w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vym2m9jbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:04:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL4Yj3019901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:04:34 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:04:33 -0800
Message-ID: <8d804e28-603a-4f3e-b9ed-cbccfb16af50@quicinc.com>
Date: Wed, 31 Jan 2024 13:04:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] wifi: ath12k: indicate NON MBSSID vdev by
 default during vdev start
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-2-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gqSmUAxzGsR-2jPMg8DACjeEKjoQXEIi
X-Proofpoint-ORIG-GUID: gqSmUAxzGsR-2jPMg8DACjeEKjoQXEIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=574
 malwarescore=0 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130437_424591_809D0923 
X-CRM114-Status: GOOD (  10.65  )
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
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> When any VDEV is started, MBSSID flags are passed to firmware to
> indicate if its a MBSSID/EMA AP vdev. If the interface is not an AP
> or if the AP doesn't support MBSSID, the vdev needs to be brought up
> as a non MBSSID vdev. Set these flags as a non MBSSID AP by default
> which can be updated as and when MBSSID support is added in ath12k.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


