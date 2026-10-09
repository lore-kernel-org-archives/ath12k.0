Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60056CA6019
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIJ6J/MXQ1oSPeoJJWVdhdjnJM9MuB6zXdDPPg31KzY=; b=1xnWtgx8grFk7KW+BkImjujPrc
	hISnc+uImVwaCcaY5TRBPOZPyq8jgfAByDhjmouIQEJFcRpMnXBxJq9b2PEK+Xg2yYhlm+sCeQmKR
	A5W7iOckqY3hv9zOmplTHGh+/SQ/eViemb460WVDUS6t0OXMpG8XLIGEVDpgCQWzqTJ4rASt6jal7
	JJZsYn4B1FmgJtJPSJpaHxKnyuttAkkh9B/I96S9LQH6eiD7R6otWz/pt3VvyYLU8zsGikXriGm2n
	wvL72PK4wCScJ1A/mTkpfbj8b3qaiFp5+AIIdALmgMKsUgp/D7YiLGmJNklaLPCsUtJKXzemq+bJz
	bfA/XuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBh6-00000006SXe-3lIC;
	Fri, 09 Oct 2026 14:35:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBh3-00000006SXG-3O6o
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 14:35:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKFDw3023938
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 14:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIJ6J/MXQ1oSPeoJJWVdhdjnJM9MuB6zXdDPPg31KzY=; b=HmYopKqU81XlFDTO
	vBvaMvXXKOT8rRXLMR36QxiyUYuoNHAbyGxr/m8nCWr8zz18LtYWLiiLVdxt1Cio
	MMQg+/VIArQcM0fSk7uI3VDfmLmPI4wdhnl8YjKq2MgLg1zvc59WkG3qGSTmH+9y
	HV8Ew5rc/sQlKFGuRF6m/MzM8I4pl5hWjTwPgWzynNpq81szDL8r7d6YNbGC8ofb
	p/wQAJEkLR6/3Rl/4YltJpXLIni5iDKE6+peH5Dqtv+C+HDNZ9LwkM3RWRGYTCuH
	8UvL9TE+764K3AVy6Dw5jRsWVSS/yIKTUjhLb/mbX6oNgbntBZrdpsF8nAkaWrkp
	3YL0sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwc08f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 14:35:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so120824871cf.0
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556527; x=1792161327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIJ6J/MXQ1oSPeoJJWVdhdjnJM9MuB6zXdDPPg31KzY=;
        b=WSjMRIPdIO1TKmfnUh/RS2WJGMQHWjwx/o35yMR3QY3sQfaWcdgRYPRJM94V+LH3KO
         NnZY2w2PnUFu4RtqW5/epPwqJzfE/mV7fbxdIz1dsNKpuaz+sGVE1Gn90qmbBCKz4wYT
         H0ewO7VIUX8IcCXnwuR7wfdYwTqERr4bIF8xBOTl3HMglf+1Ws8EOaUtGV+ulUo23eOF
         CLPzzH//aaL4VZitFBwjdoy8416bw1YQ/qhzCf1VuI9czei00HZcBcFfk9vNZjfkiU1O
         WJbYruhqPnScmAbXT1U0aR8RODqOMmhpoULF+uKPuQpKuIbyG1Gi8nJlbdUFCgVQReEB
         0w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556527; x=1792161327;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIJ6J/MXQ1oSPeoJJWVdhdjnJM9MuB6zXdDPPg31KzY=;
        b=vmcSPwGG30drVR0zWRFww4sQy9/Qow4Yvclo1lXFWI+S++gJbKMJCIPKr4z1S+2FOR
         YAchP6d+rnlL58TdvVzsoU2n4h/YLeJyTOLX2VsrC6PIQClMikKCwU7Vplv6dbWp/c9f
         5y6IJK8PFA/zzK6QJC7vcElXaIILyVZ7BV732TFNDVKEx/vgE9FBIp6rd73EKnKpKq/M
         bpvBco+ukHtoiIrEcP5Wsd4NYkvc1oMYBZjeSvGRwfDaxFVVlfxGD/pQZciy6ak2yTtN
         /sTM14149qKWLCOfyhaiPhVhhbwkgm5lGjZk5Ih/z5vgQBtiK42lmQ5hLKa9wUlV3/WI
         xC0w==
X-Forwarded-Encrypted: i=1; AKwUvBzKPi/883PbjQJ1QbruoQPcFrfS4GTmLhic2i0hs5Dv88jkJwarsrWtd7V+ZKe8vvY7sCYO1dA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIce7k0EAl74C2u9eC2qlm9tpD47e08HHKvN1NsOaF/mtHvBXXU
	hUqk2Mpk35CFSUUh6ktX5TJEknvHWTjr/mN06PVJTunq481DjgRPolzDeRj48KAm/eiA4B+I+AF
	1tjJySLYhPzk3dc/8b/z/usiRMtwF2uxQVE6ZmYSLo7m7MmO+5qPhrE+EQxwF/9QJ
X-Gm-Gg: AYBFou2crT2+cBzrfJU/+WeDDKgcdHfZvabXzHr4nI3qE0DsQ46NPGsqki4QIqEnhL4
	JRs7pwREVha9EUX1WmYplZjEMTCkx2IM/202L3QCKCt8szCXhk/Y/VXXsYSE8Iv8EfzftDkYQDO
	9WyuI5W74giBzkgJJf3y4lnzJ+46g5KQ15fgyWDEA51PpVS8t91eefUNhuHaex1qLjDVwKnot54
	olZuCThe01w0wI+T5lGKudGl4tIRHhgJgX4TuA2Ekr+eeHT5zKTdiKlS0BBIFO/PQ77cH1d8rWp
	Pwser6XeV/GWpZdbEvSGb/X6vsEtCAoTTxMblx+HLoIpLCUrKcoDxu92yXCsoGxJA3vcm4QXkG0
	sjgPylxQ5euLca9VLSas9BaMLrU0JuAtbn4H2v5E4qGUDpGOIV9LfM26hy8Fu
X-Received: by 2002:ac8:5a4e:0:b0:535:341c:e2c with SMTP id d75a77b69052e-5359fb8f878mr30395421cf.39.1791556527394;
        Fri, 09 Oct 2026 07:35:27 -0700 (PDT)
X-Received: by 2002:ac8:5a4e:0:b0:535:341c:e2c with SMTP id d75a77b69052e-5359fb8f878mr30394691cf.39.1791556526688;
        Fri, 09 Oct 2026 07:35:26 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dba11sm18937931cf.26.2026.10.09.07.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:35:26 -0700 (PDT)
Message-ID: <d34e6792-558e-4970-9b8c-3a2ce7d899b5@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 07:35:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: use private page-frag caches for
 RXDMA rings
To: Nikolai Semendiaev <agent00791@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org, wabsie@gmail.com
References: <cover.1791408913.git.agent00791@gmail.com>
 <bd52182ca4916b55632a710be2f5c9cfd25f07a2.1791408913.git.agent00791@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bd52182ca4916b55632a710be2f5c9cfd25f07a2.1791408913.git.agent00791@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX6UiFE3UfAts3
 n27jrHtpK3VNLCfWFfLmClNV2szpNBykTxJ4ITVmuaZwF6zQ6/8Wkujvu/BpH3qRsJgi5UmF5eo
 PwzeScYqr76aIbrw98dCw99ibDvYfw89Xgud7DkHASjhQupdKLIjkCwo6d4m6XDtlB4S7Z/rDeD
 zrYgk4zbm8oMCSyvquYpp5G8vkmYjumjBljScU/y30lTqaPkCR16Wc+1OQeLBQ/PO1tAiPz4xx0
 ph7sbrW/PYGP/V7DrbTP+THTpOF2BFQYFc3KXowV5o+AlH2PygCkd3WEEGnGdgz8NJMWGaXQjMH
 HwWugDWpqIDMavgF06R57OMQfC2X288z8o51im83U3hZtI2ECEEDkQLEtIHHUSeOAO7qkW3YD1a
 ML4lNfsKWnTqVc/MaIleasyWfYtl/1Yw8XGQ/ldyJQWkhhoUR+7ThdYqlAFjx3mROQ86TvglrX2
 ph6RXurl6uiEOAWP1+w==
X-Proofpoint-GUID: sjiVsYogtSSL3Zq3mlSR2F7_2fm_xJdJ
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8fbb0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2qyhcpLnmCfHRKMOYrAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX0jbmAKrSFspg
 ZjUpdsCyj7J3IASqpMOMEgAa48b1tKksyWSPJdd/S8sOWdBbWq04XCl43tNvONFzKFoMYpQwt1m
 26qzjXqdu8FSQo1T2Ox3xUSdyjssqqI=
X-Proofpoint-ORIG-GUID: sjiVsYogtSSL3Zq3mlSR2F7_2fm_xJdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_073529_858096_5797FACF 
X-CRM114-Status: GOOD (  10.19  )
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

On 10/7/2026 2:38 PM, Nikolai Semendiaev wrote:
> RXDMA buffers allocated with dev_alloc_skb() share per-CPU page-fragment
> caches with other network users. Long-lived ring buffers can pin mostly
> unused 32-KiB backing pages as short-lived network allocations cycle
> through those caches. On QCN9274, OOM was observed during sustained WAN
> downloads when Ethernet and ath12k processing shared a CPU.
> 
> Give regular and monitor RXDMA rings private page-fragment caches. The
> existing refill SRNG locks serialize cache access. Preserve NET_SKB_PAD,
> allocation flags and the DMA mapping and unmapping operations.
> 
> Drain each monitor cache after releasing its IDR-owned buffers, and the
> regular RX cache after releasing its cookie-conversion descriptors.
> Disable external IRQ/NAPI processing before non-reset crash teardown;
> the reset worker already does so.
> 
> Use skb_reserve() for DMA alignment because skb_pull() cannot advance
> an empty skb. Allocate extra alignment space for monitor status buffers
> to preserve at least RX_MON_STATUS_BUF_SIZE of DMA capacity.
> 
> Based on Mark Ruvald Pedersen's ath11k per-ring page-fragment isolation.
> 
> Link: https://lore.kernel.org/linux-wireless/20260719215817.2468580-4-wabsie@gmail.com/
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nikolai Semendiaev <agent00791@gmail.com>

This conflicts with a different proposal:
https://lore.kernel.org/all/20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com/


