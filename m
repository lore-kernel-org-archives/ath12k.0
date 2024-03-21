Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6058C6FD1F
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyppWcS8kKRb9nHQUOI18piwOw0wpgn/8HwrGeFyI0g=; b=3v3Sy/ju+euc8cT3IgAHfSbPN6
	KLi8W17NpVKMPcPKLdepfmt1d596lmNS8Y7VEITsJGEywqOJU5jyJbT+GG/l/jJKsQHzlr9avPyG5
	xchQwGiCynsYxdZ1qRgjPPBfvzFNXczZkE4xSkY6b2jKndNZB146l/MF4LhAEJaWL4fFZCmsfQAkh
	P/r4hwBK/1rJrfYI9/Qmu4Gt85nuLH/koDlXlKjL/kQF9tbYCbY1g5O5/EjdoUQf1srdYgpM0WjHu
	9f5x1jRx92UOCwLt/xcskwox6l5VdtCQawo4uNxYD78LsBq7HJ8NDHPI/GO6WbtOPnRScdvV8IfBO
	ejG/vnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnPe8-00000004dAd-2Z6a
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 21:08:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnPe5-00000004d9r-2N9m
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 21:08:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LKc3Xv028083;
	Thu, 21 Mar 2024 21:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uyppWcS8kKRb9nHQUOI18piwOw0wpgn/8HwrGeFyI0g=; b=U3
	euUY3AJeEju5i/yGzcrlW7GxWKgWkRLs6d0dtXnw8QeRtdIHhCZBjqY5Eam2KnIE
	Z8a12PBFyWj7qcI2pcgX9mxxbrnzORgtz3t1m/5EWeRBGkPjp0A7LUJyiQ6WnOhZ
	hst/ndgzdiEtj44XRAJniPJnzW+LNvRVUXYJACle6/+g+xQjbnBHOJkJTEPx3kCr
	ivByE56zSSifQOLEUKV2ZpP6Dd6SzWRGZU2hrs6MwqgGIdfdGe3jzXuAj86cinLD
	yOUYrfzX4cg/8uIutuDsx3KcUKGD3oKfa3LMNi7lvBn54FPvUKlyAA/gZlANB68F
	jCjkCHq6UcqOyqBV7b6w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0trh8704-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 21:08:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LL8EfP016372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 21:08:14 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 14:08:13 -0700
Message-ID: <1a922799-6e48-44c4-9d82-850933aae81f@quicinc.com>
Date: Thu, 21 Mar 2024 14:08:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] wifi: ath12k: support get_survey mac op for
 single wiphy
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
 <20240320190943.3850106-13-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240320190943.3850106-13-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QVIG6JCXf52L-ZVUvEIvVIfMIBtJFfvS
X-Proofpoint-ORIG-GUID: QVIG6JCXf52L-ZVUvEIvVIfMIBtJFfvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxlogscore=786 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403210158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_140817_708429_F822C8CD 
X-CRM114-Status: UNSURE (   9.91  )
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

On 3/20/2024 12:09 PM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> The radio for which the survey info needs to be collected
> depends on the channel idx which could be based on the band.
> Use the idx to identify the appropriate sband since multiple
> bands could be combined for single wiphy case.
> 
> Also use the channel idx and sband to identify the corresponding
> radio on which the survey results needs to be populated.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


