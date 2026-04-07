Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB4FB5189
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 03:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+E0zzEKdybd0FhWJhe4rpTtHjb1TkhRmXS5TeSU5yU=; b=b0WpfuQGsZjBZODeOmX8IhxAVC
	wMZwq5d3a9G0e5o7yrkfQO2tyu/11y44SZIP8Z63mynzXVDRmVN9k7cP8OZLvLCg24U9jS5MyZF5d
	+M1i/V8z4+51ljpl0siaGz7vSfG1RnnY6/KAUqmJqy8nxe6TpI1dKylQ8+2L8BnyqF26ozqXVqAOv
	p/SsJoGaZAXugvdH99+VnreY+A+VHiImBGFmnyYiJ/egSMTHCo+Cusro9OMmk31YrCLzARZMK+Uzx
	m6Gex4v42Z1NdB3Ldcib1t6OmwP8hAICtj+FueQRnjI8KFWACG7FeZsyB8txFssWJwQGDP0SFZpSz
	3lDaNCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x4B-00000005pCe-3DOn;
	Tue, 07 Apr 2026 03:25:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x48-00000005pCF-2Yit
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 03:25:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LPf8u3815234
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 03:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+E0zzEKdybd0FhWJhe4rpTtHjb1TkhRmXS5TeSU5yU=; b=Dx7ksPEQ7jGDCOr9
	pq/sT/Z/4PUTo+ow7nxZDbiE+97K9PMkjlWa0n4+z62vZ4Kgzn3As2hpApol4J+y
	4emEfdUtO+glSmAkHKfpNDWCfpF7jWFhWPJf5I+uiIZMASmysAaoKzNkxdiKMxih
	B/DgxE3eN79xgd51LQuU9alt1iTDL+fZmyi8Ya8C6RWC2rsd28Sl7S00iyMr5qVE
	W1EX7gZxss9JtvH7ehW3RwiotbUJrssAtcoXc5pPaeFuOVVjsAjKKjbKJxPswTcW
	PkdFcWDkMiOE4abKxlqBwsY+qPe3fzsFGsj6uPmTXZ0erL6uVOMR81bDZWLUIZ/d
	/VBVEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4rtfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 03:25:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso4182676a91.0
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 20:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775532322; x=1776137122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+E0zzEKdybd0FhWJhe4rpTtHjb1TkhRmXS5TeSU5yU=;
        b=j1uqVqUyDL6wEmCQWgFdTusZ/hF3VBj8xuc5pZP6E1LrCYEqGdT8+yGEPFvgQkE/F2
         T6ibw/cr8OOL/MkNr3zAFA8NzIJbAg+e3LN3MpuDXEQSV2UTNqRnkVGF0el+VAWtPVUq
         taybjTGJ/rqJGqOv9GHNn1d1rIRRQOnWKHVwf9qXmN9Q0W8YUhJbi5hygSWkI7JlNHOH
         0o8BlLWstV4CWK1QiAs30ZeVc7cMMEAs4nBVJQGZLJOHF3YV/0+EAtu/rlXPbTuPYNFv
         zeZfOhByZFvgFfAPKcgXkN3SOV3DGZVJefTw1QGJjSzpkVYhfc0bP5Ff8z5XLCDkDIDj
         AL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775532322; x=1776137122;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+E0zzEKdybd0FhWJhe4rpTtHjb1TkhRmXS5TeSU5yU=;
        b=S0gRkrU1TPp7UFxx4i5OckLWVYvS6oKB8EgwutRspVzmhck5InotEQEPIGkgwajDb/
         J7B+PkFSC1LcSpp0ry8nYDXm2QrM61EV2GAXTG3dwZIXVZnFLD3GONtj5dqHM60gTnms
         kCKUXhurvBbhhiDu9YZnZLNld+cQryr9V+Au+zGnhhwAjm8fZq6x5QaXsfP1PE6ChI/f
         DkvzId7ByGT3DAW2p5suu3/fi9hXW0SStwpvK4J2mWbZdRR916ZJCz9aL77NE+2KoAaC
         EVZwvzZNdLklfwa8lhvLRRSoBArMt4ArGDhf2Eyr99Ofom8Z/RmFr9EaJ7GwgQr6lIJ1
         p2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd0R1aOvPLXrxuG4uY95SybbRU34gdlx58v3CAqFaAMve/35NjogCUd+KQhYeIPJOwjT/I/ak=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzReNCk2dplF2c0Hur5R0Ysn3haOe2C/FpeWwOYSIP1mashRbC
	6JnWDvR0jeAAmpEn04WqtdR0D0wOJHaKXMBMg4M5Wcn0aET7TPyotPsYRn8/Bd6kqD0bJT98BZV
	NqRxWjqVxuQFuIpzq5lv0i04hpWZGaxFktWwBJsJeS+KocqBuqdcRbjTjjUK9azqT
X-Gm-Gg: AeBDieuDLYvjlzqpWOxfNr9qECp9MxjDZPET2hRTxZKIWDkmev7RCObc2zes/Wc1ot5
	dK1DokB2G8yunaGAabFW2ZZO/XJ+9PCfLJk8S8p30msxREi/wcjXiUWED8biwaRTUILCNHIid9S
	Ja4WSA4vGbFEtRiarWK8czpgcMUuuL3ywWb8UWEPDEKYvGfyRcpq2ERRWdwF8zOTkVEPy8XuJ8g
	lzdv82R2JklHQ58kCVZl5PZVB9qyHRvXENZjofW8GNSlZ3W4u6Kgufc6tsCfmF3cMKZcfRBPDAM
	5/V72uMGKMXNngHKOKq/HFeotUP6AA30dk+ZyYtpbxjE5lcV4Ahj73VHCFVSeaZ/ZDV7fOchXmr
	PcqbgpNYcISXDUIMo7oIE0+B7vsuoVe/3HRTD8yQraWPhI2x6lo7s2l1Wl5CHO/sdxxrJTnz7hm
	eCFqyz8f4x7wmdXGgeBaA=
X-Received: by 2002:a17:90b:17c5:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35de678f2bcmr13245072a91.6.1775532322276;
        Mon, 06 Apr 2026 20:25:22 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35de678f2bcmr13245052a91.6.1775532321773;
        Mon, 06 Apr 2026 20:25:21 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd36a1d04sm19993403a91.17.2026.04.06.20.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:25:21 -0700 (PDT)
Message-ID: <47e60bbc-c707-4a68-af33-2cf2fa6ce946@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:25:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Skip adding inactive partner vdev
 info
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
References: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d47923 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RQiAibkc-cMzSS9pYhwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LwMQg_ujtNihj2kGGz1E16fu1fEHc7DD
X-Proofpoint-ORIG-GUID: LwMQg_ujtNihj2kGGz1E16fu1fEHc7DD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyOSBTYWx0ZWRfX9EOznEysj4bz
 zA5KzV/DeaTLzsF6KOeW3tUkVf94oef6q7KECcLkwFVg7ObCmMhbYJbNFd/nXa4Nbr7BxRWmpU7
 tuW81e1KjN4BwXjJjGbt51e9YjblHhQXsQEFasR6lszGJPl3PLhiqyytk+Mgmh65KeqwrYSC5xU
 2DiikJ9NYdjKHog17uLCxyAC6mGojGdeFCHehD69Lly8/UIlvCnN4eZrZYAarU/PphSh7M3HAM8
 9NXpKEIkn4TAz3dNN3A5P83Sv+qt97+PA+nhaUhpkSc+qI7PqXJYPT266SSYPnw8kt8U5LrKEQq
 g/a8+iEmDIK8wcX85U8Cx8qH2NkBij1CCGaPHJyF/3qozIlcZGT0+pErH6cU8jkSvj54chQwbEB
 TvT0nndkhZ6ad7+G0VUwmTVaYT7tjA2sHlIgNBB4oaPN2eKT1yu12yOg2exjFerJPkkTvoI9iWj
 qjmR456grpE/JOPwKtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_202524_788043_CCB61800 
X-CRM114-Status: GOOD (  17.38  )
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



On 3/30/2026 12:07 PM, Roopni Devanathan wrote:
> From: Avula Sri Charan <quic_asrichar@quicinc.com>
> 
> Currently, a vdev that is created is considered active for partner link
> population. In case of an MLD station, non-associated link vdevs can be
> created but not started. Yet, they are added as partner links. This leads
> to the creation of stale FW partner entries which accumulate and cause
> assertions.
> 
> To resolve this issue, check if the vdev is started and operating on a
> chosen frequency, i.e., arvif->is_started, instead of checking if the vdev
> is created, i.e., arvif->is_created. This determines if the vdev is active
> or not and skips adding it as a partner link if it's inactive.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 553ec28b6aaa..c1a1b220f4dd 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -11131,7 +11131,7 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
>  		if (arvif == arvif_p)
>  			continue;
>  
> -		if (!arvif_p->is_created)
> +		if (!arvif_p->is_started)
>  			continue;
>  
>  		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
> 
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

