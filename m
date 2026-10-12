Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC4DCA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pPPLwjmVufFsK6SDXsEs5dgYISVMn+cFpVZ28+JrPU=; b=4AMATJExfGAvh57rfJ/t0LkPgx
	wNx/vEdrr/wYDCmPp95tP9sXXAj6/dwonHDe4yhD1djZTo1OBhtb0WNwKe/P2SQxQYMOgDOblMe56
	BAVlx/FGNU5Y0MHJ7BtvW/8IAYNf9SnYIvK4e6KJF3azfquXcDv6CzRBOSKSHj7lewVBhU7KuTlbJ
	45VWtafmqyJy3PsECywxTa438Ry7fngXeSvuV/RPSWy5hDfqSJhutzAriLviMAGtd5S9EiTLYTeAT
	MbfZN+HIogYhn/aGFcZ2j1ow0BYGVy6UXy4umPeY14ctqPtR3FoLR70L0lpIqk6gXDomBW+G3NEqX
	1VBLb94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8vB-00000009hAa-16cC;
	Mon, 12 Oct 2026 05:50:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8v8-00000009h9u-1znk
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 05:49:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55qbb1339465
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 05:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pPPLwjmVufFsK6SDXsEs5dgYISVMn+cFpVZ28+JrPU=; b=KNwi3vaFD3SQfj1a
	o/nqZfjagrL2NX5VhMo6lbcNEGaP8yTkgyerpQb8sm9IehuBoL9qMJszqbmSLie4
	WhsJezbS3i+1n6ZP0PZJ4JJ6PXwlfC3zlRI2R9xLxV5oyXWs+7+wsrgGpWsUXQzI
	FIJxeI0pQFnYhJsOAyhiHcTDVTzrl6qjOsLVXAsOniQlmH0M1C7SbrBMOVxpPJR9
	6phyiEj3tRjf0RBL1Y/ADtZGScd49q+j8PPGeLev6X8zDf6Jtor1nzD68fAgKpuw
	PR5efBLge/4Tx+OUg8p9vclBerTopImzHXtkLLpbiuVpJfRHVJtYv0ZuEmfSmFCO
	ZTWlJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk24wvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 05:49:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8ba4757baso5411855ad.0
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791784196; x=1792388996; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pPPLwjmVufFsK6SDXsEs5dgYISVMn+cFpVZ28+JrPU=;
        b=WI9R/JU4GVbYQgNf5GyayWhQfnfNXuM7Q55rlPTg0EmICD1xkaZqtOcgSfphSDjVes
         hI0PHoJuAoXfcF1p94MdDO+NciqUkqdkEn2Po8LsKRqH9VdVahlt62kB+hGgjUZZilWW
         kRm/Z8s/Lms5WbwDF0SL7eOScVYXrAlvi1E2Obz0jfbc5Mm92+Z6UAxXEMJeqV/zMSGu
         e6x6GEyJyPZIczuwmrUk83QP373hzC3vZKYidf4EcR4dmVscezsim42aEO6awMW8bklV
         Lsjn7qZfzT1zE6AOLv3uweLwK8YTUkRivrxfaax2H0f6uWyUmoM1gDDBTJY5D1lE8HO2
         Kouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784196; x=1792388996;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1pPPLwjmVufFsK6SDXsEs5dgYISVMn+cFpVZ28+JrPU=;
        b=P47N42k2zA9tXO4Vn0wVVk+L65vGv9KSOsr9h+xfBWQGwaYndTBv1R6FnotH2UIet5
         GF7sfbyh9QtJ3VcJtA3rBC4FDQBKc5+beFGZQK+xGhsSteUFCK13KyZFE9f4NjdO//Kz
         uxNtwoTXO6N2B9Vj77J2otxZuWxoT/mRYhGvAKRsIlispR+QEmzwz7ckhQ9CYkrbI/BP
         LDDy18nM4jgWKkqV9INC5qml7ua1iYtVAgZ+xS/LDlbuf/xVlvTqhywSi5hBirHzBpB4
         RTnK9+dTXDfA9k3mmnnH2jbYWwxvffe+JGdmf+/S2JfL8DY2QzcrXzKTM19coRi75E/e
         gvOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAXwi+WQxgAEUCR/WAPQNg5+5whIWO9CIFq52UfgTJqdukaBjzfZZrmH/cqbAsuxdKlgTQoC4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJBtBnYX1jllCaxSYhTBWj+xPbrSLiOFF4nw/TbsTMswlaMTd7H
	2E1VAkIJ15pO1QD/5HT0spGo9otHML8afNWaeRox4ANui5ycZqpoNIuPL3XKm+lOAamcxQwaQx/
	nryLVO+1fdW8rB5hjmjfw9n80iDmt2mjarHFtPliUF0wr133rMcZfFxd/roBSwSc6
X-Gm-Gg: AYBFou3bqj4FyKxkM+UM60LDwN5w8RoHMn/+nnx7lb4tHgd6UCsyG4DVVRj8l8Iypyu
	KrEthrHvgt2RUKDF3CWvkm/Rg2Tu5x41yAJSDuJwpIuCCrnvMCu+KLPSYQf1jC5Tbfv8/SIc8pm
	O8O+cr60NWu9qWbgtCG2WAqBhQQANWHu17oMyc63a/U+imJ0T3CLxGmgUUp9MBcipf9Ea7iqWAq
	qAUf1gjZBPr5Ybc8Ycl3tKlB7LOUKhifKtDRfbhIaV+2e66XUXbGDFzMuNC+uSi96FiquhlRcFb
	Ec8wTtC3uCmmsvXRFb2r3OZLu8aFsyg6qgpC979hc/GqE38gRQj7JokS8z6x43MbwaXPi+PGA0h
	xp+enB2t2YXqT2nfua7+s68y6m7LnzIk=
X-Received: by 2002:a17:903:244e:b0:2e5:d33a:88dc with SMTP id d9443c01a7336-2e842aadef1mr75953445ad.17.1791784196452;
        Sun, 11 Oct 2026 22:49:56 -0700 (PDT)
X-Received: by 2002:a17:903:244e:b0:2e5:d33a:88dc with SMTP id d9443c01a7336-2e842aadef1mr75953085ad.17.1791784195337;
        Sun, 11 Oct 2026 22:49:55 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4cf3sm37758925ad.72.2026.10.11.22.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:49:54 -0700 (PDT)
Message-ID: <8ec100c6-e8c9-45a1-9bc8-e4cef580af86@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:49:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] wifi: ath12k: avoid IDR mutation during vif mgmt
 TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <20261003092104.520135-6-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-6-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yYruV9HCkkbjMtLDcefsba1C9EE2yXzH
X-Proofpoint-GUID: yYruV9HCkkbjMtLDcefsba1C9EE2yXzH
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc7505 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=YGf98eWBf9nrUm2w2I4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX4cuMluL8V/Y2
 CFdlYKey7EdjvlyqNQH3OrUf77bXPcHglSysHKZu35s7yI7zWVnuGsVZ8JwBQIAPcagbBrtFV6G
 2yANwsuhowROlgkqPcNWL46krqpavK45OWYnlvjDfCINS6oZp7AjfZOzyqTnDaK6XuRFHo7z6tU
 9/+idSq8s72J/dgfmoh2HdDzguWDnSHEh1Q+P0aVgBADN3Kvixk3XJYBtHlQ8Hf2rYhDxHKmYDh
 LNaqeC2kRaGorpg7y6N8DqIV43HFLd3+FnfuSG3jAjNM2O5ThvXutfgY95z2thH42FPEQ7HsLgf
 0BDUvyS7CTlMCTeGnbF4WhY+0Ei+3JsAciyFNkz5CuZibN1le8EnWYyfqEN6R1qRbx1FO6Ljf0z
 +OLB8ZSE0jvgLWyQUREL3BCQdCIIlPSKq/oPok+uFNIYai9DP78xFYZkVMqHlBL/d8dTAGYCjRe
 6PPVu9FF1BxAQfJWH6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX+PIRJFc+v09p
 sU2DoYBEwUhf89onKRVt5zcRCIjLs0pcNoY4rK2dDfSbzOEAFCMC+8NQuQX80sFjvQ2cbINfJiW
 aGqDbILgZOUNsReIEjj9uBAepF8N8kA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_224958_548965_291FE287 
X-CRM114-Status: GOOD (  18.30  )
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



On 10/3/2026 5:21 PM, Jiale Yao wrote:
> ath12k_mac_vdev_delete() walks txmgmt_idr with idr_for_each(), and its
> callback removes each entry belonging to the interface. Removing the
> current entry can invalidate the radix-tree iterator retained by
> idr_for_each().
> 
> Move the walk into a helper that uses idr_for_each_entry(). It performs a
> fresh lookup for every iteration, so each matching entry can be removed
> through the locked removal helper without retaining iterator state across
> the removal.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index c0acb92b7320..108ace48cc97 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9196,16 +9196,18 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
>  		ath12k_mac_tx_mgmt_free(ar, buf_id);
>  }
>  
> -static int ath12k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
> +static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
> +					  struct ieee80211_vif *vif)
>  {
> -	struct ieee80211_vif *vif = ctx;
> -	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
> -	struct ath12k *ar = skb_cb->ar;
> -
> -	if (skb_cb->vif == vif)
> -		ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	struct ath12k_skb_cb *skb_cb;
> +	struct sk_buff *skb;
> +	int buf_id;
>  
> -	return 0;
> +	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
> +		skb_cb = ATH12K_SKB_CB(skb);

this has the same UAF risk as Ramesh pointed in ath11k patch (patch 3/5).

> +		if (skb_cb->vif == vif)
> +			ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	}
>  }
>  
>  static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,
> @@ -10967,8 +10969,7 @@ static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arv
>  	ath12k_peer_cleanup(ar, arvif->vdev_id);
>  	ath12k_ahvif_put_link_cache(ahvif, arvif->link_id);
>  
> -	idr_for_each(&ar->txmgmt_idr,
> -		     ath12k_mac_vif_txmgmt_idr_remove, vif);
> +	ath12k_mac_vif_txmgmt_cleanup(ar, vif);
>  
>  	ath12k_mac_vif_unref(ath12k_ab_to_dp(ab), vif);
>  


