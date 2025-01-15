Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8ACC02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:CC:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t56w0zxptNyUSFP9eC1B7m625vNjqZz4J1Nv5uogHDg=; b=VEE98gT6+39EIH8YyQI4kOVolb
	1aNVnf+tQiNfBkpm+eCuVr5NUIMEO3NUXofxWxFUIABjnrFjxu/IoSndNFv82rg3LAqWv86gtWpTK
	HxelbHSAEGcLLa4bV8IH4XJa380o+egxA5LdEleQt74o0pYvCRFKLOd5DhOQmDv4HYMvAfBlqpww2
	odDwuWjPCsHhOMN9DYvAg/AZrc0nJLQq9bZZTa7ZH3qox6ZA//yPSvwoynhsvpZdvE5HvlSDBYmka
	YqmlstO/4oV8So3Vkiqj3OW+OP7RlyK0O69bfpM+dYCOiUTREYfwFJdPFkPHUIb9e/P1/Q9b/1Smn
	Itd5YR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Bf-0000000Cuno-0FY5
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 19:36:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Bc-0000000Cun4-0lvT;
	Wed, 15 Jan 2025 19:36:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FIobCC007832;
	Wed, 15 Jan 2025 19:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t56w0zxptNyUSFP9eC1B7m625vNjqZz4J1Nv5uogHDg=; b=BrDKQCZ7lkFoq7g7
	3EBQSOGI9eOt+K4nXEf6uFZRbSPXtqixbWisdjO8+HMjaVAJ7yBLOivQSiioXG93
	ABvDyVyYd1Zl7Ld1hTgEE7s4sH8QhClet/0l4JMzSAO0LHHXUtKZwCDLNCxDq1HK
	AqQF3Kmwa1ksi9QO8smBm1i+9dqrRTQjKnVc4b2a7EyT0p9l/aBrCB0thKaXEbBC
	7IUnl85TGSM8BLUulm+j5SOQBBisgiYmQCJlw/IXURwLKuZJu4SqWSsOSpIwxy84
	iH5onw8SpqMpW4vBGuM5WX3QG8DhkEGTDuu5NpoRovpn86WD3R5gYUtJo4tvWo4E
	5mhAdQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446jndr3du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 19:36:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FJa9dC011389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 19:36:09 GMT
Received: from [10.110.39.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 11:36:09 -0800
Message-ID: <1df1e6b4-cb25-4abb-a6eb-1abaeeb5f588@quicinc.com>
Date: Wed, 15 Jan 2025 11:36:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] wifi: ath11k: refactor transmitted arvif retrieval
To: Aloka Dixit <quic_alokad@quicinc.com>
References: <20250114223612.2979310-1-quic_alokad@quicinc.com>
 <20250114223612.2979310-2-quic_alokad@quicinc.com>
Content-Language: en-US
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
In-Reply-To: <20250114223612.2979310-2-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UejdSBEqeiKkfX_yuSSPKygzyFDM0cZn
X-Proofpoint-ORIG-GUID: UejdSBEqeiKkfX_yuSSPKygzyFDM0cZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=529 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_113620_230955_5E1FBF78 
X-CRM114-Status: GOOD (  12.65  )
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


>   
> +static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
> +{
> +	if (arvif->vif->mbssid_tx_vif)
> +		return ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
> +
> +	return NULL;
> +}
> +
>   static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
>   {
>   	struct ath11k_vif *tx_arvif;
> @@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
>   	u32 params = 0;
>   	u8 i = 0;
>   
> -	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
> +	tx_arvif = ath11k_mac_get_tx_arvif(arvif);

ath11k_mac_get_tx_arvif can return NULL, below, we are accessing 
tx_arvif without a NULL check. Shouldn't we add a null check wherever 
applicable to prevent potential issues?

>   
>   	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
>   							 tx_arvif->vif, 0);
> @@ -1597,7 +1605,7 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
>   	int ret;
>   
>   	if (vif->mbssid_tx_vif) {
> -		tx_arvif = ath11k_vif_to_arvif(vif->mbssid_tx_vif);
> +		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>   		if (tx_arvif != arvif) {
>   			ar = tx_arvif->ar;
>   			ab = ar->ab;
> @@ -1674,7 +1682,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
>   				     struct ieee80211_bss_conf *info)
>   {
>   	struct ath11k *ar = arvif->ar;
> -	struct ath11k_vif *tx_arvif = NULL;
> +	struct ath11k_vif *tx_arvif;
>   	int ret = 0;
>   
>   	lockdep_assert_held(&arvif->ar->conf_mutex);
> @@ -1701,9 +1709,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
>   
>   	ether_addr_copy(arvif->bssid, info->bssid);
>   
> -	if (arvif->vif->mbssid_tx_vif)
> -		tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
> -
> +	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>   	ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
>   				 arvif->bssid,
>   				 tx_arvif ? tx_arvif->bssid : NULL,
> @@ -6333,14 +6339,12 @@ static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
>   	struct ieee80211_vif *tx_vif;
>   
>   	*tx_vdev_id = 0;
> -	tx_vif = arvif->vif->mbssid_tx_vif;
> -	if (!tx_vif) {
> +	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
> +	if (!tx_arvif) {
>   		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
>   		return 0;
>   	}
>   
> -	tx_arvif = ath11k_vif_to_arvif(tx_vif);
> -
>   	if (arvif->vif->bss_conf.nontransmitted) {
>   		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
>   			return -EINVAL;
> @@ -7306,8 +7310,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>   			   int n_vifs)
>   {
>   	struct ath11k_base *ab = ar->ab;
> -	struct ath11k_vif *arvif, *tx_arvif = NULL;
> -	struct ieee80211_vif *mbssid_tx_vif;
> +	struct ath11k_vif *arvif, *tx_arvif;
>   	int ret;
>   	int i;
>   	bool monitor_vif = false;
> @@ -7361,10 +7364,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>   			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
>   				    ret);
>   
> -		mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
> -		if (mbssid_tx_vif)
> -			tx_arvif = ath11k_vif_to_arvif(mbssid_tx_vif);
> -
> +		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>   		ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
>   					 arvif->bssid,
>   					 tx_arvif ? tx_arvif->bssid : NULL,

