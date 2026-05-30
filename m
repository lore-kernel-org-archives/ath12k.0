Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02516CD6E49
	for <ath12k@archiver.kernel.org>; Sat, 30 May 2026 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=; b=1z7tKvVrgHgttYInBsLNltKLmX
	Q8Mno7OR5v6BxY9001kzZ20W1Wtt0sVdhT81lkEEzMH7MS3UhDJAdrd11O9MajTHKiQ6tI7yaqjUR
	wOwQFe3pNwDO5M0Zo/B1ZWIAFz5g9R02ityzRCgunx53/nBQrcEERuMcJbT7R1U6b7KbBovTGPOOv
	b0FrzCDtLACUZlnQn6CkKK/xYb1fHu9kv8yRwcksK/xki7rT67mLhodPCB860R8f9LAiVrY0F65fJ
	ythKVUobzl3NgP+0f70uU3kqqpakrUJ9fZgSZ1YRvrN0uN/pzESZiBQMXhnOsFJtp+9g8Is0c//ad
	tr3p7uXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT78f-00000008JkG-14eq;
	Sat, 30 May 2026 00:01:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT78b-00000008JjW-3ZO9
	for ath12k@lists.infradead.org;
	Sat, 30 May 2026 00:01:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TI2QCX1912461
	for <ath12k@lists.infradead.org>; Sat, 30 May 2026 00:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=; b=SPjJSPV+ZNlrAoQn
	ZHxh7mmtcvDOm1MYocHyO1ZEIhJMunDrcUhCqbHQLdAuI1BDF0Ql+/oIxZZmLhic
	FMywCJ1j1ahva4KoZ/rxXJd9C6M2ukZJnKaGcjwlFY+lmggD1+zjUQEK3OhXBnik
	Vgp86RjtLCvAfK3PMeDe9To2Pd3DVU4F8TpzWHeU1v6zbLRjefpWtPbnu7PZrNLc
	wMOA8NTRrBZ1eYh0tygVzbxKYMzbVKSKu++zKen9u+LT9KSbwllVS6868krliWEj
	GtjURwWxPyZUkGTvu1MFVmLMZSMfK1LE8CERJZbpk0eeMIlgTqk3HlXB9YAQJI7T
	8R/e3g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu52v93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 30 May 2026 00:01:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8613efbso2917459eec.1
        for <ath12k@lists.infradead.org>; Fri, 29 May 2026 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780099272; x=1780704072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=JPBwGvGhvo1l5AR7RrnDGdenshdZ4bLgWFZAZ/2phyoTTadqEwJI7Lag61OpA+OAdn
         ngj2nF5k7Vvf4lX81vbM4X7f3trUUaWwrw2+TPFloNmFKwBnZ/96iulE3DJoQaGSZ0Su
         A4/lMhEqknxx+SSWH/TDM8nUs7+XHBZDwLaWyGCQXnbfG3Wb59z97i1BN8N1f7mrdulR
         Yrwj7dP+QjPaCfXnQH5ccXs/F4NDkqxxGVdAGBKEdc+eCy4LwPuJEd/gwavD5M19o9gP
         PIBcQef6k4bgsAnkb2Emby9jM/qTDxz6sT/7VwTE0AkZL/1k8GmHyLx1CpukXRJv/LBP
         sGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099272; x=1780704072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=sbP1UpfJWcbE7gcXBw273Y1WjmQXYZsf8ETrLNbvfmAG7DIwdNyAm8PwNzgRyhHLGE
         ZfdYdSH7SLpMnZ+Ique80nKl/eIMsQrO1aoysBPx3Do5bVg5FZ06EaLllcKU08qfhUc2
         yam6iWpE8qYwOzoFF7J60hIlb4Kg+grcawlEPEo4WEQ4szhg182ZTBJbUUujBe3Gjmoy
         96+fB7xdb8Xviy4Uhv4fk9sNAhWxyfEtW+FCBMpeOE/JL0IYmwe3qCyjTAmra5Hglu6q
         6LEO91ReuQigIrMtblBr6MJyaYut+Kj6NGekkP8CM5AIkvojcxWzKB73VEMfyp3kR0mA
         GDag==
X-Forwarded-Encrypted: i=1; AFNElJ/lmy5S5T7SuYuTokai/9ziJGHDwFzfvZSsXLBqAtpWHT5QEiP+k2j39ToUpl/ZVuKjPhkJnh0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy8YEFKSE21zgLw6Lm7yE6hggFWL3pzPlvqY8xOqDDl07TnvLX
	5gLDYrS2Yh0H780MXXyDgDK1xezGy6Np1a6ICVTy7eXeMIJ61aqGQGrKYmF/xnDawihi4dpJcA8
	kc1HQapGVZ0IvaqGgQPAu3dR2lIOJAufsPF3PNtO/+n8KFsKPB8zplQCabj/r2YbR
X-Gm-Gg: Acq92OFDCZ2oDzmSZEsnx7gn/uvDO6c/Nwr6B9r1O6Vd4Cut0IvtVo42+Dq1XWu3/kP
	pQaycG7/7D57ZM16gNjveIbsG5aJeVpCXQiQ2nTZCc6IJbMyjQB3iWplT8+4zG6ksFUJ2CHY/uy
	DXY+QroZPxEnh+GBUCDYK5EkKaawNLfEq8V68q9wN3LIt3nAR7dsgNyhCDH6cHjztrXAv12eW0J
	Gc3kL/O4d+YFwIrJbAxxo2bIvLBxUaUR46KPC99p8L16PmbESudEJr2foVMvjCTnxwtxoylTXW4
	AgYBi8ClWb+rsUrJNPcKbtYcntcfXinA3m93njCmgOAYQsHu4IyzzamaTTRJJ7ZfeKjVUqUy6u0
	fb3hvOy8jML908TshXYy/kKd2+EKrwcz3iNv1coO4J8z7DEB8qzVg5gM9cPlksj++zenzyOZO0C
	mGcKsCMCUetmMbpCKgCf1rhVed
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962709eec.30.1780099271387;
        Fri, 29 May 2026 17:01:11 -0700 (PDT)
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962652eec.30.1780099270745;
        Fri, 29 May 2026 17:01:10 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5d5385sm2693818eec.28.2026.05.29.17.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 17:01:09 -0700 (PDT)
Message-ID: <4bf20c0b-f153-44cc-ab83-cd0251dabaff@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:01:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] bus: mhi: Drop controller runtime PM callback
 indirection
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain
 <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a1a28c8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q7cftjHEbLmqyJcuSDAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: G6pftkewXGJssqXvjifKbzz_VCPJnn1g
X-Proofpoint-ORIG-GUID: G6pftkewXGJssqXvjifKbzz_VCPJnn1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDIzOSBTYWx0ZWRfX4n4deD0PTJ8w
 cJnAW3ILOrInCY9so1DyTwtXP5U0HLkXaCU7UWgjT306k7by+IyfPmoQoT5DFW8zufo0Ca0Ss6o
 768O7dK8JRV6i/T80YVUfGfxcqBkl7gNptOvzlzjQ7sOp3LIFebMLGoe0mXiZr8ScEkjcym4YyY
 QjHWpljq2JRPQNagQIj/+N6YzZC8WoKO7s4Nfl1sWsF1yHciQYBi6X0QIHRhnLhLl1g3Y3VEKIy
 FFc8DzmcrPGDp+66CcFGElGIlpLuxdSpeG6HSncz+mNTh8smfyXNQk8CVZfVgtHxFT2h4xBUA4H
 SdOOUvx3EcFB1CNHAu2JkcPA+3y9ZoYSYUBoBl58v+MMC//9U4axFs3le57JXwXDhGbU4NGhMIG
 B5EaQBNgdGBgMXLz2Yr4MkkLl1guxpN6NmAr/bSYpPwgylyFSenOUg1Lis+ifbklB4xFxonHE7Q
 egpKC/zLSeIdKNfr+Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_170113_975927_C7158D3A 
X-CRM114-Status: GOOD (  11.30  )
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

On 5/22/2026 3:00 AM, Krishna Chaitanya Chundru wrote:
> The MHI controller interface exposes runtime_get and runtime_put callbacks
> to abstract runtime PM handling from the MHI core. This indirection is
> unnecessary since the MHI core can directly use the generic pm_runtime_*
> APIs, and the existing implementations are either no-ops or trivial
> wrappers around those same APIs.
> 
> Remove the runtime_get and runtime_put function pointers from struct
> mhi_controller and update all users in the MHI host stack to call the
> standard runtime PM helpers directly.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

>  drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
>  drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


