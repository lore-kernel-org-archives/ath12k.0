Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA619CD98CF
	for <ath12k@archiver.kernel.org>; Fri, 12 Jun 2026 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCZGhFktK5I+Rd85vY1rnYGowRfHuOl4vJ+wXdl1bFk=; b=Y8LtWtBeKeFuOkKibsrkKDDVA6
	diM+CuqVSc9uJ8rKfHO1lXNVKPVsAhf8bHa+CxeH2hpgZzSc77/vJJrLF/bD5yWMQ0ABPo+ZhZkqx
	eEW8Og65p2PvfPUfLMKgT1pIRpdU8vAKGaQhOGWMJBIOkHaUKSoWY2K8T1MjPQyPEZv96o8x4e8pQ
	6ww+iXVTGkySgiE9g8BLiW2yDjNzG5Tq9HZVUaNkc57M1HXNvBaEIEANNwnTNlwuznn990N9HzIGx
	wgoQKVGYDyu4PCoLUI6zw/fF26g8UJobNFwqDaExnZuRsrBNkuaNmksEloUiKKXHeR5fl3SF77J/2
	cp0DbezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3YV-0000000B8RS-2MfL;
	Fri, 12 Jun 2026 15:12:23 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3YR-0000000B8P6-3WaA;
	Fri, 12 Jun 2026 15:12:21 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 5B470EC01FA;
	Fri, 12 Jun 2026 11:12:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 12 Jun 2026 11:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781277136;
	 x=1781363536; bh=kCZGhFktK5I+Rd85vY1rnYGowRfHuOl4vJ+wXdl1bFk=; b=
	IfyvRcoUnzGp1tOUTqkNLcO3Wcc8D8dm0UNFS2E2nVyl/GDtW9v3gdpGNjRfIfF0
	ulWQFmmIia0uVlKpdpN86jxiYBjyfckuiBtOn0HQPmswkm2HhtlRQwX/dJ57yWMD
	m3JGaBnEGUB4Bq8l+e2zik/3mSG4uofkGz2p0S65zJZlx2auFw8xC+l/wmmejtak
	fL00hnW4hKoTCv7HP7zIwzE9j1YvrduNVmebOyG/r7UqwWXXysf2PuSem3OvMWME
	v23M78lEEuesHz1gvyDTVetZQPimp0IDerAuLPNffsUu0WMvOp/A921TJe/lsrqA
	Iyo7cQtGdG/FcXEVJx2WAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781277136; x=
	1781363536; bh=kCZGhFktK5I+Rd85vY1rnYGowRfHuOl4vJ+wXdl1bFk=; b=Q
	+QS1wjEEttGbj4DTZNzem3+nTtifIQQqK9DFTHSWSKp4iccaKs9OfXQr0wETFin0
	9Uit7BUNDbtqG+qrblUSYAQFTNKdW+zhCSpOSxGIj/0D+EgAhUEMhb/uMFa0F0Dx
	jGEQAXvwd5Wof7eAaygP3AfY1ueF52Ae7sVwSAKroQErrP/cjlFzTWpxzO4euw71
	zWMvN4VVnMb7V7hzbeLFYKztHT6CmXNZqzzqhOg34b94FK00Ytbbk/L5hzrQUBi3
	huvvdiX5WM/YORhySL4CNJNhk+O2YHK07HW3hVQsCov+N6ryILKi+qf2FA3CIigr
	F+OdIsNYgGATsqd7o8l6Q==
X-ME-Sender: <xms:zyEsauS7o0p0XsvnBltMVZSTFd3UapsTS4K6J3tTdErr-R63wshkCQ>
    <xme:zyEsar6ptPtlg7hdk8cZGIZfT9yS1pV2Vo13BLRqCxdpLlfHIiCtFAw_G9PDmX3_X
    7Dcf8pTHbBibGeSngz9N93v0XE2QduLx1BkO8pRX5pzl_nZnp3qAQ>
X-ME-Received: <xmr:zyEsarUHLoVgmMt75ciFQXohSG0EKZL6hnBhFgn_pJZ7Ck2sPdvOqaHJXG8>
X-ME-Proxy-Cause: dmFkZTEhPZaTC5WJocVUz5p5x0OW7AO+PJl65exHIc4Skl9u7+pCIASypwnZ2mEtrsFjVd
    nAfGYOfgwVEG7Zck9yOtoDUwnm3G0j/e0qgulx3823I9tWTC/B/GDf3mRot4aYYObkOqax
    Wn484U1gesW3V20fygsVoDQ2FgRl6KKkCUBHDXDUfYJIboONNnLbM0J/4de0z9gBp2Sor4
    oXI57Wy1cuV5E2BkFQMI7FmRf2kQp0wHEtzSsXEUWDPo1EPVbOz3OLD2gDAW8V7So8zC5j
    yZCiv0IRwN5Q7xB8h/b3oS4idkhxxZKhVjo1aKWDiIgbfCbaefLLuazkONhY4t5LiB2RPT
    sDXgC091zSfc/Aa4/vRolhXA7u9HOFswKXvU0crPiGqsHevBawOuXIgivjl++1GvYBvh7h
    sy0RAMDpQd5le+cGaXVqFHIUVKFgYM5l6A8FRtwdmURbZZqmU5k6IT+MlcgFJzSRvTa8LP
    hErtaApFyLC1Dewo6rLv9g/EHrMOgHZcSUPq+HUFRAswPxDaO5+VC2XC1/l8u96zlIsU7+
    NGTAk8lYTPzWEcY/cxNS8X5lIJQIDfVVSdSWls2jJ2LzHlmct5J+zGROScUvJc6pu6tSv7
    XPVghDqVNSLLVxiPQ2PrutL4Zc1Kx6AhCtEUwSAeUa0ZpZJTV5onbaL6Of3Q
X-ME-Proxy: <xmx:zyEsap9kzHKg_LrhUXmOrDBPM5oo_86flSWGUSA_ihQGmEktc9z26g>
    <xmx:zyEsajrT8aQdWUZXjlvWGviCXlde0e1mh0lRHc96ZAdRyugRRogk4A>
    <xmx:zyEsakKroulvIZeTvpN4JhHSKPxFEVEKqgvOsNeUBo4XkcG8RigiOg>
    <xmx:zyEsauNB4lU9fXK8hyd6TL3ny-TBiPddrekpS_WnfSv7WZd7P7zJ0w>
    <xmx:0CEsav_yNxm_0aJmrBPDTiAhBvUfsHE43ZEvwMvNzWAy7dNExeuNxlH6>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 11:12:13 -0400 (EDT)
Date: Fri, 12 Jun 2026 09:12:11 -0600
From: Alex Williamson <alex@shazbot.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, jjohnson@kernel.org, mani@kernel.org,
 linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 mhi@lists.linux.dev, linux-kernel@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <20260612091211.53856fbe@shazbot.org>
In-Reply-To: <20260612142638.1243895-1-jtornosm@redhat.com>
References: <20260612142638.1243895-1-jtornosm@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_081220_270353_403892E4 
X-CRM114-Status: GOOD (  28.07  )
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

On Fri, 12 Jun 2026 16:26:38 +0200
Jose Ignacio Tornos Martinez <jtornosm@redhat.com> wrote:

> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - WCN6855 WiFi card (17cb:1103): Normal VM operation works fine, including
>   clean shutdown/reboot. However, when the VM terminates uncleanly
>   (crash, force-off), VFIO attempts to reset the device before it can
>   be assigned to another VM. Without a working reset method, the device
>   remains in an undefined state, preventing reuse.
> 
> - WCN7850 WiFi card (17cb:1107): Same behavior as WCN6855.
> 
> - SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
>   on first VM assignment without proper reset capability.
> 
> Add device-specific reset entries for these Qualcomm devices using D3hot
> power cycling. Testing shows that despite advertising NoSoftRst+, D3hot
> transition provides sufficient reset for VFIO reuse, particularly after
> unexpected VM termination. While not a complete reset (BARs preserved),
> it provides the only viable reset mechanism for these devices.
> 
> Testing was performed on desktop platforms with M.2 WiFi and modem cards
> using M.2-to-PCIe adapters, including extensive force-reset cycling to
> verify stability.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v9:
>   - Complete redesign based on maintainer feedback (Alex Williamson, Bjorn
>     Helgaas, Rafael Wysocki): dropped general d3cold infrastructure entirely
>     and now just a single patch: the proven D3hot reset for specific
>     Qualcomm devices (device-specific reset)
>   - Previous v8 patch 1/3 (general d3cold) dropped: concerns about ACPI
>     portability, bridge issues, runtime PM, and lack of _PR3 hardware for
>     testing.
>   - Previous v8 patch 3/3 (quirk_no_bus_reset) already merged for v7.2
> v8: https://lore.kernel.org/all/20260609163649.319755-1-jtornosm@redhat.com/
> 
>  drivers/pci/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 431c021d7414..bac1edb6c2dc 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -4240,6 +4240,41 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>  	return 0;
>  }
>  
> +/*
> + * Device-specific reset method for certain Qualcomm devices via D3hot power
> + * cycle.
> + *
> + * These specific Qualcomm devices lack FLR capability, advertise NoSoftRst+
> + * (blocking PM reset), and have broken bus reset. Despite advertising
> + * NoSoftRst+, testing shows that D3hot transition provides sufficient reset
> + * for VFIO reuse, particularly after unexpected VM termination where the
> + * device would otherwise remain in an undefined state. While not a complete
> + * reset (BARs are preserved), it provides the only viable reset mechanism for
> + * these devices in the commented situations.
> + */
> +static int reset_qualcomm_d3hot(struct pci_dev *dev, bool probe)
> +{
> +	int ret;
> +
> +	if (probe)
> +		return 0;
> +
> +	if (dev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	ret = pci_set_power_state(dev, PCI_D3hot);
> +	if (ret)
> +		return ret;
> +	msleep(200);
> +
> +	ret = pci_set_power_state(dev, PCI_D0);
> +	if (ret)
> +		return ret;
> +	msleep(200);
> +
> +	return 0;
> +}
> +
>  static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82599_SFP_VF,
>  		 reset_intel_82599_sfp_virtfn },
> @@ -4255,6 +4290,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  		reset_chelsio_generic_dev },
>  	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
>  		reset_hinic_vf_dev },
> +	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_qualcomm_d3hot },  /* WCN6855 */
> +	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_qualcomm_d3hot },  /* WCN7850 */
> +	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_d3hot },  /* SDX62/SDX65 */
>  	{ 0 }
>  };
>  

Comment and scope is better, but this is duplicating the body of
pci_pm_reset() using a different mechanism with different timeouts. It
would be better to extract the core of pci_pm_reset() to a
pci_do_pm_reset() function that's used both here and by the
pci_pm_reset() function. Thanks,

Alex

