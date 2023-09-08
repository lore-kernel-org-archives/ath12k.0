Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C286CEEB562
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 19:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5ErWM/oHLTaJ69N4k5Hgrlo8LF1UzQKpfzBw5bega4=; b=1FFNZNQTwGS1Z9
	w791gCwkIa0y7jL/9W3I3N89JcNerUwzBr2pf/DgvdlEx20lzFBvY1ATHozHT/vhYvgYL4q22o1An
	Nm2t87nDZMZmYuJhX5g5+SOXP4x4T3mhIEcDywJsvOLk57w1idAY1XHCdkVzzqO0EpuF2NVg0LrFP
	qIeudrouviLacImauDt/BLr4tN3K7QKou5kxsgU/yM8poXUbMtxXMCi3m2cQ9Pt22aOPK1rIbLXmA
	GhFV6xQk7qYqrDvQbmTTVvdcaf61uaAlwz2S3revR82C9JFNCzNvt6ksN5FXm8fb4jHXfkO2Y2Rq3
	ZOFE1iEV2eHFBn/qoAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeh0Y-00ELDI-1C
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 19:19:10 +0000
Received: from netrider.rowland.org ([192.131.102.5])
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeh0V-00ELCB-2i
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 19:19:09 +0000
Received: (qmail 792929 invoked by uid 1000); 8 Sep 2023 15:12:26 -0400
Date: Fri, 8 Sep 2023 15:12:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Kalle Valo <kvalo@kernel.org>, quic_jjohnson@quicinc.com, nbd@nbd.name,
  lorenzo@kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com,
  kuba@kernel.org, srini.raju@purelifi.com, stf_xl@wp.pl,
  helmut.schaa@googlemail.com, pkshih@realtek.com, corentin.chary@gmail.com,
  hdegoede@redhat.com, markgross@kernel.org, johannes.berg@intel.com,
  alexander@wetzel-home.de, error27@gmail.com, szymon.heidrich@gmail.com,
  gustavoars@kernel.org, lynxis@fe80.eu, daniel@makrotopia.org, arnd@arndb.de,
  shayne.chen@mediatek.com, keescook@chromium.org, tglx@linutronix.de,
  pabeni@redhat.com, rostedt@goodmis.org, jacob.e.keller@intel.com,
  ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
  ath11k@lists.infradead.org, ath12k@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
  acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
  linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.5 43/45] Fix nomenclature for USB and PCI
 wireless devices
Message-ID: <0d2ddf90-2334-4d0c-9f63-018c150e06a9@rowland.harvard.edu>
References: <20230908181327.3459042-1-sashal@kernel.org>
 <20230908181327.3459042-43-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908181327.3459042-43-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_121908_038514_2FD261E7 
X-CRM114-Status: GOOD (  12.29  )
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

On Fri, Sep 08, 2023 at 02:13:24PM -0400, Sasha Levin wrote:
> From: Alan Stern <stern@rowland.harvard.edu>
> 
> [ Upstream commit 5d7cf67f72ae34d38e090bdfa673da4aefe4048e ]
> 
> A mouse that uses a USB connection is called a "USB mouse" device (or
> "USB mouse" for short), not a "mouse USB" device.  By analogy, a WiFi
> adapter that connects to the host computer via USB is a "USB wireless"
> device, not a "wireless USB" device.  (The latter term more properly
> refers to a defunct Wireless USB specification, which described a
> technology for sending USB protocol messages over an ultra wideband
> radio link.)
> 
> Similarly for a WiFi adapter card that plugs into a PCIe slot: It is a
> "PCIe wireless" device, not a "wireless PCIe" device.
> 
> Rephrase the text in the kernel source where the word ordering is
> wrong.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
> Link: https://lore.kernel.org/r/57da7c80-0e48-41b5-8427-884a02648f55@rowland.harvard.edu
> Signed-off-by: Sasha Levin <sashal@kernel.org>


Is there any real reason to apply this commit to the -stable kernels?
I did not mark it that way when it was submitted, and it doesn't fix
any bugs.  In fact, aside from updating some module and device
description strings, all it does is change a bunch of comments.

Does that really fall under the -stable rules for acceptance?

Alan Stern

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
