Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED0CC2BD09
	for <ath12k@archiver.kernel.org>; Thu, 27 Jun 2024 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pICYWE3wpqiwrbtuSRWAz7ScR72xLRh6auRUgkIKKg=; b=YreaYc79D0K9oeXvGIkEv+dd2Y
	G18tCElLkPjbTAwKOlI/VwOTZvxT/a5d9mfd6ayvekIFaHxwXv551y5LD8159QaZd6fByWI58vVcE
	gszZmnklgsdGu4R2cCJaAsd9DRwSy914n+Lyv1uu+MW3lUD7misuyp8WouZLmn+PBLIa67PHTYr0B
	Dfi9D2Xd5LMvCc0h5JocQG4bl9luEOmqUhehn0ZFo67fnctcGrF0lolvHlCGW5OjYxCQkCdYZ18Ec
	jUgOieHH0oFuGwYU4pgGJ/KLcFGAxaD7N0tVHG2lTiJx1ZygSurhaI/wdd6sTSCkU//1bInMpZFVp
	bR1y4sUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMskM-0000000BAid-10BK
	for ath12k@archiver.kernel.org;
	Thu, 27 Jun 2024 17:17:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMskJ-0000000BAhJ-0hmW
	for ath12k@lists.infradead.org;
	Thu, 27 Jun 2024 17:17:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RBe8mL023741;
	Thu, 27 Jun 2024 17:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pICYWE3wpqiwrbtuSRWAz7ScR72xLRh6auRUgkIKKg=; b=h3ZhHBvFbs332BG7
	xd6KpOjtFaFejjFtHT9yUKCtaER72pD6wfjmwrUtk+PqQgWwwBnWKJ/D9AkF1Znk
	jxYOnIA1IQ3tRYjSSEohcE6xqiBsFikrAgVocHMj/ir8FjMe0f2X/QcIjWwPHfZX
	WncYFAFcIXbauUDjTdYxh5tg2+Zx8JD+Cio/05y4JzNyMao/1Y+5pPmu6XzYMkzM
	yRe+dwA6ak5ajT9B0iHRlywzK5j5oI+DiLkeCqxeimvzXdpmKCQ5sNeLIgW3LYfO
	R7BQYOY0j7xAD8dZVwwGMVht2zJzaqpywvqwAeUiRsymjYkKMpeHnICqqXpnWz88
	yrUGxQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yw3fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 17:17:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RHHF3Y022643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 17:17:15 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 10:17:14 -0700
Message-ID: <d720c0e7-466d-43cb-b2f8-ea98e9d80117@quicinc.com>
Date: Thu, 27 Jun 2024 10:17:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] wifi: ath12k: Add htt_stats_dump file ops support
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240626085854.2500681-1-quic_rgnanase@quicinc.com>
 <20240626085854.2500681-3-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240626085854.2500681-3-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hq5532IQwCaVst4q9NMfcOQSqUMVQI7c
X-Proofpoint-ORIG-GUID: hq5532IQwCaVst4q9NMfcOQSqUMVQI7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_13,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_101719_380872_702AA113 
X-CRM114-Status: UNSURE (   9.55  )
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

On 6/26/2024 1:58 AM, Ramya Gnanasekar wrote:
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


