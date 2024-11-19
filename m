Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A847AD4921C
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 06:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhpF2Bb0bvyGsJHV8rhghw89ehnvPLxevLX8kAIOksk=; b=yY1G1EXnhVHhlleaEO1GWBNe00
	Y5Z6q3K8EtuRLsZH4t0/hNMbItv0TfsLwc0dwcNTWZYBVAvvw1zLxcaTbJvB26CzBs+ej/2VbQ6Nb
	T4sZc+kjuMgVJ+e/cJPUEx+sOpZBz9oJbeqfnkEIpLFMHQ/IXQRTGo6WPWG33x1T9XrULwK8/Seyu
	utDP3Gum4qiE8y0AiO+I4Jk9+O87dZFzXxgm45IC5CX9K1d8GL8A86Mg+qDkg5AvofF6eCSWup8dv
	HSx2qUz22KiUazmJ0cVQjTakU1i8n9SOM++i51td7EibG27O6d7ZADOJlHoSGs+6or7OVXw1wMRP/
	PaGHZ93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHKx-0000000BTrX-2YoR
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 06:03:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHKv-0000000BTqe-2gvr
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 06:03:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGH3B9029026;
	Tue, 19 Nov 2024 06:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GhpF2Bb0bvyGsJHV8rhghw89ehnvPLxevLX8kAIOksk=; b=dMEX2x7kSB5FieQm
	EJPbl5rgudvNhBfUN48OM6SDX1A1U/s4Y+od3NgQFxCgK6fAC834GRPUQ5tqg5n9
	cHgTx4FMFDvC7YpuWXIXK9f8oGx9O3+B8k/DoqSw6aHCKGDSKUyFbURgYRFc7ioS
	561EDBtYTVU08hK4y+C80tEfMfc2/qKlIaGNxnC3YYCKY6+MZBI9t8mUXe9aGl3F
	LlWWS8lwPP9dyvRLemMreAiAA1GLfqG4ZobEJCZ9bFG+F3fZk0o5Pj46yvYnUxbN
	iRLXi+1oWVY025wLYP+krjVY1kVsXnfVsmBR5IsNTBbSt0novmBr8GKdsGhPdOwh
	Pteq5Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y81jbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ63e8h006875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:40 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 22:03:40 -0800
Message-ID: <66cd6940-fbc0-49c9-86d3-6a827338aee1@quicinc.com>
Date: Mon, 18 Nov 2024 22:03:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] wifi: ath12k: cleanup Rx peer statistics structure
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
 <20241119003248.1579567-4-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241119003248.1579567-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JGE504_uR7kHTNIRGR2TYbAcZXBHbGAk
X-Proofpoint-GUID: JGE504_uR7kHTNIRGR2TYbAcZXBHbGAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=760 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_220341_688737_77EF596C 
X-CRM114-Status: UNSURE (   5.70  )
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

On 11/18/2024 4:32 PM, Karthikeyan Periyasamy wrote:
> Currently, unused fields are present in the Rx peer statistics
> structure. These fields are already present in the same structure
> under the ath12k_rx_peer_rate_stats container structure. Therefore,
> remove the unused fields from the Rx peer statistics structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


