Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DAAC4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KH+WKs3dkeXyUiLf3eosfs6mewzmj9qJ50XRDAHZRo=; b=fOf1kK9OHNi1TOBI0QZKOPHncg
	V0OYuzcNGyi7hAHgTSJ8qTEb9OkWmkudRreR6UkleczMTk15tRBiejpgeWppVauDy28dQ7K8Oneay
	FcqIdwAlb+a19QDfvz11FL5ucO2W8/weZ/LcoFxRO+wxg9mQWdkHItfxBxHkT2y69O5rh1TFIMExd
	7+IKvKfvEf1aYkeMqOoF2k8r2e19ieUutAZdkl6kfcr6CTVzosKC0hLOj+vL5xEoOzG9/2DKDR2Jd
	3yVBKeqe+Ikm5dLEE5IxxaOZ5BeT430Tz7sJQYrTJT2zJB3OzS3d3ENawqn87emBzezhcIXEsDmDc
	GxFfUw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2u9t-0000000GuCQ-2zjy
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 14:45:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2u9q-0000000GuBh-0cOx
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 14:45:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443ERXCt006149;
	Fri, 3 May 2024 14:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3KH+WKs3dkeXyUiLf3eosfs6mewzmj9qJ50XRDAHZRo=; b=oK
	mco/UHsTxRCMGinfuzfvKvVFz/7bXUzatWRwlcdttKUY3xhkGjdLyz1lj7UdT97F
	6i6nZttLuCG4Zrq0JHRgCjX1o8h6qdMhpzRp7y8e/m2IANbuSKc+urn9sA0vtSxJ
	ofHC/VIImzMyXhEDY2XKpnLj6Ppv0YzOaf9upUSWz52+rB8Bx8SeiH9QtznCXBQM
	yM12MQWGmR6giD0CMgqkPa8E2tkZlQ7SfOs+vg8TPgmjAlgO9c55kkjWzMHmA4bK
	Duq7iDD5YJ/6ZpyPBOIHotyIsqSB13QssMTzhNs/KfasKSXWnhiY3dBhTro/RxQm
	F/Q4UWqukR8yQm2bbKIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xvawbjt9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 14:45:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 443Ej3Ua012697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 May 2024 14:45:03 GMT
Received: from [10.110.94.246] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 07:45:03 -0700
Message-ID: <f45e12e1-ad97-4e6c-a8d7-b077f17158cb@quicinc.com>
Date: Fri, 3 May 2024 07:45:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] wifi: ath12k: prepare vif and sta datastructure
 for MLO handling
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240502171240.927155-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240502171240.927155-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PZ_ji8_zkPm_ivFLCxuaI-Zse6E9pLa8
X-Proofpoint-ORIG-GUID: PZ_ji8_zkPm_ivFLCxuaI-Zse6E9pLa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_09,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxlogscore=936 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_074506_239132_7DD11BB8 
X-CRM114-Status: GOOD (  13.93  )
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

On 5/2/2024 10:12 AM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> To prepare the driver for MLO support, split the driver vif and sta
> data structure to scale for multiple links. This requires changing
> the use of arvif and arsta to per link and not per hw which can now
> comprise of multiple links.
> Also since most configurations from mac80211 are done per link,
> do refactoring of the driver functions to apply these configurations
> at link level.
> Add the required locking changes to synchronize the usage of these
> per link objects.
> 
> ---
> v2:
>  - Rebased PATCH 1/3 on ToT as b0afabc4d7e0 (wifi: ath12k: add support to
>    handle beacon miss for WCN7850) has introduced few APIs that use
>    arvif.
> 
> 
> Sriram R (3):
>   wifi: ath12k: prepare vif data structure for MLO handling
>   wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
>   wifi: ath12k: prepare sta data structure for MLO handling
> 
>  drivers/net/wireless/ath/ath12k/core.h   |  84 ++-
>  drivers/net/wireless/ath/ath12k/dp.c     |  21 +-
>  drivers/net/wireless/ath/ath12k/dp.h     |   3 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c |  14 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c  |  16 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h  |   2 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c  |   9 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.h  |   4 +-
>  drivers/net/wireless/ath/ath12k/mac.c    | 861 +++++++++++++++--------
>  drivers/net/wireless/ath/ath12k/mac.h    |   9 +-
>  drivers/net/wireless/ath/ath12k/p2p.c    |  17 +-
>  drivers/net/wireless/ath/ath12k/p2p.h    |   2 +-
>  drivers/net/wireless/ath/ath12k/peer.c   |   7 +-
>  drivers/net/wireless/ath/ath12k/peer.h   |   4 +-
>  drivers/net/wireless/ath/ath12k/wmi.c    |  12 +-
>  15 files changed, 684 insertions(+), 381 deletions(-)
> 
> 
> base-commit: 25a42664a2e2587f2582e0717f2a71d0bdcc4be0

Kalle, please don't merge this.
I'm seeing an firmware crash on x86 WCN7850 with this version

