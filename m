Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B95C43458
	for <ath12k@archiver.kernel.org>; Sun,  5 Jul 2026 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmVsegBX3hn4vmev5uYRfwriKhQ3FPobjXZ+2MuSx6U=; b=Ehr2qV9tQPAP6FL/UsCP3zX+cF
	T6PokH1+RafL1XWjENrnDBx12voIeJZ14SFZ1Cpc//HTVvAu4xtYajAETBUpV6NSaf+OInFre8FkN
	TnV/ENT868vH0IOZweE3pD9Suh8cVtLoq4P0QTA0WRu+L8BXkvvTDKrWVBtDiTr8a2XVkIQTay5Wc
	akDNk+AybD2fsFWZSeyr2DEIXTmoo2ZHVOo45Xt6Nj7FljQrkA4L75CCZ/lNjAapcCHKL1RpvEhWQ
	JYI/J86zNodjw7Qi4om9PfGf6Yq4ZqXhSWcKZ0/8XOHnswyDoKI+1yKENKsgjvblb5iXqCkvXPY9Y
	WAqsczbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQZe-00000009VrZ-2Spl;
	Sun, 05 Jul 2026 17:24:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQZc-00000009VrD-0fsL
	for ath12k@lists.infradead.org;
	Sun, 05 Jul 2026 17:24:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KY03j3809048
	for <ath12k@lists.infradead.org>; Sun, 5 Jul 2026 17:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmVsegBX3hn4vmev5uYRfwriKhQ3FPobjXZ+2MuSx6U=; b=RvKlWPkCBHO5YCxM
	+8urm19XschTQ/RZxtB74iGGOOvkoa+3D3ar3bZ76oCrF9iilIIWNbMxkoP9P3Ea
	dd4hWeT+vtewyUCUe+z2lDEGpnBUScIbzg8053RqDKSfwaXJmS1n+Y+182kf7fEu
	0ra7pH0V4pXcMC5pcZlaIX3j0ThLbjtt5HGIhYPif/dEpwv3vRyeBl9lYV0tZ1ps
	8Mje87IVbl+iUSyVUeL3uszhNKVj+NRSrDlJLgzqA7JJP9giIQeQ/yGJumEdF9Dt
	dtRECmyopQ7qnb9MM2m/YCj6Oi+GKAKp9lLJSyZKjx969aCQhdxGGoW/hTdpROTX
	Up/dSg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k1mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 17:24:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so6136671a12.3
        for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272245; x=1783877045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmVsegBX3hn4vmev5uYRfwriKhQ3FPobjXZ+2MuSx6U=;
        b=RAZ6JSIcnccNPpPk5rbDm8BCU+kBNDp6HZgn9Zb1UgB7emAGbZfaTe/ylkdlg7fsWm
         WXK0ktJ+ybOE8ey0iH+mSrqOiCCffGUhqvGRnSdHqNUFDiV7ODn7EGHvATsp0Hjnf7uZ
         YnMEpo88/DYTSNPanBNzwV6UGka9A7CIsHreNIGVFLFLLAUyICL7TKNoXV7yYx1xrc+R
         c60YfmrDv97nhV2Zj3Sb/axJpO6OrjQmo20/jR3tUc0ADyD3JH5gnsme+2b0tHcs+QQD
         HnQGFwGJrpsfy3jMblaw9LlnpmJn/Lgl5CAEreTYRImachgPE//Wp34s3LFFjbdJyWYi
         u/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272245; x=1783877045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmVsegBX3hn4vmev5uYRfwriKhQ3FPobjXZ+2MuSx6U=;
        b=BXtK8NIJyydlWr3qGAAxGGisYxLXj/IrsO3Df/ssQMAChbFgt069Ns+aStYjeabtdh
         2uXbzfyOLUX2t8l7P6sMHShBNUBiZIERkKAgNqRRSfZ92HlWOHhC+Qf05seR78ao8umn
         RdfX7UlDWBW0tkdfqTvkQvskmZXzHO8TLxH7lbwCFx+1dA0nZof5RYKzDMUXrh7/5Kxi
         SS7pVv0X/VASaFd+/mIYx8tLwGpG71ZwNA7oFsyLawugEbgeUa0X8BpsKlVH2HTuQS4Y
         1nyMtuyvPdkoyW8agKoWqXK6edWbKofv/y51EK6U/HlKc61/WBvVusCd+nW+lsuVjSL/
         Gf7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq5yrPe5Ye0oJhoK2RI5DblAx4pcdWCNljfo79kHUEDYTDFLoQusAXkoBRsm8m+Kv5HNg1HB3Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yygc9ZwmPvkec5iyn20JrN/uqKg9qYllPxbURQHUeB+G2aR65Kk
	PRRIDFAhFf0eikiFvD/o3DwEDzmLWSb5ttIUkDnwhq53aUIkwc0Fa+aEi96BgLfwjbkPvxboBVM
	wh7phAwcOoTBbixAeHFozaN73Bn9eqPCpaJDZrQNLmKvyL9oYF21H/G7T+Sx3oSbF
X-Gm-Gg: AfdE7cnCRv0Dm885RemhuacFTHkTTbu1zc3nyTKL0LN8v0+6Yi0niV9cyICBM3vK3mM
	1yBI96lLTBOtqUl4xTWufsg6gH0Xk0VckDfHj03uB+9wFqCnZBaasrO3ZnHrnBZEQp8puIQhwuh
	jfSKxaG9LQoMLjEG9T4QDujGc/OgOw1i2CcRL+Z/q1WhBBPWMptgWi3nX3H+i3CzFlb0dsUaoEs
	NM1s6brF6B06X53dj22P0rs4E4Qf2KcCXJY6Zz62s48PgWIVSgwdfjcfejxYyWtPz8pZSALe/Ik
	IjvdV3MwEsWNHOY+twW8Yd4/voKyE89rj2HGJByk8TMDS0Zl7uIVNZxQR9irxr6tclk/qlpZDKD
	1RM1bbxCzcIqu5lvprpnFvdQhCen7ae11zA1D9fx8e1EH6iXx4rgtbv6Na4DOQg==
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c03e2a3e2fmr7129609637.26.1783272245151;
        Sun, 05 Jul 2026 10:24:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c03e2a3e2fmr7129585637.26.1783272244703;
        Sun, 05 Jul 2026 10:24:04 -0700 (PDT)
Received: from [10.168.91.130] ([223.185.219.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm26472855eec.30.2026.07.05.10.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:24:04 -0700 (PDT)
Message-ID: <d0fd509f-760f-4632-b116-0b6494466f22@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 22:53:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath12k: fix NULL pointer dereference in rhash table
 destroy
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260615112103.601982-1-jtornosm@redhat.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260615112103.601982-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX0M2E4xkIfgtv
 W880cJ7P2Ew6fdLww2OLPPZDWPH/868lh+0HwQAZjAsU/pKiGDKQlc2Z9zeAsz8i14sQuOTdQrf
 BLa+7jSXrZZBiPtTZDBuB1uTi3c7oYLruGKIG7fbXZKymKSxG8T0sxka0dwmko6BXVWFbWnDIT8
 cfygczAafVQOL8V8caGzpUpeuIOpBnsymztpIruec/NLeEK2zehle3SHkUuN77j+b5bUzs8iYTl
 JvWlPE7p222DvoaIiCqhKqKPtl6fVqNSyUpOWXte3gmBRVV8SoywBjegQwsmFTZ/jAVEERxVMHK
 QnF12NsZHa/u5vh7doNtImAloGuxXvySRYK2tONGkXqRiivVdA7GUcHVkQOwHEB9Qcb2+wmq0cQ
 mbNgxEFKGhIj8oCMQOaBaY60ixtIVZFRoSxIJblKrUDVgy2oCQOjkFGXsjG54TWqlk7rK9TWLIQ
 rclAXg6hsNnwAAsx/dQ==
X-Proofpoint-ORIG-GUID: 5agLbppms1LedfCSoOgHgUGuTHziUTMM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX7bag8D7N8zYn
 9hq6QKZoV2jmOlkjPlflvLSVssx8OdPz40TW7ac1uVs6FzSobvN8x5NVVcP2YvK+V7VowILoV0D
 CRCXTJ5miPCFEXci0JY1I3qS6ZJ0N8w=
X-Proofpoint-GUID: 5agLbppms1LedfCSoOgHgUGuTHziUTMM
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4a9336 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ziM92C7oNnnlFgKtw0sKeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=aXf5c7XquDVv4hRH_ogA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102408_323682_FA37C1B9 
X-CRM114-Status: GOOD (  15.80  )
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



On 6/15/2026 4:51 PM, Jose Ignacio Tornos Martinez wrote:
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
> 
> Call trace for ath12k_link_sta_rhash_tbl_destroy:
>   RIP: irq_work_sync+0x1e/0x70
>   rhashtable_destroy+0x12/0x60
>   ath12k_link_sta_rhash_tbl_destroy+0x19/0x40 [ath12k]
>   ath12k_core_stop+0xe/0x80 [ath12k]
>   ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>   ath12k_pci_remove+0x60/0x110 [ath12k]
> 
> Call trace for ath12k_dp_link_peer_rhash_tbl_destroy:
>   RIP: irq_work_sync+0x1e/0x70
>   rhashtable_destroy+0x12/0x60
>   ath12k_dp_link_peer_rhash_tbl_destroy+0x29/0x50 [ath12k]
>   ath12k_dp_cmn_device_deinit+0x21/0x140 [ath12k]
>   ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>   ath12k_pci_remove+0x60/0x110 [ath12k]
> 
> Fix this by adding NULL checks before calling rhashtable_destroy() in
> both destroy functions.
> 
> The NULL check approach was chosen because the rhashtable pointer
> serves as the initialization state indicator. The init can fail at
> various points, leaving some components uninitialized. Checking the
> pointer directly is simpler than adding separate state flags that
> would need synchronization.
> 
> Fixes: 57ccca410237 ("wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base")
> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

