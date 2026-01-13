Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D00D29DD4
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 06:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkHNVItZ/1UwfstcS4GR94uyenvt+cwhq+Jmr9KeZ7I=; b=reyXS4kgWE3BFTAs76jehR+7sW
	s4beJFiRuFhfc9YycW7suTHeMC3gIZvCHrOHOUq+FouK2dE8KCxDh/vgTaCB9/NhnEzUcPot33SSx
	obmwzgeyqUb77eGL9wNCYSakPctd51ojRwIUlXS9qsxbpxAjQ+jgHcH21CO+s5yDI50crevPD6cqV
	4Bm2fjdpL3pfzIxsqmBSEBECdy8los4Ug1gomLSs5m/X7WKhF9p1HEkGMaA5xVIL6m2IlisjYh/c/
	M/0KGCRCL/udMui/Ux4iQPn+fHGRsoIlUBbbbdvrqP2eKvnXArlWLMMDrt7YxOjbbEW4pqqKaVFyW
	I6ZdZV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXqV-00000006b0p-1gKj;
	Tue, 13 Jan 2026 06:25:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXqT-00000006b0L-0Fhc
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 06:25:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN4weV175851
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OkHNVItZ/1UwfstcS4GR94uyenvt+cwhq+Jmr9KeZ7I=; b=eUMI26eIPNt7UIVL
	lawtHb5uC7OAM5mPklXHpuhyiSzn4uzLnp4MjBwn9xfvNe5i6fhtjV9d3vQElUsH
	3I1fXPp+FyEyV/ScnoFxJmeYUKk2LyrTUmUfUiuN27RYCKUuWxS3atE/YXhDVsDG
	2TzwfxnbqMcg5MTMjCM4UCCbqQkTIDYnnl4Pgs933bYDmU7cN4jMZ8IfrOaO2aX9
	/Zsp2ObKuuZHyKgXS2LrQoRh0V7Y/wZF9o403bajzSF5is5uwOeWTyREgy2pPWVg
	n7GqrJcQMmTCiqm4kLpbOLa75eF0chdx0RasoqahXGdxpQhNfrAP0/m0eonoG/eQ
	TF1xRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f226v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 06:25:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c2f670a06so7759057a91.3
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 22:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285535; x=1768890335; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkHNVItZ/1UwfstcS4GR94uyenvt+cwhq+Jmr9KeZ7I=;
        b=j7dOyLMDJ/KUBLtvjf1U5YkFUNR0pPsglv99UIuRvyJz+JvdSZ9OP6tjc0N82LzZSn
         8xvws9wYa1vZljr+LsWFgLkHaRC0B/qnEZazehYKWr8uGceXsaFehnUCuOXai9egDZjV
         dk+d7tCvSwSEit1yRZEPS9DZa2uvUOAgsd/G4eFuxPIwun2WY6aIIaukVSIA7h5kx8RV
         3TUH/+N41tWcgqmzq7pLHVb2orWhCYoUrt90nUWEDyc7uowb3fUG0hbNGsOIIBCHFs3N
         dSo5QtPRYe9iGNHDG/en/uh00YYBmOXGa4lvxAiLtljxO5cIHKH/DFvpvaaiaVluzEDL
         UvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285535; x=1768890335;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkHNVItZ/1UwfstcS4GR94uyenvt+cwhq+Jmr9KeZ7I=;
        b=Dtn2/W7gnYtmvGoVcgpHEbDPrPX4l0U7OQKObCiFEqNc5Ce2TDSDiww+9uM5GyN5fy
         aJvR6qwA/y++24qTEstjL4bn+no3TwmLmXVczcdlGYKi8j50aK0d8pTpCFgyWCja7Fno
         CUQkuHfFkVyc0w6PtYl2iMT2UzC7Ht/NBcSr8V49yua/WJI0LN+vdeaIPZ7kIxPTtloA
         38hAjMxzoGzD7x4hO6FwYFMrk4hHqRo/mmxVRfBeDslm+kBg5q4IFyu2G4rrw7sSo+vl
         MlK8H++nFqd8Dtfy5lfQPswRawKSMDPIjCVh+YtKPyngH0eWH+6ix6IhBGgAfu63XUXd
         4R3g==
X-Forwarded-Encrypted: i=1; AJvYcCVdAAarioALLLQe82LXMzPV+fRPvGLO2CF2Kv13tmOnDz3Y8Jozs5goBkPLHFCZdpyNHny+N48=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMl9+yajD87kUNGA0WUxmS/+ABWOENWuH02ZqC4/dIsqZyYUgF
	+iJofRIVHf+KUFrYPm0vqTIoI8jNJ21qFrm2W5jfR/H1deJqzawIZrw3FExGe+4/WejzHxsU52V
	kkPPb67ihIn5URL2HPfx+ZHKAhrUUzsURFEDDIydqSso8l2v39x4he3kKaNY5L82Z
X-Gm-Gg: AY/fxX5sVX4iY1l6cSTLlWhnxlJdVXurcXBB6DY36IFr46bzPrV+jDPNVbM0l4JSJnJ
	uJWY3J1Fr5aFPnoOY8JGThrGFey67EWho7Xh2ia1gXCsYjmkypAbRM1F6OCSvVHiAlT1Zr/ATtb
	f+eyEw0IEYG6rlZQ8W1FimqX7mpob0CQ8OtnZgFGRyKYjHXGHG0+JV2tQkm18Ayi0WYIITMAFKa
	LWW0MAtstRcBV/J2LGXGzqnwic7+xnPAitfDA0XUVxthqciBIgJvglYjtOzrk6F+GjTFdEXiqob
	bFCeAOvivimw0HtvVRTwtNOJf6pyRFWinh1V3mGY7U+eqtl0KwVs20PJDivRlGtkKKnFok5ATdh
	lH39FsiT/y6JBkqmhSbFaGOhL5NcVtf1K6Me56WyoCUmFVmedRa+h2EHNAEpvMZP2Pvq7z0uR5D
	Y9UBb2DT0=
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr17836438a91.35.1768285535001;
        Mon, 12 Jan 2026 22:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1MHEvI8Av26IuMHxcFI4hoLUJoG2pb+GiVY4W98DkoK2o8hbuGxpV9X299no8BLWYeENMHA==
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr17836414a91.35.1768285534506;
        Mon, 12 Jan 2026 22:25:34 -0800 (PST)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78f4asm19087031a91.3.2026.01.12.22.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:25:34 -0800 (PST)
Message-ID: <a3c09622-ff18-4586-9891-1ac7fcdfb220@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:25:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix wrong P2P device link id
 issue
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MSBTYWx0ZWRfX1fhhmAtPVNTe
 SA6+8z7VS1BSE46IAkKWWXD6c6zml+mi0PWWwQxcdXgNqLsJp+VMxfZJJls7gpzYlWHjh/RP0Sf
 Kg8tycVzbwnr4KQAD/NzJYlg1IsALFjqRu88u7OnwSh9HhQRDoSA9Iv1He4C9QIcivBXcvKkVhx
 aN6WoQGz0h+3OfMuhjx2IhUxFxYoJ/8bpDK5WDcoCVwWdeg1bHWOF78ci4++yshvTUnSeAVbtSU
 MOm/YP/EFbH9MrluPnaicz7h42wtzxCmhHC6AUcG8wRK/MKGaOLucZ8UPje7DvL/2ZlmorXabHv
 O5XoRDv3PrGbLsyeRFs60IY5jDXw6giSNXpiB2hTp7mvb9obn4ePO3MyWc+7HtnhIOWhAJ9u2Y0
 2S2lYGVaUN0Uz1tBAXBNZXdYtTbmTRB3I/74WOf3L67OIn98p7du8jpzlVe5eiHe7tyJwTU3DJW
 eFeE0vY5xhA9elvFvXg==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=6965e55f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ScEjb7IQ4rUrBPXD1VQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5WgHWmX7YNxhN22cTTnF831sRtS3pn8t
X-Proofpoint-ORIG-GUID: 5WgHWmX7YNxhN22cTTnF831sRtS3pn8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_222537_107681_80E62578 
X-CRM114-Status: GOOD (  18.54  )
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



On 1/13/2026 1:46 PM, Yingying Tang wrote:
> Wrong P2P device link id value of 0 was introduced in ath12k_mac_op_tx() by [1].
> 
> During the P2P negotiation process, there is only one scan vdev with link ID 15.
> Currently, the device link ID is incorrectly set to 0 in ath12k_mac_op_tx()
> during the P2P negotiation process, which leads to TX failures.
> 
> Set the correct P2P device link ID to 15 to fix the TX failure issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 648a121bafa3 ("wifi: ath12k: ath12k_mac_op_tx(): MLO support") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index db351c922018..32cdf6d73ac0 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -8838,7 +8838,10 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>  			return;
>  		}
>  	} else {
> -		link_id = 0;
> +		if (vif->type == NL80211_IFTYPE_P2P_DEVICE)
> +			link_id = ATH12K_FIRST_SCAN_LINK;
> +		else
> +			link_id = 0;
>  	}
>  
>  	arvif = rcu_dereference(ahvif->link[link_id]);

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


