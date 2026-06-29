Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA915C43602
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 02:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvWJtJIO5wlFhcTu3sRJPTIcMyMoyT39MwDwH6X3WmM=; b=Rc+9eaIPzyFimjIaw9x44KyRmh
	Cs829/gLgJF33/Hs+BXRxH6MFuyCXV265HEy806zRXiY2Kwuioueq1JfC2TAtoGd3c3P4msmJNp/9
	oI8LR57iMKQHJst9GmmfA+Ljp9m69/exz5Dm+Yl5Bqz/5eYs9KFnB2qRlr2PjH7qt69UdthKG0ewK
	nyiDjvQMZ/VcJE4mjbBq1CRfD9QIuf2n6G+aMWmCMRee3G5cmzS8q8NxyijXB99J+jM4qdwzgSodZ
	02egGs0WIPmj//vT+KRaxm0Qp9pF8Mga2a2E+6IYQBpNWDK0QGmncqm0cSc3rN3DqLevB1CSDcoVP
	bb36yZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1SY-0000000DZLa-2P5E;
	Mon, 29 Jun 2026 02:10:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1SW-0000000DZKw-1N53
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 02:10:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM8pLg975318
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvWJtJIO5wlFhcTu3sRJPTIcMyMoyT39MwDwH6X3WmM=; b=Qzr4CBKhn9ap3pjw
	yNi4qCi8RJecwv/k/PWf30dSAobY2l40oVI50ZlQONU4XC8KrqafbKazFnKBeUG1
	QNfPad0AhunP/lPa1uDaRNKqtLD7gAVdjYuXrpJXVWbAuc6o79mS7bpnxUKPv1dR
	sfstaYrStjpYE2ylP30aePQsLG4nV+lBx9r82vC99xvs7EognEZDhbJvsMI6LNes
	91iyQMSJsGNRmmP+LgZo1fP4FG/GN5nsasYHSQYMTvE0JVtes52VJoKeUWx7qZjn
	Kx6PAziGUKzt0earV1STLHAetc3MLfgERrZVGktNyj1fT9CbyOCn0Nw4/BvrSTPe
	q9YRlg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a440n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:10:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845bdb194ccso3052376b3a.2
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 19:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782699051; x=1783303851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvWJtJIO5wlFhcTu3sRJPTIcMyMoyT39MwDwH6X3WmM=;
        b=bLKqLq6r2dfuZplWbJLVDwdzZQyRUYRyhi/tLJu14xHUKmCtOjBFxZl4H08lz4TZVQ
         lUTiuW8RzDd3awNBWSU04NHzT0GshP4clJYbTS8xSzRRw48mbDhND1yOaDnz5cRkWqRu
         nyAXob6dwmfXDdd/aroXVbZnjUyK1ASgjEYxVr9gi3zwfTxvrxTe9xmLRiD4yiF30XG0
         rwwugj4489FInt3/48IK6yYj5moNy9Env5QdyBO7XQaBZHmtn0K/vSzKv5AkHeLlC8Mf
         ODqgQlBcZYEMLVdYw5xhXWg+pMuKRERnZ513rwIv9hYA52mFjk54EIw1jyAbuZHzwHZj
         YXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782699051; x=1783303851;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvWJtJIO5wlFhcTu3sRJPTIcMyMoyT39MwDwH6X3WmM=;
        b=FuNTZW272FcKl6F7dASxVMxeU5QFScuHPbxkPG0QDSPIk14vH1frbFhJ24f/TkB2h8
         9sniA0z/zqWw8t0jkrngu8Wkyqv67M9P5MVm20IpedFksWzf2RCcGXV1xcVppgOMCbKt
         FPWnwgYOhgLoN5f9Wd5b8+SQOcdaMQyKdEk5GwN2kPiIxOeZkwoFf724tjuW6SRvBtHx
         Y+vzrwM3DVMwVRLV5guyWTUjLozYrUo8gl5ZfHTUCToVI6l9WSNwX12325Mk3qsF1x0e
         r5vLq3K2qC1zqUAIZu9hsfWiIvUlybnjIypyvFeI0kfJovcoheiih+Rxn8BRtk988mMN
         lrZA==
X-Forwarded-Encrypted: i=1; AHgh+RqsRYqQI7ntjg/G4debkjcCWZUWfIPvc/6oX3Wuy7lv2OakwYY7vNczgKRZGlPXB5bHh0mFxZk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkX/L5ihJfJh4PtMhzt2m90QLdlls+YWFyuF4i6EyIvFhBrzl
	MFdTWcw9s7ebPbKr4asyHCWkgXswTiSZgV1EFNtOMz+87wQdhNTgO0H9mTLhNqJYanBFw4RdjeK
	8A7NuWS2RevZYOBVvvTP53CdVxoW4TvGzKrPoKHxLy8IzolTI720ZZ1Ujh4p7DhWp
X-Gm-Gg: AfdE7cmGoImxO64UV2xkQePshVC6VC6KiSv6FMrj7/OvCzCDSYNzUK80FRehPXBupGB
	0bYiTRqI5n+GfH+1E4RsRNWv183b3N+tFLl/i9O7VNkHXNwH9y7P70xUycMdRSzY/px8Utz90Yo
	Ua8eJttNW8iG3M1S+86dNiU5n87CyCZ5AZQlaT1y1fThhWQyUDPOZL8gyAW7tNPiN5kch/dv6gb
	vmlI5ckE6MPU+gAmbqdWE9XE9brlIoKETJ2sme/RJUIAaXOxfRueXz1lJyk27LO0mQgkF4sjjH9
	KFbMIYF1eiTpjGpLBJxXpCcusiu4aLVOUNCou8M1JbHh+C/4m2cOjGb+YRmqE50JAzdSVBFxUHz
	JpTFrh/dM/k7lLEUNRDSyJKsFZ0yPCQ4/wgW89BbiSQHdgpzNHDOoetdfYjg+0VuTDFSwUEvQv7
	xaPsb+Uw==
X-Received: by 2002:a05:6a00:cd2:b0:845:d286:1fa8 with SMTP id d2e1a72fcca58-845d28632aemr8102440b3a.55.1782699051108;
        Sun, 28 Jun 2026 19:10:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:cd2:b0:845:d286:1fa8 with SMTP id d2e1a72fcca58-845d28632aemr8102415b3a.55.1782699050608;
        Sun, 28 Jun 2026 19:10:50 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm11368101b3a.36.2026.06.28.19.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:10:50 -0700 (PDT)
Message-ID: <75fd4d07-4f96-4ff5-89e1-44abdeb1ebe0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:10:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfX4LS7OZgzU0T1
 7wra4jMHujsDJiyd82vJWN7jy2yoEGDHLELfHvYruUE8zU6Rf59uwEVsSzLm+ctoybNFsNU0dcR
 Z7nl+O6jZK61nhU71U2gw3WHoCiK6OlZpnMieOmWQJsdeSMPHS/H1/7p+lHjR+XgqniQ+X5O3gD
 73HCVPpsPZOIl/GIXh+6ZZ9zIjzFkjymRtGAkVwpiRuwTj/wfeSdrLucg2ac7E4AM91t8NYsM8M
 GtADmlcIzLjEPkNYPp4RTpFnDk4OX8j0yd6Nea++FSgLqJAdLVZK5zvXH6+UOlhZBsKG1xpsIbv
 BcvNpLYvdatDiW6WrvQXqXIPiEI6tZ0zbQhrUUs+Ckm01KgrIsTpoz7Wke7DUOOBrwU2cfjNv0n
 x6VKegxnqnUo88FqB7WdzX1sV2wTNiw9Jm2qabgCrNN/Gy6q3XZoX9qcakGPv1IMoO6sSZaCQ0N
 60XZY63NtmQzPA/uTmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfX/UqoENIDzVNV
 J9wc3lWxigurqXH/L8VECiQvolp/MWTst1vutRjIpClDXdnNob3uoZ/xjGzznPX65jaHOOyuFXd
 GUGJPMwN692T9QGLdia+k9UZt2wFQwg=
X-Proofpoint-GUID: 24Kqq8Ho96St4gn49ETktKlOMRER8CrR
X-Proofpoint-ORIG-GUID: 24Kqq8Ho96St4gn49ETktKlOMRER8CrR
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a41d42b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iKBbR0_8DyDqkRAYhu8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_191052_407256_079D2F9C 
X-CRM114-Status: GOOD (  20.30  )
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



On 6/12/2026 11:23 AM, Yingying Tang wrote:
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

incorrect Tested-on: tag format

> 

Fixes: ?

> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 33 +-------------------------
>  drivers/net/wireless/ath/ath12k/core.h |  3 ---
>  drivers/net/wireless/ath/ath12k/hif.h  |  9 -------
>  drivers/net/wireless/ath/ath12k/pci.c  |  8 -------
>  4 files changed, 1 insertion(+), 52 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 1a9866061f82..6705a8a73de1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1793,29 +1793,6 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
>  	return 0;
>  }
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
>  static inline
>  bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
>  {
> @@ -2212,18 +2189,13 @@ int ath12k_core_init(struct ath12k_base *ab)
>  	struct ath12k_hw_group *ag;
>  	int ret;
>  
> -	ret = ath12k_core_panic_notifier_register(ab);
> -	if (ret)
> -		ath12k_warn(ab, "failed to register panic handler: %d\n", ret);
> -
>  	mutex_lock(&ath12k_hw_group_mutex);
>  
>  	ag = ath12k_core_hw_group_assign(ab);
>  	if (!ag) {
>  		mutex_unlock(&ath12k_hw_group_mutex);
>  		ath12k_warn(ab, "unable to get hw group\n");
> -		ret = -ENODEV;
> -		goto err_unregister_notifier;
> +		return -ENODEV;
>  	}
>  
>  	mutex_unlock(&ath12k_hw_group_mutex);
> @@ -2248,8 +2220,6 @@ int ath12k_core_init(struct ath12k_base *ab)
>  
>  err_unassign_hw_group:
>  	ath12k_core_hw_group_unassign(ab);
> -err_unregister_notifier:
> -	ath12k_core_panic_notifier_unregister(ab);
>  
>  	return ret;
>  }
> @@ -2258,7 +2228,6 @@ void ath12k_core_deinit(struct ath12k_base *ab)
>  {
>  	ath12k_core_hw_group_destroy(ab->ag);
>  	ath12k_core_hw_group_unassign(ab);
> -	ath12k_core_panic_notifier_unregister(ab);
>  }
>  
>  void ath12k_core_free(struct ath12k_base *ab)
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 4edc8f4e0cb5..a81cb3032145 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -15,7 +15,6 @@
>  #include <linux/ctype.h>
>  #include <linux/firmware.h>
>  #include <linux/of_reserved_mem.h>
> -#include <linux/panic_notifier.h>
>  #include <linux/average.h>
>  #include <linux/of.h>
>  #include <linux/rhashtable.h>
> @@ -1121,8 +1120,6 @@ struct ath12k_base {
>  
>  #endif /* CONFIG_ACPI */
>  
> -	struct notifier_block panic_nb;
> -
>  	struct ath12k_hw_group *ag;
>  	struct ath12k_wsi_info wsi_info;
>  	enum ath12k_firmware_mode fw_mode;
> diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
> index e8840fab6061..42bb00c13ef3 100644
> --- a/drivers/net/wireless/ath/ath12k/hif.h
> +++ b/drivers/net/wireless/ath/ath12k/hif.h
> @@ -30,7 +30,6 @@ struct ath12k_hif_ops {
>  	void (*ce_irq_enable)(struct ath12k_base *ab);
>  	void (*ce_irq_disable)(struct ath12k_base *ab);
>  	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
> -	int (*panic_handler)(struct ath12k_base *ab);
>  	void (*coredump_download)(struct ath12k_base *ab);
>  };
>  
> @@ -149,14 +148,6 @@ static inline void ath12k_hif_power_down(struct ath12k_base *ab, bool is_suspend
>  	ab->hif.ops->power_down(ab, is_suspend);
>  }
>  
> -static inline int ath12k_hif_panic_handler(struct ath12k_base *ab)
> -{
> -	if (!ab->hif.ops->panic_handler)
> -		return NOTIFY_DONE;
> -
> -	return ab->hif.ops->panic_handler(ab);
> -}
> -
>  static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
>  {
>  	if (ab->hif.ops->coredump_download)
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 375277ca2b89..65a780e74d01 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1469,13 +1469,6 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
>  	ath12k_pci_sw_reset(ab_pci->ab, false);
>  }
>  
> -static int ath12k_pci_panic_handler(struct ath12k_base *ab)
> -{
> -	ath12k_pci_sw_reset(ab, false);
> -
> -	return NOTIFY_OK;
> -}
> -
>  static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>  	.start = ath12k_pci_start,
>  	.stop = ath12k_pci_stop,
> @@ -1493,7 +1486,6 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>  	.ce_irq_enable = ath12k_pci_hif_ce_irq_enable,
>  	.ce_irq_disable = ath12k_pci_hif_ce_irq_disable,
>  	.get_ce_msi_idx = ath12k_pci_get_ce_msi_idx,
> -	.panic_handler = ath12k_pci_panic_handler,
>  #ifdef CONFIG_ATH12K_COREDUMP
>  	.coredump_download = ath12k_pci_coredump_download,
>  #endif


