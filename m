Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5912FCD6E79
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VWzrVKJ/7G/yNKAgeOFsr9jNdwkADnzd+yjssLBbFA=; b=yL63jpftcwB+JSYSrCXc/emR0C
	OWEEa/1uB0ThA58m5Y4cuZGTUGDvEHe1In1gbengGh0j+3mNZUmBkQm/HMC7v9ZgDYzNUIQQlfBGZ
	kj04RdCJ4ZBny72DSR4yeh9+DbgvWMnu+v/+LZUMuRGPKV4dPcaLRRf9k21c1hQWodTTSvZaxkWSZ
	edM82dpzNVCbbij7h10QB2Og8iZOsOxYk4lliN8pNYMACCwkGqooHI5uUTCHYbYCaqnMMCPp54o4r
	dFIizIWU5/yAPr0oJ60F3xt004VnOqDd6GXXMrSz/Qr5MQmnZgjEAjFA9Zjye/rMjde5egYQ7lJru
	iGd035gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdSO-000000049SH-0KRX;
	Mon, 08 Jun 2026 17:08:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdSM-000000049RY-09zQ
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 17:08:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FKOwb4045127
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 17:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VWzrVKJ/7G/yNKAgeOFsr9jNdwkADnzd+yjssLBbFA=; b=No7w/sbO+TV262I2
	QQK9JQFlIHqWZUZKSlP+zmQmVIoE7o/neWttCkzgV2GW7vgPlg6TArlj0O+At03e
	SfOMk3pUG7PKsovrFq54kFOiIKD7i7PEP8DYuZpJNn6Oss2QEFPj7jmc4WtcFRSb
	c/D+wCOya27Pxca4uy3XbQ5U6Qqv6NiHRk4xGqIeE7tVCZpVHOnXzIY6IG7LNRrI
	T/AY8xR8D7B4TTKdXGi+zV9Vngw0zaYihmE6XLUU9T8W1prjCXi4OM9Dx6mR+Pu3
	8bJXdFjGoOrHqEz+BnMgTmNxxi4Zmiqx9dKXylTIJAbpdmMC9KUyLvkPcLVLk+tM
	gUYH4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee17by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 17:08:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304e4636205so11115781eec.1
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780938488; x=1781543288; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VWzrVKJ/7G/yNKAgeOFsr9jNdwkADnzd+yjssLBbFA=;
        b=hqepYNFAvQK7y0FPV3zFb29fcOLDVtMA2HRlMLyJqtiwQL+hcv8yKGuAlWH7XFvuqc
         y2b/IxcqxRQn1sjvs0CGQzG8dmliAdn3c20t5dEtgb1z0mB7juVgjud/iXwoKKOyO/jL
         Jjn8YrkYTUNya4Yz1Yw8D/AgKJ4f51KGkriFzyA62RSl8ZYGLlxgq9/EmKQaglir0Wyg
         lycAHNSe43JcxOw9mjMRfFTsMkCk6ghd3nx0t0VdQDHSN2/EvA2/RWZlyIKkvLua7JIG
         /IxOFsazE/ijwxs/Q78rpyunBdjU3/c9/eEIDI7aKGgVoeWgZnpCiOD/HEmw14XAIMpM
         VT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938488; x=1781543288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VWzrVKJ/7G/yNKAgeOFsr9jNdwkADnzd+yjssLBbFA=;
        b=cnXcugP3otUuHjHb+AqEfzRDPwVZCP1XhbE4fZLCYBTl5XFdjn6HjBkMXyqqizvuon
         AxQjxz60aNm9hfJ7ccPDkc0p8hlxWJoGHjBznDX2v3MTV3L4AHNWkRVEOdU/WLN6IJyk
         0C7ogYsuk04yC3k49ybuJK6iUVYecZEGGFclW386JoDGMcNHBBemFBB7Qd21GQPVsARk
         v+ryI2n3Sk/ubVAF2pbbW1yGjr7tRwLa/b6L2PLTVXsOqo6FU/uWv6iP1HbMnOCJ2lmZ
         uiBWTRgtpvA8OqCZu+s+eL//IFIKMHeIPiHYhdOnsMD4pXQALjd6ht8XwChXjlIN2Wga
         483A==
X-Forwarded-Encrypted: i=1; AFNElJ/lra5JnfmeTgnuXlZhF2tHddGTFpAAJPyzRcgYY04g3hSh8fkFxTfFF3WreliZN4TaUue8Q3o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwoJDcqR6NKdnbSq5pr4rLuRfC+MK8XzwwRi5VDgbgFi/CS3w2
	zH9yQnxwh0eydRdfPJvhe26OLXqyZKIxFI/cTgr5xuCrew4seIn4pCes1vBp8dQmsuhDSTf2Ouh
	u/IfHhegxnWTnhqOpud3Qh3Z8DN9n827xVYY1WZDS1tNSdlpc6ASlZyVIVlb1UWXk
X-Gm-Gg: Acq92OF40gziN1ICa57i7tKdIlbLthH8RaHKN7Hf60V6zteFnb6kmy2uzhiw7gkGXwK
	dTmFcQYDbLk9q2GYSkETHjHFLoWt/ONXt63hju1Ba8KCDaexjrWuuMy2yJRJpZNpBDXUFbypESH
	JESLhAgnWGU4uvMhRLhCNQhM5vrlP9iDFgXv1Z0ZPHnj77bZBvq4GImtnrmAGxvxuuAp+3xCUdy
	ZXCVBi9J2a3V/DmTEA9biXDMrL9apyLHkxFuKZMZhVmVbK5IiYzAumWyDJC7R3HzvR9eHFxHm5a
	9wkFl9R8ONvYBJucUylUrJppG2qPxv19DHOCdCRveO+4rkMEzFa+t9U8jQfGjIDpsJF0K0dYSjG
	TP4kpJa5jNYhgK6Klk8KPqgzvieQcSX55KPB5B+aLsh3X9x/qqhQ8Qb533P/V4Igt6gCNXvUl5k
	aNVLfyRUd35nK9npQUMZ/KyTN7
X-Received: by 2002:a05:7300:572a:b0:304:aca:35c5 with SMTP id 5a478bee46e88-3077b22c938mr8036365eec.23.1780938487928;
        Mon, 08 Jun 2026 10:08:07 -0700 (PDT)
X-Received: by 2002:a05:7300:572a:b0:304:aca:35c5 with SMTP id 5a478bee46e88-3077b22c938mr8036332eec.23.1780938487252;
        Mon, 08 Jun 2026 10:08:07 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm22856903eec.23.2026.06.08.10.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:08:06 -0700 (PDT)
Message-ID: <973da9e9-3851-4e00-85d4-28140c039127@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:08:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: fix NULL pointer dereference in rhash table
 destroy
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260604071032.659009-1-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260604071032.659009-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2MiBTYWx0ZWRfXyxBmVhs8tII1
 G/eEyaj76WFRLmh81iYG8v09Ch7niGvaPz4bR7c1f/UyRSx69s/UYNW1panak71dbcpMTMjBtvM
 29B1ck8Z6DWyZ70f1i6Qh33zth4EJMh6cX787NLllqn3iFM4E+TRsIZ1MKs1SV7VdQHsGZqWGEO
 4pqNxqgfPk4u6dmwpe0neQbSu6Zpv+f1iuzAic6sxqqnnrUu6rUw9hpVdycZitO4NBV9Ht0Owrh
 0LsulmJxme7X9PCCB1Wb1KpLrs5hjCn1ro3j6Hbr28icrGwI63QOgTcNNWkUtSwMmodmTj9Tl5Y
 EGdQ6k2/V7x+fKcQiAcQmKD6fPivyn05vcBnFUN4ZtY/8O1MZXgXIAkQ9SUk6VWnhh7Tl+gukK7
 DZqZk+72bGYKzEEwHc3TEUzSPO5TlI6LnIgw/ZG8bE6VBZ33I1l6dpzclfLDjYKMFJskhl/24Di
 pLBK3nIcNSbJcyGkuzQ==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26f6f8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=jrdOLSfvXqH_YxhRKEcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: YLPjikFXrG3uYTzAkLa-irADKvpkFHT2
X-Proofpoint-ORIG-GUID: YLPjikFXrG3uYTzAkLa-irADKvpkFHT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_100810_199475_99954B45 
X-CRM114-Status: GOOD (  24.63  )
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

On 6/4/2026 12:10 AM, Jose Ignacio Tornos Martinez wrote:
> When unbinding the ath12k driver, kernel NULL pointer dereferences
> occur in irq_work_sync() called from rhashtable_destroy().
> 
> Two hash tables are affected:
> 1. ath12k_link_sta hash table in ath12k_base
> 2. ath12k_dp_link_peer hash table in ath12k_dp
> 
> The issue happens because the destroy functions are called unconditionally
> in cleanup paths, but the hash tables are only initialized late in their
> respective init functions. If the device was never fully started or if the
> init functions failed before initializing the hash tables, the pointers
> will be NULL. The issues are always reproducible from a VM because the MSI
> addressing initialization is failing.

My preference would be to fix the logic so that the deinit is symmetric with
init, and if any stage of init fails, it should unwind whatever init occurred
up to that point. So this patch seems to be a bandage instead of an engineered
fix.

But I'll let the Qualcomm engineering team give their opinion.

> 
> Call trace for ath12k_link_sta_rhash_tbl_destroy:
>  RIP: irq_work_sync+0x1e/0x70
>  rhashtable_destroy+0x12/0x60
>  ath12k_link_sta_rhash_tbl_destroy+0x19/0x40 [ath12k]
>  ath12k_core_stop+0xe/0x80 [ath12k]
>  ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>  ath12k_pci_remove+0x60/0x110 [ath12k]
> 
> Call trace for ath12k_dp_link_peer_rhash_tbl_destroy:
>  RIP: irq_work_sync+0x1e/0x70
>  rhashtable_destroy+0x12/0x60
>  ath12k_dp_link_peer_rhash_tbl_destroy+0x29/0x50 [ath12k]
>  ath12k_dp_cmn_device_deinit+0x21/0x140 [ath12k]
>  ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>  ath12k_pci_remove+0x60/0x110 [ath12k]
> 
> Fix this by adding NULL checks before calling rhashtable_destroy() in
> both destroy functions.
> 
> Fixes: 57ccca410237 ("wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base")
> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_peer.c | 5 +++++
>  drivers/net/wireless/ath/ath12k/peer.c    | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
> index a1100782d45e..38045564e223 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
> @@ -275,9 +275,14 @@ int ath12k_dp_link_peer_rhash_tbl_init(struct ath12k_dp *dp)
>  void ath12k_dp_link_peer_rhash_tbl_destroy(struct ath12k_dp *dp)
>  {
>  	mutex_lock(&dp->link_peer_rhash_tbl_lock);
> +	if (!dp->rhead_peer_addr)
> +		goto unlock;

not a fan of this pattern.
if we go with a bandaid solution then i'd want to use guard(mutex) so that
there isn't a need for a cleanup goto -- we could just return like the patch below

> +
>  	rhashtable_destroy(dp->rhead_peer_addr);
>  	kfree(dp->rhead_peer_addr);
>  	dp->rhead_peer_addr = NULL;
> +
> +unlock:
>  	mutex_unlock(&dp->link_peer_rhash_tbl_lock);
>  }
>  
> diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
> index 2e875176baaa..80fee2ce68f1 100644
> --- a/drivers/net/wireless/ath/ath12k/peer.c
> +++ b/drivers/net/wireless/ath/ath12k/peer.c
> @@ -444,6 +444,9 @@ int ath12k_link_sta_rhash_tbl_init(struct ath12k_base *ab)
>  
>  void ath12k_link_sta_rhash_tbl_destroy(struct ath12k_base *ab)
>  {
> +	if (!ab->rhead_sta_addr)
> +		return;
> +
>  	rhashtable_destroy(ab->rhead_sta_addr);
>  	kfree(ab->rhead_sta_addr);
>  	ab->rhead_sta_addr = NULL;


