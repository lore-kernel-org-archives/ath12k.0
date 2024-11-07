Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE2D29FBC
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3i45+0lajGCiB7D2FM93uOfbP/cFoMWOXRUl9ibpeA=; b=s7RG7cEFMD7lrmKMSJPtBqRIFK
	lZvnjABHUCpC/Tc8H+U32hnMFHMi/RJ+UdBWwG54pNvkje5nSgHvXoY+c1J4y8X5o3k1dVppsZngr
	8GCEsaikt0FfqrbmwyR21YeLxBqr86ClEofzM+EEuWTXbp0m+JQuxw3kU+X1C8bT8Ef1pCQGcWalZ
	RYV+MxLguclaCQYDa04HToCCgePl/l5ONXScHpiAWJgQY2bDv8K9gCUkjRtLMo82bY/EinEBICOy9
	VoCdsAhWbwoQ5iwkLiZgdMyYyC7e5wifsTYh8IxRN5+OkB8I03aRiGYY+MsGyu3VstiuBhMcerfvo
	DzN+6uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8sEk-00000005S31-2YFc
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 02:27:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8sEh-00000005S23-1ii6
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 02:27:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6ESObZ001931;
	Thu, 7 Nov 2024 02:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3i45+0lajGCiB7D2FM93uOfbP/cFoMWOXRUl9ibpeA=; b=W+n8VaJYFErY4s6+
	sV4L+3WcGG3Z3481xyNQzGaE3GGscRtW7/FnH1PvLyjIhsMzBcrT6dO7E62/hiST
	aHKBOvLSrbYIe+DseHc/EfgjEzhQPhgluA1LZzpYclefSpuIO83peIOyunsh9hyw
	nmo5mzaEfRLCS0fxYo4YqBvs516txl97r33Sh6YsD9L6/6looCWMAWd+cyhK3T4G
	C2S5i3zRplu4zPfwkvodMhzky4igpwJxi/KnslFiFD7u4O453NTiGpzLlnK4dolU
	7Il99UMRQaoUUtgauPsnLI/jeGJfd602Am/SOdo9Uu7xztRDHo3Y4SHmARb8NzKZ
	Mz0JSQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072k8vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 02:26:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A72QxV5011515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 02:26:59 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 18:26:58 -0800
Message-ID: <f75d7222-514b-4c6f-985d-e6ffd67e317a@quicinc.com>
Date: Thu, 7 Nov 2024 10:26:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-2-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20241106142617.660901-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yh-UaaV-1bvWRDzS7oxT5Tf9VrpQ9gEm
X-Proofpoint-GUID: Yh-UaaV-1bvWRDzS7oxT5Tf9VrpQ9gEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=772 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_182703_504532_6803668A 
X-CRM114-Status: GOOD (  10.09  )
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



On 11/6/2024 10:26 PM, Kalle Valo wrote:
> +static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
> +				      struct ath12k_sta *ahsta,
> +				      struct ath12k_link_sta *arsta,
> +				      struct ath12k_vif *ahvif,
> +				      u8 link_id)
> +{
> +	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
> +	struct ieee80211_link_sta *link_sta;
> +	struct ath12k_link_vif *arvif;
> +
> +	lockdep_assert_wiphy(ah->hw->wiphy);
> +
> +	if (!arsta || link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
> +		return -EINVAL;
> +
> +	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
> +	if (!arvif)
> +		return -EINVAL;
> +
> +	memset(arsta, 0, sizeof(*arsta));
> +
> +	link_sta = wiphy_dereference(ah->hw->wiphy, sta->link[link_id]);
> +	if (!link_sta)
> +		return -EINVAL;
> +
> +	ether_addr_copy(arsta->addr, link_sta->addr);
> +
> +	/* logical index of the link sta in order of creation */
> +	arsta->link_idx = ahsta->num_peer++;
> +
> +	arsta->link_id = link_id;
> +	ahsta->links_map |= BIT(arsta->link_id);
would be better to put this after rcu_assign_pointer()?

> +	arsta->arvif = arvif;
> +	arsta->ahsta = ahsta;
> +	arsta->state = IEEE80211_STA_NONE;
> +	wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
> +
> +	rcu_assign_pointer(ahsta->link[link_id], arsta);
> +
> +	synchronize_rcu();
what are we waiting for here?

> +
> +	return 0;
> +}
> +


