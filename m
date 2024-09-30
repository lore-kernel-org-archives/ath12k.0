Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A690CEB2C9
	for <ath12k@archiver.kernel.org>; Mon, 30 Sep 2024 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUbnokjMdhbaHID+kmCt2enVRYrky86MLMRNTCxQODg=; b=TY07xd58uGJmHE702OdaSrhHfm
	mo6gx3GdrK7fqdu0hRN4gmi8kdTV9cpMbCIzZvRl96CYsCjmApV8Pq0pF8nOEH7x2VNNl1QTqjkUR
	Fc7/oQKG9clJTmTdMrZ/sycZeZttH5AjTga/TYT7SB4vcST5fr2cVeED/bQsjcwD7ZDP3uEAYRPMU
	SaI13ZuHemhjC4FYbow2l5j2mzuiFTcNOKn5PikQfXb1A9KMu5Zln1yGPGHaNMJ69OKZyI6wD//Wy
	CAT56rKc9gw30RJw88tXus0beSZ+h+X92LYpY40GjeWlN4DDRx0sRmUxsUhc/YmX26BVn1fNdgZdL
	WP6UGUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNnR-00000000sPX-3SM4
	for ath12k@archiver.kernel.org;
	Mon, 30 Sep 2024 21:19:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svNmR-00000000sMX-1f93
	for ath12k@lists.infradead.org;
	Mon, 30 Sep 2024 21:18:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UBRMAj001546;
	Mon, 30 Sep 2024 21:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbnokjMdhbaHID+kmCt2enVRYrky86MLMRNTCxQODg=; b=mGTda37tTb3lLkRh
	KhrfBIgzBXkeL3RMBDuZ/f06UG79+VN99sYwsT538qvogvAJx1MgFNZKoWIXWRin
	tKg7f/eo03n48iXYMJoAfdJr9Y0/RgAMJiUEcd8RTsF2ZpTMtMzAcJ+KXnkMpuEj
	3DBhA2sj2m3Xq+8ImqcoIN0IXXMz0mLVUi89cfMy5T4QOGk8G9F93dhaMMMvYSg3
	iTyMdDGukox9Os8aiKvxTK4DG9tSq6bK39VdjiOipGzFjn4OwDQAJ/qp5KyedqCh
	gMHWdMyMVkFClBfymi+mmripDQPUQukPtCOsfIIRQm5iEEyoI6mbIkr7iNp8plVH
	Av6iMg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xajfe0hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 21:18:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ULI50G015419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 21:18:05 GMT
Received: from [10.111.183.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 14:18:05 -0700
Message-ID: <793ec8c0-7227-4ba5-891b-8f7ea7382463@quicinc.com>
Date: Mon, 30 Sep 2024 14:18:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240918212056.4137076-1-quic_pradeepc@quicinc.com>
 <20240918212056.4137076-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240918212056.4137076-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kMbBfm2zBSarpJVZnLwzsbaKQMb8hrpP
X-Proofpoint-ORIG-GUID: kMbBfm2zBSarpJVZnLwzsbaKQMb8hrpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=947
 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409300152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_141807_493341_F5690F9D 
X-CRM114-Status: UNSURE (   9.71  )
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

On 9/18/2024 2:20 PM, Pradeep Kumar Chitrapu wrote:
...
> @@ -8323,15 +8808,27 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
>  		ieee80211_iterate_stations_atomic(hw,
>  						  ath12k_mac_disable_peer_fixed_rate,
>  						  arvif);
> -	} else if (ath12k_mac_bitrate_mask_get_single_nss(ar, band, mask,
> +	} else if (ath12k_mac_bitrate_mask_get_single_nss(ar, vif, band, mask,
>  							  &single_nss)) {
>  		rate = WMI_FIXED_RATE_NONE;
>  		nss = single_nss;
> +		mutex_lock(&ar->conf_mutex);
> +		arvif->bitrate_mask = *mask;
> +		ieee80211_iterate_stations_atomic(hw,
> +						  ath12k_mac_set_bitrate_mask_iter,
> +						  arvif);
> +		mutex_unlock(&ar->conf_mutex);
>  	} else {
>  		rate = WMI_FIXED_RATE_NONE;
> -		nss = min_t(u32, ar->num_tx_chains,
> -			    max(ath12k_mac_max_ht_nss(ht_mcs_mask),
> -				ath12k_mac_max_vht_nss(vht_mcs_mask)));
> +
> +		if (!ath12k_mac_validate_vht_he_fixed_rate_settings(ar, band, mask))
> +			ath12k_warn(ar->ab,
> +				    "could not update fixed rate settings to all peers due to mcs/nss incompatiblity\n");

checkpatch says:
WARNING:TYPO_SPELLING: 'incompatiblity' may be misspelled - perhaps 'incompatibility'?


> +
> +		mac_nss = max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> +			       ath12k_mac_max_vht_nss(vht_mcs_mask),
> +			       ath12k_mac_max_he_nss(he_mcs_mask));
> +		nss = min_t(u32, ar->num_tx_chains, mac_nss);
>  
>  		/* If multiple rates across different preambles are given
>  		 * we can reconfigure this info with all peers using PEER_ASSOC


