Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0207CA100B
	for <ath12k@archiver.kernel.org>; Tue,  2 Sep 2025 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMojhxwtB2bOVmAnbFE+QuYNxpuTmb8Gm0jhb3Fx/28=; b=bx948VmUsF3joWF4C37hwmNEGC
	K0Rqy2t1+qNQrXDTfWa/dw1+xsOaMd+BCVuNzZcT0plCaQ8HcFXB0FNv2JyeFp7Ah7yt5ta6evuBP
	4CMfHN3tzU5Jq5d8hieqtS/XU09z/yA9qpZbQNK6N25hurWQwj1B1eziTG0RGAXd07VmZvOFXs4f5
	osNMk3N3djOJ3LIU85fTxliZKe+2U6hmJgfFCTeiBPx3cr0kCWULa57S3fx/1RVqFB1eZtgjU8bpj
	4Z3bvFu1jxssCd0gAVcEtSaV+O1dhoq2riVyE0uTvNCjFKNiAqZjiRRMcdsHFYr4Er0VwLQqjzCRn
	hxZp6uGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLBW-0000000FgZg-1HJJ;
	Tue, 02 Sep 2025 07:12:06 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLBR-0000000FgYA-1t8A
	for ath12k@lists.infradead.org;
	Tue, 02 Sep 2025 07:12:04 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B6565240103
	for <ath12k@lists.infradead.org>; Tue,  2 Sep 2025 09:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1756797115; bh=NMojhxwtB2bOVmAnbFE+QuYNxpuTmb8Gm0jhb3Fx/28=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=oaNNWQAVEJVtNMm3ZnpgqgU+oaWYKjTg1+RD88uFOBmmblTNtNyzIK3HWR/PwYDVv
	 BTa/yQfOqjcSh4pkYLqFzhUKTDSH8rjSxuMAMma6l9hdAt96srRjcrV2Z+d1Uf4y2t
	 KBN+XXv6goCEXd09U0zZcn6a299MsGPQwvDt841/5Udux+OcNWbgpy4z1NmTqSaL93
	 UlDv78fekoJ5mAg7+LCz6NB4ZqTgVhFSeXzKK9TsLE6fZtyUBy3jzXtvBc2CnuXh6G
	 4qMXEsFmK4NEwgn8t14leu9wQLS/AqbsHlD+ZjkgrpNq7yC/exIsew3aMmrm0cmTkT
	 ung6W2s0gY0KQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cGH3t00Jbz9rxN;
	Tue,  2 Sep 2025 09:11:53 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 02 Sep 2025 07:11:55 +0000
From: a-development@posteo.de
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: Re: =?UTF-8?Q?=5Blinux-mainline-=36=2E=31=37rc=33-=31-x=38=36=5F?=
 =?UTF-8?Q?=36=34=5D=20RIP=20at=20qmi=5Fhandle=5Frelease=20with=20ath=31?=
 =?UTF-8?Q?=32k=20on=20a=20MSI=20x=38=37=30e=20Carbon=20WiFi=20-=20mainlin?=
 =?UTF-8?Q?e=20kernel=2E?=
In-Reply-To: <623e93fd-73ef-445f-8519-d510d0c36801@oss.qualcomm.com>
References: <fabc97122016d1a66a53ddedd965d134@posteo.net>
 <623e93fd-73ef-445f-8519-d510d0c36801@oss.qualcomm.com>
Message-ID: <d8e395e714f33e596884a8f1443347b6@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_001201_896828_7273C704 
X-CRM114-Status: GOOD (  16.76  )
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

Hello - the below diff fixes my issue.
I can finally boot/reboot/shutdown AND use my WiFi module - and not only 
Bluetooth.

Thank you so much!

Can you push the fix upstream?
Also maybe have a look at the linked issue which now would be resolved 
if patch is published?
https://bugzilla.kernel.org/show_bug.cgi?id=220518

On 02.09.2025 04:51, Baochen Qiang wrote:
> On 8/31/2025 11:36 PM, a-development@posteo.de wrote:
>> Had the joy to build a new machine.
>> I had to switch to mainline kernel to boot at all.
>> Blacklisting with kernel 6.16 allows me to boot, or using latest 
>> mainline kernel.
>> 
>> Hardware is NEW.
>> 
>> Log: https://0x0.st/KH4D.txt
>> Alternative: 
>> https://paste.gg/p/anonymous/52779beef5144f2fbe74be2673951f50
>> 
>> What should I do?
> 
> Could you try if below diff can fix your issue:
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c
> b/drivers/net/wireless/ath/ath12k/core.c
> index 8d2839cf1de3..bc40958e885d 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2109,14 +2109,27 @@ static int ath12k_core_hw_group_create(struct
> ath12k_hw_group *ag)
>                 ret = ath12k_core_soc_create(ab);
>                 if (ret) {
>                         mutex_unlock(&ab->core_lock);
> -                       ath12k_err(ab, "failed to create soc core: 
> %d\n", ret);
> -                       return ret;
> +                       ath12k_err(ab, "failed to create soc %d core:
> %d\n", i, ret);
> +                       goto destroy;
>                 }
> 
>                 mutex_unlock(&ab->core_lock);
>         }
> 
>         return 0;
> +
> +destroy:
> +       for (i--; i >= 0; i--) {
> +               ab = ag->ab[i];
> +               if (!ab)
> +                       continue;
> +
> +               mutex_lock(&ab->core_lock);
> +               ath12k_core_soc_destroy(ab);
> +               mutex_unlock(&ab->core_lock);
> +       }
> +
> +       return ret;
>  }
> 
>  void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
> @@ -2191,7 +2204,7 @@ int ath12k_core_init(struct ath12k_base *ab)
>                 if (ret) {
>                         mutex_unlock(&ag->mutex);
>                         ath12k_warn(ab, "unable to create hw group\n");
> -                       goto err_destroy_hw_group;
> +                       goto err_unassign_hw_group;
>                 }
>         }
> 
> @@ -2199,8 +2212,7 @@ int ath12k_core_init(struct ath12k_base *ab)
> 
>         return 0;
> 
> -err_destroy_hw_group:
> -       ath12k_core_hw_group_destroy(ab->ag);
> +err_unassign_hw_group:
>         ath12k_core_hw_group_unassign(ab);
>  err_unregister_notifier:
>         ath12k_core_panic_notifier_unregister(ab);
> 
> 
>> 

