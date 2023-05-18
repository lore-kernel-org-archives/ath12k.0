Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3200FC7EE24
	for <ath12k@archiver.kernel.org>; Thu, 18 May 2023 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKAHmH7JgAFNi3cotMjgFr/BKGCbIr4Nn/31gdU4eqo=; b=r7QaRDl2f5zF/s
	UpqpK4NM/lpy4g5SRqraZDkbrRny/Ylj/mkGMH9vbplQox+aUIxC7J3SGeu+inw7mg4q0wZK6PyPU
	RW0judbW7mEirIebq+5lLRONFueMqCOyOcBpQwXch9fWxVvagM8zSriKuoEpLWTkL4VIMyEbsWAuH
	mfqMnvtSDQLDfpzlebceRBL/xYqyVAfn4tBjq8nnGjSX954o4NdYaTqpWa1rEybeSimbKy107Grpj
	IQjvJTTWnyX7ctyhS5vXLdQ4AZzfKuqzJFGum8KinOM6qFjc/VaSwnw90JDjzB0yreuMXU2zGfWx8
	oZjJM+bziKRR6ih7G+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXsE-00CBYg-20
	for ath12k@archiver.kernel.org;
	Thu, 18 May 2023 07:16:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXsB-00CBXy-22
	for ath12k@lists.infradead.org;
	Thu, 18 May 2023 07:16:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I7FgSY017360;
	Thu, 18 May 2023 07:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VVJ1gn0Eq1ogzFXJs4dLGBVQAOgq4fU3KueXzNks620=;
 b=E7lXLaEGQA/x5ZBSbPyyCfXufNN/JGXj11E+B9B4JtIPxjOyoaoIfMBDOk74K1F5MBB2
 HBuH7EoRqvCsTnUNJX4otkHqvfzHEpOABGh3RFGR3gD69vbWdIVMBMSxDrRRu9Ez5zLq
 NO1Bku86xlN+tLJ3vxjCvBGtIugHLqJUbf7PGw0FA2eeXHQu0euLBeopoGPB0C0j7Lr/
 wPWmeKotni+5UdX8ae4aS676Ui82fFESTcqYYwvKKShNlaPBl75weU8MYMmiX6a6ArB6
 9nxP3n8hs7JGhMZ6lUAVHpZkuA9LpqpaS1vXDIaE4BhvohVQF9l24p8uWqcWTBd7Hnd2 RQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnb7h8ear-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 07:16:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I7GP4K010143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 07:16:25 GMT
Received: from [10.216.42.73] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 00:16:23 -0700
Message-ID: <bab80d1c-5ae4-546d-af1a-12d06b6a8d2e@quicinc.com>
Date: Thu, 18 May 2023 12:46:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] wifi: ath12k: Avoid NULL pointer access during management
 transmit cleanup
To: Balamurugan S <quic_bselvara@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230518071046.14337-1-quic_bselvara@quicinc.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20230518071046.14337-1-quic_bselvara@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NgWqy3fjfbEybMNtXKTcAuJtkQMLa0hQ
X-Proofpoint-GUID: NgWqy3fjfbEybMNtXKTcAuJtkQMLa0hQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_05,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305180054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_001627_808269_BD63B80A 
X-CRM114-Status: GOOD (  13.88  )
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



On 5/18/2023 12:40 PM, Balamurugan S wrote:
> Currently 'ar' reference is not added in skb_cb.
> Though this is generally not used during transmit completion
> callbacks, on interface removal the remaining idr cleanup callback
> uses the ar pointer from skb_cb from management txmgmt_idr. Hence fill them
> during transmit call for proper usage to avoid NULL pointer dereference.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d814d74bc168..a344211f5b53 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4443,6 +4443,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_vif *arvif,
>   	int buf_id;
>   	int ret;
>   
> +	ATH12K_SKB_CB(skb)->ar = ar;
>   	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
>   			   ATH12K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
> 
> base-commit: 610b78b97bad8f3e77c27a15e9a03cbbb4109697

LGTM

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
