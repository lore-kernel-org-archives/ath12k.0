Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DA4C27C55
	for <ath12k@archiver.kernel.org>; Mon, 10 Jun 2024 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNp/NfNKrIJICiOCDcHl1fz9Hf5r9KdRBRV+A71ISMM=; b=HQiBJDVdVjQRL7RHbQjmxlE/FB
	iGAuv6qRdyNFqE0MhNeYRYIP3Vm2t8Jn8TOy2Ze5GZG+eEbBy/9Cg1jvlehsQtcxiYqpyOtl3DXQh
	bcKYOl8ulq74eQEKB4LjOA+ZB6LEeWZLt4m4mGbatZs/oeCZy07Mf97VoEBPrAxHhyLsS1cos7RgS
	CHD/gKc4m17kY4TRUuUauv04yU+PamItqawGF+ukvm1jYaQfG++sQoSX3+Dacl/Ct95x3GbQxNqEN
	UEy2tC/T/6QwgmCbV36IgPfnFu2lHbJxCyTZjiJ+mljA2ZPHiAWGi2GPu9E2zrtxgnt0nimWQ40St
	5W22DfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgOQ-00000005WI5-0sDM
	for ath12k@archiver.kernel.org;
	Mon, 10 Jun 2024 14:53:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgOM-00000005WH5-2nhI
	for ath12k@lists.infradead.org;
	Mon, 10 Jun 2024 14:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F244B60AEB;
	Mon, 10 Jun 2024 14:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD198C2BBFC;
	Mon, 10 Jun 2024 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718031181;
	bh=669b0rf7NSQJN24pCR2kgrEbrq2y/L2bXeys+xzqceo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ATVlmlFUbxSt73KqWf8Qlo4N1ec2IINHyia28FhGwk2fp9dcAuDKeOcqCrSKVIgvN
	 3rNLRWFd9n0BhJ5YcieIhjKt/OIxiUg9uJkZEBPD3hCFmCNl/LFGIIi4+Chb+Y1F2a
	 gOxcTL7H3+RPuC8CTZ0CEE9LGpbHQ2qU8xb/KJliYv/AYZCbRF9Mma1n1j/O1RrZbS
	 OS6vxAEG6cgoISc1RDj2GS5kxxHsewf/ZTw2BDNQhtnHenZ9QqJyAzjT5QZV7Jhy+M
	 ECDVaSSMMJ7PWUiiwbPm17yDJGcXNcWRSN+Rt/bWfagTNYriKM3Vt9FZksARZ4mwU5
	 0nc3j04reVbyg==
From: Kalle Valo <kvalo@kernel.org>
To: Zachary Smith <dr.z.smith@gmail.com>
Cc: ath12k@lists.infradead.org, quic_pradeepc@quicinc.com
Subject: Re: fail to connect to AP mode in 6.10 on WCN785x (NCM865)
References: <CAM=znoFPcXrn5GhDmDmo50Syic3-hXpWvD+vkv8KX5o_ZTo8kQ@mail.gmail.com>
Date: Mon, 10 Jun 2024 17:52:59 +0300
In-Reply-To: <CAM=znoFPcXrn5GhDmDmo50Syic3-hXpWvD+vkv8KX5o_ZTo8kQ@mail.gmail.com>
	(Zachary Smith's message of "Sat, 8 Jun 2024 17:37:21 -0700")
Message-ID: <874ja0q27o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_075302_799072_93562187 
X-CRM114-Status: GOOD (  11.72  )
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

Zachary Smith <dr.z.smith@gmail.com> writes:

> $ uname -a
> Linux athtest 6.10.0-rc1-wt-ath+ #1 SMP PREEMPT_DYNAMIC Fri Jun  7
> 14:03:56 PDT 2024 x86_64 x86_64 x86_64 GNU/Linux

Technically this is not v6.10. This is ath.git master-pending branch, a
development branch with test patches, and they _possibly_ go to v6.11.

I got first worried that we have yet another regression in v6.10 :)

> [84599.322219] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
> [84599.896011] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
> board_id 0xff soc_id 0x40170200
> [84599.896023] ath12k_pci 0000:01:00.0: fw_version 0x100301e1
> fw_build_timestamp 2023-12-06 04:05 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
>
> $ git log --oneline | head -n 5
> 6f446d0a1af0 Merge branch 'pending' into master-pending
> cf899366dcc9 wifi: ath11k: use 'time_left' variable with wait_event_timeout()
> 9e0e90f4ca68 wifi: ath11k: Add firmware coredump collection support
> c0889b096794 wifi: ath11k: fix RCU documentation in ath11k_mac_op_ipv6_changed()
> b14f951b2de7 wifi: ath12k: fix ACPI warning when resume
>
> note this is 2.4ghz
> $ cat hostapd.conf
> beacon_int=100
> ssid=testap5
> interface=wlp1s0
> driver=nl80211
> channel=6
> ctrl_interface=/tmp/hostapd_ctrl
> ctrl_interface_group=0
> ignore_broadcast_ssid=0
> ap_isolate=0
> hw_mode=g
> ieee80211w=0
> logger_stdout_level=0
>
>
> $ sudo /usr/sbin/hostapd hostapd.conf
> wlp1s0: interface state UNINITIALIZED->ENABLED
> wlp1s0: AP-ENABLED
>
> <is waiting for connection, then after client connects:>
>
> wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: authentication OK (open system)
> wlp1s0: STA 0e:db:91:6f:7f:d7 MLME:
> MLME-AUTHENTICATE.indication(0e:db:91:6f:7f:d7, OPEN_SYSTEM)
> wlp1s0: STA 0e:db:91:6f:7f:d7 MLME: MLME-DELETEKEYS.request(0e:db:91:6f:7f:d7)
> wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: authenticated
> wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: association OK (aid 1)
> wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: Could not set STA to kernel driver
>
> Bisecting I found the problem in this commit:
> 3d887557477 wifi: ath12k: refactor SMPS configuration

Pradeep (CCed) is working on a fix and hopefully he sends it soon.
Thanks for the report, please keep them coming.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

