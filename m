Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53024C4706C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08WVi6h6ejnrh4eCn/NLZ0wIGmpUNC9+sQC0C4MZ9DM=; b=uhC7yc8vqnXHV3wbAEgsBADURI
	4e2IZAyV6SrKAYamgY4e/LevV1Wj9G5X5rVj3l04JLLtXPRWi2IJ4Qm2KlnHpPy0qJFfWcJkO5f88
	lQ6s9+3QCSsbmcrlKxlC2CszO081NuC8ROviY8xR1GK2HrpMNM7Duj8URAgFZBVGCSW+tKQGQQViW
	Uh8fP2TfytZilM6nLacDpvVLekpkaeYDwqXWMuDXo6oFga1G0P+HaIwvpZ4zqdBLrJzYOjYUTKXxJ
	7A5cEpOpFtaK1Db8sSBqqliV0IvCxWbDi9ZGzixQEvGTi7qAN8y/zi0jmRQmT80doqvBPJTn/LFrR
	liszoKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKZ1-003LOS-01
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 16:39:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKYy-003LNp-1j
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 16:39:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CFTPAu029066;
	Fri, 12 Jan 2024 16:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=08WVi6h6ejnrh4eCn/NLZ0wIGmpUNC9+sQC0C4MZ9DM=; b=kb
	DyprdNQL5PacdVqs46vrr+uxerEUy2hGs972cKzGL3GGJAHHgcFi6tyU1J8qMfq3
	KS67wpMdDAcUSUXtWhwo535ZNpAy7S+m/QD2IcIPRwe+TWBUSWuLq0r7VSYOVDdy
	axFL9oXLsLzi5KFFsQ+FmCoeUuou6cfCdKDqSUV9w6XfJs/nn8L8HlPnjn2mqHt7
	e8wN+M+G03ZrIAnsW1avZf2wlyqxPqFdKg2SmhG+odhVgYyUmpakFgvNSw6o61zh
	4GfvjY/cDsNUG7Saw+3d+Ap1OhU3//omig9m+0bU2Hr2jFTNghM8jbOzELXLkpxv
	X6KXeDoJ/qgaTbDoGIVw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjxm61pqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 16:39:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CGdGKl012238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 16:39:16 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 08:39:15 -0800
Message-ID: <27cc1c3c-183e-4b6a-a844-2a0b900080c1@quicinc.com>
Date: Fri, 12 Jan 2024 08:39:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Introduce the container for mac80211
 hw
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240112024214.3481840-1-quic_periyasa@quicinc.com>
 <20240112024214.3481840-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240112024214.3481840-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E71rm-RDfAYTou8bdgILWPbd1Otrt0zi
X-Proofpoint-GUID: E71rm-RDfAYTou8bdgILWPbd1Otrt0zi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=731 clxscore=1015
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401120131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_083920_690753_B3663D5F 
X-CRM114-Status: UNSURE (   9.65  )
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

On 1/11/2024 6:42 PM, Karthikeyan Periyasamy wrote:
> To support multi link operation, we need to combine all the link/pdev
> under a single wiphy. This avoids the overhead of synchronization
> across multiple hardware instances in both the cfg80211 and mac80211
> layers. Currently, each link/pdev is registered as separate wiphy,
> tightly coupled with link/pdev/radio (ar) structure. To enable single
> wiphy registration within the chip, we decouple the wiphy data entity from
> the link/pdev/radio (ar) structure and move it under the chip (ab)
> structure with a new data container (ath12k_hw) structure. This approach
> improves scalability for future multi link operation support.
> 
> 		mac80211 hw private data structure diagram
> 		------------------------------------------
> 
> 	Now						After
> 
>  +---------------------+                          +---------------------+
>  |mac80211 hw priv data|                          |mac80211 hw priv data|
>  |                     |                          |                     |
>  |                     |                          |                     |
>  |                     |                          |                     |
>  |                     |                          |   ath12k_hw (ah)    |
>  |                     |                          |                     |
>  |                     |  +------------------->   |                     |
>  |    ath12k (ar)      |                          |   +-------------+   |
>  |                     |                          |   |             |   |
>  |                     |                          |   | ath12k (ar) |   |
>  |                     |                          |   |             |   |
>  |                     |                          |   |             |   |
>  |                     |                          |   +-------------+   |
>  |                     |                          |                     |
>  |                     |                          |                     |
>  +---------------------+                          +---------------------+
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




