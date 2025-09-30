Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E26CAC5B0
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 03:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brOCBlDY46dipdDeXww+agPSZ1wAHzxnSZuPebl2Evc=; b=ngIUQhYXycvxLC/RpThrG1ZGP7
	fvnKt/adBHkPNdpqFWpb2SdMVaRe+ZTd47YZ7OVera99jM/dZJ5QZ7SpDqVOBm8ep5k2tucmjt1+t
	a8zL0VSK+EJeZyWUt8Mr1qowS94Tg7QNQNxo19Tve3Wy6KdlvzIpRsyPXykPZG9Jx8e3g/UtfhjDf
	Q7gfLvym0C53gia4mjurCzMVz+qo9O6QM4xquXRgIGoafIN508ERjQpiBW6aNOScLNG7dGFDx9V22
	k4WzEepLp2R3i1t70kZHOVPoyLFO603sxPMo4bYH9hl45RTjMvdCWPH0FqBurx3Y0MJetzAemfIRi
	6QWfAjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3R4l-000000041jE-16bR;
	Tue, 30 Sep 2025 03:30:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3R4i-000000041ip-0YRD
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 03:30:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TH4Yhc029201
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 03:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brOCBlDY46dipdDeXww+agPSZ1wAHzxnSZuPebl2Evc=; b=G60IGFpUxhePuAQd
	lD8Yt6zSeqPGYefdVJTT7fu0WG6Xlo0ePeFyErGp9knGLLxmfUS3uGRvo9rwb3dp
	ejqTDuNAGMKpYW5Mw5DVDixMSYr8dl76JhTDhek8OgUcBM45XIJVc/uzlGLDMY6Y
	65qqiOfnnDmZKPeEOKKEYkL7S5MCfQrtMsjk3qhoKS8Py1kg3PN/O0QydZMHru5C
	2Tvau76GtzZk054Y+ok+MEsFk60sZ8J+GXdPfhhYAaymlL9soJXtMXww1Qhwu4Wj
	/LwNro4vqRu8timwbC6oB1gpGt+BQSTYvxb0pzE3Wh2G1IBoBUQBUrJtRkYgSmWB
	QPZX3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr2yav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 03:30:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32edda89a37so4961048a91.1
        for <ath12k@lists.infradead.org>; Mon, 29 Sep 2025 20:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759203045; x=1759807845;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brOCBlDY46dipdDeXww+agPSZ1wAHzxnSZuPebl2Evc=;
        b=RKcGAd4qO7+/rE2ITSgGP1E+eCe/T0WrLGdvtxAI1WkvJANAx1qKQmAPkB7XgtBGhK
         qzE6jr/QdxB8MuOkLwLhW5XiiRenTnofFTd/cTQjt4lgSv6bgE//LUhNRn0hUuyzFOWu
         vLo420ju6PUjOhN1fT6zvo/uVZx3EGOQ7Fx4WHWUu+TruTUhM3itiCTEI4MJcx9hdazy
         Catni0nVuRiuY1lKkYrgd9m+rfj7DNf0bZPLQR1hO/yMPdn/hwsTx0lAIZBd28Y2qgIt
         wgD1lI8kS3Um9ePL1J4pi2TSaUG1BA6nCPi9vsAhfZPRUcQBSB+7KRO3MzEi/lFe3wq1
         lfuA==
X-Forwarded-Encrypted: i=1; AJvYcCVl9E8ieMi/i4j3Bm1ltv85AjTc+g3MVTx4IrZSc/lgX7/jxHCNrC6iU9QQwYWlA0sytR1fzqE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Vf1ZsRlCtzVpurVBbueyC/u51VVxiIKyIB6h/Rb4HzrzHlJD
	HXdRtZG7CBQlG2tOzc+CHmE+UU+K4tmMw73sfOuJUBWq8gW/3AlCi43PtZXPtPL6phRk4lZFSGM
	3LQoX2gPp1al6+SgAZPKNaSnwxaGIKpECIRTc/lR1/LShEIZEtchj2UFLqkI2eQhV
X-Gm-Gg: ASbGncv3gVx1ookzzMSn3ICMNw9HlSp5p6cHtFe0oeZ5435bn4vLo6xbZ1cB22x6tWf
	V7NyynpVCbueeXHmtlm+wmKb/fTqCjpJbOsA+T+J4LIz7Wn9Q7BbFrzzgP10FtyEDTJ2ZoByR1W
	PAyPHOMK+7y9lPgmhST4xy/c6TIaJnk9rFR0HmGIGNKbk8imxWU93qYTU1F02b18rrYX+xIHQgA
	aQsEzOWXc3E6RSVVhNvJqnpAMdr6xzFzb3364o7XuenzAN+7jQdX8E+U0b7+inOt+pUH5euaux6
	Hpieby/mmxTSf1ZpNOL9ZYQia/N07zsNm2cRsBCoCXN9TPPrreyZH13ULXFGyPTQLP9bWJEC9oW
	qb5O66M7MQkavE9ycaIqm+ftmEl8QWLKRQERxJI/ypQ0=
X-Received: by 2002:a17:90a:bf0f:b0:32e:3830:65d5 with SMTP id 98e67ed59e1d1-3342a3013e9mr12967918a91.36.1759203045445;
        Mon, 29 Sep 2025 20:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmzhRm2yKLf/LvWqB19YTdagnUlAt9ONjeSefFwwWs0m/ewON8e9U8J7qVNQgu1b69BzaRng==
X-Received: by 2002:a17:90a:bf0f:b0:32e:3830:65d5 with SMTP id 98e67ed59e1d1-3342a3013e9mr12967895a91.36.1759203044884;
        Mon, 29 Sep 2025 20:30:44 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd90327sm18797359a91.3.2025.09.29.20.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 20:30:44 -0700 (PDT)
Message-ID: <39facf12-c452-4fa4-9b76-3da6a0ce3230@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng v3 6/6] wifi: ath12k: Refactor ath12k_vif
 structure
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250929115102.512719-1-quic_rdeuri@quicinc.com>
 <20250929115102.512719-7-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250929115102.512719-7-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX897KA2QMYMsz
 C4rgFWhLLRzHkSvabDuajLhw+ZgZO1kc0CmraZmh6sWReDz02RYG5FP2HGUZCCbM0NfYyRY6FuS
 A+igfbNW8VW97yk5flAonN9C4WCIUE7fQHmrCxkfzzNOS/W4gBzHnPzj1wdXSA3Q+2rPt8Cq9iE
 kGLuJB+oqeOKEDX9xg7fY2NTLVbLpKYH+6oSarFqjmd6frjgW87Hs+zO/KLZvIgqi6OJzC1HA+3
 rBVt614SMI4BLxz2TdfpiWpjFsZ+JsWtXqEvWlwfYv1QiFHVScbOqJOWNstTsFd/cYJZUzQvPWC
 O2XP9pZ6VSI1Hk0bjzCE0mjGh2zapLelMpR/uVzmAT+vW2AONouTwqfobRXwshi7tKWu00jdzaL
 vDwu3UiY5hWbi+ZX/GN1g+SIAS0IVA==
X-Proofpoint-ORIG-GUID: fTCnXbtjmM9_OMw3HoaNnhM7lnCtZEiO
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68db4ee6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P2Nd2P8nHlY44GcJbF0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fTCnXbtjmM9_OMw3HoaNnhM7lnCtZEiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_203048_291746_4E7C8E64 
X-CRM114-Status: GOOD (  10.74  )
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



On 9/29/2025 7:51 PM, Ripan Deuri wrote:

> @@ -938,15 +944,19 @@ int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
>  
>  static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
>  {
> +	u8 link_id = arvif->link_id;
> +	struct ath12k_vif *ahvif = arvif->ahvif;
> +	struct ath12k_dp_link_vif *dp_link_vif = &ahvif->dp_vif.dp_link_vif[link_id];

nit: consistently use ath12k_dp_vif_to_dp_link_vif()

> +
>  	switch (arvif->ahvif->vdev_type) {
>  	case WMI_VDEV_TYPE_STA:
> -		arvif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
> -		arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
> +		dp_link_vif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
> +		dp_link_vif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
>  		break;
>  	case WMI_VDEV_TYPE_AP:
>  	case WMI_VDEV_TYPE_IBSS:
> -		arvif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
> -		arvif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
> +		dp_link_vif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
> +		dp_link_vif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
>  		break;
>  	case WMI_VDEV_TYPE_MONITOR:
>  	default:

[...]

> @@ -318,12 +318,14 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
>  		       struct ath12k_wmi_peer_create_arg *arg)
>  {
>  	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
> +	struct ath12k_vif *ahvif = arvif->ahvif;
>  	struct ath12k_link_sta *arsta;
>  	u8 link_id = arvif->link_id;
>  	struct ath12k_peer *peer;
>  	struct ath12k_sta *ahsta;
>  	u16 ml_peer_id;
>  	int ret;
> +	struct ath12k_dp_link_vif *dp_link_vif = &ahvif->dp_vif.dp_link_vif[link_id];

same here, use ath12k_dp_vif_to_dp_link_vif()

>  
>  	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>  



