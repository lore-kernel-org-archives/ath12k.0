Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77DDC02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfR4VKXyWrV0SBIXo4O5uvtC0k7une1HxqT58YlUyMo=; b=hoqfkL1qzYJ6EDQh7XWbA9G/qO
	wDXKIJbSlRrySXvmVp/dMMB553boxth9HIcAAufPPdkGOh9kEwml5avZ3nQOV+jkwcwVf/5MgGVq9
	cXjw/1T5GVe0QV43tMdJSBimegVHzxNYJUY790mlIK3bY6PCowqkauvBJakPfTc/S84vBnWLiW9cs
	w7KhKzvZFAaVqSVSzFMPMPsYtG5W31xChJ9+w4KPQuzmCKUxis5/lNQTQbGl3iGxVJyDZ6cnrsSTL
	EmJIxIeAucNvAeaXpnWT0czKWHyS4PzFBe4tQ7fhrB3nqBoTCVqak3DgpmleZUHveF/v1EzhcFbn6
	l2gS/3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teysh-0000000FwLp-2eRa
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 16:01:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teysU-0000000FwII-2NZF
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 16:00:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E5Zv8002409
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 16:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfR4VKXyWrV0SBIXo4O5uvtC0k7une1HxqT58YlUyMo=; b=INuNE7S2K1gnpaoA
	tcHx5L5imZtJWKMblDUgO/VOkZd/x2O2OwH+Er7sG/V61a8SuOKzfmqHiSHUY/1/
	9FD7QhtBtFiO3h2aMOXkhdejN+J9JjZw3TrvzFrcwhXTITTUiS0wHXCPe/1tk4g8
	gcuAVOxRngrLgIQCZdckTudEPmhjQxBeynyODi38wKeXv16qO4O6KxlY6fpQGxBL
	NGHBhK9gVnI/wRMIdTt7u1b/YoSIq99HhSIeuDOZ4YVu/9c7IOp1AcaUSzG04Z3w
	GtLgpXx/gHuAPj8fuxgMZxdsBapfm/tJDK0PYfvZwxfF2/LbQsMOck6RGDWZkPZ1
	HUOSNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy8s88qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 16:00:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso8748027a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 08:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598449; x=1739203249;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfR4VKXyWrV0SBIXo4O5uvtC0k7une1HxqT58YlUyMo=;
        b=ucKy1h+HmWbujPcUWe+aHyuiUMkUKcoaGUghEgA8t+MmWuoWOi0kaHpfejwVXqS5UG
         X8yj1Y3UWRVWja6shtszVLNGu1xoy7DyH5XoPhfi1+dqo3Im5tleqfHRoy8EyWp7SSiW
         jf4iUdMjjE0wA6ayo4VxKKc5lGNIrkOYo131YQaOiur1s5OQHSSdXHU2BSecUVx1um3t
         BvcIrOy+DUyCrPaLTRhzGOCApSVwJSnA51mVmlvdZ1Y37nbkav/9RhS7fc4iosFvZ3ZL
         mc1XHVPRJbPDiX5I/LND9DNuQz3MMaScyz1d4vIhrIJR6eqEoAzOqlOJ7RMM3EYISDqM
         J/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWEMVWNiJsZ0eNtgp4jfV+90dTIX0DgERL33/x8n4CsO1sge4sANlkQe+Fafz1B4N2zsYwFplg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNahI3lrxuzpPAFZXKFWZCiPqcQmUVjqr6tZGJijJd3IS1tD1t
	VjcovyDidasdbCN3KYm0go4+VokmU0iL7sP3cOcEfMGUL5cooiOT1To/UcGYMuM/CyrUU/82kkD
	ZdXQ1VAoN0dX+r8nogCG9tLFQCZ+lNM72eC/nfilwJ6/PQvzVXzuPJJYn4fwd
X-Gm-Gg: ASbGnctuqSwa63eI+MtXvcVcmbxXu+TvjAKfLxrlaxzDes2uslEfXe3LL59+l7DLCQC
	7rIaYxcZ9mmNv1Ovy9K7QUF2YB8455hRzyDXmCvfYt0erweUpkWuIvCGtTri/aLxYA9ImwyljZU
	irG0IMdQs6DvL4yhT61H2841KjGIN4LQTnQi33yKPM72B4r4ipXEvgS1y8xTTOq9cVyMMs1WYub
	es6stZIa0WJlMecgvqCZY9nFFuh9vjrlW5o6Z2czVJvdUlI2a8uZ3Ws0r1P+qoHRX1wCDJPCxPt
	CM7G/yah5yZXIlpZaMv7bfyY6UM74S1Lxkkgk4ct3A==
X-Received: by 2002:a17:90b:1f92:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f83ac70dc9mr30680615a91.27.1738598448727;
        Mon, 03 Feb 2025 08:00:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBWw2JiHfto3mg8GUpLcoM+KR9w42+0ZaIJ+HnE11/NNyG7cl5PEKS/5hlxpQnQbjWFgC3/A==
X-Received: by 2002:a17:90b:1f92:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f83ac70dc9mr30680556a91.27.1738598448165;
        Mon, 03 Feb 2025 08:00:48 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc98ae9sm12613925a91.10.2025.02.03.08.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 08:00:47 -0800 (PST)
Message-ID: <edcd9883-e2c9-411f-be8b-2060818f849d@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 21:30:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] wifi: ath12k: Add support for MLO Multicast
 handling in driver
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203075538.3982875-1-quic_bmahalin@quicinc.com>
 <20250203075538.3982875-3-quic_bmahalin@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203075538.3982875-3-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OArj8qiW58h47iaFuWXGraiRXB_Dz0Hk
X-Proofpoint-ORIG-GUID: OArj8qiW58h47iaFuWXGraiRXB_Dz0Hk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=851 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_080050_613288_CA6474E2 
X-CRM114-Status: GOOD (  10.07  )
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

On 2/3/25 13:25, Balamurugan Mahalingam wrote:
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7151,6 +7151,22 @@ static void ath12k_mac_add_p2p_noa_ie(struct ath12k *ar,
>   	spin_unlock_bh(&ar->data_lock);
>   }
>   
> +/* Note: called under rcu_read_lock() */
> +static void ath12k_mlo_mcast_update_tx_link_address(struct ieee80211_vif *vif,
> +						    u8 link, struct sk_buff *skb,

Can we name the arg as link_id only to have clarity?


[..]

> +
> +skip_peer_find:
> +			ret = ath12k_dp_tx(tmp_ar, tmp_arvif,
> +					   msdu_copied, true, mcbc_gsn);
> +

Remove extra blank line?



-- 
Aditya

