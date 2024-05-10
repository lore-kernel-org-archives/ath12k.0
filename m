Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A7FC25B74
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqvdwL1lGyFTJhFTb8pX9ppM6bMMO3rSKYSfSL6ORzI=; b=mVXzcRydnKSf3vv2JfJR5Ig8Kg
	O2UFxhhFaiGiVlC6r89gt3auGE5YijmMKq/ixcCfp6cMGsJ2WnUhSkguanwZs7IC40YGVdr1A/T41
	Ik67a6hR2U2+7VAgxO0og7Y7wfWS/LL14MtzccX7r1ZuYkQSVs/mdyTU0BLorIg0vQnowL2LdaGR0
	Ou1sT5yKNIaT1VYjos/Y7sUK9xTuGvJWsMNgyH5+bc43B8K+W9jLp5PgZTH3ckpA9jT5alAgjXuMu
	RLjVAHQ/5nYk4xgJIUFiYq3HH2X1Nk11Z7wROnrmwQAPbjrWuat5us7Fui2nWBeDbior+W0jFmRDZ
	cHTh2z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5WJI-00000006JiC-2sEh
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 19:53:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5WJF-00000006JhS-1bvj
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 19:53:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AD5lgw028344;
	Fri, 10 May 2024 19:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NqvdwL1lGyFTJhFTb8pX9ppM6bMMO3rSKYSfSL6ORzI=; b=Cd
	/owGugibYUKPfIs0n95Gb1Gscy0SKFxBbh/C7bNEjz8L9vcb2vMQf2CY+AJL0FBl
	bvZtmOe4wmS5jXNLKY37Xeoff6HoOYSWAMT3ohiXJTkmbsgPI4ryK2xGdyIN73Gi
	VB5J8GV3RUGfRo/uegSjpvMZoAdWczGZRm8HEZPl0O6wJ+uQbImmSM65wJu1ogOZ
	LAgKRw0WdfliqE8TdnkEqhq6BIvPPDjb4MHsKDAN2Ii8twhd9/NCZQ+n0wvIe0hO
	CD26RwEq6dab8Rlkl4/Pw5pDzrzTMEBAJ07jnJVq7iA+HPhF2HwGY1LgjMOQzLFs
	4anSiBQaqRH6uC6csHAg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0tetc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 19:53:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AJrZ2K020301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 19:53:35 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 12:53:34 -0700
Message-ID: <4735f493-e300-48b0-9113-93f5bff21b49@quicinc.com>
Date: Fri, 10 May 2024 12:53:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] wifi: ath12k: Add htt_stats_dump file ops support
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
 <20240510050806.514126-3-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240510050806.514126-3-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2VynYSMS_XHjBP6MVyAz4NXurPb-ZnIx
X-Proofpoint-ORIG-GUID: 2VynYSMS_XHjBP6MVyAz4NXurPb-ZnIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_125337_467686_3F80155D 
X-CRM114-Status: UNSURE (   9.34  )
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

On 5/9/2024 10:08 PM, Ramya Gnanasekar wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add dump_htt_stats file operation to dump the stats value requested
> for the requested stats_type.
> Stats sent from firmware will be cumulative. Hence add debugfs to reset
> the requested stats type.
> 
> Example with one ath12k device:
> 
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
>         `-- htt_stats
>         |-- htt_stats_type
>         |-- htt_stats_reset
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


