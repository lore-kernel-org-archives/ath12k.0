Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E173C3DA64
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mioISJehhtWtXAXFLAz+BflYe85ptWXAnSZ9obXoXn4=; b=JPzfve1iC1kdyWCTjI7mScNSqb
	FDhezAa4/GFWTFw7iGEo0tXOARy/31JHQNQNwL+/KFB/aDLaz3hYo+p+2BkH7LgVxFlkUchqJ5rdW
	iqx59p1q/g6vVC5MbsfzGmKSye9AUIiFsHN5hivpBWyhtadI+UktzpKGH3d8vMrn5d7OVNON0p3Pw
	qZm8E4g2ptNvJT9uKWfer+ozKguLTCdoSyokSVJ9McbcTsLPIe+vIznCV509xQKy2MLAMedURAg9H
	IvykjGFvcOrG1+RwF/zaKWsN9aKFxdEEZj94SwshdCKnv8unIqq5o6HAwnR5fcH3bNDQowU10CIWj
	+Dletn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDYZ-000000024Oi-46Xe
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 17:56:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDYW-000000024OD-3iWy
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 17:56:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VCXt6n031641;
	Wed, 31 Jul 2024 17:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mioISJehhtWtXAXFLAz+BflYe85ptWXAnSZ9obXoXn4=; b=W1S0iIlTAhMnlADq
	aRMQo4dvXcNILBSy6s8JsqI6/KRfD9NqG6wcLkdDuab0cCGcVBampQmPGvR4KT46
	fKq2h8pBob6BuJc+jqCiXL2pLrwm+rSyxTbB5lz7I9b0y/aCtV3QLGwpih1TnEXQ
	e/6yZWqRH8V6r7ENVwd9Rr5rswT0xzv5wzeD+TZ/0V1Er+dxQtpnp0d0paP+0sJE
	gJ4gJ0rGZNwulDvgtZ08l8+CD96oRUdas0ASVFBAx4+71DMhJek4j7kntUPugQTD
	kkTxiJbPKnv/XuaZc9YzDED53eKnVf7hw+sGkei14WEoyuVty+uX1IBa3mFgNNZa
	X9oZeg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mp8n4jgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 17:56:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VHu5mD030673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 17:56:05 GMT
Received: from [10.111.177.34] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 10:56:05 -0700
Message-ID: <6f47df34-3ae3-4619-b52a-1140f9a6e384@quicinc.com>
Date: Wed, 31 Jul 2024 10:56:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] wifi: ath12k: report station mode transmit rate
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240731113645.54738-1-quic_lingbok@quicinc.com>
 <20240731113645.54738-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240731113645.54738-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PREX3MicXtPtQPiMD0BP-4TItqYldgir
X-Proofpoint-ORIG-GUID: PREX3MicXtPtQPiMD0BP-4TItqYldgir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=852
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_105609_102928_9B03CFFC 
X-CRM114-Status: UNSURE (   8.06  )
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

On 7/31/2024 4:36 AM, Lingbo Kong wrote:
...
>  drivers/net/wireless/ath/ath12k/core.h    |   2 +
>  drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
>  drivers/net/wireless/ath/ath12k/dp_tx.c   | 134 +++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/hal_rx.h  |   3 +

My Qualcomm Innovation Center copyright checker reports:
drivers/net/wireless/ath/ath12k/hal_rx.h copyright missing 2024


>  drivers/net/wireless/ath/ath12k/hal_tx.h  |   7 +-
>  drivers/net/wireless/ath/ath12k/mac.c     |  79 +++++++++++++
>  drivers/net/wireless/ath/ath12k/mac.h     |   4 +-
>  drivers/net/wireless/ath/ath12k/rx_desc.h |   1 +
>  8 files changed, 227 insertions(+), 6 deletions(-)


