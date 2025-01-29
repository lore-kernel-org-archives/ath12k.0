Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B63C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 06:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzfkWxJreF6ssp14Jtt9vtY84vRD3ibtf97KEMPqF8w=; b=YTq1jA15SHZEvFxf6IQMLhNraD
	6jUa3JXgix4WHpzAT45BJ5w8EpuDVP9Q1/c49vc6/ccjeaZ4DxijxHXmkyGO36QgsAW7RKfNEg1gv
	kaQ/7OdngbKI+ov5EWOePwqlFp91MMglHXCrO4akQim1mtwEeAZfmgkjxl+b7GJuevPTUb5ZcbmbW
	EX3uBN4OtSXW5wtD4ygPjZGvHM3OZ4UnLIveyeusKsAFXK2UvixdE5B5iROzU24cLRj5nn+78o8TI
	HLObmlX3hg9yDkYz39XfGwHCdkkEZ/9ZsHBTb8s6o+I1aoiVy/3tqcfcfZ3yON02iO50fq3qghzgc
	9VfQi5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td18k-00000006NdJ-1q0E
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 06:01:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td18h-00000006Ncu-1YWS
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 06:01:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2sNkl021406;
	Wed, 29 Jan 2025 06:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzfkWxJreF6ssp14Jtt9vtY84vRD3ibtf97KEMPqF8w=; b=YwAc9U/rk8xoNy2c
	pkY3vIOr+AMRc0orYDcaC/dNS05WNA11jUpW+bVlr8y72e1J29OFwAH40f8OIzkx
	k6gc8s1m3x2mP7FC+jYJBuSJyCYGn4FtBlyNFR7WQNo76qd/EQZ5felrRm8kB12e
	7/4p8egFa4guKp+jJLgH6bnxIDNAlBCfB7lpTuAcn4THtM4nonlbJZO3F8KNhXg5
	2ej3P7j8MlrWqSAsMMIkXdG5bAzLTKYuSxLGoDEIQjXpDUAMrs/8Qg2r3NACaHj6
	G2G9FmD5+N/vb/uUGFa91kXrTjo1WkRWiq39543Ql9yo7w8SQddKbsOglV3xu9rd
	LCuD3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fbxvg8an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 06:01:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T61FFd009996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 06:01:15 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 22:01:13 -0800
Message-ID: <f4cc8b0a-31ab-14ad-2687-7f25ab0baa60@quicinc.com>
Date: Wed, 29 Jan 2025 11:31:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] wifi: ath12k: fix link valid field initialization
 in the monitor Rx
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Hari Chandrakanthan
	<quic_haric@quicinc.com>,
        Nicolas Escande <nico.escande@gmail.com>
References: <20250127114030.43479-1-quic_periyasa@quicinc.com>
 <20250127114030.43479-2-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250127114030.43479-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3cwnBNPlPrDtxufQFB2O1Ad8aVqjMEV4
X-Proofpoint-ORIG-GUID: 3cwnBNPlPrDtxufQFB2O1Ad8aVqjMEV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=928 lowpriorityscore=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_220127_550697_A9D9C83C 
X-CRM114-Status: GOOD (  13.32  )
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



On 1/27/2025 5:10 PM, Karthikeyan Periyasamy wrote:
> From: Hari Chandrakanthan <quic_haric@quicinc.com>
> 
> Currently, the link_valid field is not initialized in the monitor Rx path.
> This can result in random values for the link_valid and link_id leads to
> undefined behaviour in mac80211. Therefore, initialize the link_valid
> field in the monitor Rx path.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Tested-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> index 7e679ce177d3..023715df1126 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -2001,6 +2001,8 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
>   	bool is_mcbc = rxcb->is_mcbc;
>   	bool is_eapol_tkip = rxcb->is_eapol;
>   
> +	status->link_valid = 0;
> +
>   	if ((status->encoding == RX_ENC_HE) && !(status->flag & RX_FLAG_RADIOTAP_HE) &&
>   	    !(status->flag & RX_FLAG_SKIP_MONITOR)) {
>   		he = skb_push(msdu, sizeof(known));

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

