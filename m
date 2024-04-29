Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446B8C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 21:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSFpxn/BPcX4u9HeZTUoCyoNSd95G7IKLIlKXusGBHQ=; b=RKvH9gHss3a9dfRBs32qbc4eVG
	khmaAxmVw/eRp1EPl01MdVrYRAP/BCPrBXuKFrBPY2U2qNZM1f8RUFx/FAtHfxoDduSRurSbwz1jt
	KhVhOX2VeVyogHZ+zFOf2VFjBFQloVpRlLOXr7UMYqM9MGabK6PJHAeug/8GVyEDDtdCV+6HYfRcy
	v6eWBZbWtTc6HilWixpiTz0L1Tpjdc0ApdkPigLlJkG/XIWPAHt2/YkbmEehOkTKhuwNSbpM2uoxG
	QDUAO5nZbSHVAXrC7dl65/w2npY5uVyoMRLHkOd+4sdyp94LbC2c5P1MVXD+ixdEkBH/8yUQJEkfj
	sXZyJ1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Z0H-00000004K6D-41iR
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 21:57:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Z0F-00000004K5e-0xKj
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 21:57:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TL0Z86023356;
	Mon, 29 Apr 2024 21:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PSFpxn/BPcX4u9HeZTUoCyoNSd95G7IKLIlKXusGBHQ=; b=fv
	Cxg93Zz25HzZQB/BBgmHLP4LlH14CUK6OzsoupHt0+AngXfQWjGygawefwP8nlvJ
	XcCxw4GW3AmYU5vvHH1g02Rtgt1cscCCKA9P6cx6E3DniIXS+nNozGhqfbeCQGss
	A9rwi6/lN/bBM73etbw979+OMomo4gLOxDzt5+cKhbkJg3sQxTdeKWTugke8BfS+
	V9bDWs34pG6EqvFlWmyJ+B6+7NkqczaFJ2VWYMtcBsqSJ8stPpTBi5tz/QjWOOMy
	5V/EOiV/+Privglpx+TnkAsCicKvgOfrb3tOLiQrAMQT3KqAcocg0HZrEBj9KNLq
	qIqT/UuJoAFps/rbN2Wg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtd8kj3x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:57:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TLvZOa031493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:57:35 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 14:57:34 -0700
Message-ID: <ac9dc67a-8bfe-48d4-a169-99f2caca3643@quicinc.com>
Date: Mon, 29 Apr 2024 14:57:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 2/3] wifi: ath12k: Remove unsupported tx monitor
 handling
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429072039.711706-1-quic_tamizhr@quicinc.com>
 <20240429072039.711706-3-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429072039.711706-3-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AJU_EWjznHyeCaFc9AkTk0N7DXH5Wcnj
X-Proofpoint-ORIG-GUID: AJU_EWjznHyeCaFc9AkTk0N7DXH5Wcnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_19,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_145739_438476_84F0239A 
X-CRM114-Status: GOOD (  10.68  )
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

On 4/29/2024 12:20 AM, Tamizh Chelvam Raja wrote:
> Currently tx monitor is not supported in driver.So remove
> the tx monitor ring configuration, allocation and handling.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 40 +----------------
>  drivers/net/wireless/ath/ath12k/dp_rx.c  | 56 ------------------------
>  drivers/net/wireless/ath/ath12k/dp_tx.c  | 42 ------------------
>  drivers/net/wireless/ath/ath12k/dp_tx.h  |  1 -
>  4 files changed, 1 insertion(+), 138 deletions(-)
[...]
> @@ -498,7 +487,6 @@ static void ath12k_dp_rx_pdev_srng_free(struct ath12k *ar)
>  
>  	for (i = 0; i < ab->hw_params->num_rxmda_per_pdev; i++) {
>  		ath12k_dp_srng_cleanup(ab, &dp->rxdma_mon_dst_ring[i]);
> -		ath12k_dp_srng_cleanup(ab, &dp->tx_mon_dst_ring[i]);
>  	}

ath12k-check warns:

drivers/net/wireless/ath/ath12k/dp_rx.c:488: braces {} are not necessary for
single statement blocks



