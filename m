Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310D0C7EE23
	for <ath12k@archiver.kernel.org>; Thu,  8 Jun 2023 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnjaTrNdWhumd3vITRdOHgBw/6izVSowyHyLP5HfYSM=; b=VQhWYWtWKUKedV
	lZbDB7rrXOCQoIvJkMCDzz9c5oaR608HkGYabFNBD01n0JuGQwavUrLzjt1K7JiKt7KaXEuCF/Q3Z
	iElzDm1Pxj4sqOKe+/sr536jdba+T235qcs2FPnVxxF3GgsKdaD93TWe3ZdIfL4BU8/h5gr8a3E3N
	eagDoRRIJ0pupR4zKDdA4EOBzWgCkcebVx1ORaffuB3Rv6uJybN3FrZJ2yYWhvSAIivgQsyY6YHeA
	tWp9aIZBxnqlA0GPw7MEmN9MOlqi4ELYKQaUoZEADYxcX8mlc/9syl8VfL2ny853Fo3krxcq03wsk
	QB/QMHoodLPahlIuSraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7E9O-009Dpo-2k
	for ath12k@archiver.kernel.org;
	Thu, 08 Jun 2023 11:49:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7E9N-009DpR-1o
	for ath12k@bombadil.infradead.org;
	Thu, 08 Jun 2023 11:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6CYH/yvi+lpnCPwaJ4+GEAetEPEA12O1uGjN5TpUzRU=; b=CbjoovfnV/ZWMbUyjMrleEPJK2
	KS+yD1Op+BHcFv7jlDGvwSBQ5REoc16ScG0UqrFyGexyfWERdXiFsahEyIrRlj2vlSohG/38rkqS9
	v/KDa6oBn8b2mRCuToVwpBeSBfvqbztm0+hqlY8/qZID7eSEYRTIUw5Ywuo4j9QzySPnEMRU7Fb6F
	//z8LIP7jdXWJr4BYf7yv2EfMHz6uD1kx1Tl/x4zjXF3aPBb8E3yDibvBRE14/8F72zNbgFH0tUHB
	7T0fdaPPWdvZyUsip7nGP23nKAwVEi1SlYf9lC7fygWYzmy2FywalEMJSfjV+PifwrywWUkT+24nQ
	KEVg0kNg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7DTd-006C4b-30
	for ath12k@lists.infradead.org;
	Thu, 08 Jun 2023 11:06:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358ApacK025788;
	Thu, 8 Jun 2023 11:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6CYH/yvi+lpnCPwaJ4+GEAetEPEA12O1uGjN5TpUzRU=;
 b=Byjs/V8uSbNC9HAW9qoGEPsJSUvpaN7QGR7fT9xbEISXmRYBAdUvY7+8UIaLtclpjfQY
 ZhXj6oiMERRqIlj5vLmxpQ1fJK0SMdp1CwaaHc1Ullm2rGuUdNl0eoMtXVHYaNJHKxOo
 LrRvXpcO/2gR+QbwBLJ+tUN24Y55FAdS2nSdkE0c9w68rft8c8MUEjGxZEaFTlCrTIrP
 qb40cYO+n55ZeYirsPIjLr0uohOWsSzk/aWE6Mrj6jEHPpnnpALk3Zh0f/YPbbWt1teG
 0Y9Fq7ZuLLAEV193wQ8YYTfwyh3fcNlhOaQarCrFss3VdHRVdQSzIB1l6FWb3mAwxcKn 5A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r36pdrswc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 11:06:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 358B6fFp010850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Jun 2023 11:06:41 GMT
Received: from [10.216.0.83] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 8 Jun 2023
 04:06:32 -0700
Message-ID: <e2c15d6b-2416-91cb-f08c-2ed985a9634b@quicinc.com>
Date: Thu, 8 Jun 2023 16:36:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] wifi: ath12k: fix conf_mutex in
 ath12k_mac_op_unassign_vif_chanctx()
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230608104444.3134-1-quic_wgong@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20230608104444.3134-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SWsNV4XKYzk4g_J5mGDYlTlSY8_Bnnk4
X-Proofpoint-ORIG-GUID: SWsNV4XKYzk4g_J5mGDYlTlSY8_Bnnk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_07,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0
 mlxlogscore=922 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_120650_559532_93050983 
X-CRM114-Status: GOOD (  15.20  )
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



On 6/8/2023 4:14 PM, Wen Gong wrote:
> "mutex_unlock(&ar->conf_mutex);" is always called at end of function
> ath12k_mac_op_unassign_vif_chanctx(), so delete this unlock to make
> sure lock/unlock is paired.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index ee792822b411..e65f5337d8f5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5910,7 +5910,6 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
>   		}
>   
>   		arvif->is_started = false;
> -		mutex_unlock(&ar->conf_mutex);
>   	}
>   
>   	ret = ath12k_mac_vdev_stop(arvif);
> 
> base-commit: 0a00db612b6df1fad80485e3642529d1f28ea084

LGTM

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
