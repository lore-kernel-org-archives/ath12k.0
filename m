Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9D606A31A
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B3nvoi1u;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CATH69gT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilZCtIfS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J+FBnRhZ2QnMn481TMIHmuO1R3phrSYLbDfpoygi7QY=; b=B3nvoi1uQhiHuy
	hwGsXe1MOVugvm4HAf0U+qb5hHKYM4tUHBRCM6+odeVwazmV8k3N93vtEEjIkf0m2nN49o2JRgHKj
	hSZfDmZ7TONjZGDGX3ostIg77MklRavvuSYZo0001X38ncKWYM2cXfTG4cUbBtLpiz4IAzdzp7zoI
	im2A5zoRg16ghSia318UqExIyB+D6WgG9nxQ7rVK3d9XnQTXzA1K1bJO8LS6AKrpTp0q2ZJkAQuZF
	v+FASrEUtBzpwVAnydDfUUDLCQcUcwkJHwfZVN0xsUeBK630/uPeBHxIWI7ekwbNM7BgCLmOrShxn
	3b8+8GgPmmZH4UwrShMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAJG-0000000FsWv-3pYG;
	Fri, 23 Oct 2026 08:07:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAJD-0000000FsVH-0kfk
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 08:07:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9k12067801
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 08:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+FBnRhZ2QnMn481TMIHmuO1R3phrSYLbDfpoygi7QY=; b=CATH69gT/UksPUqN
	NTGTiU0p9T0kjVHeh/RxszIcC3m7wT+wn+M2dS9EXBhb4tIBQdPRKZXcQH2rWUPn
	Y4XbHnvuButfWwj9G7KKuxTPQvGWywJrtiULVVARCBYaVQY2WoC+UQWiaaRrbfKN
	yWrHQ79ARxOjdl/PdFGLiiQfhHcRB9YnBrgaCfhuaAOJfxCblWLd14rJdFiWQM/H
	QPQ93ZEhJYn2/8I9MXDhfDnkT8VfVxoLAf000yaLAgAPjB5CpQc0FICbcBfJ3JNL
	JVYDPCtwmg+N9RbcsFg+PeT4i15HzadMV4L/sY7bYvq+YO3OLxvUpK+oHVHMnQjl
	h5bNkw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw355x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 08:07:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd67e98f68fso871678a12.3
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742845; x=1793347645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+FBnRhZ2QnMn481TMIHmuO1R3phrSYLbDfpoygi7QY=;
        b=ilZCtIfSxzm+zwhKAmF5DO9rDsjfq94YfSn/iE+FwN1Z465dIFa2WcougZLriDeeAL
         bmPkDZibiQaw5x6WEq1JrP3LXDEz/Wje9hoKji/eTrLkFa0XPKvzEDrUXYf7XW+cU8zk
         9bj54ozs2jjJkU4O+p8vGu0aSq0FGbwSIry0nQV/uOTU2tu4mkFjNj5GhLXR8jNsgx3e
         hA9p+Bhz0OdqOqguETEdb31IU46n/FF2CBdBYjUB1FUG6MGJaNXOiPR6IQoVzeEZNDVN
         FIglz+wxNRTmQ30izLGjVA5z0DL0rTKVhZ1prvGKNZ24UwxtlnLVHpyCw+B1i0VBC6lF
         U8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742845; x=1793347645;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+FBnRhZ2QnMn481TMIHmuO1R3phrSYLbDfpoygi7QY=;
        b=ooCVupaRDD/IDuVVwXZ1tLgalel66MEVijSaNQOBbzEcfC+lO7gASK+TZ3h/+2YFLC
         3OOK3lNs6fyQTN8jTY2K1AKGhjcHYdkvDD55xQ+H6oBI7yqminFg6ARj4iRJ09r6dNaI
         ZCbiEgTzBt0qGi6xfJg9+R8C4cYaAfU8V5UGUTp9w0xaYzFdfXcesc654CbVASr+URnF
         B90exyCcyvLmHQv0oKgMfLflSoEETAtPMTnC3zG7QgiItLoBpNYjTfqyfgY/mpXP2pzu
         F2JWeBGATchtW/LrfeLpW3KAKr8ZxuXnCwWTU62vlx0XsgY11nBOMq1Od6h4NeG5vH54
         HGgA==
X-Forwarded-Encrypted: i=1; AKwUvBwubuMeOC2Fp9dTPSot9gq6xDbYIzKECxHe2vPemRqwSsdYnH9fgW/CpFZg3qJxGo9fNQPi660=@lists.infradead.org
X-Gm-Message-State: AFq9FYIR/0kSdUmAg+dPOfcySGunYfM1PuJnY1iTRlTmbjPUCzqEd+GC
	czJh93hBZ9adZv1wJmvrF0tvu9uBcnsqAjtOJ3H3o6uLLuDhHc7Rvq2lovjh1vD9gMSwJTzJ1A/
	R+51X2uGfsw8IAz/0GkJwXTfw2tE0HxF2ttHl/6XK6paVnxTt3T7+AA9BOqcqVXXr
X-Gm-Gg: AYBFou1EPcFlWvKNobNDV2ZFoLcQrXF6PQ8Vdfa/IhmWrZHvYg4Bu4xpzJtIRB9OZel
	DVwhw90wBIS6QBf1x0+T4ABke5pSEjLF+HtnABqbZ/Ecq1mGOaA1zcJ2q+1if2HR+0pGMOUfI5+
	3p1aeZjpWm7gfXO/8UFa2YsTJKVkq+mWcw3qqgUURfT5QpgU3j+DH1G8cmzRuCASEokiViOAFBt
	J7h7PRQEa23gcCu9ZY1pblZVAbjS5Oe+vxkUZHpr+vqqsiQoIWZjtAR3h1vZVgEdfLc1zbBvo5p
	w8Lb3th0r1/VRlEyH7AeNeRSN3gCJIxB4Ww8P38L9HQQg1eh3F7RR7hTnzDdSIdgEXlNon3qPjk
	BUfoAltz224t89st8AKi60NrTS50DhWvWzksD9c6UFyoa9lM0sYyJI6g+7ZDKOjwsi2YgaJc1vg
	==
X-Received: by 2002:a05:6300:86:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-3e359a97d82mr1320411637.9.1792742845184;
        Fri, 23 Oct 2026 01:07:25 -0700 (PDT)
X-Received: by 2002:a05:6300:86:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-3e359a97d82mr1320394637.9.1792742844735;
        Fri, 23 Oct 2026 01:07:24 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm529974a12.30.2026.10.23.01.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:07:22 -0700 (PDT)
Message-ID: <41eff135-80fe-4820-b9c4-48705159a013@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:07:18 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fLu7xD7HxvY-2Bep6-hv8LQjBkS90h-V
X-Proofpoint-ORIG-GUID: fLu7xD7HxvY-2Bep6-hv8LQjBkS90h-V
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb15be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=l5KLu2utXcWZLmDjM0UA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX/bHX1r4emk5Z
 rZeXiXLUlnkHENH9+EA7PdZtQ5kjP5/QWrkE2GLYHJaD5eHvr2hiVucs1xSGTmJYbZDtGwVwKx/
 YAp5PBNP3ocpzBTqDAHf3KnuyC04Ju0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxH34TJpOW/0u
 OsrnCoJPirzBgJzlo07pRd81p2n3aE4Us3rb40SK6jdTIlbixXlP6MIqXLgXGUAQ/HM9RdGIqgZ
 GUbgLsa86+FOvKl4czEonwMYLmGZS+tKxvxe4Nz+mkQ8n5/dQ4DdLEjPhJW80Yr8HZLojRY8jlf
 l1U2Wu52zaxYdoTzZUFbKtAuvW0zwoJacmQyp5ZoCwnTCf0SA7yvTcA3IKAwjKMgb2RKznLFQ9m
 3R2sZzmZ36mMJL/paCFxIYkfDAcFNz09z9wH1m8oxZ7ZVPEkgXsruK5OvvPjPSrGKMc1o6JS/0L
 gqGtNUg8QsBYUh2Bes7PLqjxXy/LWHNOWz04bPRz5AsV0WbcTB+UFR+7CNFPzzTpoFLSOMyDZ9O
 MyxlGNAsUU3zbLpzZ83jW3AfRoCO4fJAmvt5hmxHGYtGt3V+3AsabTze4mswA6e0KGmr2HUulCV
 blZCWtUgkrXObynImFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010728_634156_DE0E1D8F 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/17/2026 5:16 PM, Lorenzo Bianconi wrote:

> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -149,6 +149,7 @@ struct ath12k_skb_rxcb {
>  	u8 tid;
>  	u16 peer_id;
>  	bool is_end_of_ppdu;
> +	bool reinjected;

rxcb->is_frag already identifies a reinjected frame, can we use it instead?


> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c
b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 8fa0e90b4531..0003cc5a3720 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -138,6 +138,7 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
>  		if (!rx_desc)
>  			goto fail_dma_unmap;
>
> +		ATH12K_SKB_RXCB(skb)->reinjected = false;

These skbs come straight from dev_alloc_skb(), which clears CB area inside, so this is not
required. But for readability purpose I have no objection to keep it.

