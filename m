Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EACCD5BB0
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFZFaXo20zyBmuw5LWPStkgN4cehYROfIhtSIYDc2NY=; b=OVdP8LYdnnbfCYTiMF4w7DLK68
	kZxClN/Xnr83/KnIudcEYfvwAxUh+KQmAR5D0dGd6aiNeY5TRFaZeCO/7JUHJujyErL3pF6Kz4dhr
	sbB7xeS6SN36/R3uhUuPYVIKiLgm2CaYiLIGW4Tv5QE7o8/Hvmy0z+6Fl+QEptEA5TXg0JYFES8pv
	P+rcDrXKXPXbtd7rZqcDNVlb+g7i5+CI4c8oPt3kNgmpDJGLdERlLuyF0LXSN9Ib/PSlStIHcSJb9
	bAHGwq5nO2335rJxfVwvx/y5mtiY8s0arjKr/w/R/ODXyYK0DmyOlqi8RhOJd7AdDF2MHkerXIRe6
	WcdClNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM2u-0000000AJDz-496i;
	Fri, 22 May 2026 09:19:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM2s-0000000AJDC-1ILd
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 09:19:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M5sXGF777027
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 09:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFZFaXo20zyBmuw5LWPStkgN4cehYROfIhtSIYDc2NY=; b=G4Hl+a2bt9xlT2xB
	i33NHHBsAMvqM4JTaoRo6J9jdtEjEdAPknF7IUcKa2QmmhGxzC27bvY+tVYX5Xj9
	kiZoXBn3WAHOqmwu8T23KtrdqhbDz170SjOq93IM8ILJ4l8TFQ644RGVytnzKIBx
	AQoLJg+eh11S8HSm4dfOLuu4nonzHqpl4eDTe//NNxggneVnggdxx5AkDle2F7jG
	I7Q3xIZMfiGD+nIOkkg/lT7hwus1982KpkHL/oJYRmACRgnbquJa/PPGROpCxMrD
	DiWGtpJeJ55WFcMQ0FEE4vnLr1vM234NbtJjeDysEgC5Jl4Hk1wiMLdrtGhnKjqr
	DqnF7g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h2s6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 09:19:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837d0d71c61so3668663b3a.1
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441592; x=1780046392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFZFaXo20zyBmuw5LWPStkgN4cehYROfIhtSIYDc2NY=;
        b=VtIyZDq2huCTurF112BgCG01V+ybdlok1kzFvrdrmP3B6pbY69fd7jmn0cq6SsTN7Z
         mEysDjmfUHEyhwxTb/KFlM/y4xra9Ywr72s7MQqqLlreuo8koJuPaa8Ra+7a5J+MKW+r
         Czzj2hnrFkqjjZaxCsPibY/SjE29Oz7Fw+Zy8ZVoKTA5SetfMoOpWjDOqqFKOQJuBSp2
         sEcgZViFzncuU8Dqp+6osV/b1PvLUnkLjubsRyMTYs/JnX593HmrB89jNYCE+7WnoTzm
         bcqi8qQSnT9SEx1EfETTnWKsK8dn4MF327R8POXz3q8fkcGLKrWBc7wTX6QnwieA71I2
         XlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441592; x=1780046392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFZFaXo20zyBmuw5LWPStkgN4cehYROfIhtSIYDc2NY=;
        b=iQ2PmAG4lwo70Yer3LlNAXarjmztvpjIvymjYcXNEu/DYrS9AlV7Ny+4I45jqkz6Uz
         Mfy+hTzngwO5GD/z3nk3T8iK3QHsJZchnx61kTyp6s1b08JFgqHk4618cz0WD9XPS4TV
         +p/+nk5nBn+XqbT+OxkoDWBqtKv2EloaP+DYF5ytqo9BQLsOFUTVt/BLh0pHPG125Uiy
         H0fSTdPYxU5l7Q+74E9j7J546qkZqvCHKREotCqk7OeawPHxRDmmRds0u23bZqrRjbod
         jIPsUW3kw/1Fqd3khfPL4SJQohhJ1ZkYotZzDc5ed/YCTlGp9idHzPm/ACA5AYnoMjO5
         TMtA==
X-Gm-Message-State: AOJu0Yy9yq3GtVbJin1hq5Zlhpd/z0r/bAspO1RPjK04edOqCUNK23RP
	GFxYg5c1O+d7GCnN7LSPv4gTrXGT8ODQmrZszWRVke+JgirfBY3L87j8pdV20UM2MAZMIjsSzMa
	6cwKj9Xa/IvE9Upd5sA5yEsSHyUWx6XHbvvOwP7FkI/0BoPo3tHAl4dhs8kxydzIGnrb2zTk8
X-Gm-Gg: Acq92OGkcfuilcMaQ2CisgPnk6SR9A4GtenJ+hMJXOEB9XrOplTXwoKCbE4qEhTE7BH
	5/LVgiLsii5eqeoQy7+jFcSzfRSzatHz6x5hwlMOVPGbOAYMnw1Psohq6kqncXDB1wriWLFGjTW
	MmGs97Qff/jNCG14+ZKXeGNu03dpSyfO309nL82Ipo1xfFGc01bIabKzHCvPqGBySVeZzvBxXec
	jCx0ZKfx4gSrRuuFy7CVqLEyRvpAthqxkOa+ImLUQofwGhU65eXz17a5X8mr332wDfVEPEiIs7A
	8ovRETIcUwDJt6nNbxyvbsmzfgt4f7GsbF08+fHDNI4O2kgdr44OWJpDyFtLOznloSuBi11is9k
	47UmPVTIM+ydoHebfoU6dAORYC2MaX6o0/6JeA9wkK9Qe3r+QJR6MbX076iMj0yu5
X-Received: by 2002:a05:6a00:4f94:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-8415f3d0e36mr2709311b3a.11.1779441591994;
        Fri, 22 May 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f94:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-8415f3d0e36mr2709286b3a.11.1779441591459;
        Fri, 22 May 2026 02:19:51 -0700 (PDT)
Received: from [10.152.204.244] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea4de4sm1391410b3a.35.2026.05.22.02.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:19:50 -0700 (PDT)
Message-ID: <e3328366-77ab-4505-b1e2-63f928cea903@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:49:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Prevent incorrect vif chanctx
 switch when handling multi-radio contexts
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20260522091200.3179640-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
In-Reply-To: <20260522091200.3179640-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d_fdh17796bsnq8OOE0Mnyf3k-a6-NUx
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a101fb9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ve6J-mc7yfqyW4SkaIUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: d_fdh17796bsnq8OOE0Mnyf3k-a6-NUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MiBTYWx0ZWRfX02oJsQtP8xZ2
 XF2WRPWkgaUmZXIfDr31b0QQ5/ZjIB54T9b94PbUi1DCOm8g0/i0t1cE4v+jknwUolAE2MsHGAN
 EHIl8fr07fk2HHC4UlJ8IczR3U/YUtW/X/KOrVVnU4QtGhewJFSgHTEOT1JRhlfmYGNHLmiFhpK
 zL7/gFCoAzNsknFQInVxVKuCULI6ACTzprXU8UyFIwWhYgQmwMn2ZWhLStvPIBEgfS16Wz/P4Qo
 OzPoJMAcic8jJUdytJLKxSLAM20FnbCVHalGTcC4oZaMNdUiE/ZawQmlFvITmet6Qcg0pE8tkri
 0IkSE0y226Smce93PiE0pZjWKdovqbBRZvOjsS+dSD78e7Ri6nmXCCyVc9n/cjspvLu5UpQrELN
 kiNE1zuKfkU/HnDR8SKY7YPXRPSc1X4DKQzi3eqS+Wl6A/3M+zYazcf/UFs4zyGHmX1//kdrBRn
 EiW/gTjJfn5ADVQ+ofA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_021954_475057_3B33FBB0 
X-CRM114-Status: GOOD (  26.11  )
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


On 22-05-2026 02:42 pm, Maharaja Kennadyrajan wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Kindly ignore this patch. I will send v2 of this patch with 
Co-developed-by tag added.


> When multiple links switch channel contexts around the same time, mac80211
> may complete CSA for several links together and invoke
> ath12k_mac_op_switch_vif_chanctx() with an array of vifs spanning more than
> one underlying radio in a single-wiphy configuration.
>
> The driver currently assumes that all entries in the vifs array belong to the
> same radio and derives the radio context from the first element. On multi-radio
> hardware, this can lead to incorrect vdev selection/updates and may corrupt
> driver state when the number of vifs exceeds what a single radio supports.
>
> Fix this by validating each vif's switch request and then processing vifs
> grouped by their associated radio. For each vif, ensure the band does not
> change across the switch and that both old/new channel contexts resolve to a
> valid ath12k device. Reject attempts to move a vif between radios (not
> supported for now) and return -EOPNOTSUPP to upper layers.
>
> Then, iterate through the input vifs, collect all unprocessed entries that map
> to the same radio, and invoke ath12k_mac_update_vif_chan() separately for each
> radio group. This removes any reliance on mac80211 providing the array grouped
> by radio or sharing old_ctx pointers across vifs.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 87 +++++++++++++++++++++++----
>   1 file changed, 76 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 54081beb9a5f..5c8e25d40a98 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -11476,6 +11476,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
>   			continue;
>   		}
>   
> +		if (WARN_ON(!arvif))
> +			continue;
> +
>   		ath12k_dbg(ab, ATH12K_DBG_MAC,
>   			   "mac chanctx switch vdev_id %i freq %u->%u width %d->%d\n",
>   			   arvif->vdev_id,
> @@ -12267,23 +12270,85 @@ ath12k_mac_op_switch_vif_chanctx(struct ieee80211_hw *hw,
>   				 int n_vifs,
>   				 enum ieee80211_chanctx_switch_mode mode)
>   {
> -	struct ath12k *ar;
> +	struct ath12k *curr_ar, *new_ar, *group_ar;
> +	struct ieee80211_vif_chanctx_switch *v;
> +	int i, j, count = 0;
>   
>   	lockdep_assert_wiphy(hw->wiphy);
>   
> -	ar = ath12k_get_ar_by_ctx(hw, vifs->old_ctx);
> -	if (!ar)
> -		return -EINVAL;
> +	if (n_vifs == 0)
> +		return 0;
>   
> -	/* Switching channels across radio is not allowed */
> -	if (ar != ath12k_get_ar_by_ctx(hw, vifs->new_ctx))
> -		return -EINVAL;
> +	struct ath12k **ar_map __free(kfree) = kzalloc_objs(*ar_map, n_vifs);
>   
> -	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
> -		   "mac chanctx switch n_vifs %d mode %d\n",
> -		   n_vifs, mode);
> -	ath12k_mac_update_vif_chan(ar, vifs, n_vifs);
> +	if (!ar_map)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n_vifs; i++) {
> +		v = &vifs[i];
> +
> +		if (v->old_ctx->def.chan->band != v->new_ctx->def.chan->band) {
> +			ath12k_generic_dbg(ATH12K_DBG_MAC,
> +					   "mac chanctx switch band change not supported\n");
> +			return -EOPNOTSUPP;
> +		}
> +
> +		curr_ar = ath12k_get_ar_by_ctx(hw, v->old_ctx);
> +		new_ar = ath12k_get_ar_by_ctx(hw, v->new_ctx);
> +
> +		if (!curr_ar || !new_ar) {
> +			ath12k_generic_dbg(ATH12K_DBG_MAC,
> +					   "unable to determine device for the passed channel ctx\n");
> +			ath12k_generic_dbg(ATH12K_DBG_MAC,
> +					   "Old freq %d MHz (device %s) to new freq %d MHz (device %s)\n",
> +					   v->old_ctx->def.chan->center_freq,
> +					   curr_ar ? "valid" : "invalid",
> +					   v->new_ctx->def.chan->center_freq,
> +					   new_ar ? "valid" : "invalid");
> +			return -EINVAL;
> +		}
>   
> +		/* Switching a vif between two radios is not allowed */
> +		if (curr_ar != new_ar) {
> +			ath12k_dbg(curr_ar->ab, ATH12K_DBG_MAC,
> +				   "mac chanctx switch to another radio not supported\n");
> +			return -EOPNOTSUPP;
> +		}
> +
> +		ar_map[i] = curr_ar;
> +	}
> +
> +	/* Group vifs by radio (ar) and process each group independently. */
> +	bool *processed __free(kfree) = kzalloc_objs(*processed, n_vifs);
> +
> +	if (!processed)
> +		return -ENOMEM;
> +
> +	struct ieee80211_vif_chanctx_switch *group_vifs __free(kfree) =
> +						kzalloc_objs(*group_vifs, n_vifs);
> +
> +	if (!group_vifs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n_vifs; i++) {
> +		if (processed[i])
> +			continue;
> +
> +		group_ar = ar_map[i];
> +
> +		count = 0;
> +		for (j = 0; j < n_vifs; j++) {
> +			if (!processed[j] && ar_map[j] == group_ar) {
> +				group_vifs[count++] = vifs[j];
> +				processed[j] = true;
> +			}
> +		}
> +
> +		ath12k_dbg(group_ar->ab, ATH12K_DBG_MAC,
> +			   "mac chanctx switch n_vifs %d mode %d\n",
> +			   count, mode);
> +		ath12k_mac_update_vif_chan(group_ar, group_vifs, count);
> +	}
>   	return 0;
>   }
>   EXPORT_SYMBOL(ath12k_mac_op_switch_vif_chanctx);
>
> base-commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0

