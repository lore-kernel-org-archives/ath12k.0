Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE7C55173
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 22:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=; b=qytV12lqmQNI7aeDQJjwdvS+j5
	+lBAzH80B4Djj6edfcGibRHFA0AJOXedVA7wD6hGu2DmQFXu/zg1oo+rtlasocral6lgbl4FbL6dr
	BZkVSTuBO9Tz+LaWzcOOD/JngbvCXpnEV81bIXZ5x84Z1ibp0F3HA6YarLe9bCTmvk3ziWxS6S3VX
	w8+9m9wNm9AjRHgCrM3Sh0bxyZ+AgufRfaIzWkpf4VROrJMK9GxhDt59dlAgsPqYJXNWr4Imuq3hq
	mi49W5yx02LwoiRb8NF3BvRSSyxNh57ibn+qjDRDVv+Pl8O07fr8zMytO7eIcXodKkWkhShU8eR4d
	Bz2cRAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvKq-0000000Depe-0btA;
	Fri, 31 Jul 2026 22:04:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvKo-0000000Deos-2n8a
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 22:04:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0bl5956518
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 22:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=; b=kU1raL0rs+7Krbr4
	rYXNg2OZfV+iaVADXFJ5vs2lOpu0FOApn3zvlhKWoyFpPeIuOEGMTXCXmphnyxpa
	bHEOLNiZBQaB2uZ6GgWY1AWMzzHojxBqeRUl6KVEBwyZ2s4FmKY7nMXctWzPBy5H
	qgBkU7ytWCvP5MHVlUL1/7bKS27FM3Q835/do0Ra0WHHfArak98kD98A/qOXkD5Q
	b0LAcqlqJfl3p2yVY0bneAWqa9YchV36H3pMPkUCMJZmPa5tYkyJ1qcGxr1bw/ka
	vHKWK6Jw6Q/KCsMlrJ+tdmJauJHYJDtXLgp16dQ+fNigSSuUEe6po3W+vWbY/cDg
	C8M6tA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqjqqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 22:04:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso2266942a12.0
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785535445; x=1786140245; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=;
        b=U3a0WVlR8sXImSb7aLbEgG2Dr4lCu26NJR6+PTvJoiQvWfDzZGbNQ66koszu6T90s8
         QWL18m09eBtblDsP6HgYqwUHFtvI5VVN2bIMUoE3htUnGJ61VYs/jnljNUhWf7s+U2GD
         TSS2ZbLqa61lG3tqjZeHcUyHdZRJCjakCPVA9i4wVpoH5dnR/2Twkmm9edAV6On8Zc0e
         tseiUHiJSerkdcrHkUjfKAD3x8ib1HKzo8vhgfW6W7loNjkEnJbXMeBmFuTCduFPoswF
         SLpT6hlLVtOqg1oYwi1+uvo/t3nqqNqDqZsFDSDBZdVPA6QAkQcIPCVz6GA0Dva2/xNZ
         3FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785535445; x=1786140245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=;
        b=iREKdRJDZ+Qt+DxZmb+jFE3JQdNoVlXCalECQPOqMU0snZ9geJ+HSTDlpH/4v+aTjC
         Y5g6Rq+khF25euLlLl9smDe7A7VYLwFDpjDpmDAnK5nJRN/sek6FaGTdEEKtBIOxo8yV
         pN+BuzytwfwpNVJYVqo0kzeFnC2c+08oC+/1NZoFC+Fo862tJy/bwFMvdk102WumnARf
         SLTSt8G7LWXzlEPuW15XtoKptjVWEySZvpWzu4mRulXYS5HEecdNVvWNsIR+mJIfFLnW
         VqZdpYS1Z3Z5UkT60jJP3EwrNbCVpuzNRACb7WHyuJKDADex+q7GM0ulqMLPCsSAU08H
         4e9w==
X-Forwarded-Encrypted: i=1; AHgh+RpR8hIfrPKyV/1PvsbhUiFcbYyK+bmyc/AJDS80Q0+x8jQ1fBIfHWcHj/fT5ticFAFo+8f/em4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrDTmuWSeSe2MUyFB+KIC57d7aEdmi9Va7Ao5NKsYz4ekS0gN1
	pHcZFDBezZqwLmCrbYjmmFFKb2R0yPZ5SD/fe010Sd4ifvddrAvXMtNV2o5GDfP8RWIReyxLGeN
	SaIXDnU3TlJn22aGrLB4DXMLkLb3kMtgygAaW2UmqPXQ8MBHAnCqEywEtgXDhVuSr
X-Gm-Gg: AR+sD130ILPi/51mZOS67ogtzxC7wvVLddunfSteCaBX9vPa7rok98pzsR9yQhPALQy
	66OGGOor3XNDR0ZZDetWkAN58+xi4SETNqMtqwkYew0BO8Zs1r5Lnqmrvg3T61iFQ+1VTnZB7jA
	07d5gok32CQwGcPuT2lpp+MPlt8bEswuPCFatO08yLEP/mQbugFQsybVwWb30lb276FC9EO5DFU
	rpDqJ0GlRZrHLKDhSnfedq6C3Wqscsu7RSMyvkTdEGnG/piqP8P6fA/6shgjblcmWqKlbm20rl7
	EZ1O0SiYHQe7tnu4H3qZq2yypLx88S6pDQxJQ/z/PxqfvTgmN+2RhDsHLJOUaNxN/8ih8Y10u1m
	IsF8D/9syVF7oAnQ5OLLHqcBr/Cj25YTYMDyPoLDkaqLaOXklYxE7ImLfZvM=
X-Received: by 2002:a05:6a20:4499:b0:3c0:9c19:65ab with SMTP id adf61e73a8af0-3c92a9054e1mr1240317637.67.1785535444656;
        Fri, 31 Jul 2026 15:04:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:4499:b0:3c0:9c19:65ab with SMTP id adf61e73a8af0-3c92a9054e1mr1240278637.67.1785535444178;
        Fri, 31 Jul 2026 15:04:04 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm12966664eec.16.2026.07.31.15.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 15:04:02 -0700 (PDT)
Message-ID: <a9565939-0ff0-4672-a733-20692b9f9f26@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:04:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] wifi: ath12k: fixes to improve MLO station stability
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2NiBTYWx0ZWRfX3ONYPGRuWl9W
 EQVs1+ljSf/p3yaUEJe0kZIqCW2H7WqIC0LRLyk3gZLeIJalKeVrrc0Y8C/teCKFTLddqc6cBcP
 NoGVXwROYaXkueFDnSIElhtKPErcPyZtUjjG4evyBodjP9yneQ6huD6OCdo/WhvTWbL6sitcAHH
 SOEbgNbNGyZOULbhxqFUrdOj3ufF3tWPY+S7U+lWjNaV0fhPBLOFXqCv1+qjpSD4bzLZZspPdND
 SJFzGRufzVCtx4x47NiGaVGryUNTEvtAk0pGWe6DL9UijfB6ED9az+PNuiS7z+NQbvDCfsZ4GKV
 6cbVlqIvgKJyX6LEnUnoA8OflJm/qBFLCSES/uIrybEwkvJYu9CM+1jA7sUkuC7RyZxyGJIhr6T
 5CML/A7emWBjIQXPWn1Fe1NWVTafM5EtX4/oPGnk7zkWbTPBK2FgSQCauHlQS63rslQuTKZmBnO
 nT+GZCKcSegSTfW/b1A==
X-Proofpoint-ORIG-GUID: 12kO-cxPAdtJUqjzIuxaLkZx27mD1CK5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2NiBTYWx0ZWRfXymtfVzeqEemy
 J9Fj+qRJTYt3JxPdPkLpuAiIwh+wpoK1w826KuE7HRG5smicBkZopQTbCo4vnzatj1mAWpJqj0y
 ISUKc6k3GWaqe7RcTuBpPlfRAbrN9pI=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6d1bd5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=vNYMOvrsSQ6qDk_1z1wA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 12kO-cxPAdtJUqjzIuxaLkZx27mD1CK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_150406_817028_CD731EAA 
X-CRM114-Status: GOOD (  15.11  )
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

On 7/27/2026 9:27 AM, Jose Ignacio Tornos Martinez wrote:
> This series improves firmware crash recovery and connection stability
> for MLO (Wi-Fi 7) stations on ath12k. Both work correctly for non-MLO
> (Wi-Fi 6) stations, where the driver handles the full teardown and
> reconnect cycle without issues and maintains stable connections. This
> series brings MLO to the same level.
> 
> Without these fixes, a firmware crash during an active MLO connection
> results in kernel warnings, NULL pointer dereferences, 20+ second
> recovery delays, and periodic disconnections both after recovery and
> during normal operation under heavy traffic.
> 
> Patches 1-3 fix firmware crash recovery:
> 
> Patch 1 moves the RECOVERY flag clear to reconfig_complete and adds
>         CRASH_FLUSH guards to prevent operations on dead firmware.
> Patch 2 prevents scans during recovery to avoid NULL dereferences.
> Patch 3 fixes ML peer ID desync between host and firmware by syncing
>         the peer ID from firmware's actual value.
> 
> Patches 4-5 fix MLO beacon miss handling:
> 
> Patch 4 fixes beacon_iter to iterate all MLO links instead of only
>         deflink for BSSID matching and connection_loss_work
>         cancellation.
> Patch 5 complements patch 4 by skipping connection_loss_work for MLO
>         entirely, since its cancellation mechanism is unreliable and
>         the mac80211 probe triggered by ieee80211_beacon_loss() is
>         sufficient to detect real AP unreachability, as done by other
>         MLO-capable drivers such as mt76 and rtw89.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> Firmware crashes were observed to occur spontaneously during normal
> MLO operation with intense traffic testing, though rarely.
> The debugfs simulate_fw_crash interface was used for systematic testing
> and reproduction during active MLO connections with traffic.
> 
> Note: I will have limited availability from mid-August to
> mid-September. I will address any review feedback before then
> or promptly after returning.
> 
> Jose Ignacio Tornos Martinez (5):
>   wifi: ath12k: fix MLO station firmware crash recovery
>   wifi: ath12k: prevent scan during firmware recovery
>   wifi: ath12k: fix MLO dp_peer ID desync with firmware
>   wifi: ath12k: fix MLO beacon handling using per-link addressing
>   wifi: ath12k: skip connection_loss_work for MLO beacon miss
> 

This series doesn't apply to ath/main, please rebase:

Applying: wifi: ath12k: fix MLO station firmware crash recovery
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.c
M       drivers/net/wireless/ath/ath12k/hal.c
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/peer.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/peer.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/peer.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/hal.c
Auto-merging drivers/net/wireless/ath/ath12k/core.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/peer.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: fix MLO station firmware crash recovery


