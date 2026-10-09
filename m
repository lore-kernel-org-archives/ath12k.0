Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2A9CA6019
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL8XGJtRI+7qCtpmGw7qS+GXrTYObKStvKcQdkmFYSQ=; b=yAVZTb+2+tJbF1iMqDd8Jwo70u
	VuWz7FzeMSA0hIF2UGTHZm5bVX+VgSOaXV/cZbXu6EqrP5YVbQ5l7VsQlIVwoQmazLH7H1ASNfmss
	VAcQvomQ+X34DpquSbU9t3T4g3G3NuCmzkzMYeNcm/TXfGEYlr3qN7JLabohPvRM1Cg+ItCG2AcSj
	IoMK0OlbtBZEjUrdaLsZMC0lxfkcvi+TaPTREYk/N+ZUk551I67KgVfkebhxFEhqFwGN1rXsmKBWp
	4vcJTbP07B59tlPiOhNkqnyPwi3/0F6aGlsVNDO38fyAFA1CAtq/gci0ZP7R5VYy84rT76CseB/Cc
	D35sLtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7dk-000000061Uj-3ovL;
	Fri, 09 Oct 2026 10:15:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7di-000000061UD-0zKZ
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 10:15:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIe7404366
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 10:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FL8XGJtRI+7qCtpmGw7qS+GXrTYObKStvKcQdkmFYSQ=; b=E8SxVAshoXRPHfT4
	jDb63xAQnTghMe8wbetZduEsrmsZmmLBcjTKKlWRxC9h8MUJNo7lN9IXAncdS4Ez
	KKDPff0wJAt664nI2RoCnDnWd2QPkRzmTuP76hPZd9pZX64/NLGai55DA8la1RAj
	E2sOq/qmY0bVXexPr0CYEE0ONz9lURWVK2AtDwx53cuhAjrGpSroFcaIp4KUrfPL
	nqo79IwhHPHZmnCY+dxM8rhff3b1N8YvVTXSyWEvKHozmOgiG9x8EAL4S0gOFzPv
	JeC1dQkgmkHoFcnl3K15aWFvuUsVM1VLBeEXBLUS/s5Ij8fF6y6CESgLsgf1LDIX
	EFBHRA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk33cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 10:15:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a2c5d7ef1so8231405b3a.3
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540945; x=1792145745; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FL8XGJtRI+7qCtpmGw7qS+GXrTYObKStvKcQdkmFYSQ=;
        b=DbBGF1QFnieYVxFGi/3EZVyOEPTQFe8PYjYX22XgbJSPUqj9DCXOegUpCaKp3seEhg
         dMoRXXy8ZIplSnS1xAI2WBEFBAqB3kcwI8AxnDsBUfeEph5z/kVYurXyr7vwcO9Qs99m
         t1jc2hToWL6ISfC6Jioemz+588nqB+WlJRCZzqiRcJSxdHCbvkLfgYWYVkAR0ur3+9tM
         4BE4QAKGW/eIz9x3D6/UupR0A9+2aqz5hnUWVSnn+IktJcDWUa/WYVwtoxTvyw8C0AQ6
         0w/Qqzzfb71In2P5ssDyUUyI+v88jg512gUrg6ElJ9fvFXz+7KAhGhXYfSOCzhc1pOi9
         tBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540945; x=1792145745;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FL8XGJtRI+7qCtpmGw7qS+GXrTYObKStvKcQdkmFYSQ=;
        b=BHOETeJ0l3WECwvRtKomM5xM5nFN2Qo0Yh4uSSFA0zz+tuifzkyxmb5wmge/ubaFZ9
         Jxprebm26s7mnnpqNnVLXywD+SmQmLbVE1Rl2JGw3tTT1LOxgWGwtxrDRgSN41Voa16+
         9zz4ZxeVsZh1Evq8d0Oy06V68ssDngbdgN34ue0qR+JpeTMGCjC0hgyVOIbfg5Yolngj
         7V7L2pR0BUD4YWP2zIkr4+Adl8O5HgbqoPD/UOAtby3xMCoxLA2VcjSN/fFw8HoSPOYf
         puhsmB01JgVdg8HEGPcsXm8N80BVNDfjxoF3DA8RecIRjdtXaMZe7s3gDHqcWotb0TvO
         PTXQ==
X-Forwarded-Encrypted: i=1; AKwUvByYCNUYFKA0xgH81Yrr6JTDjGQoMvF3k3SD4u/R4BkXdimilH2dsmJM9gowhhEZbv6MizT62hY=@lists.infradead.org
X-Gm-Message-State: AFq9FYIhaN0TIEv/Wt0I0QY1Zj2rLYGbpvtNGeYxbpuv+M+9SBjErM3l
	Ff4LnqSphLWI4idBbGEUQhKO8UqjRPY6Hqk5R3GQAOWoiNInrXTshkxLogDpKRvtMKKZmlFqD6b
	ewAoeGIjRngxtB3ryevkbO6ToIhuiQC+pciEX+ZgLI8QFjROLQ+kNCvUkww/NHxMic1RipNzH
X-Gm-Gg: AYBFou2GqTc/HMZtSzE+9K+3XfnkUW+tyvigNLRJvhYzWJUFGJ5Q+VaFYDMg9l1YoWD
	NULJbW6yOMXcOELUkDah+YOOxHNSLvwecB/Ugg0YXoPFJtLwY1Qpf/1xlxELKGM/NMAps3tv2oJ
	FKC79ZTwbbrFgXYNQP+IOVMV4t4MnWusUYoQRgqSFxtFAjBE6tKnW4/9vamPLAY+PH++Fo/IZBB
	4LMQyZkDwt1XvVb1t+1YZDMHQmzb8RHlMzFWeJ1udvAh87nQfDOxsCxSw0VGA46CYjzqz9vEL34
	sFiSlSg7j1Np2ljOCIPqLpTaywbYw4BPVZXdPivRufAaVA36KpsxUwpkbSWwf5exrlP+Y950dfS
	GFXg2M71ryU1Nvd/7ZIlhb0H+r7EZ4L7p8PRWSMcD5URdo/k2rIqh/gujQQ9AXcvsluAfotHr
X-Received: by 2002:a05:6a00:4c98:b0:881:8784:95ca with SMTP id d2e1a72fcca58-897c76e1767mr1419931b3a.33.1791540944862;
        Fri, 09 Oct 2026 03:15:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c98:b0:881:8784:95ca with SMTP id d2e1a72fcca58-897c76e1767mr1419912b3a.33.1791540944395;
        Fri, 09 Oct 2026 03:15:44 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107398sm705736b3a.17.2026.10.09.03.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:15:44 -0700 (PDT)
Message-ID: <e7181ed6-e14d-4fcd-a834-1ad07011b8d9@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 18:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: make external IRQ control idempotent
To: Nikolai Semendiaev <agent00791@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org, wabsie@gmail.com
References: <cover.1791408913.git.agent00791@gmail.com>
 <ccca0d5d087b862c3b41ab4d3c5849ca0dc2d32b.1791408913.git.agent00791@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ccca0d5d087b862c3b41ab4d3c5849ca0dc2d32b.1791408913.git.agent00791@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8bed1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=HjfokuTOBCbMWJCBPCEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: dYNzj62AOzyRGqXCzUybqH4DPAuAxZbD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXxoz+XmgKKb9z
 OfiO+iDZey3VW11XHYeNUpVUjX5KI4HtDMFuoYty/ei04J7EAmTiUBsqi7lmzdjen1U1Fn40u0I
 RwI+t7d5EWChzXtIuZ8f3K20xejVmlA=
X-Proofpoint-ORIG-GUID: dYNzj62AOzyRGqXCzUybqH4DPAuAxZbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX098Xc9vZHknA
 JyufeZ3sB0I+zyI3x/CEvD9mz8Cnozrt9j83AI7QrXn11MNzI13rh00gFrwLNocOs/XzgB6wO5E
 s0sfQfbiN7z47dlp+V4vddy1wmlQpu1Vx6VJYLWiSvj8bdvvLc5+9HPKST4CjWprraJ0Jt0+ieO
 BP21B6WnGoY+CXgZagEzQOemIgJM/qfCUIEuZyUWJt/JoBqrfOtv+d5yFkuKp+G7n8t+WpO3koX
 TrNRPVCjfYTU7C8dpllnxOjgXdssoDkXS5vAMUf8p7uwstXHid56/6Obv4HUl6LpD3pntQDGcdN
 lJSNQP/m2u+zwGe+8FloButS28OqJjGF9AbYuzDzxT5PZ85UQmbsC8vgpgTluheQhEE4UyJglQc
 Pgp+Zv44gNrGjStDt5t3CbJBWoJEvotCTrgKvGbFGKa3i8+4saB6mRwW2jZXLJx23XAYjZzB+vX
 mUjh/p4U4a+ufmPwxkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_031546_299910_BD45DF42 
X-CRM114-Status: GOOD (  12.23  )
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



On 10/8/2026 5:38 AM, Nikolai Semendiaev wrote:
> The AHB external IRQ helpers change the hardware IRQ state even when
> NAPI is already in the requested state. PCI has a device-wide enabled
> bit guard, but also changes each group's IRQ state outside its NAPI
> state check.
> 
> Tie each group's hardware IRQ transition to its NAPI state transition.
> Mask IRQs before disabling NAPI and enable NAPI before unmasking IRQs.
> This permits an extra IRQ disable before crash-recovery RXDMA teardown
> without increasing the IRQ disable depth.
> 

first of all, did you see any issues with current code?

second, the idempotency predicate is bound to the per-group irq_grp->napi_enabled, which
answers "is NAPI poll enabled?", not "is the IRQ line enabled?", so semantically this is
not proper. PCI already has a semantically correct and atomic state bit for exactly this,
ATH12K_FLAG_EXT_IRQ_ENABLED, why not just use it? The current approach leaves two sources
of truth — per-group napi_enabled and device-level EXT_IRQ_ENABLED — that must stay
perfectly consistent, which is fragile. As for AHB, can we also use
ATH12K_FLAG_EXT_IRQ_ENABLED?


