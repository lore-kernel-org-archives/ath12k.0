Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328DBCDB47E
	for <ath12k@archiver.kernel.org>; Thu, 12 Oct 2023 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSVb2OqCZF8qK4qQoRZLejXnmBy2S2uXRq5KXdCT+60=; b=B1dIcK9Y1KJh99
	iY3ZVpe1o8p9ClrJd01/JfLn85HA4yKLVirCuo4tDTV3Oe8pXYEOiVqiTvcpjjZSyp69dcE4WldsZ
	WSAizRJk/qw3PJ87hCSeDBnPNQgb4zXopDB0Ys99pgQ8G23KLHzUPmyvbLVlaX7k9dui7mhvb0SF7
	/tjMrwfldtZGjq9+hKjxkNjiIOq8nrB4rwNLMJ8xf4WhaxHL0b1gRQ3l3CZL9v4Z5rS0W5lFk1YDD
	ABESNxEuHaL7Is09v5cia1zwf3vL+V4+oUhQWmW4CNGr6pOZ6zfc2PP4TCCAKRbd2d21coM7tfBGJ
	Ji1XIudRLIR4tQVn88Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyVW-001PYu-2c
	for ath12k@archiver.kernel.org;
	Thu, 12 Oct 2023 16:25:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyVO-001PVD-2O
	for ath12k@lists.infradead.org;
	Thu, 12 Oct 2023 16:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7916561E92;
	Thu, 12 Oct 2023 16:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08ABDC433C8;
	Thu, 12 Oct 2023 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697127933;
	bh=YNQigbYz044LjlyWkF5uH8izFEBMRQbk1jX2yJ52+HY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=owaWl7YQ8CnnS8FHNgaUmwuOWAC9NgEW/SJD0KRbScPfd64osPjXVcgNLqVU0g8oz
	 ngcdI96wzEYrLaZGl3f9arnzEKoHou0vIoPcM5CneqP67ZXZxMsxMeyFmbCB8/QHGJ
	 RfvZn6getXkISasQei58JKPmijzRU6NeJspdpRztm0HPn2N4d8wTtT4zDZ2YEHk/0W
	 kty0qATbNINUCZKFw+QsIGWsLXNhpOIpCVrj4xIiZzCxtLTXThKfMdER+IKYMij5Y7
	 dZjPzeZnvUNREq5nVsSx3SlumDxIq5ER8LHYN9gl8F29+4EleDUxStU8jaqxSYJEuO
	 4kWyZS8uG4cYA==
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/4] wifi: ath12k: add TAS capability for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231011050004.423413-2-quic_lingbok@quicinc.com>
References: <20231011050004.423413-2-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
 <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712793008.3550118.7804115872979270031.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:25:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_092550_688162_8D54C164 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, ath12k does not support Time-Average-SAR(TAS) for WCN7850. In
> order to enable Time-Average-SAR(TAS) for WCN7850, ath12k defines
> ath12k_get_acpi_all_data() function to get TAS configuration and SAR power
> table, then sets pdev_id, param_type_id, and finally sends the TAS
> configuration, SAR power table and WMI_PDEV_SET_BIOS_INTERFACE_CMDID
> command to firmware to implement TAS during the initialization phase.
> Besides, ath12k registers an ACPI event callback so that ACPI can notify
> ath12k to get the updated SAR power table and sends it to firmware when the
> device state is changed.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This adds a lot of new warnings:

drivers/net/wireless/ath/ath12k/wmi.c:7172:21: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wmi.c:7172:21:    expected restricted __le32 [usertype] length
drivers/net/wireless/ath/ath12k/wmi.c:7172:21:    got int
drivers/net/wireless/ath/ath12k/acpi.h:27: line length of 96 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:115: line length of 96 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:152: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:154: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:165: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:255: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:257: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:278: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:301: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:309: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:317: line length of 96 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:328: line length of 95 exceeds 90 columns
drivers/net/wireless/ath/ath12k/acpi.c:330: line length of 95 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:6995: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7007: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7009: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7035: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7047: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7049: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7070: line length of 97 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7079: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7099: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7101: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7128: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7139: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7141: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7168: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7180: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7182: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7207: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7219: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/wmi.c:7221: line length of 94 exceeds 90 columns

Please ALWAYS run ath12k-check.

4 patches set to Changes Requested.

13416565 [v6,1/4] wifi: ath12k: add TAS capability for WCN7850
13416566 [v6,2/4] wifi: ath12k: add BIOS SAR capability for WCN7850
13416564 [v6,3/4] wifi: ath12k: add adjust configuration of CCA threshold value for WCN7850
13416567 [v6,4/4] wifi: ath12k: add set band edge channel power for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231011050004.423413-2-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
