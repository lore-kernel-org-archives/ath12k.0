Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA4E7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 08:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hhw5FdPcylu7DJ+Cu9qntkjqgKQe/3tRzTHVwMP7nY=; b=UC/kh8QOJG/00+2GX/nDa5nKPN
	oKQfPQTqteXN+k8JcGK8TPYL/zR71EvwobryypKiQHpGQ6oxLLiL6nvqFkAcmBFBUfotkF2lkKKGc
	/ljYH09qVL5PcMIfXK6nTFnLSmY5i5cOGiRISy42CHZn/OJyC0t00rieOH9QQHmLxWKQ0Gsw0xw7u
	cJhfwpPAHYqOoS4F+bZ6VNYT8IFtkj9ed79aozwZG7fUgRwgc48ZZsMAZG+HltoYGdqtAuoYyGwDI
	vHsHm4WX9KRnxDmCeTEsmWTLAVhB0spKIyT6/ShzuQnY6LuxXclJ6jgONrG3qD1o+DMhNrED70IHT
	jDaOA33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFtg-00000004PMd-2Qnl
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 08:34:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFtd-00000004PMF-1oMT
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 08:34:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4WZEN007773;
	Mon, 13 Jan 2025 08:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Hhw5FdPcylu7DJ+Cu9qntkjqgKQe/3tRzTHVwMP7nY=; b=HdW/RfpAHeKchv3h
	QWV2+vJAt/jUWyzUtfyESIMM94K83MyvBneYfzpXvszgIJp1XWEgua6L6uCH529X
	1xF3a4iEEskKR/kRy6Bansc8YKA6shpesxC8UXL13aYZWIU7o9uFizqpC6OjTxSh
	Mz8C/h8uu6MDmJtaA3jBRuLJjM5ok54H6ZKc3TQSkn62ON8GPlKt5L3fwWe7Fq/y
	wmbET3OBRM1SKhs89dTSgPXraFKZNlrlJj1Uyx/VVtixbPfnaWFxV2OWZiaXilQP
	wdkKa1iMqo09MmdVblmtSRljF94hcMEPCTvAckIKqVZP71MPnAde4ibAE4PTrmje
	vaiI9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444uw6ggbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:34:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D8Y4XC020568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:34:04 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 00:34:02 -0800
Message-ID: <552fd4f9-7787-456a-b6d7-de7b96fa60e4@quicinc.com>
Date: Mon, 13 Jan 2025 14:03:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20250113071758.19589-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xTEorYVU1j_cS-LzgRL7_dK8WfMZZTgp
X-Proofpoint-ORIG-GUID: xTEorYVU1j_cS-LzgRL7_dK8WfMZZTgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=658
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_003405_480870_560558FD 
X-CRM114-Status: UNSURE (   8.51  )
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

On 1/13/25 12:47, Lingbo Kong wrote:
> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
> Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
> Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.
> 
> v4:
> 1.used tab(s) to align the = to match the existing code
> 
> v3:
> 1.Rebase again to 48322e474f04
> 
> v2:
> 1.use TAB to be consistent with existing code
> 
> Lingbo Kong (3):
>    wifi: ath12k: Dump PDEV transmit rate HTT stats
>    wifi: ath12k: Dump PDEV receive rate HTT stats
>    wifi: ath12k: Dump additional PDEV receive rate HTT stats
> 
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
>   2 files changed, 682 insertions(+)
> 

* drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: 2025 copyright 
missing
* drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h: 2025 copyright 
missing

No need to respin just because of this.

-- 
Aditya

