Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939E0C98304
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 20:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Tutc0NA5XTcWaNPOzmZQGJ2sl+cDnPgadEfH3Im0nE=; b=rYV6skGMggrdwJS7OU+sePUfS5
	FSNWy6/f8lq25bQliJbR+i/agxYehDwRf5HO7S4YQDysa5taQOCH0BA/Iyi2ISscyz5m/AKf8FQ7Q
	CQIa4cPvxsrpdMxZF0xzoMAVgiuJCjpTmymf3Xx7tu0wo1d88gokckBJ8C7/Oloo4DlbSrzU2YVrX
	KMvntmaSJe8PF5ELysGUxkKJGV/gOS+IwA55N7q7VlF5PZbGFjXwVgm36cVOiYfBfbTQ9A7szyCVs
	3/6xTqDuXweh92C8Q+uZo/D+kfg7jI+QMvrwk3EwnIeMKJIlj6dysXSLWTbdJ1uz43Ax388ZNvDVP
	GjSAoA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tqs-00000009UzT-0DAC;
	Wed, 23 Sep 2026 20:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tqq-00000009UyU-3cT8
	for ath12k@bombadil.infradead.org;
	Wed, 23 Sep 2026 20:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Tutc0NA5XTcWaNPOzmZQGJ2sl+cDnPgadEfH3Im0nE=; b=K9C4empOdZwl3/o8AI+16NTy1b
	rK3ZxYyqFyJb5sKjZ/OB7MVTU8fxwa1r49kKho90HzUUGpjjuCwvsCG4aFJ4M0hUQdsdpdePHA3Ho
	b8fu6Ld9SlSD0OhXLonhSyFI3v3wG8QSJ8k3TgrhP/W4G8M7tXCsSvAGWDOFjHXXqzqqhGMasOH2n
	7BEe6n3207I58Z/SAQUriLfgahTtSrAVRc/JpEg+TWRmng0YbU3Cu0516LjtAWgX3bpgH1s6VeksP
	AGiqzFRh78RoJCnzcMO1OtpYMZbIZ1ScSH2XSX0H9pRbtyQ94tgnno7rB1fuyP93/gNb7Zl5x1zwm
	pfT6yfmQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Tqj-0000000FGej-13Fu
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 20:45:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJlGPB1027038
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 20:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Tutc0NA5XTcWaNPOzmZQGJ2sl+cDnPgadEfH3Im0nE=; b=Qjq9375tWyx1Azbw
	pU7nAiRp64qGgqWV/dF0paH4QDVPMhpy6LlVbXNHuWulmKxVPnmQAczVmvy4O3ZW
	R5Ysm/A46KGAJy8hcre18XqkK74J0Lti77PTQCsaPbFadKYHGEaso74fcakI7tAw
	6clam6mkIV2YoJhIqCYoeHEqNbz5C9i5Nr9gVwjD4PSRk7jarvzybt8DMjo836Fg
	PkWSQ6QFR7CePx/wqjadkWXqZ+CCFiEJw+nund31xllW3eZiY8F6JelTx0VxjsLy
	2T4mDERgjh1pi6+hUTZddVfTlHeDNzERre0NdqPOK6sE+D7Iacd4EAKwYMoY2N4P
	3AkBDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxsxay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 20:45:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3284bbaa89dso862229eec.0
        for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790196350; x=1790801150; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Tutc0NA5XTcWaNPOzmZQGJ2sl+cDnPgadEfH3Im0nE=;
        b=Ryutd/spgS+b2Nt6V8cgi9PWnt+3Oe9qnHF8fPTVY9Y4JYsuNk/gfqdVoUTEzky5KQ
         WP4NwlYAZ9UBfLP6//MYGx/crVrpHAcSaTnFYYbiBbsbIOVv/szXye2+sr2UJv5lyXz5
         dFAgBwjVEhMvNCzmxhDJfENdJWwPL7ap2YglD6WSjo4wd8KXwg0v8w0iC07AcRT61Zmm
         xwmgwfDov+T9tZ5qmEXdU6qKR4q5daGXrS7IYwNcCOS/0OGUFzSzq1VyxY8HM86Cl4ps
         XyqdxEV2bMlQjCAf/L4AzIfKUTv3cXn37dcnkkfqwLB425o4WBUGfRqTA/RCCOtm/k9Q
         Fy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196350; x=1790801150;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Tutc0NA5XTcWaNPOzmZQGJ2sl+cDnPgadEfH3Im0nE=;
        b=v9D2A4+LehuMHqTrOgcrM+i9/fq+9jrTUOxqSi4Lm1ajUgVsSZUtONHkC5ZxYB/h1z
         43gAFcGkRLhU7R0b4sV9Du/xLQ2OvskJiC/1sw68PrveKokhHoglKtikfxyhiiYUxNWY
         ZdLMuh8mMfeUD6c86e80cg44ThkJkFLdzpmJJKfyahwTacCY2MdY+Ac7aWSmpoSU1JCk
         fnMhWuLp6RVsLL9ktLR4reVF/GGahCt3B6d0m632qve0XJOiVgz6JwJIUl3NIu3tFPew
         mHMbq+Y4aTiWtQVROqwDvzNCnhFQSKqdcA0DLDBulfpwxYhPz/wtnu0kZS8fgpwS2xlB
         wg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5wtxKXQaCBajoFgmWWZuEPXJvreyKs77oYxJFiOnXBmBFNi4cCxvijMeiKt+ekn5PwdKOA18=@lists.infradead.org
X-Gm-Message-State: AFuF++l1WIHrTFPb+yMNpZItJTkECdUEdFNtaAS7nqsesa/RHXE4Szyk
	kGl+8LHSLKgedRbU2H5cnXP4jF7g6Fd8R9984WqmH8YADc9Gpshiq8uW2ijLF5eRnZefdkztdON
	x83FhkoP8HFBgVEzeHAG4VGzEuLbEPFidUzVYoJ60IzQlGSKnpszJ1n9gQ49Nls7n+kDOOXFM
X-Gm-Gg: AYBFou1SpeG6R1rHCrOGaGLG0qMMGDom45IbHxmFIAmFz8XtrhHnZztgDfnuGvgJgij
	9uYsoC3O10kS+EdH+8jJUYzy++5gZ0ym72yuEC5vFC8g3n2JTBliIJYDIq9JGHk8/SHyxoZnIH8
	Mwnx2YRkFfh7hLXr3x+3+K8iHNcTI5GrP4Yi0PDzwCRgrdF/FOSRCc0KCl/AXAtJFe+JKHaWfKB
	WvIANqaJLtUtOTeI/fLy2F511Jr2iNwI3BozcRBoO2e93o5r1N3p3oE77a/CPAc0vOT4XoCEwNf
	0idbL1hp9Y6UCORIDbAvBdWJhiEBldPE3ReKVphbKGojQY2NQQI+p/6fy1ig0gMSiRKXpTYNXt8
	HZNKABjefl8AqoRRSArN9lvh7/TBOv7aEokMXxgzDzsY=
X-Received: by 2002:a05:7300:f588:b0:33b:ae91:1e62 with SMTP id 5a478bee46e88-3400459996bmr221970eec.41.1790196349738;
        Wed, 23 Sep 2026 13:45:49 -0700 (PDT)
X-Received: by 2002:a05:7300:f588:b0:33b:ae91:1e62 with SMTP id 5a478bee46e88-3400459996bmr221954eec.41.1790196349075;
        Wed, 23 Sep 2026 13:45:49 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e498f0sm7469110eec.27.2026.09.23.13.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 13:45:48 -0700 (PDT)
Message-ID: <8340ba71-cc37-4dbe-a82a-b88d27c0703c@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:45:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NY58hhQmxifSlZ23YOCQeWuiXpNz4MzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MiBTYWx0ZWRfX0gLu1/IjqEL8
 Krtn3ea40LWWbxeI5LhR0NDRKqHkTlYGIGgsZR3vLN6qeCDcN4mJ77NhSzhjjt6F7Q2t8BOPgQ5
 hFrhAnPQseRKwEygnLWLs8faRpgnBA8cYoOXmwb+8Nz4IAfCyxfop2+tRBnOaJzXRaDQLCdWlTs
 3Qg7n3woLQ0jCo7+S/pMzgq8IdLSfT2f1luFjKTQk86H2cO0+B/X0t6NmtKlEUZSxvLCi+xOwiO
 sUV6XLp/MmzPrqM6inD0TyglVwEWwYcObejFLSCjldWWLOx+EaIRATe8tEk/eSU/n9SkOdSYPdo
 nLxudY2v1m4HYytvP09FXnJ11yJl7xgyxAeg6dpsLDW696ZdSqFYiRl2P46lEBqzxpFylm53jFW
 eILR9bkTqOE6mUCuT2n855TjVuL41kY1rwuNv4MDp0LnNp31hyyMpjIzFdjuhlSZc2FvSiIlzBk
 JL/JgE3JfgRQ/WLI1pA==
X-Proofpoint-GUID: NY58hhQmxifSlZ23YOCQeWuiXpNz4MzA
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab43a7e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bDFmln8m-5B1oVUy_N0A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MiBTYWx0ZWRfX3LSFU3EtU8Kl
 VE3lIGmGBffQ4Y2Vh9SAHo7+BpTwoWP7/Y8HnASKUJwzAHV05KxCeoCZpxOIfBaI09SNfvz2PbH
 cDKxMgnpyxMc7UMg4LgH1fpGXMMHPc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_214557_630415_5802488D 
X-CRM114-Status: GOOD (  14.36  )
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

On 9/1/2026 1:56 AM, Aishwarya R wrote:
> ath12k_dp_link_peer currently carries state that is not inherently
> link-specific. Both the station pointer and authorization state are
> shared across the links belonging to the same logical peer or station,
> yet are stored separately in each link peer.
> 
> This series moves ownership of these fields to structures matching their
> actual scope:
> 
>   * Store the station pointer only in ath12k_dp_peer.
>   * Store authorization state only in ath12k_sta.
> 
> Doing so eliminates duplicated state, reduces bookkeeping required when
> the state changes, and makes the ownership model clearer.
> 
> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
> updates users to retrieve it through ath12k_dp_peer.
> 
> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
> updates authorization handling accordingly.
> 
> Aishwarya R (2):
>   wifi: ath12k: store station pointer only in dp_peer
>   wifi: ath12k: move is_authorized flag to ath12k_sta
> 
>  drivers/net/wireless/ath/ath12k/core.h        |  2 +
>  drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
>  drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
>  drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
>  drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
>  drivers/net/wireless/ath/ath12k/peer.c        |  2 -
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
>  drivers/net/wireless/ath/ath12k/wmi.c         |  2 +-
>  10 files changed, 36 insertions(+), 84 deletions(-)
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

This series no longer applies, can you please rebase?
If the conflict resolution is trivial make sure to carry forward the
Reviewed-by tags.

Applying: wifi: ath12k: store station pointer only in dp_peer
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/dp_rx.c
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
M       drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
M       drivers/net/wireless/ath/ath12k/wmi.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
Auto-merging drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/dp_rx.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: store station pointer only in dp_peer




