Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18851C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45VIrV65xa70qkS9uSCG4Bi37IQm33T1S5jV4fVewfc=; b=qENpBD+w5Y0agoZP32p1gYgyj4
	Y80S/87cytsM9bTdvZ6h/QTnl4m/pqbsFMLLIfTd/wxQs+Mu4hQy0raOKk3q1fKvbtRP/G5pHuGcP
	mdkQuq8eI249zsN30kW3UU1hhXfzBT/G0SOy5cqam/lWko/hZ2lrc06C+POQPFcwww+ibUcNuv8Xb
	taOvh+6tsKZl35e0mZrecUxV4bihNmm6DlT2W9fD8ft4K4BIxJDN59FVnQWtdkkbyzO8hmdnO6OS3
	QTbAQ9UgYEfIw23xkT55nVYdkhGfm69dfPnsl2XulXmFEitNrFbnTE0OR3mW9hUl4f8qqPSHfs1gW
	/dXmtqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzt3y-00000007CGK-3Pvx
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 06:58:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzt3v-00000007CFJ-1Alc
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 06:58:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P2kQju023123;
	Thu, 25 Apr 2024 06:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=45VIrV65xa70qkS9uSCG4Bi37IQm33T1S5jV4fVewfc=; b=WV
	4QyOWsJltVhQpYoLQS62rAAxbY5LjggDPlhaMBH9rfhAsuMoNdmreeRw1KvuZsbw
	/A6wV9W+tb7/4bEIXTwyUX94dD1n5bSssUIVnlMi8TRyOCZrf/YV3d2qEzTdZDYM
	HeIrMuhQnc+nAnxgTys8enwmd5OfOGHxIYihg+Z99hyxzT8wISFn4138NknD0LtT
	FJLNtCr8NOFAGCIbQsvw5l9UCyPtM+ZxDyY329sDy0nsg1CFD354lFXd78htiMWD
	LtZNYfJe2VEcxCz3R8K3QooajM/feSRhfqz/P5SUHRS0B8hLyvm23j9DOTN7QBVd
	RXbR8O2zmuVqjgf+EsZw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenggp8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 06:58:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P6wRr1026020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 06:58:27 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Apr
 2024 23:58:25 -0700
Message-ID: <9ccdf330-f501-ed5f-f85c-4a5d08cd889a@quicinc.com>
Date: Thu, 25 Apr 2024 12:28:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
 <20240424065646.1666166-4-quic_periyasa@quicinc.com>
 <833facaa-6b8d-4301-84e1-bef1980f26b6@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <833facaa-6b8d-4301-84e1-bef1980f26b6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bD9_hHjxrp-dxW3XkcdpO2XPIXjXEXrT
X-Proofpoint-GUID: bD9_hHjxrp-dxW3XkcdpO2XPIXjXEXrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_235831_538847_EF6C7320 
X-CRM114-Status: GOOD (  25.03  )
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



On 4/25/2024 2:11 AM, Jeff Johnson wrote:
> On 4/23/2024 11:56 PM, Karthikeyan Periyasamy wrote:
>> Currently, hardware state is not protected across the reconfigure
>> operations. However, in single wiphy models, multiple radio/links is
>> exposed as a MAC hardware (ieee80211_hw) through the driver hardware
>> abstraction (ath12k_hw) layer. In such scenario, we need to protect
>> hardware state across the multiple radio/link at the driver hardware
>> abstraction (ath12k_hw) layer. Therefore, introduce a new mutex in
>> the ath12k_hw layer.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c |  4 ++++
>>   drivers/net/wireless/ath/ath12k/core.h |  6 ++++++
>>   drivers/net/wireless/ath/ath12k/mac.c  | 29 ++++++++++++++++++++++++--
>>   3 files changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> index a685cfd6fd92..e9aabdb9341c 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -1048,6 +1048,8 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
>>   		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
>>   			continue;
>>   
>> +		mutex_lock(&ah->hw_mutex);
>> +
>>   		switch (ah->state) {
>>   		case ATH12K_HW_STATE_ON:
>>   			ah->state = ATH12K_HW_STATE_RESTARTING;
>> @@ -1078,6 +1080,8 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
>>   				    "device is wedged, will not restart hw %d\n", i);
>>   			break;
>>   		}
>> +
>> +		mutex_unlock(&ah->hw_mutex);
>>   	}
>>   
>>   	complete(&ab->driver_recovery);
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>> index eff1093fbb6e..3e3e157b6c56 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -634,11 +634,17 @@ struct ath12k {
>>   struct ath12k_hw {
>>   	struct ieee80211_hw *hw;
>>   	struct ath12k_base *ab;
>> +
>> +	/* Protect the write operation of the hardware state ath12k_hw::state
>> +	 * between hardware start<=>reconfigure<=>stop transitions.
>> +	 */
>> +	struct mutex hw_mutex;
>>   	enum ath12k_hw_state state;
>>   	bool regd_updated;
>>   	bool use_6ghz_regd;
>>   	u8 num_radio;
>>   
>> +	/* Keep last */
>>   	struct ath12k radio[] __aligned(sizeof(void *));
>>   };
>>   
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 8b003c18796d..3dc95d36b6a2 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -5546,10 +5546,13 @@ static void ath12k_mac_wait_reconfigure(struct ath12k_base *ab)
>>   
>>   static int ath12k_mac_start(struct ath12k *ar)
>>   {
>> +	struct ath12k_hw *ah = ar->ah;
>>   	struct ath12k_base *ab = ar->ab;
>>   	struct ath12k_pdev *pdev = ar->pdev;
>>   	int ret;
>>   
>> +	lockdep_assert_held(&ah->hw_mutex);
>> +
>>   	mutex_lock(&ar->conf_mutex);
>>   
>>   	ret = ath12k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_PMF_QOS,
>> @@ -5664,6 +5667,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
>>   
>>   	ath12k_drain_tx(ah);
>>   
>> +	mutex_lock(&ah->hw_mutex);
> 
> since this is always unlocked just before we return, it is a good candidate
> for the cleanup.h functionality. just change this to:
> 	guard(mutex)(&ah->hw_mutex);
> 
> and remove all of the other edits to this function. the mutex will always be
> unlocked when the function returns
> 

sure, will address this comment in the next version of the patch.


>> +
>>   	switch (ah->state) {
>>   	case ATH12K_HW_STATE_OFF:
>>   		ah->state = ATH12K_HW_STATE_ON;
>> @@ -5678,7 +5683,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
>>   		ah->state = ATH12K_HW_STATE_OFF;
>>   
>>   		WARN_ON(1);
>> -		return -EINVAL;
>> +		ret = -EINVAL;
>> +		goto err;
>>   	}
>>   
>>   	for_each_ar(ah, ar, i) {
>> @@ -5692,6 +5698,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
>>   		}
>>   	}
>>   
>> +	mutex_unlock(&ah->hw_mutex);
>> +
>>   	return 0;
>>   
>>   fail_start:
>> @@ -5700,6 +5708,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
>>   		ath12k_mac_stop(ar);
>>   	}
>>   
>> +err:
>> +	mutex_unlock(&ah->hw_mutex);
>>   	return ret;
>>   }
>>   
>> @@ -5762,9 +5772,12 @@ int ath12k_mac_rfkill_enable_radio(struct ath12k *ar, bool enable)
>>   
>>   static void ath12k_mac_stop(struct ath12k *ar)
>>   {
>> +	struct ath12k_hw *ah = ar->ah;
>>   	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
>>   	int ret;
>>   
>> +	lockdep_assert_held(&ah->hw_mutex);
>> +
>>   	mutex_lock(&ar->conf_mutex);
>>   	ret = ath12k_mac_config_mon_status_default(ar, false);
>>   	if (ret && (ret != -EOPNOTSUPP))
>> @@ -5800,10 +5813,14 @@ static void ath12k_mac_op_stop(struct ieee80211_hw *hw)
>>   
>>   	ath12k_drain_tx(ah);
>>   
>> +	mutex_lock(&ah->hw_mutex);
>> +
>>   	ah->state = ATH12K_HW_STATE_OFF;
>>   
>>   	for_each_ar(ah, ar, i)
>>   		ath12k_mac_stop(ar);
>> +
>> +	mutex_unlock(&ah->hw_mutex);
>>   }
>>   
>>   static u8
>> @@ -7848,8 +7865,12 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
>>   	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
>>   		return;
>>   
>> -	if (ah->state != ATH12K_HW_STATE_RESTARTED)
>> +	mutex_lock(&ah->hw_mutex);
> 
> another good candidate for
> 	guard(mutex)(&ah->hw_mutex);

sure, will address this comment in the next version of the patch.

> 
>> +
>> +	if (ah->state != ATH12K_HW_STATE_RESTARTED) {
>> +		mutex_unlock(&ah->hw_mutex);
>>   		return;
>> +	}
>>   
>>   	ah->state = ATH12K_HW_STATE_ON;
>>   	ieee80211_wake_queues(hw);
>> @@ -7904,6 +7925,8 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
>>   
>>   		mutex_unlock(&ar->conf_mutex);
>>   	}
>> +
>> +	mutex_unlock(&ah->hw_mutex);
>>   }
>>   
>>   static void
>> @@ -8850,6 +8873,8 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
>>   	ah->ab = ab;
>>   	ah->num_radio = num_pdev_map;
>>   
>> +	mutex_init(&ah->hw_mutex);
>> +
>>   	for (i = 0; i < num_pdev_map; i++) {
>>   		ab = pdev_map[i].ab;
>>   		pdev_idx = pdev_map[i].pdev_idx;
> 

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

