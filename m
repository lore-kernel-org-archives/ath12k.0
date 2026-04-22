Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26BBF94CBC
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 02:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CV7U3mQMJfVMAl6qflQ64fFOB5iGrhYZdBNtJgFLV5w=; b=KzW0eZWmthrepgKG9jWV6FoZhN
	3GGB00f3CxBQiynwNjz0UlEDbeLX2GX5y4ZVh8KziC/bIomWdDRH6UfLiu2wwyLTr2HdBG+PTzVb9
	h5rxi+42UjubV9e5cWuHa3jzjSXd9b6ReT9Hdfo8qCTCS8wQp+wCOBUanHC+axBKZY+E02JT4LzEp
	PIG+UJnCoizJ8Dzu3yO7Wg1Vh9b7VY0ezaGv46YpPW0ps3TUBOqBxCBU6Pv4EMZ3Z9Ek8nN9CzuoP
	eAKFPZjHyktZad/xwkiH1Q10KxE8OY6XxFbeEGds7PmtlvBPyoePFVvnAYvZQK+SkjglyeN68R6Tc
	vks42Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFMz6-00000009USi-0bcA;
	Wed, 22 Apr 2026 02:06:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFMz3-00000009US3-00WE
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 02:06:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZmEq3377498
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 02:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CV7U3mQMJfVMAl6qflQ64fFOB5iGrhYZdBNtJgFLV5w=; b=ls5H+simo0txwsBu
	u3grL+mcbKlb9GCHvQwcJy/lXWGK7vb/JJtNAKMvkU2IrcIPPsBt/lQn8XBuuxK7
	2WbCVl3GYRKbImfHfhqKXf06Jxc2Ee6AZ66XxgCNfTyfvAABYCJQ/T9+EdtKjZ84
	QMtBBM54VAU9G+TmUBo1UmWvVqN32GKsmLxRDhp55M6c/qNuU4cmeEhA5tUZo9bb
	/hxIonzt6KFXtGmyi3Hs1yF0QnTE7m5kJd2CcNvAZGcIxtX50bXFeUiU6hY/hX7w
	+vvxN/zhB1cKwcuN+bnMCi2Kavo37ZMHd4GWrC+In8z3azBMEvh9lo+hIExHCZw1
	eieGOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng186f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 02:06:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da86144daso4913957a91.3
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 19:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823591; x=1777428391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CV7U3mQMJfVMAl6qflQ64fFOB5iGrhYZdBNtJgFLV5w=;
        b=igTNdPpI6fVtCXNHrTlmSmRpYZsXXnoGYTyW9hhlISAFNQAlL/gDiHg0R+ZbtZSCv/
         kU6CF/gZWGdJNHG2dqs7SWAuyaEW7i4HsqRf7yQ8ctEnJ4su0jkJCumBUH2EeaRBzywR
         oRzz4D9CEJKgozgPHCduyoXgexMLysjCxR4qwuBLeo6kur3ZSjQt4RoDA6IqKbXix7lY
         DeaDdwVEza50JcCGR1yT67LJnENG4qtLO4yfU/Uo6UDo87iq+TYRM1qeg3bNzIncwZ/W
         Uk4tZmL4LRJKtccWtpFzIxqWPxKccKXkod/HHSgf0K22KuwGgKdBbjtFnkfZLn2PKfUb
         BE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823591; x=1777428391;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV7U3mQMJfVMAl6qflQ64fFOB5iGrhYZdBNtJgFLV5w=;
        b=kq7y/K6avp6M7PmNNdiZ8xJAdNZGyVDEfd+EKgBF032/x1CLL8pPKnde0GweMtRD9K
         1fcEn5zJ4tGohhg188s5Lu450RlsQA5dwdNXg8iO/2dMq8Bxx59IpotgsF3rCpXdeWjH
         KVgG4PsmYV8Ix8CM9QfEdWUZr1WKGV8D2P+F7Z1/pQJ+4WJVbjitKlmu/SRGwVagOt1A
         DUkKwHYm7GgYElNMZDafq1V0e8m5pGOXn7Iyl1oSfoO28qbIdTFOr/TG10CMNmoIM6S1
         yfajFYMt6stDZnu1BrdWkI+T5NI3pgOea7fEE6PtZKOHHA8/xcdbI8l9Hxq/796ohDhG
         bwUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Plbz/1qgBXHL2jNmayUXOweWXxp7mkxPO10R/9lVfbKrhN3tsX55tn5kfOo5GE6ck2Dr7Uyk=@lists.infradead.org
X-Gm-Message-State: AOJu0YztHCfvoGQda1zrUZKkLsINKyq9bkKsodEyIPUyOBXZq139LG72
	EfmYE5NHQTZ6G/RMHO/UpSfG4oHXzlWrTOMqUReJ9cMgjsCtRrDXOOw/kBDrenBORSOcTv1P5KK
	TeuuZ7Da9ZxeLXtMAwHSZUUT2ftaHIJLBpaYevuw2eGg8MJyAWjXHfCiU2IQYSKPVWt0D0U5T
X-Gm-Gg: AeBDiet/AazMEW8O3R4PNnvGK9RRLXoTRVU7qlWVgsUobJBR4syMHuIXdr50cP1h0e1
	mYVz3qOhToaOWnBFgJJQDtMndSpmKq1+7VGAfl4QB8jLp/I44UVpiflu5N3aqPVI8H/cL43qejP
	i80M4RWDCMHq/+ep6wZTk5/CLriZW30kJf1p6zO/ESmeEM0yz8EJjMN/GoxQtBqACzJ8ll8Hflw
	C2MtTrmSEZ+2JGeZIQfMY/y90tssShgCduMOEL4Ri/0JU5FXLKDJ5VTMbaw9o/JbjqiWVM6Qcov
	vVsrZS8TfAVmfIqPlrFx2Gkcxp+aPWeMt/g1aETtZB793J8PIRMqg3jrWkftwgRHyT9boV9nqLM
	pXAOnv5w8lMGJvkP1mPaQprZogtA91QK+4lncMmqblblV7PyeFp7XtyL8qfVThzXvBSKikE5vX3
	bQoRU2LG683dUDVGIVQ/qUQlB2m5+HoQ==
X-Received: by 2002:a17:90b:4ccf:b0:35f:b647:d973 with SMTP id 98e67ed59e1d1-36140229b13mr20344552a91.0.1776823590616;
        Tue, 21 Apr 2026 19:06:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccf:b0:35f:b647:d973 with SMTP id 98e67ed59e1d1-36140229b13mr20344504a91.0.1776823590133;
        Tue, 21 Apr 2026 19:06:30 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm14933809a91.5.2026.04.21.19.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 19:06:29 -0700 (PDT)
Message-ID: <dd79f106-9b68-4600-9094-d962e598199d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 10:06:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on
 PREEMPT_RT
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
 <20260421172500.1050754-1-asas1asas200@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260421172500.1050754-1-asas1asas200@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e82d27 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CW9kBp-o2NpbEht7vlgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vLY9l0HLEV6LgcmlUUw1DYsLrF1Xa514
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOSBTYWx0ZWRfXz2mFPoQcLq5r
 mtFV+nIE29+oMzh26uHQyO9zWuAcMC7MT6s46z9hbkk/yR2JiJTDX+DUqsDqt16GYnImuvEscg1
 zoFjbYhQu7CKG9MWKWZgh+/FpBTcH16MSYL0iPt6BhqU9ZGLE9P/+ONRNH2Rn6vA8qyHRvDhgSL
 G7LBDcOjh6xpB/ACtQgxCBua4vUm2NrmyqW9LjKMtGKacuSu+ce/HivwZP8hqy1BVwBaiwcT45E
 T/qjf20LczULFw5dr2V4NkxEn22m2kFgzHRPZMGGscd6U4uOJWEzY7r05Iga97ws+XhavuI+KE4
 sGUO28pv/X8OiXBfR32Ov2aqHKsS+jD7fqu6RuqHZEeihN5ntLe3/OHVo4M7JKdzB7XuRAZdkBv
 1elWYAftZ+Zq7elbiOQgthFY0uCs3nQ87g/YVxLQqMHmT3/8UWW4sCaqsSM0lt+vQw8VlwXwjVu
 cavS2BPgITqbhvGVNHQ==
X-Proofpoint-ORIG-GUID: vLY9l0HLEV6LgcmlUUw1DYsLrF1Xa514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_190633_190257_062B6EEB 
X-CRM114-Status: GOOD (  13.72  )
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



On 4/22/2026 1:25 AM, Yu-Hsiang Tseng wrote:
> Two functions in ath12k assert that the caller holds an RCU read lock:
> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:
> 
>     WARN_ON(!rcu_read_lock_any_held());
> 
> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
> false positive splat whenever these functions are invoked from paths
> that do hold the RCU read lock (e.g. firmware stats processing or
> mac80211 interface iteration).
> 
> Root cause:
> 
>   - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
>     returns !preemptible() as a proxy for "in an RCU read section".
> 
>   - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
>     task can therefore be preemptible while legitimately holding an
>     RCU read lock.
> 
>   - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)())
>     and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
>     read lock, so these warnings are incorrect.
> 
> Typical splat seen on a WCN7850 station with periodic fw stats
> processing:
> 
>   WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
>     ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
>   Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
>   Call Trace:
>    ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
>    ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
>    ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
>    ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
>    ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
>    ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
>    ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


