Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA92C10F15
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 20:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ucx0wDmOUHj45w6/3QbWPivsLi/pgZ0EZ8g+RMdugKk=; b=Vlg57Zj53PsO2SshQccZlsjg19
	rNjQI31t70V3+4NmbKbFBz7ZJEZx/QCTLgUL0uNSkzfacw8iWWdWoK+AX9ZRfVYLMWdrGX+9gxAWy
	V5wkYAAMaGLq9eC8ILd6EIPGb+Oz5JGQsGJp4WGEZgdh01YvN7FbXXj09Qb6A9ZsowFcDrz9961Ss
	FCqwrY2AfWMzYoJsm37QGqm/xa+E92xF6YIZ33Ux4tMoo2zJbqeihzAl+LuIAkwHVJKFi0zuxJROK
	UegoFTUnPVO0MFwKj98d9gZqlEuf1XgvHOubLnGU4huqsNbNZNLcicOvoTmm7yFqdBJRdn4BHFz/5
	Z7QXyf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzj6V-00000005tJs-2vPn
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 20:20:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzj6Q-00000005tG7-1Y6V
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 20:20:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OKGmu7026098;
	Wed, 24 Apr 2024 20:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ucx0wDmOUHj45w6/3QbWPivsLi/pgZ0EZ8g+RMdugKk=; b=ic
	P8IPvcriQh4b4yFCMRNEdtsuesiMtd3XZQ3658gyGFceXTy2zg4gOEsjlfhV4Lwx
	yD7gYfhOrmayhhhoiZx52C5DG1xcdbED0px1SZlWo0UJrUoQ49DFB47Sk3zX68UB
	GKy6LLJ6x7LPNp0hVmZUylRDSBbniWtnrw57K1Iv3vnOZL0Abpn2WQ8gFgZbYmsc
	XUAYnYBxHLanfjfMELPc/wuHEiyVcVpTyWhPZHzi1kS1Nl9sSXiTtdl+1og6So3P
	UUdR/WaTIQSHhQyT/0z7m7ZXdhnkPE3fQvhCmAVJEFYSyDq+09dEu+/F9/3Qi+Il
	H2s2oSuFOF1bhPXTFG9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9dj3t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 20:20:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43OKKO5i004409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 20:20:25 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Apr
 2024 13:20:24 -0700
Message-ID: <7813db11-2445-4af3-910f-f3232af873aa@quicinc.com>
Date: Wed, 24 Apr 2024 13:20:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: Refactor the hardware recovery
 procedure
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
 <20240424065646.1666166-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424065646.1666166-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qNC5T4oR7RuEz5bjBuQXPw3d8cxodAD2
X-Proofpoint-ORIG-GUID: qNC5T4oR7RuEz5bjBuQXPw3d8cxodAD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_17,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=641 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_132026_760319_BAFB638F 
X-CRM114-Status: GOOD (  11.31  )
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

On 4/23/2024 11:56 PM, Karthikeyan Periyasamy wrote:
> Currently, in multi-wiphy models, the recovery handler access mac80211
> HW from the radio/link structure. This will be incorrect for single wiphy
> model, as they will hold multiple link/radio structures. To fix this,
> access mac80211 HW based on the number of hardware in the SoC/chip. This
> approach makes the recovery handler compatible with both multi wiphy and
> single wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
[...]
> @@ -1006,35 +1005,34 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>  		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	for (i = 0; i < ab->num_hw; i++) {
> -		if (!ab->ah[i])
> +		ah = ab->ah[i];
> +		if (!ah)
>  			continue;
>  
> -		ah = ab->ah[i];
>  		ieee80211_stop_queues(ah->hw);
> -	}
>  
> -	for (i = 0; i < ab->num_radios; i++) {
> -		pdev = &ab->pdevs[i];
> -		ar = pdev->ar;
> -		if (!ar || ar->state == ATH12K_STATE_OFF)
> -			continue;
> +		for (j = 0; j < ah->num_radio; j++) {
> +			ar = &ah->radio[j];
> +			if (!ar || ar->state == ATH12K_STATE_OFF)

remove !ar test, result of & operation can't be NULL

> +				continue;


