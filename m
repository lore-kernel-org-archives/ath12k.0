Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6E9C02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0110w/5hEyoEkseqshvplOtl+V80g2OAplLpO2U9Uv4=; b=Xf/+KtTb0P91YiwqMWyb6/q5Z+
	mbVFDRsIwia+ksSS2MsbYnR6URBlCI1Nw4B7rKqmPL4ewk4q3KbxBDNH1E04bXtY/K8EHbgxVypi8
	H+JGsNbmvWP8Hu/KBac/NKuxKj+Pc0TrwI5LCqJTKxBDXo+gbWqff5UjaECQk3aYN8c65xQvau8QG
	P4P0Ekttkv3TuXfOpm/OAH1h7L2Dqx7CHQh2V9OktfV6W1lyrfzKim+UzOdngKrcxHULBG7dU9DrX
	syKfx1wQJI2mXeMmVPoANm1sXr8d6xcRJ4fy3Y/qglmHTGwPJotOJIicdrugbrAOLLuUQcWYAkaNO
	eq0t7RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBze-00000007gsL-2yUZ
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 11:00:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBnJ-00000007dwf-3dn2
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 10:47:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L9QgQC031220;
	Tue, 21 Jan 2025 10:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0110w/5hEyoEkseqshvplOtl+V80g2OAplLpO2U9Uv4=; b=S5VvWEMbM1aftGKd
	oAuWS9uaXQPTk8D5/OjybEBLOak6mUKfRLbnHM0Kc8A5KOgtfvSCF6lNWCsoQSKs
	JWvMBA9TXBz+ObvTf6TBLiQRHuqXrwMbyc/sBoPM6b2QerdPafFW13+gBTt0vbaU
	7cYrGQXOr8208Yr+jl26wxRO3jDSV4iSelB4Yw1vwEOLFtHb3vU7UOfHRiRNpj0D
	eWsV1reLGNj3wry1D70zN/lRlB78ymd9bku/i6yqm13k3s9SVgaVGyonYjPbc8u8
	VyNJdTftTPAnLVujGRPDCnWPhtGr7YYq3DWfRUtQFjMzMifbU2HvpI9G0xxdZ0oK
	4IWWBQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a8y2ga9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 10:47:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LAle5X026027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 10:47:40 GMT
Received: from [10.253.36.159] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 02:47:39 -0800
Message-ID: <f790e71e-9b03-474a-be21-5d9bfa71e593@quicinc.com>
Date: Tue, 21 Jan 2025 18:47:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250121091844.1987-1-quic_kangyang@quicinc.com>
 <20250121091844.1987-5-quic_kangyang@quicinc.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <20250121091844.1987-5-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ecHgHlF96YOyg6oZXjU3qVSIg0cx7CTY
X-Proofpoint-ORIG-GUID: ecHgHlF96YOyg6oZXjU3qVSIg0cx7CTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=823 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501210089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_024741_912481_82B3772A 
X-CRM114-Status: GOOD (  10.92  )
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



On 1/21/2025 5:18 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently ath12k does not send the country code to firmware after device
> recovery. As a result the country code will be the default one which
> is reported from firmware. Country code is important, so ath12k also
> need to restore it to the value which was used before recovery.
> 
> This is only needed for platforms which support the current_cc_support
> hardware parameter.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---

Please ignore this version, review v9.


