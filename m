Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DA9D4921C
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02HxydhBRHmUHEDePO1OYsimindC+DrKNg1lGE0mEOA=; b=zKCcdPmWT4YuxciTt5HlK61N6X
	4wIVq3Xu+kw7Zlo3nd636kRodE++BiEumlj2JSymnPRem1aIqiqRYcbrYN4ApllGUVVu4EvSbIeXw
	4uT4efqRSr12K2SdTZ6I1HTVwISM50Xiy4KQxlu0VaihB0U3a5IDs0SDhlKHsXw34ORRx/kGWu4fi
	VqAr/C9kEO2IkZIIevHqJvjXtFhHeH+5ouqWeQqo4BkxIUicoHCcIRCo1CQl5ZHQQazar9WOHpG8V
	WMsDxcNiFLIXs/Fghaen10ay2Vb3VgKIBbzGTjCN8RBgAfuqBs8SKEI/ZUpHD7rhf36U7XF5Y1Eu1
	JCkq7wLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHLE-0000000BTyw-24TR
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 06:04:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHLC-0000000BTxF-1F5X
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 06:03:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGHJwM028646;
	Tue, 19 Nov 2024 06:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02HxydhBRHmUHEDePO1OYsimindC+DrKNg1lGE0mEOA=; b=A9NRl0MEnUphS9fC
	+D9aGy0TNST6+/uIaRNnkX2I1UKC8CutUblz+xMyYBK906ZY5EBizaCBk1tfVQ9M
	tsOO3yr9jPSF+Hh/QJqfAZwRLaL5cOM5wpr5Kt9hZHEngJQheQq6yE8a5Nw96pIw
	ySQaW/d5+y816sy2qI9V0EOpf+lW6u8Pulzn5KmzdiHDzBp4+Ga6lGivuIAGIytV
	uSsqLS/aOUP6CIYhVZQP3B7/Rsi4OCm408Amp717fUeoRKSe8KtXc0moJ90Twspd
	aQGPoZ9vw1WqNwYXQYgYLzFQKIQ2HwGniaCUtGKosRYYFhzj9gBgU/BBtCloq0MG
	IUJ4hQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6sk9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ63vtC010206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:57 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 22:03:56 -0800
Message-ID: <bef46f08-b2a8-4197-91e0-aa9727194fad@quicinc.com>
Date: Mon, 18 Nov 2024 22:03:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] wifi: ath12k: Change the Tx monitor SRNG ring ID
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
 <20241119003248.1579567-8-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241119003248.1579567-8-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zkHgpS6Cgrq-rt-rxZl3PUIOcv2nkKEY
X-Proofpoint-GUID: zkHgpS6Cgrq-rt-rxZl3PUIOcv2nkKEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=814
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_220358_340740_BBB5F6C2 
X-CRM114-Status: UNSURE (   8.45  )
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
> The Tx monitor SRNG ring ID does not align with the ath12k 802.11be
> hardware architecture. Currently, there is no issue since the Tx monitor
> is not enabled. However, in the future, the Tx monitor will be enabled.
> Therefore, change the HAL_SRNG_RING_ID_WMAC1_SW2TXMON_BUF0 SRNG ID and
> assign the correct start ring ID for the ring type HAL_TX_MONITOR_BUF.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


