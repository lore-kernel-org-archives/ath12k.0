Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75005CA5FFC
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnWIFVH7MtC1BufK84r37hUKPcu2nCWBjQY0FtW6tXY=; b=e8OSMH6w6zuUgCuB29yasQsXz9
	pDR/TXlfdn7hlC6yO8OkQ68AbWh2X3XlB3LgZte+66KTB75jtCntHsujkShiefU95BJTiGIHNkEE+
	1i0DAigk7/GwiefsknXPAjrMljfmWxBxLqy2M8d4bMOwIBhR9ugnyZys8H1Dkt/TgzE+JP5+DB2fB
	qnrAzZ0BPOUIy8S/rCE+8j/teFGarXpEhPd10E+6ebVFBpYl6d/aEex6ESJmvtmjpgTNKHNbGuHVQ
	nwRg5I5b3B6FTQPXbkWe/Rrj6sxso4KIfsUWccHpPe2vGIOBttq6zooELkL7QhNtqJHR2hp+c6PL5
	zjMMatVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3sm-00000000hMh-2HQq;
	Tue, 06 Oct 2026 12:02:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3sj-00000000hLj-3Cm7
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 12:02:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPGlT717717
	for <ath12k@lists.infradead.org>; Tue, 6 Oct 2026 12:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnWIFVH7MtC1BufK84r37hUKPcu2nCWBjQY0FtW6tXY=; b=VC1ibpACVcIULulG
	7gd6TeT5B4hrarAk0zbbEFTrllDvaYlQ7nWDJWCRpY2rix8BJQS6NmtB3BqenqVh
	FA1jJxl5RqOqmMu18zULY7Z/pbaoal+plAF05V26akjy1ASt0jb042m+YUJ1J5kZ
	dwPf9AC4cLgAsbRcfW6x3RDlb1jme30A/H1xnk1/rFXbG5ytoT5dwlC5PBxHnELt
	/+WRf+tIlwePAQx+AJD0H1ycmR5OmY2YKo03RUhJj67rn2c57kxj1gp7jqxTqq4F
	NTc6eZ67mLWS9+v08BGnA8NEwJjEQfmuXpwF3hyB6u4ih/oWoE+muPDcKc4xEh0N
	7wAXfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3kehq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 12:02:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so5606142eec.1
        for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791288172; x=1791892972; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnWIFVH7MtC1BufK84r37hUKPcu2nCWBjQY0FtW6tXY=;
        b=fN2kJSpq03FfebKTdo90d0bXdGIY29b2mFHNykfKjisYOb6jWXRZ69xMAi96gDXX1q
         XUYZoGWCZqm5DrnMIZ8baceJdrFZqAMuW6RNBXieCGKcoGsbEoXpPRfvwxYp69PHcIbX
         Hf9R8nJYH8urEk6NrsCgLOwKVb+OxuzyWgKjKF4etn/IvwumxDPXhRFl/rs0jVse9exw
         6Ad4QfFvvDwe5QicaizPq0hYW8KkwxxOcPe1H8st+9ORThrW1mBz8wx4pRlayILbCsYx
         qipRFG5euF27XrUa6ZcI0z1SS9rwB7sK8orfdS57oSWhTCvg5TZLkdyV3cyXUHEnT9Gi
         DUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791288172; x=1791892972;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnWIFVH7MtC1BufK84r37hUKPcu2nCWBjQY0FtW6tXY=;
        b=DpD9hpBHrYQWq14A8Jj8epA71DtNo72u9FDtKjvmViOpaTJJUm5bBEmF83WF9S6Gi7
         zXYMxbZJ8tl9aexzwrXGGSXYwnzHgOWy22dmVgRpvd/bLEUH8FW1toYotMja17uWBrg1
         21+KuNsvyuqfOF3XW+EOGOtjWnYxpfMPILLEMfnewTU1cEX9dhyy9b3i0RqVhBBoZmJc
         rm8+8zcGvxCJQUsyXil77CjCZGHa54zfyV3I+1tDf9RztyJM/5hvMHePknXCCskbeXTs
         x/5PjgZ9bDGZlBNZ7Ck/iYqJSKluhIEoHvdACPBb07MNWL5DtiA/IZKIET5iRTZ18qEu
         rkIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiC3RGzrkviI+qYps4lSGpZztdVkNKGK2q6eNe7wumNFVDNGRcw6PTBaMJeiFk7A7k/uFGlNw=@lists.infradead.org
X-Gm-Message-State: AFq9FYJffPggAhr8t4TncTaBl8X7CQG1kvp4AR6GWQdF0Ypzb41SIOeP
	f6fAEForxr0g6v3ohAQlBX6Z6eEqCj4fX96UaW/ICF76jA62u9gtfKQ9JEzgnlCi6HsFFhuFwZT
	2l/WTyiRkEVbQRDvTHja9hZH2G7cMiwAGumalPA1OGDANJgH6nY+iWsPQQpC02Ae0
X-Gm-Gg: AYBFou3d4SorNNNYoeGTKbpHJhLqnEDVGOUC85pyAReck3g0NDCSR3ciwT9dNNla30n
	CAF5eCW35jr+cHE+5IJYIlPrgTY0h/jK0coABw0Ni66R0Fdl5jcn4g6EItyMMboFyrb//FrO/TJ
	wnSzgo5gx/GyfuUi4DGMIB4LihNUxm4fTzjPqwxhBcAePcQxS8hcwJ0uQfxwDIUrmrl4VLJB1aL
	anpXs7xuB521t/6I0HxghL2lSZT8H3eji5gz7UuWXLj2819O7/q20449yALfkSYvCVxhG7lpjt5
	Epx6OaiwPhndd7CLnYKp0OfZXRYpHBv8PbqcRFFRi+LiFxu6lJLbUWmP9Gpv2UjDDEgEvi5LBg/
	UA8nL5K9O1Rw7oYmnYOwv2ttGnRKoAH+C2qL7fbcbCf0=
X-Received: by 2002:a05:7300:55a2:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-3514df98487mr1472308eec.7.1791288171574;
        Tue, 06 Oct 2026 05:02:51 -0700 (PDT)
X-Received: by 2002:a05:7300:55a2:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-3514df98487mr1471398eec.7.1791288152612;
        Tue, 06 Oct 2026 05:02:32 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2add7sm7298163eec.13.2026.10.06.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 05:02:32 -0700 (PDT)
Message-ID: <c3e204b2-47c2-4368-adf4-4f3f9d30e790@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:32:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2KDVsRpUV_QCTaqRODtYXtYQL2K9VjrV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NyBTYWx0ZWRfX0q7G2KXxgsiD
 YKVHDdRctsRlQ32IP9o1ZX2JorJSJZKaOtxSMpYKHBe4vDrYAn2cMyYy+eko2MAZI7XnsUe7krY
 PNTUe3f6MX2x11yr3eYxdadQiNNMhOw=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4e36c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nb6wtAQdZFIURrQIQuUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NyBTYWx0ZWRfX4s8vtcg+/5pa
 bo3VyeXm8E0u1WX9cyV/fzkGM/sRZKoUXiIxQuGDhRwRoSNiRnV+q5/xeDhcyuO3MUJqSb+KFkG
 VVLFvrzq9OVVvEohTcr5Twg3ljsDJZEnVoBsmLXfnsbeU+WRk+KrrOB8CMRxN567YcVw8oaPlWB
 K5LE1fbxceixu1LHUKWwNc49DrUW48wmfN6bahT65m4GdIWEYQ+1X+nxIgbMu+xKbQ6cowiDabO
 21tZkPYq9BjBWkf8MjLPR2t5+caMjggzRFfeX4kUVGloDU3GnQUTCp0+j2KKisqACq5ILplQJen
 OTRTv1VYn+vFyYSDu6MCB2ZUNAJ5V+Utu9g8A0x9aIsOK02KewoBEaHM3s2/hBNK+NRhhI+2KOk
 wxIz9UWfUJIaIaLl3PUcXzD2NJJLCvnY89p3Xir+UvxGAPvx3hsHttpRCHfmmUt+cf3DBRmVWPn
 FK1pNAiOn82SsHmwQFQ==
X-Proofpoint-GUID: 2KDVsRpUV_QCTaqRODtYXtYQL2K9VjrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_050253_831770_70FBAB2C 
X-CRM114-Status: GOOD (  20.85  )
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

On 6/12/2026 8:53 AM, Yingying Tang wrote:
> This reverts commit 809055628bce824b7fe18331abb65e44d02b0ecf.
> 
> Call trace:
> rcu_note_context_switch+0x4c4/0x508 (P)
> __schedule+0xbc/0x1204
> schedule+0x34/0x110
> schedule_timeout+0x84/0x11c
> __mhi_device_get_sync+0x164/0x228 [mhi]
> mhi_device_get_sync+0x1c/0x3c [mhi]
> ath12k_wifi7_pci_bus_wake_up+0x20/0x2c [ath12k_wifi7]
> ath12k_pci_read32+0x58/0x350 [ath12k]
> ath12k_pci_clear_dbg_registers+0x28/0xb8 [ath12k]
> ath12k_pci_panic_handler+0x20/0x44 [ath12k] ath12k_core_panic_handler+0x28/0x3c [ath12k]
> notifier_call_chain+0x78/0x1c0
> atomic_notifier_call_chain+0x3c/0x5c
> 
> ath12k_core_panic_handler() is invoked via atomic_notifier_call_chain(),
> which runs inside an RCU read-side critical section. The current code calls
> ath12k_pci_sw_reset() synchronously from this context, which eventually
> reaches mhi_device_get_sync() and schedule_timeout(), triggering a voluntary
> context switch within RCU.
> 
> Revert change "wifi: ath12k: add panic handler" to avoid this issue.
> 
> Tested-on: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c | 33 +-------------------------
>   drivers/net/wireless/ath/ath12k/core.h |  3 ---
>   drivers/net/wireless/ath/ath12k/hif.h  |  9 -------
>   drivers/net/wireless/ath/ath12k/pci.c  |  8 -------
>   4 files changed, 1 insertion(+), 52 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 1a9866061f82..6705a8a73de1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1793,29 +1793,6 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
>   	return 0;
>   }
>   
> -static int ath12k_core_panic_handler(struct notifier_block *nb,
> -				     unsigned long action, void *data)
> -{
> -	struct ath12k_base *ab = container_of(nb, struct ath12k_base,
> -					      panic_nb);
> -
> -	return ath12k_hif_panic_handler(ab);
> -}
> -
> -static int ath12k_core_panic_notifier_register(struct ath12k_base *ab)
> -{
> -	ab->panic_nb.notifier_call = ath12k_core_panic_handler;
> -
> -	return atomic_notifier_chain_register(&panic_notifier_list,
> -					      &ab->panic_nb);
> -}
> -
> -static void ath12k_core_panic_notifier_unregister(struct ath12k_base *ab)
> -{
> -	atomic_notifier_chain_unregister(&panic_notifier_list,
> -					 &ab->panic_nb);
> -}
> -
>   static inline
>   bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
>   {
> @@ -2212,18 +2189,13 @@ int ath12k_core_init(struct ath12k_base *ab)
>   	struct ath12k_hw_group *ag;
>   	int ret;
>   
> -	ret = ath12k_core_panic_notifier_register(ab);
> -	if (ret)
> -		ath12k_warn(ab, "failed to register panic handler: %d\n", ret);
> -
>   	mutex_lock(&ath12k_hw_group_mutex);
>   
>   	ag = ath12k_core_hw_group_assign(ab);
>   	if (!ag) {
>   		mutex_unlock(&ath12k_hw_group_mutex);
>   		ath12k_warn(ab, "unable to get hw group\n");
> -		ret = -ENODEV;
> -		goto err_unregister_notifier;
> +		return -ENODEV;
>   	}
>   
>   	mutex_unlock(&ath12k_hw_group_mutex);
> @@ -2248,8 +2220,6 @@ int ath12k_core_init(struct ath12k_base *ab)
>   
>   err_unassign_hw_group:
>   	ath12k_core_hw_group_unassign(ab);
> -err_unregister_notifier:
> -	ath12k_core_panic_notifier_unregister(ab);
>   
>   	return ret;
>   }
> @@ -2258,7 +2228,6 @@ void ath12k_core_deinit(struct ath12k_base *ab)
>   {
>   	ath12k_core_hw_group_destroy(ab->ag);
>   	ath12k_core_hw_group_unassign(ab);
> -	ath12k_core_panic_notifier_unregister(ab);
>   }
>   
>   void ath12k_core_free(struct ath12k_base *ab)
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 4edc8f4e0cb5..a81cb3032145 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -15,7 +15,6 @@
>   #include <linux/ctype.h>
>   #include <linux/firmware.h>
>   #include <linux/of_reserved_mem.h>
> -#include <linux/panic_notifier.h>
>   #include <linux/average.h>
>   #include <linux/of.h>
>   #include <linux/rhashtable.h>
> @@ -1121,8 +1120,6 @@ struct ath12k_base {
>   
>   #endif /* CONFIG_ACPI */
>   
> -	struct notifier_block panic_nb;
> -
>   	struct ath12k_hw_group *ag;
>   	struct ath12k_wsi_info wsi_info;
>   	enum ath12k_firmware_mode fw_mode;
> diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
> index e8840fab6061..42bb00c13ef3 100644
> --- a/drivers/net/wireless/ath/ath12k/hif.h
> +++ b/drivers/net/wireless/ath/ath12k/hif.h
> @@ -30,7 +30,6 @@ struct ath12k_hif_ops {
>   	void (*ce_irq_enable)(struct ath12k_base *ab);
>   	void (*ce_irq_disable)(struct ath12k_base *ab);
>   	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
> -	int (*panic_handler)(struct ath12k_base *ab);
>   	void (*coredump_download)(struct ath12k_base *ab);
>   };
>   
> @@ -149,14 +148,6 @@ static inline void ath12k_hif_power_down(struct ath12k_base *ab, bool is_suspend
>   	ab->hif.ops->power_down(ab, is_suspend);
>   }
>   
> -static inline int ath12k_hif_panic_handler(struct ath12k_base *ab)
> -{
> -	if (!ab->hif.ops->panic_handler)
> -		return NOTIFY_DONE;
> -
> -	return ab->hif.ops->panic_handler(ab);
> -}
> -
>   static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
>   {
>   	if (ab->hif.ops->coredump_download)
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 375277ca2b89..65a780e74d01 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1469,13 +1469,6 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
>   	ath12k_pci_sw_reset(ab_pci->ab, false);
>   }
>   
> -static int ath12k_pci_panic_handler(struct ath12k_base *ab)
> -{
> -	ath12k_pci_sw_reset(ab, false);
> -
> -	return NOTIFY_OK;
> -}
> -
>   static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>   	.start = ath12k_pci_start,
>   	.stop = ath12k_pci_stop,
> @@ -1493,7 +1486,6 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>   	.ce_irq_enable = ath12k_pci_hif_ce_irq_enable,
>   	.ce_irq_disable = ath12k_pci_hif_ce_irq_disable,
>   	.get_ce_msi_idx = ath12k_pci_get_ce_msi_idx,
> -	.panic_handler = ath12k_pci_panic_handler,
>   #ifdef CONFIG_ATH12K_COREDUMP
>   	.coredump_download = ath12k_pci_coredump_download,
>   #endif


the commit in pending looks good

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

