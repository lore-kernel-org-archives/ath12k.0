Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8825DC4345F
	for <ath12k@archiver.kernel.org>; Sun, 28 Apr 2024 04:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xt4Uf4oJwlm3QuqdX8dENJW4GO2h70oxRsJ5WWmJkaQ=; b=odFVLFw2OQIzmbzyfP7Fb0zbaC
	bGxefxH2d9bK45OG1L4rQHqq8a6SmpG9RPs18cC31LKWZKmOQbBcAKpLz46NDHcy+GXruY1/ZmMox
	VNTWuCmJR71Wuz+PAUrId0N+3pXCHJzt2dag101/ZMxIB+AVjmio5cwkDFdqqGnh+wZQhedFnI7r9
	dnIU+laD7SXc/Lpb0QrG+292e8rtGmUryuXzs7WH2g7v9BS7cIBFmNfIs2nkz+awS4Edb8zntAkOb
	QPoIYFB3AGeKdzFzaAnwSRPY/b2wss7WTjWutg6Wg6APd6X21mE6GcvghNDXDiqLw1OX6RxslSsd3
	PC5+qFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0wcY-0000000Gq8J-14fz
	for ath12k@archiver.kernel.org;
	Sun, 28 Apr 2024 04:58:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0wcU-0000000Gq7Z-2d0O
	for ath12k@lists.infradead.org;
	Sun, 28 Apr 2024 04:58:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43S4q3NM017905;
	Sun, 28 Apr 2024 04:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=xt4Uf4oJwlm3QuqdX8dENJW4GO2h70oxRsJ5WWmJkaQ=; b=U6
	pymiwAx5znVSP0JaE1HzHzQux0rvVa4KoiYXMKcTwsxHQdVU3hq8Rm4qmjhNI20C
	NlZwbVTm0ur8aGFPl6i6jjMsvQxkeD6xhGN232CT11iqLjakOqOx01wP/bpGUn/T
	HZhmqIZ9Li/wcIQTgOXU3xR+jON7bHDriazZib5u60FIPONnqnxlyJ1ZxnbcbmOh
	UM3ijKZ5KfeHwsxTHM0TcG50auKWkNogTSwv6LDnP3dLHh/0d5EQIcX+YOJyWJtM
	JzteVBqNLssnXGHhv0rLfjwL4T0cLTyjm0PzCbj3u5rfrAlJx2r7mlROF8DkDNra
	GggwieqCzVpDqu/iLTog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrsk798vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Apr 2024 04:58:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43S4wUZI024525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Apr 2024 04:58:30 GMT
Received: from [10.50.36.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 27 Apr
 2024 21:58:27 -0700
Message-ID: <973d4ffd-055c-190b-065a-5804cd059e03@quicinc.com>
Date: Sun, 28 Apr 2024 10:28:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv2 1/3] wifi: ath12k: fix calling correct function for rx
 monitor mode
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
 <20240427162644.2470886-2-quic_tamizhr@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <20240427162644.2470886-2-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YdugQMLetX_4dgq2pFXz1NLPfKo__wWx
X-Proofpoint-ORIG-GUID: YdugQMLetX_4dgq2pFXz1NLPfKo__wWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-28_02,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404280031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_215834_749808_74C9C7EA 
X-CRM114-Status: GOOD (  12.98  )
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



On 4/27/2024 9:56 PM, Tamizh Chelvam Raja wrote:
> Currently in ath12k_dp_tx_htt_monitor_mode_ring_config()
> ath12k_dp_tx_htt_tx_monitor_mode_ring_config() function wrongly called twice.
> Fix that by calling ath12k_dp_tx_htt_rx_monitor_mode_ring_config().
> 
> Currently monitor mode is disabled in driver so the change is compile
> tested and boot sequence verified.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index 9b6d7d72f57c..2fb9fc42db11 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -1044,7 +1044,7 @@ int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>   	struct ath12k_base *ab = ar->ab;
>   	int ret;
>   
> -	ret = ath12k_dp_tx_htt_tx_monitor_mode_ring_config(ar, reset);
> +	ret = ath12k_dp_tx_htt_rx_monitor_mode_ring_config(ar, reset);
>   	if (ret) {
>   		ath12k_err(ab, "failed to setup tx monitor filter %d\n", ret);
>   		return ret;


Looks like you modifying in wrong place because the debug log 
information is not matching the rx message. no ?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

