Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7BDF327D4
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URbrxLq/NhhyYFTtqjb5hgyP/ewhb68e/QnrFe61sLQ=; b=d8oklUhtHbY5lnCBNK9INYHPE6
	VwrM5wwklxH77k2oAqDD48qnxr1QZafvPvVlUcboA0qa/7kXiDoGjcD1Ni9oUdLbLYK0OJIfJ0nWj
	KhOnvoFi+upW7vocnAfY8EFM7h4uNARTn5ARpzG4nwJwYRKvaaOjDhR2NWG8z+npp1xoEbz906IC4
	/MNjuNH2QQAOgb7AeAJpxCeoC6b8eva2Lc1L2v0Qq/4lDD34BJ65s4eaOjRv3ywg0omXNLMWLB8q+
	8agLrOUV3wyyEOWdwLT+ycGR6PLkpT4yFLSZr/XR5E1Mr7c/xGWqfeqOT32m5sY9lIKdTnG/g3KFE
	N9iDOZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFExy-00000008yQz-30Gw;
	Tue, 21 Apr 2026 17:32:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFExw-00000008yQX-0dFO
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 17:32:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LDCel21538426
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 17:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URbrxLq/NhhyYFTtqjb5hgyP/ewhb68e/QnrFe61sLQ=; b=QS1e8+mpvTYDjLbI
	xBjSEijM1o+jWC55zG9SWLVLY83eP+tP725VAEMlhVXgrcn+abz3kKFGYxGcZS2Z
	nGSkalD/gFqNdhkCNZrhy4it6WuRCW+iPpJYayUglXGT6Cbxn/kixJ5iDld5vNIs
	lIWhGLifnNHQdWbQyKJtrjSG/+3qr/XCsbfx85cOg+ZzNdkQymT0hD9CTabVefrF
	5IHeVJYJi3GJdUEAaWnZYUIY1+zZtddg0aZOAbWaFeNXNSENAl9EsH3PgMiLIN6t
	n2f8vZWfZAihWck1OOoTbAfdnCIdKr24JQpmTr+Qs524pDnDLz+D9EUnnsVRSKk2
	EJ2t2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hajb2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 17:32:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7948640854so1979693a12.1
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776792771; x=1777397571; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URbrxLq/NhhyYFTtqjb5hgyP/ewhb68e/QnrFe61sLQ=;
        b=Z8Su+Mjsu3NOmGyzA5jMQqLKP9MO/+bFGbWubf51uYRUUMCABCKkzM1qc5cAuELSyz
         70j6EO4rndLinOQpVLtFINh5ANrs1XGAn8bqvGZHbchWRDZLreQjTSvwJFxNycTkBd9F
         G2rWU0G3ZJfX4B/i+rvazjmDMPEv69UY5RyZyF23k0wjUtzgKNnp0EQCzXDp+6YbTe9w
         87lnI1pZEXkgLJNlttT3BhL4GjNbmOPVAUEojYeHKU/CFNAL1odCoOj71dK0ICdbIK6N
         6XjcSnu0+WHoQCHz32kFuYxfigUJ9PTzaciqJR8URfqeqtzT6PBMv8+25n99LJ9uUFDE
         yinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792771; x=1777397571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URbrxLq/NhhyYFTtqjb5hgyP/ewhb68e/QnrFe61sLQ=;
        b=O0j0+cJ6W9pk2W2DQaXtn0ZvWVNERbqL2WF037O5hjssZtx5jOh7B3N7XAXHQElmDw
         PXgI2BIXgwhEsXJVnnIspBuTYOxPgqSBElvzeuS/4jkUvApctme4jk6EZ9lqz3ZCDwOP
         Ne/wGv6386iA+3u4qfomqfWY8EsvP4N7THsxZcuxE9NhuDAAuiKmJho8LkGKEciYYMu6
         xJM9IHMKcIDeG5OJoYpisPD9VbUytgp4Ja7an26Q4z/VJkD0ebLuhNg8MXtfE2ASsxsf
         gz4XKo1tewVw9JczWHD/mCo/+QPytoLuKCDIHQJnHrEXf0nQqYQz2o2dCTCwfMcdrR0e
         ny4A==
X-Forwarded-Encrypted: i=1; AFNElJ+nT+4UQDIs3W9Q8WGrVpbHnJqVXO9Leq7dYN5lMnbjiRaD1zRiPAlpUBy81fDxD7+QfFNzO54=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj5IS5mAMh8XlXSTs65r/MaAzyOPfZX4QqAhGRA4HlhZjXeFdi
	sr3N+8SYfQ7jgdmIlgsC2FDgTeTv9TnYZMJB/6JHs4HF9ZLfTu7B42SxGNPq/XPZw692di7UqTF
	+JmgQHCevHy0DFNsaym9/A56J3vpRWhaCs9Lj7YGLm0YaUZ100iZyTmaWBMLtUeB2
X-Gm-Gg: AeBDieuYxnXWYCtjuNbQtcarEdC7s2Qu1JZeyU5KFbXF97rbWbgGGd2Qp2GPQihQvL7
	UEplOTmx0JCmlJtBjrrzZkjpFZjAP6dvMStKTLE/vRWDD36IZ2Juf9HuoRGKNkhAxk83o+wzwNR
	Hu4MZVn/vrczuu3Yy9xRtGBsDbrLS/rQQIj7HOXKCOYSDjhd4qowEWyDCXiwupcWfr4+3l2LXwe
	Ayy1WuE67OY3HDEjL5OGv4DxlTBcrNmK40bR6gehBS/scolfAMR/tfVmGc9gXAoT/hSWgwZ+Ntl
	t9Ilj/jrX0DiV9b/574+4TOLgA0SPSfVbtiEp4JcKW5d7WtSZPVy818tgEzdsIvnkK8wv1I7ddx
	4CPryjGNUWbsnezTCcoXbNjtB8zGKVFnWVFkJu3XxEJvGWpx2KExL5tEdARtrKPc4Ldg5eTENwH
	EB
X-Received: by 2002:a05:6a20:4326:b0:39c:cf9:b8e4 with SMTP id adf61e73a8af0-3a08d8f5a50mr22898221637.42.1776792770674;
        Tue, 21 Apr 2026 10:32:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:4326:b0:39c:cf9:b8e4 with SMTP id adf61e73a8af0-3a08d8f5a50mr22898185637.42.1776792770063;
        Tue, 21 Apr 2026 10:32:50 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f3e5sm11200099a12.5.2026.04.21.10.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 10:32:49 -0700 (PDT)
Message-ID: <1016fbd7-be27-44b1-9eb8-6201c9495f1a@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 23:02:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on
 PREEMPT_RT
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
 <20260421172500.1050754-1-asas1asas200@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260421172500.1050754-1-asas1asas200@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e7b4c3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=akWcTCgZTv-KWhlo_GAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 4avBpnSIzf6WeLVWAY30wPlymAdBmIwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE3NCBTYWx0ZWRfX+5B8CrBF4PzO
 DaETPxpNZs7tz+P5oaaeu4+pFSi0ENFsbym/Fmpt4AinOBtOUsn/N0AJNr51f9B3nxla5dpnc5w
 07AS8iYxurKmB4iGEa3Bo73g6hrfOpnRBvPWSpL/Qo8CdKeCsTkiXsYb6yH+ARNGaOsY0fwg2nP
 UJJxtcXJhcTCnDHZX8sSSz8ejIFo/g03hf9vJAK3mCdKRW8glNSf9ERF3SPOjn0D64Z+0qhRHo/
 t4easmqlEnEo+CC0mPA/td/uVp4mXY3AnYjfMwGg3UT15FLPDbKf1TJDit0TSg/k8JVaiqXuZb6
 wpfks6kXSsevGPcn9istVY6qpX3UkX3B98x/Rnonby6z0yQO40KoEjPKQc+ZMJHamvVY2agRwwy
 q0RZS7Bfcwp76FvsRlf7alKPLQ/fUPN93FpycsuAZbbKg1tbJHLm7aEh/V0fQ7pd0SSdoJXMb5F
 koc3JmcCGJO9CK04yGw==
X-Proofpoint-ORIG-GUID: 4avBpnSIzf6WeLVWAY30wPlymAdBmIwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_103252_220409_CAA0B80A 
X-CRM114-Status: GOOD (  14.30  )
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

On 4/21/2026 10:55 PM, Yu-Hsiang Tseng wrote:
> Two functions in ath12k assert that the caller holds an RCU read lock:
> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:
> 
>      WARN_ON(!rcu_read_lock_any_held());
> 
> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
> false positive splat whenever these functions are invoked from paths
> that do hold the RCU read lock (e.g. firmware stats processing or
> mac80211 interface iteration).
> 
> Root cause:
> 
>    - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
>      returns !preemptible() as a proxy for "in an RCU read section".
> 
>    - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
>      task can therefore be preemptible while legitimately holding an
>      RCU read lock.
> 
>    - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)())
>      and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
>      read lock, so these warnings are incorrect.
> 
> Typical splat seen on a WCN7850 station with periodic fw stats
> processing:
> 
>    WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
>      ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
>    Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
>    Call Trace:
>     ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
>     ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
>     ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
>     ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
>     ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
>     ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
>     ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]
> 
> Replace the WARN_ON() with RCU_LOCKDEP_WARN(), which is gated on
> debug_lockdep_rcu_enabled() and therefore compiles out entirely
> when PROVE_RCU is disabled. PROVE_RCU kernels continue to get the
> full lockdep-based check.
> 
> Fixes: 3dd2c68f206e ("wifi: ath12k: prepare vif data structure for MLO handling")
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

