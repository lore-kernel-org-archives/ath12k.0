Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F249D0BB4F
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 02:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYx3LNkNkAC6ghH/84DmDc4zUZuUy4VKE78EUGVz7hk=; b=lsdu1u2/0T3uclkl93E8CGTPZf
	bYHAxROiij/3HCUuW5vm92KjwExTPCv46zLkIMs1sjLghcbTOvd+Tvoh0+3SeALaBbMOmhrMwBk59
	4CocsTcKilZVKVD9am1jd/dylSROE1ah9uZAFEtcHDXRpb4W7kPGQ7cuptiSorIz+zWsyfYkiBeuC
	5xbrqSeorKc5wfkc/5DIx54W5bn4yosZ6uYzkdwUBlwWjE1CPcJmEZ9UOUMb4p7ilG6kytHsIjsdQ
	Kxb3S5CnINL4PXNi5GCsvMx4haR5nA6avK45kY+kdFmppQ5KsVV4++qFebLVJiO9LCUoAQu8Wyhuc
	JIB6IbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3o41-0000000GZlq-33O3
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 02:59:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3o3y-0000000GZlM-0CId
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 02:59:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NLNK1F025624
	for <ath12k@lists.infradead.org>; Thu, 24 Oct 2024 02:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYx3LNkNkAC6ghH/84DmDc4zUZuUy4VKE78EUGVz7hk=; b=XXqKuxYys/7f3iSd
	esRA8Yf6qpnRqUY7ewCIr7v2M5QXl0D6wgXGHBki7A53yFiq4ss5cmC22DLzRyCt
	guvNMRzRCDsGUgNK+/1XksTcWzwQ5IKmiRJB6Z4bxZ76vOg5PXWm/Funk50lWSeq
	E7McpZaq6QEa/Yzz17Fuvn3Z/pYJZTYRPvblTJPx5Z5Bm7qkyKyZRsrnRvdo/sNQ
	2u3gJGiYBsoC33x8gOeCLh/4pUh8KPm+RERSkow6/aB5pc7YNEhJwzfCpzlGyoqL
	RmP0RRW4J3EmKM0+Qyu42SO+P3PRoBDu3FDmsBJm+hza7lvJHUjkPNva45xDD/Lf
	qHYQWg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40c67r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Oct 2024 02:58:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O2wwME030493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Oct 2024 02:58:58 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 19:58:57 -0700
Message-ID: <e886a4c0-14f9-4299-97ef-f8cd811c94e6@quicinc.com>
Date: Thu, 24 Oct 2024 10:58:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] wifi: ath12k: Refactor sta state machine
To: <ath12k@lists.infradead.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-4-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20241023133004.2253830-4-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HnVAudOz_KW8loohzKTQcq-TK7yt-Q22
X-Proofpoint-GUID: HnVAudOz_KW8loohzKTQcq-TK7yt-Q22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=659
 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_195902_133948_7606C3BF 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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



On 10/23/2024 9:29 PM, Kalle Valo wrote:
> +static void ath12k_mac_station_post_remove(struct ath12k *ar,
> +					   struct ath12k_link_vif *arvif,
> +					   struct ath12k_link_sta *arsta)
> +{
> +	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
> +	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
> +	struct ath12k_sta *ahsta = arsta->ahsta;
> +	struct ath12k_peer *peer;
> +
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +
> +	ath12k_mac_dec_num_stations(arvif, arsta);
> +
> +	spin_lock_bh(&ar->ab->base_lock);
> +
> +	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
> +	if (peer && peer->sta == sta) {
> +		ath12k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
> +			    vif->addr, arvif->vdev_id);
> +		peer->sta = NULL;
> +		list_del(&peer->list);
> +		kfree(peer);
> +		ar->num_peers--;
> +	}
> +
> +	spin_unlock_bh(&ar->ab->base_lock);
> +
> +	kfree(arsta->rx_stats);
> +	arsta->rx_stats = NULL;
> +
> +	if (arsta->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
> +		rcu_assign_pointer(ahsta->link[arsta->link_id], NULL);
> +		synchronize_rcu();
> +		ahsta->links_map &= ~(BIT(arsta->link_id));
should we put this ahead of rcu_assign_pointer()?

> +		arsta->link_id = ATH12K_INVALID_LINK_ID;
> +		arsta->ahsta = NULL;
> +	}
> +}
> +


