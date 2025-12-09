Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DFD3B7E2
	for <ath12k@archiver.kernel.org>; Tue,  9 Dec 2025 01:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYMwWGOVBSgGJklHUSVmoJod4PG9XIn06diCPF7M+jc=; b=1O7lgaK3lU4xQQH57NgAjV4746
	3w/YcidaEDtq7p4vSF2vmIwivF4jmJcwQzWQaaeAHMnwoNb0oMwGOpjrkPXRJgpspQeDRX3XZjynW
	oJ86wsIK72enL4+fPcwLG6lsbaN+5G2GjkQrPr7KBBe0vZ5GhzQt2Cps4Thb3hSOLK2qZ8R/QRans
	Pfu1fhKr8DIcWxWqiduHqDkOrbRZUoziNpdc2s/WW0iC2WFhL5TfWp5TZgYvUXxD0Q02mPJ1sukfv
	peOaX9oXchmK8yV0SqZocig3CvHHxMqyrU6OiKe645rDemrugdhOiZei26zZbUyByiC9W05AZI2Nr
	+g87M6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSmrm-0000000DiPL-1Gqw;
	Tue, 09 Dec 2025 01:50:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSmrj-0000000DiOt-35Yj
	for ath12k@lists.infradead.org;
	Tue, 09 Dec 2025 01:50:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXD2X2618916
	for <ath12k@lists.infradead.org>; Tue, 9 Dec 2025 01:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYMwWGOVBSgGJklHUSVmoJod4PG9XIn06diCPF7M+jc=; b=c7QtzM9ZHiBkzWhf
	Tjd3xbdUFkZIjVTFf/fnuq3bJX6sb7PBWHHUvtsmk6mvows4QaSqb/x6Rz/plro4
	p7sniiffXEpiFws9C+Jj/VttOhK14NpD1GMhBlubtSQrURebbAzQezGsw52vJYf0
	oX9gSsLNsz+pDgzsFPWJ7ZLMzpTKgozFlS8zxbpBN95H43/hCMrlsUx6LHh+ZGJp
	dtaDqAaN6mLqXGppoYdNoF28HruQwbP/4Kf0pdbrxVa8C+kJ5YrPrTak8W5R6Q/I
	nymBg/xXTpsc+CuGMGIcHD/vJAG7F9+UXisTqeJOMZW5OBQI0HFKQFed1hrT4LaD
	LgEpYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax76u0em5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 01:50:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so9461148a91.2
        for <ath12k@lists.infradead.org>; Mon, 08 Dec 2025 17:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765245007; x=1765849807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYMwWGOVBSgGJklHUSVmoJod4PG9XIn06diCPF7M+jc=;
        b=Nfg2DgE5HJvtq9V923EaVE90PtK6N2TtD8AS8N7x1Sn1+F1Y9eXaEO4NQf4lxJTRV8
         VVmYWg0YNeO9wjtk7mvv2jaS/VALi7gOoaW5+UfX66FXYnFVbtExm0anU0wooV50UOB0
         a3x+wC9Qh1u/rxKk3tCbXZLJRQ1VknodPkkfun60btcTRSqy1DY0TlAmcA4Ts2cTiHFt
         DBqVl+fycSJQsE19v8IH7v2UiuIaSi33loZOhK1ID5zl0HfTA0pMlHVliJ6Ez7aAyF02
         jq0CP1CCP5J2hudvi0NAcbVkQRuYKuu+tksGZeb/g9HPThkzHRt7/EGznm+IvcUI3OQy
         dN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765245007; x=1765849807;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYMwWGOVBSgGJklHUSVmoJod4PG9XIn06diCPF7M+jc=;
        b=U88QrNlxeqNlbQXeK7ELZnTJOSe7M2K8lQ50Pv0dz+1EBRYRq05sL4nTN9LbO1NLhW
         QAieq6sZpg59uEqWnCrFBDpho7y8ySf88rtnEJuQiC6nG7TTgWaTMviijfYoxVaElwvh
         v9QKcTZJwAlBPJRVFVTZB4sDBAfKWfYtF5oZ5inVv+sdLy4WxMKfi6fy1bdn77TXm6JE
         aY8cKXV00n6W9vlvpM3rlKaq/k/61Md7d5pLg7welBKu+W2HhcE7wBr5PUYKlG37tYiN
         jQn61mhlR3UKozMuB0M+HoX/bireoFbxjl0beCK17er8qejcxYYHNWGrtcFuTbpIER9H
         DvZA==
X-Forwarded-Encrypted: i=1; AJvYcCVOwe3iVrnlHOxdSIrAWYKVVknSRjfHaARhawj/JeHiY5tuAK65pFJO6n/Jb+3IvUmg0b+sk9U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ODt3LCyR1mEePXeYPzzGu+FvP8rZpssy9HbrRKyp2GAMxu06
	rXMpSQLWFUYQ3NO+uqSfOqid1R/TWbq2qSGBJrdAjEiLEu+Gt1JOfewogW1BCf9o2DB4xzLokVV
	4KxuR2WfaGKJMe+Nr6TSoE3RtY5AjNCMIs1Iq7rt9RSTZ+rx8UOptTqxHcVyBVgvz
X-Gm-Gg: ASbGncsR54mQCFyR6l0szA/uTn20Pd9R4msCDTI+Q0x5qjob4Nnr5+pCmuZMMNct/+w
	EvY74NDt9+bKszqpPyfQs5adqC4xWf3yRsu6h9Nttg11otU1edKm3sLoa6ptf9GOUtm2a/sk+H4
	/SlS5WLz4hYaDCqWJQGQpGKT/6xavFkIMupZpgjVDqlsXqf8aiuizArcXqgTMEdXzuL6hfi8lRL
	z8LNYmGQfgxzIkrtVm8sY68M3VvNIiPlSYDTz1e2NHrba8qVOjnZk/Jb7YThuLD9W4/rwrQjTJ+
	euyH9oE84tREC5lbWrtQoyNwC5nDYOYA9xvEudLicLHue1IQRkOcey6aBieuMJW2bo3fpKAYBPX
	2zqwpQOC3s8Q0+fLcm6vgBO72E+ZiyRlTOhCdBMrwur0XucXHYSkBeSPtvOtDDgZSUYLLyn2+ex
	+ODk8/bD0=
X-Received: by 2002:a17:90b:2ccb:b0:343:747e:2cac with SMTP id 98e67ed59e1d1-349a26081fbmr7387584a91.31.1765245007147;
        Mon, 08 Dec 2025 17:50:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxRX16HOt31Ofctpv4cUfI8JUUGyeaSIELIX8maSH5nbDjdOrzYQEDTC8aAAW+ive5qww6cg==
X-Received: by 2002:a17:90b:2ccb:b0:343:747e:2cac with SMTP id 98e67ed59e1d1-349a26081fbmr7387568a91.31.1765245006635;
        Mon, 08 Dec 2025 17:50:06 -0800 (PST)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm524982a91.6.2025.12.08.17.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 17:50:06 -0800 (PST)
Message-ID: <94374e66-f7bd-4e5b-a683-8802616472b9@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 09:50:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: Skip DP peer creation for scan
 vdev
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxMSBTYWx0ZWRfX13CRF3qs9I7Y
 IGigU4EacPtxxoWDnuHrj3dwb4KWBZfU8lT2t5iJL4J7CIbujgrYpdpvmhmIih7elO/27HIeGuB
 DcElNviEsS4xCfe9kPj2OM7hG7u3slBPUIbIoKpAyiI0eay1F4C8oCVOuRI9UuqWCER72ZQ/juw
 yvvTWQnJ3aSCx+DT5uDyOrTn3fJ/Rkf+okr+laWAL6hAGfDdwt4vVSQsr7EejJbJwPRF+B0rwlU
 Lcu4KY9goYVBTreNNXVXKRnNL51HlgtLFWzd78P7kcdlgyWfqpnEuFDaHXdPY89+Bq+ylPG+ddO
 DD5wjgQwCZSNDfAt6UPvmIhoXJRyKR6kJat9p3ooMNYqcRWHMTDNJfWZ1Wakrviiulc3UqNLsI5
 FfoXf7xIL9Ls7Ckjyo1dl46kelwjHw==
X-Proofpoint-ORIG-GUID: vo7K2AAbf-ev_rWQydImAPzEIdtBIy2z
X-Authority-Analysis: v=2.4 cv=PYTyRyhd c=1 sm=1 tr=0 ts=69378050 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=uoGj4bbEhODSdn1brq8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vo7K2AAbf-ev_rWQydImAPzEIdtBIy2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_175011_918010_EA2B757E 
X-CRM114-Status: GOOD (  23.24  )
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



On 12/7/2025 3:27 PM, Ripan Deuri wrote:
> Consider a multi-link AP configuration:
> 
>     MLD vif (MAC addr: aa:bb)
>         |-- 2.4 GHz link (BSSID: aa:bb)
>         |-- 5 GHz link   (BSSID: cc:dd)
> 
> For AP vdevs, ath12k creates a DP peer using the arvif's BSSID and stores
> it in dp_hw->dp_peers_list. During scan operations, the driver assigns an
> arvif to the scan vdev and uses the vif's MAC address as its BSSID. In
> the above scenario, the scan vdev MAC address (aa:bb) matches the BSSID
> of the 2.4 GHz AP link, causing a duplicate entry in dp_hw->dp_peers_list
> and leading to scan vdev creation failure.
> 
> Failure in vif bringup sequence:
> 1. Create AP vdev for 2.4 GHz link:
>    - Assign arvif with BSSID = aa:bb and link_id = 0.
>    - Create DP peer with address aa:bb and add to dp_hw->dp_peers_list.
> 
> 2. Create scan vdev for 5 GHz link:
>    - Assign arvif with BSSID = aa:bb (same as vif MAC address) and
>      link_id = 15.
>    - Attempt to create another DP peer with address aa:bb.
>    - Operation fails because aa:bb already exists in dp_hw->dp_peers_list,
>      resulting in duplicate entry conflict.
> 
> 3. Delete scan vdev for 5 GHz link.
> 4. Create AP vdev for 5 GHz link.
> 
> Since DP peer is not needed for scan operations, identify scan vdev using
> arvif->link_id >= IEEE80211_MLD_MAX_NUM_LINKS and skip DP peer creation
> and deletion.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c  | 22 ++++++++++++++--------
>  drivers/net/wireless/ath/ath12k/peer.c | 12 +++++++-----
>  2 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 3649f58fef84..42e750376926 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1229,7 +1229,8 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>  
>  	/* Delete all the self dp_peers on asserted radio */
>  	list_for_each_entry_safe_reverse(arvif, tmp_vif, &ar->arvifs, list) {
> -		if (arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
> +		if ((arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) &&
> +		    (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS)) {
>  			ath12k_dp_peer_delete(dp_hw, arvif->bssid, NULL);
>  			arvif->num_stations = 0;
>  		}
> @@ -4031,7 +4032,8 @@ static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
>  			ath12k_warn(ar->ab, "failed to submit AP self-peer removal on vdev %d link id %d: %d",
>  				    arvif->vdev_id, arvif->link_id, ret);
>  
> -		ath12k_dp_peer_delete(&ah->dp_hw, arvif->bssid, NULL);
> +		if (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS)
> +			ath12k_dp_peer_delete(&ah->dp_hw, arvif->bssid, NULL);
>  	}
>  	ath12k_mac_vdev_delete(ar, arvif);
>  }
> @@ -9720,6 +9722,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>  	u8 link_id;
>  	struct ath12k_dp_link_vif *dp_link_vif = NULL;
>  	struct ath12k_dp_peer_create_params params = {};
> +	bool dp_peer_created = false;
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> @@ -9805,11 +9808,14 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>  	case WMI_VDEV_TYPE_AP:
>  		params.ucast_ra_only = true;
>  
> -		ret = ath12k_dp_peer_create(&ah->dp_hw, arvif->bssid, &params);
> -		if (ret) {
> -			ath12k_warn(ab, "failed to vdev %d create dp_peer for AP: %d\n",
> -				    arvif->vdev_id, ret);
> -			goto err_vdev_del;
> +		if (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
> +			ret = ath12k_dp_peer_create(&ah->dp_hw, arvif->bssid, &params);
> +			if (ret) {
> +				ath12k_warn(ab, "failed to vdev %d create dp_peer for AP: %d\n",
> +					    arvif->vdev_id, ret);
> +				goto err_vdev_del;
> +			}
> +			dp_peer_created = true;
>  		}
>  
>  		peer_param.vdev_id = arvif->vdev_id;
> @@ -9925,7 +9931,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>  	}
>  
>  err_dp_peer_del:
> -	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP)
> +	if (dp_peer_created)
>  		ath12k_dp_peer_delete(&ah->dp_hw, arvif->bssid, NULL);
>  
>  err_vdev_del:
> diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
> index c2fb5bbd6cea..5f3bd3b9a3e9 100644
> --- a/drivers/net/wireless/ath/ath12k/peer.c
> +++ b/drivers/net/wireless/ath/ath12k/peer.c
> @@ -241,11 +241,13 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
>  
>  	spin_unlock_bh(&dp->dp_lock);
>  
> -	ret = ath12k_dp_link_peer_assign(ath12k_ab_to_dp(ar->ab),
> -					 &(ath12k_ar_to_ah(ar)->dp_hw),
> -					 arvif->vdev_id, sta,
> -					 (u8 *)arg->peer_addr, link_id,
> -					 ar->hw_link_id);
> +	if (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
> +		ret = ath12k_dp_link_peer_assign(ath12k_ab_to_dp(ar->ab),
> +						 &(ath12k_ar_to_ah(ar)->dp_hw),
> +						 arvif->vdev_id, sta,
> +						 (u8 *)arg->peer_addr, link_id,
> +						 ar->hw_link_id);
> +	}
>  
>  	return ret;
>  }
> 
> base-commit: a1e19289932aeef26085feb97597d624da6302ab

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


