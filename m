Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D258C5516D
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=; b=TgeHfHWt5SD5UHSGwrvfrrBpWa
	KAq3vHvWSNLr/fKr5ZFeENNAQeTtxQLDPyTU7U8qdxs2BPfBgrIWqdoHOd/R90a2CTX+2kK7xws9b
	hEQg25nS+NBTUZ/LP4ip5bAk9N/7zbtH90RB/baG8ZDu1hVJdv3/xZSnq7Tc4fdvjBkfDhwdh9TZz
	+MJ8db9DVVo07dG8r5iyMLmt6WVIzCZi+rI4Oly8Xp4yGjJpx2kOJXIb3LuZ/zOdki44qru4+dKpH
	GDRSVxBOTssv4sQ0JKwUfbf3rFiOMfVcikCmviJoCM/oz6hSkHgVFkXW4XwzLK7xFKLeVxm0qCMu0
	eNIfW8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiv4-0000000C6c9-3I5i;
	Fri, 31 Jul 2026 08:48:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiuz-0000000C6Zs-0YWB
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 08:48:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8bcd73389858
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=; b=ZFER2MqW0V669Z9o
	0G/Uf8oyXbDt2XRwQ6DhHWatjPP1fATBHeCrNppbMT1uubhNyM9cD4k5PU1bsA4g
	XwAPBDhFngkGkyDUTepJPPFia5B3PtvJh02WTV1FpYeRORGH/CGlOyJnvgHPpjbx
	5Hvmk3xtc2vXLlmVvxJL8jTOogP1ND++p+npcLSAkztisrP2yhnowvMWNa5ajwin
	24xSqUjpDDS+nfyBr2fTD7+rD065yjD46yP/MOstiG9GWqki6MTKgQbOsS84wPOc
	nlLo6LQpLxAnNl6cKx4qHjkrHUoUqs4OLW484sHESy0NTvus071C0vd0EEdWyU4K
	oSTntw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc2g1du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so6416015ad.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487716; x=1786092516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=;
        b=UiDAoMIDd3TkrftMkrBdHRnmJbu+pQMo3YUNectvqzsg8Bsjx3nWr9rb03D+MYTLJQ
         nphjEWg69/557Dh3MqZYzUZ/RODq/VUeUH+QrbLi424VGIBgBmqnjK9pHUUVEvC2IBNJ
         z2zrzF4uA4Fh77695DqtMiikYUesOpkcSJwY21tJVw5yJFqAEdx5FgOQFcrjRDHiaJYW
         uhYkx+1BC+ByRpRaRxFjaOvlCj6R202rM3/UrOXFLERJEfGA7SsDDvJdg4ug+mx4iR0P
         JUQI6bqKQdyKUVRGWXZrxvmf5VvVV4Bvs/7soIAa9DFRtIP182nEsxk/x9SrRqJkvCC+
         CGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487716; x=1786092516;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKqhQPZyBwZ4oy7X/APXLY0ykWXFwIpRNGZDu5Vj7iw=;
        b=YtTd+ghOJxLAqAdkHpXCrCqww2gmPwhFdDVfTVxggduf+QmAgVjB/3Kh8LyYlYv+7B
         KGg+ROzFcw3+zshPy91IElfe8Vw7JTgJAF8RJSHjmbweDcDNYB2qgLPB3yzH1X2IqsX3
         1BDKY3Dpfig7lK4IHnVhvaZawqmBY1EtQjqPPBAmAfCZ/hrIOXWP+GhWqOtAZeiqYK8k
         0cHxg5vjH2/WeRkEnHqd5DRX0axgB2vGKCRJe6Q6iVvkcyyi1HyywpstFLq27a3RNzkK
         oMIzDqYwcmYzBdW1cmICnftgJ11KX0qC0mIqufAqy0aQ7mowky0lA27SHYHNPn3GfPKV
         YO1w==
X-Forwarded-Encrypted: i=1; AHgh+RqctUSB+Ha6PvLvMjZpaEMgW8QYNNJblY73btGpPm9q/hBBKAxmrBFhUOgqh+jsXq57ycdaESQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWipKt8RO5Eanobc+bLtTNr7g1nXDILGlB7tW1pUkMbnaAgrXm
	FO7UYY30bauRNZ0VybBSdfAwXHO87qQ3fcIfYdLj5x2Kmk4yG7JfoSxPhZLOIn1vLL3F1vEglM2
	68tiFqkbbczMnLlrJz8O2gTEcUuW4Bizd0h9oDvcWV983/pBcMCedLzKtdVPv5LyS
X-Gm-Gg: AR+sD122V7xL5Jq2THbv7T+2gQz6s/jSwXlF9jQ4v+o/TmP/HIk/voJp6Em88b5JByp
	JnJIZXvLcAhxcoiS6/IEBNGqfQUkGiV+IXPyryKB6yGd+rjnAIqtux0qNETg5Q+J6ERq2aRbXvF
	55m7v5481o2Fe5neHY1OeQ/jaYtk22dsTaiMXXxKZ0ux1E1rEg3vtYKblFr3Mq3OIlOH4H5PHPi
	bc3c/qlFOW0k43KdY8N3g6DLwRtMyd9o6m6z4p9rNz1/jRJjgBw5ZdZEn4Zxj6ZvnRsSX4Qp84w
	uepS26CNT7BuVdu5amSqgN/R841L0PW2/KXLqNXpqQ7CUi+mqf2B7eHhdqr1RD11zLzi4SacVdy
	LIblSuFm5tIDUtG0SPreBmGsx5/mcm4k5Wyu4VWQGduCKjY0doNcgMK6QyESoiWWLacPW6wba1Q
	==
X-Received: by 2002:a17:903:191:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d046da5e90mr12155925ad.16.1785487715794;
        Fri, 31 Jul 2026 01:48:35 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d046da5e90mr12155795ad.16.1785487715368;
        Fri, 31 Jul 2026 01:48:35 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b12202bsm2603905ad.66.2026.07.31.01.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:48:35 -0700 (PDT)
Message-ID: <87f02c36-6257-4713-8d39-370f575ecd1a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: fix MLO beacon handling using per-link
 addressing
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-5-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-5-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zdst8MVA c=1 sm=1 tr=0 ts=6a6c6164 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=wMn7BGEeBF2Z8DAmW_4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Z-1C75Ity9z4_YB-ljSEQR1kN3oJOBtm
X-Proofpoint-GUID: Z-1C75Ity9z4_YB-ljSEQR1kN3oJOBtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX/vqoL/3usUAk
 eps0BwljkvFobCmXSwn5co7yUK3BQ+TOcGb1vQk7Nm+OfqaqmWmoN6mzyMjaeeZ19rkR2SVdQQ5
 RUYYtJqdc2fqCWFEtUunHlEYDOGKRkXzaBS9HDM/lz/1Mfb7EEsMpKKUBUpJwVf/gPyGxN+G0/V
 dAlCr86yLkLIlry8is1QBxuuXdVpL0HalsjY1VQXZE3BaRQeiCRwWWqD78EwDFpooe1vNhKr/wc
 qjiRUxLwwKPO2rCYfLmnU1SUMtS/iXqK3izYdxvw9wftBxBaC5Z4dkdNj/+r/zR4CrvaL3AIak6
 4XEqk+U4PH8Zl6iKQJaWmpAhU37fDTdepyoCLbRzdLBxMF/3+13Lj9s7PDlkQ9wUCnh6Dqtb6RL
 ebADBPYq26F5CmZ5yu+aZBNlkW4EGWnTkMr05KWlYqy34L1rDWEVJ5v44StESojyherRM68A925
 yhIcYyFt5j7CyQcOeLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXwent635y9R7P
 O/DThTA75eDLH7upIkj11sXbYZCxTCRZpy9N/FRqAwM7zxK2/hs/+uM2cKORCf4kt8bZQWHy5N6
 E+XcMgm9amzTkQASYNbVkyDOFy7bksM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014837_182847_4F7C44A0 
X-CRM114-Status: GOOD (  26.83  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> ath12k_mac_handle_beacon_iter() uses ahvif->deflink for both BSSID
> matching and connection_loss_work cancellation. In MLO, deflink is
> only the first link created for the MLD VIF and does not represent
> the other links. This causes two problems:
> 
> 1. Beacon BSSID matching only checks deflink's BSS config
>    (vif->bss_conf.bssid), so beacons received on non-deflink links
>    never match and never cancel connection_loss_work.
> 
> 2. Only deflink's connection_loss_work is cancelled, leaving
>    non-deflink connection_loss_work timers running even when beacons
>    are being received normally.
> 
> When the firmware reports a beacon miss event on any link,
> ath12k_mac_handle_beacon_miss() queues connection_loss_work on that
> link with a 3-second timeout. If a beacon is received before the
> timeout, ath12k_mac_handle_beacon_iter() should cancel it. But the
> deflink-only handling means that for non-deflink MLO links, beacons
> are never matched and connection_loss_work is never cancelled through
> this path.
> 
> Fix by handling non-MLO and MLO cases separately. For non-MLO, keep
> the existing deflink behavior. For MLO, iterate all active links to
> match the beacon BSSID against each link's BSS config. When a match
> is found, cancel connection_loss_work on all links because the
> work callback calls per-VIF ieee80211_connection_loss() regardless
> of which link queued it.

is it legitimate to change mac80211 to support per-link connection loss? if not, better to
move connection_loss_work from ath12k_link_vif to ath12k_vif ?

> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 36 ++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index e36a37852fab..ebc35636b4ef 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1946,15 +1946,43 @@ static void ath12k_mac_handle_beacon_iter(void *data, u8 *mac,
>  	struct sk_buff *skb = data;
>  	struct ieee80211_mgmt *mgmt = (void *)skb->data;
>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> -	struct ath12k_link_vif *arvif = &ahvif->deflink;
> +	struct ieee80211_bss_conf *link_conf;
> +	struct ath12k_link_vif *arvif;
> +	unsigned long links;
> +	u8 link_id;
>  
> -	if (vif->type != NL80211_IFTYPE_STATION || !arvif->is_created)
> +	if (vif->type != NL80211_IFTYPE_STATION)
>  		return;
>  
> -	if (!ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
> +	if (!ieee80211_vif_is_mld(vif)) {
> +		arvif = &ahvif->deflink;
> +		if (arvif->is_created &&
> +		    ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
> +			cancel_delayed_work(&arvif->connection_loss_work);
>  		return;
> +	}
>  
> -	cancel_delayed_work(&arvif->connection_loss_work);
> +	/* For MLO, each link has a different AP BSSID. Check the beacon
> +	 * against all link BSS configs. If any matches, cancel
> +	 * connection_loss_work on all links since it calls per-VIF
> +	 * ieee80211_connection_loss() regardless of which link queued it.
> +	 */
> +	links = ahvif->links_map;
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		link_conf = rcu_dereference(vif->link_conf[link_id]);
> +		if (link_conf &&
> +		    ether_addr_equal(mgmt->bssid, link_conf->bssid))
> +			goto found;
> +	}
> +
> +	return;
> +
> +found:
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		arvif = rcu_dereference(ahvif->link[link_id]);
> +		if (arvif && arvif->is_created)
> +			cancel_delayed_work(&arvif->connection_loss_work);
> +	}
>  }
>  
>  void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb)


