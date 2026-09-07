Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A9C79F9E
	for <ath12k@archiver.kernel.org>; Mon,  7 Sep 2026 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98atpqeEqErvQfy5RYHFK/T1sDHuewTFDWq2WDqd5Sc=; b=Rpa61SyrDfhFTqOIOm2PbvH6qb
	NgsS1Y//ZVC/d+aa3hg1bpS3oXM+OYK16kTmwaxVtQMqm6QG3gpZ9FFVnpAr1IzXRAhS3Tb7gZ9/V
	PttozfMi6Db2aMw94vK1Yrq9aXAftt0OhZxYqCHu9t9FKbdd0OTqjQEJJPRgWgjL2J/ojyQ/XTfpz
	yXQXqUJN9vuk99ru4uMcVQ8+JqkmdAsrHTpntXEv7U92Wr20cz8eM94EBg3C1AnRmH/5YqjDkiVLl
	6/PCcktNq/q3Tyy/UTWFv2QcL6ExTzOUy+RIkkJHE/yOOJvI42aDqEA8hv2KWPrRCmwByMAmQB7It
	pkjGnIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YNl-00000006mu5-0EBh;
	Mon, 07 Sep 2026 12:23:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YNj-00000006mtx-2OwW
	for ath12k@bombadil.infradead.org;
	Mon, 07 Sep 2026 12:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=98atpqeEqErvQfy5RYHFK/T1sDHuewTFDWq2WDqd5Sc=; b=CN1ldf2x9nrW8tCFFEQL54KEkG
	ME1EBZpJKJaM7pCSCDk6H4XjZVI84BZXoPNPvndLlFeWxfDHEN5oJmhXKgRAGr4iUuMdMHV0mFTaA
	inoZBHz30t5Q8HjHDX/Poyxv8pFN69IAW8tLDFlfiRx+7aKfcDV8auhvfrVYh4h41jNqq54u7/xDf
	XNUvN2a+aDtQ1cHdI8ptAIByGnNErtpQokVuh8BfIG41NoPWGE+np6P74JTOauL4FfBl+BXTFJWMo
	3S2Di+lk22UTgVfcC/y71lXU9kKgeiTlpz8t2X1IkHAAgdkhMYidwELYfyj1B2aSNdog+3Lfx2FAx
	iFJO9EHg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3YNe-0000000GD5z-3AYM
	for ath12k@lists.infradead.org;
	Mon, 07 Sep 2026 12:23:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An8sp3350140
	for <ath12k@lists.infradead.org>; Mon, 7 Sep 2026 12:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98atpqeEqErvQfy5RYHFK/T1sDHuewTFDWq2WDqd5Sc=; b=K1yfMNWNwBBEvCHc
	OoQnFrYTTT2rLDg0t36O3FatvedHHgGqIlzewxJab26AD2yABThHluPPSBD5PMVf
	2ldRPUZj9GcB5ha1OpHzVa7glAr2Pl4GMC5a/9RLcf+OxHYbl2THrzXsNua9dLez
	sFQ/unJDvaKo96IyQgtkMnuPXKn8apYKoohRK8GJnnSLRWPBvIMIQKAZ1/Y/98KB
	gnUWpVanbXz20Trjk53Hm1wLWOHoMzHeCt5t7Cnk+j/GERGYnHdHk7ygwpcj7Hgw
	dYgmufwI7y3LfgGN6IHHgw15RkBOFymZFV6iffBpW0/Rw+auFlPc9aydr9BG+17z
	EBY/nQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0qst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Sep 2026 12:23:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so3253975a12.0
        for <ath12k@lists.infradead.org>; Mon, 07 Sep 2026 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788783797; x=1789388597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98atpqeEqErvQfy5RYHFK/T1sDHuewTFDWq2WDqd5Sc=;
        b=A0sj0wRWzbB4n60NWnMXcG2XtgTJ9ad7PqKUxM3ZLLcW3iCUj9VhiaO143DbvHsjzW
         3JOLYQcy8+8ZzkJ4ru4KYTYUwcmU1nTTq0UxEQtOTh8kLILrGRAAtGnNU2brVImftg/C
         yiR4THySVK/5LTi047GKaQyf4lYdgf7u0ZN96+54z128XOkzZ/9evSIO3XkqaZiE+88w
         qcIffjjCqxHZieap/P/De7x9wgSxSM0B0XHvtcb1tDzSLR1unstdSz6D8CTNQaBhnTyQ
         C+jCxQ9G2NGnXfkNJ/5YESFjpEy2ormyoQDuqf6MGisdElIVaNasgwtmUUjlsernVl2D
         nkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783797; x=1789388597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98atpqeEqErvQfy5RYHFK/T1sDHuewTFDWq2WDqd5Sc=;
        b=qgJJCKiGLDPutbM8T0+1YwG9PPQzlAdnZ7U/9u/aFjbY+6vDQL7GGJxmm2g+xJ10Oz
         RV9bLxqdNQtTBp/Blawz0lXBTXRupI7cM5v+enXQ45VV+ZrZ4zKKIwNG6n9PmZ9/IQL/
         TQ1GO5g5GuS79Rj9iMWI1j8f1glevfPhLgLYKz3t5Q0o5rUqFkTOrOMnYOgHp07KMjKE
         mK7lUUuQNMhtXRx14V88aic8AAD1490QuULf2dFbB6k/Q4jY2h0mVrEqXKYB4aQADNfo
         SyNkNvt17MB0ACB3MabwWBVboSFseuphu97WyPvqVRfPgZy7HxJLayQqAuHNwOh5tP01
         r82w==
X-Forwarded-Encrypted: i=1; AKwUvBxhJQG3fjkE2qCk1o9jsn5hY/eR57TKIip5af0y5cx3vrFvlOBJhJfoAWNvNgcLbZOJOaod/0o=@lists.infradead.org
X-Gm-Message-State: AFuF++kuE6kv3O/6vb3n7WJ20OPBpaAuPh118Q+LPTrofhQvtYzLpjnC
	KwcOFSfYrcdZpn+vXblEHek73BhrzGJfl27UrOzxa3Gxymja0JHxZfazTWIlrmhG+vejy28JsYI
	sO7yqKAu2+ogYnf/AgBlceQbdbLGE1vG9xTmi1LVFmqBRiuTFIe1jPsLND6qgkpRw
X-Gm-Gg: AYBFou3nypI1tlt2LS6DMEQUxZ7LopDKB562wU6LqRSAYjzjX3so3d2WgTgUaxweN4A
	YWPjLT9fj/97lRBwLV8BEY+//RRfPXjJNit81lGd+R4pK2BKa3yKlY6ZQ4SbbuBkPCIzZxlIBWF
	6ThUNKA9z8slA7dgZMPbfJQVvF8JqvEwkBZjz+bRl8W5QS8lP3ohmHTw5XlydKpPWEKKlEdtfGe
	JXLPDYkeHfhJ2xDa0A/sbExuy3URUi2JuEcmvt28ssi5qGdz8lqKz4g8LAXRraMImu2jjywKhsk
	8S4f8+2W2aEcRML2PQ28QdESEkR2XLnx1sq2awNbl2Rx49XMamIhdIXw+ne23T/bMrVbNY+FwEs
	Nvi8uxR8e3lGBfJdOREUeNgo6xUKMk3MkoK4=
X-Received: by 2002:a05:6a20:1602:b0:3d3:aed2:6f23 with SMTP id adf61e73a8af0-3da21638008mr27894222637.23.1788783796936;
        Mon, 07 Sep 2026 05:23:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:1602:b0:3d3:aed2:6f23 with SMTP id adf61e73a8af0-3da21638008mr27894181637.23.1788783796321;
        Mon, 07 Sep 2026 05:23:16 -0700 (PDT)
Received: from [172.20.10.2] ([152.59.48.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm2794285eec.31.2026.09.07.05.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:23:15 -0700 (PDT)
Message-ID: <dd02ef49-2e37-497b-9a37-32a5b2c93539@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:53:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPQ5332 multipd: missing text PD level and qcom,rproc ownership
To: Hideo Sumi <hideo.sumi@mugops.com>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        vignesh.viswanathan@oss.qualcomm.com
References: <20260902041339.7665-1-hideo.sumi@mugops.com>
 <741d7c3e-6eea-4a84-bf4c-8d8eb8032c83@oss.qualcomm.com>
 <20260902192434.54709-1-hideo.sumi@mugops.com>
 <9103ca95-5e27-4979-994c-e14f123cec7e@oss.qualcomm.com>
 <20260903124238.59908-1-hideo.sumi@mugops.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20260903124238.59908-1-hideo.sumi@mugops.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eacb5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=LjvNJr9HdsU1EkKhf9BFDQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=aTTwR_pdSoFANY7pt1YA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: TyG8PRui1kR06RxxvGM5yM-v2ZUjB8C-
X-Proofpoint-ORIG-GUID: TyG8PRui1kR06RxxvGM5yM-v2ZUjB8C-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNyBTYWx0ZWRfX2IRYLDQdZ3nO
 zpXJYriv0akEbx19t+o3jmEVI+AnGQtm+cLjkB47XvJ06+rZ6/A0rCaKNEYjbeke9mbxeKJ2Qqu
 Pi28kTJaVNvkMYOEnKCkJ7udy8zw+JM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNyBTYWx0ZWRfX2N8Lg5DlC9Um
 jwgaTF4qaZBF9lEu19JwTYT/IKFOGxIa01/qXJVxApeCH4pS+4AyQaCWeGA4xlzPhUCxicrjxBK
 EWw6YZxquPDbreOMgZN9EiHqEeCNP4Z6uRkLKH87D4aTwp2m9xaLheObJRqbXR4OMYjar4sNFCp
 NQ2iD0nS+LjkqtVmyImKRHKWc8hJPuZbAARTK59l77+4Flldr59XNZSPo/kBZKUVZz06lolv9No
 B59LfsyhTFtRBgHThpNNlZGEBlmLej+1zCVSakeAXIghdCN6kIXw4XzACnRm0r4juvWz6+mMghH
 IoVmD+FmDy+BZ+44fmrra6tNHLWHMMjd7Ok4t/RMugXX+aGqz6BYUkl+FVRbCyR1FC/ppquws3A
 dTxEKTfeRCkcWif8rt4dvqXdDSJJxtPi5MuW1+mEgUWqB0/ltHvaWUl5HHnO7Mc7mNdNm/3SfWL
 LMVG4wB6tfeH/Fenv5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132323_392271_B08C5A61 
X-CRM114-Status: GOOD (  35.73  )
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



On 9/3/2026 6:12 PM, Hideo Sumi wrote:
> On 9/3/2026, Aaradhana Sahu wrote:
>> Before we look into the SMEM handling, could you please confirm whether
>> you are using the latest ath.git ToT and whether the remoteproc v14
>> series is included?
> 
> No on both counts, and thank you for the pointer -- I had not seen v14.
> Let me be precise about the base so we compare like for like, and then
> ask you the one question that would settle most of this.
> 
> This is an OpenWrt build, not ath.git ToT:
> 
>   - kernel 6.18.44
>   - ath12k from the OpenWrt "backports-6.18.39" package
>   - the multipd remoteproc support is the *old* series: Manikanta
>     Mylavarapu's original multipd patches (Nov 2023) plus Ziyang Huang's
>     "split q6_wcss to rootpd and userpd" fixes (Sep 2024), carried as
>     OpenWrt target patches.
> 
> It does not include your v14 series. So it is very possible the issues I
> raised are already addressed there, and I do not want to send you
> chasing a three-year-old base.
> 
> The core of my first mail was a *text PD* level between the root PD and
> the user PDs, which the vendor firmware for this part requires and which
> the 2023/2024 series does not model, so I added it locally:
> 
>   q6v5_wcss   qcom,ipq5332-q6-mpd         q6_fw0.mdt   root PD
>     text-pd   qcom,ipq5332-mpd-upd-text   q6_fw3.mdt   shared RO text
>       pd1                                 q6_fw1.mdt   user PD
>       pd2                                 q6_fw2.mdt   user PD
> 
> So the question that would settle it: does the v14 series introduce this
> text-PD level (a shared read-only text image loaded between root and
> user PDs)? If it does, my local patch is redundant and the right move is
> simply to use v14 -- no need to debug the old base at all. You wrote the
> series, so you can answer that far faster than I can by porting it.
> 
> I am glad to help validate v14 on this hardware if that is useful -- if
> you can point me at the base it is meant to apply on (ath.git ToT plus
> the series, or a branch), I will build it for IPQ5332 and report what
> reproduces. I would just rather not promise a blind full rebase, since
> 2.4 GHz already works here on the old base and I do not want to trade a
> working setup for guesswork. The OpenWrt device support proceeds on the
> current base regardless; the upstream question is only about landing on
> your track correctly.
> 
> The details you asked for, in any case:
> 
> Firmware version, from the Q6 error record:
> 
>   WLAN.WBE.1.3.2-00067-QCAHKSWPL_SILICONZ-1.128291.1.135427.1
> 
> Platform: Qualcomm IPQ5332 (Xiaomi BE3600 Pro). Two on-chip WiFi
> devices, two user PDs, both attached to the single Q6 root PD via the
> shared text PD:
> 
>   - wifi0 / pd1: on-chip QCA5332, 2.4 GHz, AHB
>   - wifi1 / pd2: QCN6432, 5 GHz
> 
> The multipd DT (our downstream form on the old base):
> 
>   &q6v5_wcss {
>       firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt",
>                       "ath12k/IPQ5332/hw1.0/iu_fw.mdt",
>                       "ath12k/QCN6432/hw1.0/iu_fw.mdt";
>       status = "okay";
> 
>       text-pd3 {
>           compatible = "qcom,ipq5332-mpd-upd-text";
>           firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw3.mdt";
> 
>           pd1 {  /* wifi0, 2.4 GHz */
>               firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw1.mdt";
>               interrupts-extended =
>                   <&wcss_smp2p_in 8 IRQ_TYPE_NONE>,
>                   <&wcss_smp2p_in 9 IRQ_TYPE_NONE>,
>                   <&wcss_smp2p_in 12 IRQ_TYPE_NONE>,
>                   <&wcss_smp2p_in 11 IRQ_TYPE_NONE>;
>               interrupt-names = "fatal", "ready",
>                                 "spawn-ack", "stop-ack";
>               qcom,smem-states = <&wcss_smp2p_out 8>,
>                                  <&wcss_smp2p_out 9>,
>                                  <&wcss_smp2p_out 10>;
>               qcom,smem-state-names = "shutdown", "stop", "spawn";
>           };
> 
>           pd2 {  /* wifi1, 5 GHz */
>               firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw2.mdt";
>               interrupts-extended =
>                   <&wcss_smp2p_in 16 IRQ_TYPE_NONE>,
>                   <&wcss_smp2p_in 17 IRQ_TYPE_NONE>,
>                   <&wcss_smp2p_in 20 IRQ_TYPE_NONE>,
>                   <&wcss_smp2p_in 19 IRQ_TYPE_NONE>;
>               interrupt-names = "fatal", "ready",
>                                 "spawn-ack", "stop-ack";
>               qcom,smem-states = <&wcss_smp2p_out 16>,
>                                  <&wcss_smp2p_out 17>,
>                                  <&wcss_smp2p_out 18>;
>               qcom,smem-state-names = "shutdown", "stop", "spawn";
>           };
>       };
>   };
> 
>   &wifi0 { qcom,rproc = <&wcss_upd1>; status = "okay"; };  /* pd1 */
>   &wifi1 { qcom,rproc = <&wcss_upd2>; status = "okay"; };  /* pd2 */
> 
> Thanks,
> Hideo

Thanks for providing the details. This helps clarify the setup.

I checked the backports-6.18.39 code you are using. With that version of the Multi-PD implementation,
the root PD and the Text PD handling is done by the remoteproc side, so for the issues related to the
Text PD, I think it would be better to confirm the expected behavior with the remoteproc team.

Regarding the latest ath.git ToT + remoteproc v14 series, please note that the firmware you are currently using:
WLAN.WBE.1.3.2-00067-QCAHKSWPL_SILICONZ-1.128291.1.135427.1

may not be directly compatible with the latest upstream flow. The WCSS secure PIL flow expects the Q6 DTB
rather than the bootargs-based flow.

I am also not yet sure whether the v14 remoteproc series contains all the changes required for the complete
Multi-PD bringup on IPQ5332.

I have added Vignesh from the remoteproc team to help clarify the Text PD handling, and also whether v14 is
sufficient for the IPQ5332 Multi-PD setup.

