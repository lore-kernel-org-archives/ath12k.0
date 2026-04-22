Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8986EF9EDCB
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ4bPzlWEYxjbJF2kreOp9MPUnQ0acpYT1N59TN47uE=; b=Pz42QzUcoMHSb9Lnfr/D2uxA1D
	xhaLIBoIitllvp570AeF1Lp79SVGcYqdKJWSZqdmYH5KV8Atq5AwGGspTUNEG4rKseMZTEfrLx9jq
	x2nRmEgjAU3hHC5lGrH25LW/mU79hnEPCf179DgmG0jG8771Q9HVtiSqP52nONjYNEeGat8IsmYvI
	WP5nJQk4Br/9DxD2o2JvlimZK7+bRBuAoKIoxHa3PibaOAaOt3JmSc8wQNXUv/RrhBM+vUQaheY3Z
	/7QkC1HXafbRhFcfeYJ1lp/alEZAeyF34idfSkQcV4Vgpka84LByNgv4mPOcbJOeEDiBCI1wPAzxW
	2a7dBDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXiE-0000000AJRF-1GdR;
	Wed, 22 Apr 2026 13:33:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXiC-0000000AJQ3-0WH6
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 13:33:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99Dse647345
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 13:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQ4bPzlWEYxjbJF2kreOp9MPUnQ0acpYT1N59TN47uE=; b=JWwBRp5yiYEvuszc
	5vmuY0T+vuGqB9GymLxDU3t6ZHEXTjN1eugjAvaNYTJu4gsBbsVurHzAr7619j1O
	1QUW+g4uaewoD+p8bXMctqnFIr+UkWjIPofLJl/YK9cQF4Swx2HbrfUP3hCy0j5I
	eDKySbiBcE5GtnUOrmuWaqdw4V8sb3nyattc3OmArpr+qEXdmupK+qxf9M32WGzn
	495dKQ4V3VZpP3c/wT8nJz7yb98dUydHUfNxSdI9C7igW8uOQDOKRrP8HilZi2RZ
	WyQKWbFKgjrwBJu8yU0FKG9iKa7dYNn/A67Tlb226BCHvE6dD6cru/lyFbjVXyRq
	sLMcEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkbge3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 13:33:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so3166550eec.0
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776864829; x=1777469629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQ4bPzlWEYxjbJF2kreOp9MPUnQ0acpYT1N59TN47uE=;
        b=TuSa/Q4OTw3H9KFoGO2/AMdecUYTaPb31BgaL47kIsTzjmy+kttNFEAlQVYZVS775z
         Q2sOAIXuyf2nUtlOiVCAJf5bXes7SUhAl8iZa45qzrD7oV+iwMsxN39UuVDvKoYF9rNw
         9fbhWPLeIbUw2wJuMD9McI7Mkwlzzf+37SKPHqFDsIertRxlZGqO7+UEIowVMZydIuD7
         enJQjFGkfpJ9rg1yZUomnP26OqVGFKLXE7u0IVI1DJh3DOmXYf2k5VJ9Mc4WihAVpVvg
         LVWb4J+l88TZR5PeyIZer2UopRgosDOa4Y6n5tE9w5MFgKmF1v5sCcygYJGHLOK0jjCt
         6uYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864829; x=1777469629;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQ4bPzlWEYxjbJF2kreOp9MPUnQ0acpYT1N59TN47uE=;
        b=UREhpQ/0L7uIEBX7gKK1onDxjsantZVWAOQjeE81w+Wu6L8zt62omAXC9T/52QabYm
         2ccTHGE39NsUF9K8DnopU3fwSqg8RMGYvoZ2ODxVOEhc9f0QPMfUMyagHUjGpQtUFsLa
         NACI0SwAw4hd6HEjP85Nle3sK/H3pzXPv4FO89bUlMHSILC5T4+PKlsAgh9kgirj42XW
         B44z14NqypBOMh8gmc/ffJYGUP20oef+obiNfNJTqAETk+r53wwBF3yTdWhib5+wp83S
         Wr3aeUVT93GIp3G6SThbtJbxDR3vBwxZYokUdg0j7LFB9cMkdGxxMnXmGFtRZAM+Ufz8
         VZLw==
X-Forwarded-Encrypted: i=1; AFNElJ/imRE2G20yuEWD7ucxchT0+r1wwysbs+XVJoVQ6tTgQE2u5m+yCkt5RQQZJhfst9mYNWJKMss=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5wEZmYMwi01Ew5T+elnhR1sP7e5SmezrCQKDFQ5HftzHyMRjB
	nVusMm8oZPJPxnkUv4t1wektZZCHwa9Rs9KUpd2oEX6Y9XjdAv4l7eXRGZuE+vK764OkwhbQYMp
	0szDgamF/d15v7B9Uw+rBsHWvfbcNspfcsYtjVrYTWuk+ACMBUzB5+cM36tbdKSt+y13DJh+Z
X-Gm-Gg: AeBDietDhLx1Ejx3evAYfSMH/QqIF9pQJ+lQ+cSRLQnYt4ceq70X0504xdYloLLbvgg
	tuSHiMdYKlpzk8wASSkfEJBxANUtwQ8D88ZVVKaOv4IpnLB5fJgd3FLeJqAncVVI1BDVZha0Ayq
	x8xpbOvGlwoxmYnN6HbyEXYYopPMecTC/q1Qm2sA1ZcxBqyHET9bSEn84G8blBAYLuklbVODDu2
	u1Zr1cTyUFrl6P3wrS+7o/v2G3CZxMc/eeKjxS7ok5B+eMDjQHF5BKAkLUUBu8UqFJtcYPNQxrw
	gxk8KPDZ2xIl3Kx9efPfqjD4aoTZgK0cv++sYdU4CmRjx711P3+F8ZqvmPgVBpdc4LStMChtSFu
	94NOl+PUNlx40W1ouq9/RWVJTcgAec01BsDk7C5QxuXMayeZSj/H1/9xZKiXbTzF1nGXr7c2Vk4
	JU78bDrrUlSsFDgh4p
X-Received: by 2002:a05:7300:6c27:b0:2da:1a81:5ae with SMTP id 5a478bee46e88-2e475b3994cmr13676058eec.10.1776864828538;
        Wed, 22 Apr 2026 06:33:48 -0700 (PDT)
X-Received: by 2002:a05:7300:6c27:b0:2da:1a81:5ae with SMTP id 5a478bee46e88-2e475b3994cmr13676038eec.10.1776864827980;
        Wed, 22 Apr 2026 06:33:47 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm22934305eec.21.2026.04.22.06.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:33:47 -0700 (PDT)
Message-ID: <5209fd4c-eee3-46ed-b731-1e822a04b03b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 06:33:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on
 PREEMPT_RT
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
 <20260421172500.1050754-1-asas1asas200@gmail.com>
 <a396cf77-81ff-45a7-ae62-fb4e22c18497@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a396cf77-81ff-45a7-ae62-fb4e22c18497@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gn-755V7Zm9r0Wn_wG42KzrM-koWaCPb
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8ce3e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=t_iSBFEcjObAjGY-HZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: gn-755V7Zm9r0Wn_wG42KzrM-koWaCPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzMCBTYWx0ZWRfX9bsvPiVy1vPE
 mj/fDXliLLzSJnX8PHff1fGLIPOFwOggyWsSAftbTtCt35GXzanifj6ovzVubEwQ5VJj+kMxvVs
 dpieWP0RnqUSMrLVInGPD8Om9WWM3orSYLKxDy6cjJqYrXh9PNPqQeISvi1u52+gbV1VeSCv11+
 yLP88qnW7awkyqAm5TVNNWwjtN19Dwl+LBhkD+Qae2flQPDYX41DadIaV0Hpwprv/W9jJACzdLI
 quHEaA89+eVKgMUtjsxR+jD9nZNahFkn/x4CtWk45RMDjk5ObnhCAiLMIgDpf2AoEk8pN164ifo
 qdLQjwZJK+nmZvbaLpN0fNpK8p87CTaXTqT6utmB9BhFJboWVHi83luTUqYxKWIcPgviTzWbBZD
 ER0WV4S1LKlJfrbaU6hFetGjAghAmTk9+qLbUjZ1lIPMem7ZA2ZiY6VLLfjyeI0+i9aBw7Z/HZB
 pkc8Zx8AXZme28gYPBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_063352_286863_EA58BB8E 
X-CRM114-Status: GOOD (  17.38  )
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

On 4/21/2026 2:27 PM, Jeff Johnson wrote:
> On 4/21/2026 10:25 AM, Yu-Hsiang Tseng wrote:
>> Two functions in ath12k assert that the caller holds an RCU read lock:
>> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:
>>
>>     WARN_ON(!rcu_read_lock_any_held());
>>
>> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
>> false positive splat whenever these functions are invoked from paths
>> that do hold the RCU read lock (e.g. firmware stats processing or
>> mac80211 interface iteration).
>>
>> Root cause:
>>
>>   - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
>>     returns !preemptible() as a proxy for "in an RCU read section".
>>
>>   - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
>>     task can therefore be preemptible while legitimately holding an
>>     RCU read lock.
>>
>>   - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)())
>>     and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
>>     read lock, so these warnings are incorrect.
>>
>> Typical splat seen on a WCN7850 station with periodic fw stats
>> processing:
>>
>>   WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
>>     ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
>>   Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
>>   Call Trace:
>>    ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
>>    ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
>>    ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
>>    ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
>>    ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
>>    ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
>>    ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]
>>
>> Replace the WARN_ON() with RCU_LOCKDEP_WARN(), which is gated on
>> debug_lockdep_rcu_enabled() and therefore compiles out entirely
>> when PROVE_RCU is disabled. PROVE_RCU kernels continue to get the
>> full lockdep-based check.
>>
>> Fixes: 3dd2c68f206e ("wifi: ath12k: prepare vif data structure for MLO handling")
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Note that Tested-on: is not a official upstream tag, it is an ath-specific
> tag. Since it is not an official tag, it should be specified separately from
> the official tags:
> 
> <commit text>
> <blank line>
> Tested-on: ...
> <blank line>
> <official upstream tags>
> Signed-off-by: ...
> 
> Unless there are are other review comments there is no need to send a v3 to
> address this -- I can make this change when I pick up the patch.
Amended patch in my pending branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=32f70ee38388bb9089b9cffa9791f5ef8d5d32cd

