Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A5BD591A6
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZT4GvFAoGUnibyAT5ItV79f0v+HsTjVlPi3muhSasc=; b=A7vmwB3YU2u87bC0pf7y+wa1vD
	YZFpjjhO/B73uTsCR4BP39RGxyD8Ny7QexNvd/kjRdr+9z4WQMiDgae5NCHLMMxmvB6rv2taVDY2x
	pEd2OUYBjEK/r+SLLJvmL6UH/IqmjbqgFGDP8QsyQyfAIBgkhwZXbQDkayp9O23n8t1bktjgXekGN
	r9iuJ7xgPfZcVv9YfNmCecHtBQNmRTt+0D/Xs4+BoM+DEpI4sCOx+FaiEJbmQOAnXfwCmCrhkgwxN
	80ecvoEz3L/cYof0i+/noZ0+ytYQxivTxiEp4/GaVqpFKdUAe5pTqEPxXHSY4Qe4J6RpW450rWfGn
	5qBV9K/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHLD-0000000BTy0-2OIi
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 06:03:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHLA-0000000BTwL-38tB
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 06:03:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGeTK004702;
	Tue, 19 Nov 2024 06:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZT4GvFAoGUnibyAT5ItV79f0v+HsTjVlPi3muhSasc=; b=mgRVgOaiRKcXIJza
	0XQOAdVqt3RJ3JyhAXgBhAu0goxFoOZAXQXDr0/Y49n11DnvcANM0f8rC99W3Gc/
	dulRmwMfda+uT2EBfyNsusP8/raArGn/+zGI8/JgJt0t6lE+jnIMPDrTYXGQCGLF
	cXvGz9nxMihi5ItC2KGe6xmdBixiSJM8h3oOX2FjTUDkTZtfISKnNFFsaWtZBPdy
	FNDDZyPvgN2oKHSqseRicAfP7+LZ6lrMQ9t9nvCpdJeYssvYecse6Tkl9eVC6Kkz
	Y5CmBLGBWN89g5zyLCvwvNC/yyGcc4jDhwAw0rX47TRIKBZIf9o3oR0QiQzZAxyP
	Mz+VEA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7sjy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ63sai012050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:54 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 22:03:54 -0800
Message-ID: <1b9ba031-5d5e-4eb9-b565-9bcc586c94fc@quicinc.com>
Date: Mon, 18 Nov 2024 22:03:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] wifi: ath12k: Remove unused HAL Rx mask in DP monitor
 path
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
 <20241119003248.1579567-7-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241119003248.1579567-7-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: omTKb3oqT3iJ1NYesQPYUFEe81dQroCb
X-Proofpoint-ORIG-GUID: omTKb3oqT3iJ1NYesQPYUFEe81dQroCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=703 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_220356_904877_76B9D4D4 
X-CRM114-Status: UNSURE (   7.02  )
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
> Currently, CODING and TXBF are unused masks defined in the HAL Rx monitor
> status TLV parsing code path. Therefore, remove the unused masks to
> prevent incorrect assumptions for code readers.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


