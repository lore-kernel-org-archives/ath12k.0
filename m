Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BF5EB8FA5
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 05:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mb2eCJ1G7hrkrvKqp9FDgKvXzPU6mhzufjD70C4M+Q0=; b=b3u7iNfBawj6sP0ZvBMXv+6/WD
	UAofk20x505S9Tj7EF0MbpjJJY4pnl9Ia+2vYH4lSzYdFu+0aq1UFYy4/ljmBSjIz+TKbxHeyrj63
	sxUovlNweSwaWDBSESE/l3b1QiYN/d0gXZoTIPQBy4r3mlrFik0At1DNoSTaVjM4VUf/Pt0+7Znm4
	w7xKdpaOPT5lXJnAu6VOI5AMK0Izd5uXpDdbkqaSGK8YprohDtNW6RaiVRnajp/oXrlckNBAP+sCN
	8F1zm6CC6Jo2uAD0KD25xSQ7kNHlNZjqS1PnRgOZFxgc8LR8oe0lF05TY3EdNXTNjrMqsrg14wNQU
	mS0ppbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkeR-007GdY-0g
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 05:00:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkeN-007Gbp-0Z
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 05:00:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3864ehYO012581
	for <ath12k@lists.infradead.org>; Wed, 6 Sep 2023 05:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UpW8obS2k2aJCEIo917btK9lPt+oAX9vFWu4pWz60p4=;
 b=dcz0k53AP39VYnA0dKvCFd/PmbB1aDbEoQuKgvXOR9h+l1I6/Rrz4TCrRPpVPAf2XvRu
 6UgidLRIoa7sdSIZfKZuAAtkBoccG2D3Pr0aq9VsiBbW38eT2NYzNXgF6ofzxz74WwUv
 DNg+B1XWwUNGI14Cg5w07GvMz20Q4RQH7kQbA6UGdZN5M9SOdsdVvuwPE6MLJWJ/iwLP
 aBhbyRXLcDFnyKa+qX+SRYnJ+qHF+6DC6ito9NBzgjie0fqegxJaPAg4vVFPD11s0wym
 BlcB9asObHrt39a6FtuYAqS54IB6+m4yiBTJaFT/9XLPPzXzWJTMeFAWqi1CjCZrwg8y ug== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxhbhg5j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Sep 2023 05:00:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386501c1026550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 6 Sep 2023 05:00:01 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 5 Sep
 2023 22:00:01 -0700
Message-ID: <5b33c223-5781-4f72-84a0-bd3f228036d3@quicinc.com>
Date: Tue, 5 Sep 2023 22:00:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Set default beacon mode to burst mode
Content-Language: en-US
To: <ath12k@lists.infradead.org>
References: <20230905213943.12275-1-quic_sidhanta@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230905213943.12275-1-quic_sidhanta@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rNQBn4JedZojfB_W_hu2Tom4imkK-H6p
X-Proofpoint-ORIG-GUID: rNQBn4JedZojfB_W_hu2Tom4imkK-H6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_220023_228301_0EB40C1B 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/5/2023 2:39 PM, Sidhanta Sahu wrote:
> Currently, firmware does not like when beacon mode is set as staggered
> mode for more than one beaconing vifs. Beacon mode for multiple
> beaconing (transmitted) vifs are expected to be in burst mode. So set
> beacon mode to burst mode by default.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> v2: Modified the debug log.
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 1bb9802ef569..d38b85eaed37 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2314,7 +2314,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>   
>   	if (changed & BSS_CHANGED_BEACON) {
>   		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
> -		param_value = WMI_BEACON_STAGGERED_MODE;
> +		param_value = WMI_BEACON_BURST_MODE;
>   		ret = ath12k_wmi_pdev_set_param(ar, param_id,
>   						param_value, ar->pdev->pdev_id);
>   		if (ret)
> @@ -2322,7 +2322,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>   				    arvif->vdev_id);
>   		else
>   			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
> -				   "Set staggered beacon mode for VDEV: %d\n",
> +				   "Set burst beacon mode for VDEV: %d\n",
>   				   arvif->vdev_id);
>   
>   		ret = ath12k_mac_setup_bcn_tmpl(arvif);


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
