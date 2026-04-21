Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE84F5A8A2
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 02:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgDMVNCvXyKwwDfZlNFHIyKphSpxFtsaHkDWCwFQFHo=; b=j0iGe0qyxdJqR9vz6xwTxEeFBF
	ymYL1egTu6gxHNVNkoq1uihfwIAn0CNhq4THdJNTFDQKCxtF+z+0x8uYClZYgOdfcPWBtKHKDftGc
	2ho6bRYH6Nfo8DCEuyR2BNiihkDM/ctbbygPd1b//tHpmSsTJAhGeBS/gfRpvUbin+GaeVPXlzC2M
	6cVxbUSjLgeVi++vTrDEqwlojvmfc7/FGmZfLPoMDwhU8K3NAZJFpoeoGGD2pLaV396m0nyoyBoj5
	H05HTaJEXqM5p1UeBGBSgMLdSETe0rBZDu73LCRZOTCxG4vDKZR+kXjrxsxTDnhI7Y0UZpD4LrZxK
	iU1RqGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0n9-00000007vwE-1XoM;
	Tue, 21 Apr 2026 02:24:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0n6-00000007vvj-24Pv
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 02:24:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHCq2t3015371
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgDMVNCvXyKwwDfZlNFHIyKphSpxFtsaHkDWCwFQFHo=; b=XXGMutNId1A4XRpO
	h8g7wY+s0r/8gVyvi8Xh8E1wmNaLJibCWqnHY4FP8zLk/zy3rJuyfkK5fM0oDacZ
	T+1DQcrrrkdzIyO+85TrSbGMmBfXclWK9m1vznJeYalN1D3plaj2vkSPn3slVxTx
	ofq3O+AsSP9XIgHR8TiUIN6cHFLWx8Zg5vbCXT1NbQvljaCAf9RPXcXRIE36kghP
	r03WOddszcqoqQsB17qiLK4RZOu0QC/YWpc1WYgatDyNeLN26aQaO0biJegqSwSf
	COAaoZPr4hqWqQ8ZniXJQfCtwgqsCRW51AQ+81fLHMm6sXDN6JsRkpjy4wVe6Hvh
	feU92Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuktxa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:24:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso5011587a91.1
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 19:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776738281; x=1777343081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgDMVNCvXyKwwDfZlNFHIyKphSpxFtsaHkDWCwFQFHo=;
        b=Nt9f+tao6+XizPG/mBiaLSsH7TGYhJ2Yj5FOYj234V1R1IlQuNpxBhGz9KWlrQYkK8
         E9T46jaFbApjzekwckv0256Kc4ab7aaf7AyUEZmNLFprD2id9euJ8RZHV/VN1/OSQQPy
         crXhrFOD2RCbWAoJj4OmD7PNF/aRK6YqZJw9yRavepP4wNdv8j7J+y+i93e78E6jOmqp
         j0rr7uprmkJYjp0gsdg/bfSeOe3gTnJ4zSlSiDUS8VeSJz6GorqL0FENXspc81Wl2r4E
         mR44/xr3sfvJrcqfOdbsbk2phdKTwqIqk5SW976sPSnMwDhhiA7UntiUCio6eJP17fC0
         KQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738281; x=1777343081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgDMVNCvXyKwwDfZlNFHIyKphSpxFtsaHkDWCwFQFHo=;
        b=ci+5IwT1/3vnoMgm0UsJaFXnyZ+jeQAqxEnaoC1Ni62WBgpIS3jVDP4QuVeIGKdE40
         3ATOBYzAcT1kJyUDmht8ieLRUVCmL8FvwVuTDo67SR3gfR2sWpyjchWjG7friL3FwCRq
         bzkxAyHRj/NHsjZlS9Bjb6dWp5KCg5AoRH+NHxZd0sJ5QPxvCJeQGeWa3k05B01dgLCb
         al1v61074h8/20u+unN6KiJ3PwNb5b1enCbLnQpvppmpC2UXHX+UNaO3vlaPWrllXD8f
         9uhDnb2zEgtu0cAZuQT4kaljyvJen9Y6QqQ1fgCHIBi5kG8Kp6t5JpYINlcAFS3G1St2
         ei8A==
X-Forwarded-Encrypted: i=1; AFNElJ+NV4m6pXtq7vO3EO5FqlMYILK6nB+u9zBvh3tccS2rlruwSIkhWbHeUI8Pre5XLL4rvvsadI4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjCmR4HXxck0KqgJnQ/saU5wZZ1yMXPjrmFi2UnTNgbTX/pHg1
	Vhg/TdDBvHwiyASgQ+7DTHXnZ0hA4yDL8BNb4yUwK3gR8tiVq9JkVZvpC470+DelJf1krlmPizu
	wnWr5iZ2/kAqaI7Cj/+lqEhRb5CiCvfD5HngmT5Eq53Ccu0wGwEmpXNZSqEs6Zdks
X-Gm-Gg: AeBDieuorHRr806UHQHWtGblRDL2odiP3oPcIYZkqF9ns4WObvLvn/IQQHgQEAOC3ku
	jD3Lhhw7BhZ1X6Rw83p9iEB73HTFUk1fWMd20JOgDw0wT/FoKiVhhLvGHUvv4Lk+y4K1J74rkG/
	yLCInesqoG313us6gWBEvf8kK8Qf5eQ+JzwIDwT2HMZmLPWMhivsyQUqIaDobqOIDCROCemfUzE
	ucjbR8OBEzkHbvI5UDPbOMAiJen6NrVOoIl/nUzzEGZSyA0KR42qXT9zqBaJq/eENkiArwM3e6o
	4VbM8RRyuySy/Ms+ISPc/yKbEzZVabySl3Kunci6G6M8DF8hLr0YipZKgktEZcO/EZvA7oUr30j
	0ozPmhUxKPZ8YeFF25vZ4UFHm6eSb2oaxrSLUPbgv4VmjRzjzBaAMYzLr8lBiOXoWY+TO91CqMi
	dRgAyCxZMc+k/h7ydxSEHTfNm9QnHmjg==
X-Received: by 2002:a17:90a:d604:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-361401eb6e8mr11315829a91.4.1776738281306;
        Mon, 20 Apr 2026 19:24:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d604:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-361401eb6e8mr11315799a91.4.1776738280743;
        Mon, 20 Apr 2026 19:24:40 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc593bsm14924248a91.1.2026.04.20.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:24:40 -0700 (PDT)
Message-ID: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:24:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix false positive RCU warning on
 PREEMPT_RT
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Cc: Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20260420161049.695518-1-asas1asas200@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260420161049.695518-1-asas1asas200@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eUL5WUdJ9BmJyDA_x-NPIGzbLAbQPybO
X-Proofpoint-ORIG-GUID: eUL5WUdJ9BmJyDA_x-NPIGzbLAbQPybO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAyMSBTYWx0ZWRfX3uDi5XWtI55I
 l0MUDImlg4ePRqLuDJxDd7ND1o2mpy7s9rkrLeM03SIDODr2lxTU0GgqlH8iBZeW8NiYUu0we49
 55steuYsXwSU1x4XEqiwl5gEZn4QeoV1NwhmsJEjuSUrdmAf4lGsqgUHpp6E0rmyXbF7pTG2QdZ
 OO5GBgaBs5FrG78EuVR5BfnhQcQ+TTbxpklnoI0SK6ihrfQhU0uvAqCz3prM7YByMbbe4l3Hh3B
 DWIhpUes3yHAmVSqYOegkQG1aeBMKtAiul1HIyCpJBvT4CUa+CWDLD/q4yB1/CLW5yNDHLMzd6k
 vIeXUKldRsYX9kyaRbzSiEzzAUCue9Qmp0h/Hy0y31KyWuZ6FHuWtkPOadZN+NKsXoEz5PkpSum
 ijcLFpwdPO1n4XWWYwllfukJRvbBi8J8oZFCBoT7EiU+BUIpWLMGjjBoBv4MRJpZKcmLShcsbqb
 2A9U3uj0FwKx7tPgqqA==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6dfea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=yypq-u40hovQB3Eki34A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_192444_660582_DB8AEF86 
X-CRM114-Status: GOOD (  19.91  )
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



On 4/21/2026 12:10 AM, Yu-Hsiang Tseng wrote:
> ath12k_mac_get_arvif() asserts that the caller holds an RCU read lock:
> 
>     WARN_ON(!rcu_read_lock_any_held());
> 
> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
> false positive splat whenever firmware stats events are processed,
> even though the caller does hold the RCU read lock.
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
>   - ath12k_wmi_tlv_rssi_chain_parse() holds the RCU read lock via
>     guard(rcu)() before calling ath12k_mac_get_arvif(), so the
>     warning is incorrect.
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
> Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index fbdfe6424fd7..a772a5b6adc9 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -788,7 +788,8 @@ struct ath12k_link_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id)
>  
>  	/* To use the arvif returned, caller must have held rcu read lock.
>  	 */
> -	WARN_ON(!rcu_read_lock_any_held());
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_any_held(),
> +			 "RCU read lock not held");

should the instance in ath12k_p2p_noa_update_vdev_iter() also need to be replaced?

>  	arvif_iter.vdev_id = vdev_id;
>  	arvif_iter.ar = ar;
>  


