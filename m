Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1CBC83F1A
	for <ath12k@archiver.kernel.org>; Sun, 20 Jul 2025 04:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33LP6STipnEU3sdZfdff9S3Jr2wO+7z1dVrVDCId/P8=; b=Idh4iX+Qz55bBIpGNrIxVjCRBF
	0INPa39xMNuLGwDSuvxqpnhRX2Vyguy4vTQzI4D/1aeDn62TcMsGi1uPGDJlX4sWBuoAGAxvhnkct
	W0NGNfu4yQNmQ4IyU+PlMfVK48LMJcrSNTgAHAzS0UH4UfJi/+kEgHRCSC9UjCiPju1LeTjhxSGjN
	2RGjKz+WKUlFKI79VTSWmdRnlEaEcUgULUZHwpaw2S7qR/OIrboh202ukuXpCtyJ2HeVVTeRmTWB+
	cs5XU/Z3X7qc+N6y+0BfiQ7QMnoz3VCOEkfjlTbObtztjbLpvFLVd2w2jRCU/Asb/mCtPzDfv9bhl
	/RbuACyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udLbd-0000000EtX7-3q4s;
	Sun, 20 Jul 2025 04:24:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udLbb-0000000EtWk-2MkE
	for ath12k@lists.infradead.org;
	Sun, 20 Jul 2025 04:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9329A5051C;
	Sun, 20 Jul 2025 04:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3D1C4CEEB;
	Sun, 20 Jul 2025 04:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752985493;
	bh=BAiS+5L1aoOna4clIV4XORs7TOaMn2H/5GNlaa5gSKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hues/3N8LDK8NbIKKerIvu2ZL5XDm9nJMyJygi1KB2NFouDNZMVQGEIkYRkNrQzAV
	 OuPrtbiL7wm6lO3OxkfUsONFQLpXGvxLkhDW3SpCiufumcGmFORUzqsRiqNFLiRd48
	 kf1FvrBfAT1uD1eIPlg04rzyqsjsI5Kymv+VFbvj8advrAvTrdfJla/vVtHrBCIDrD
	 ORlpjWAhQ6dtW2flVHfGiiPCFI8Dj/Z7DAWyCJPEy//6NY7OtOd3d8LVaFbJ0E10Ol
	 vyYpm7EaqfjebHSdu3Xv+ZuAFt5/o1Av2LeEiW6WYPLKaDG0RU0a5PJa1nlFByj4qB
	 y6euF3y2iX0WQ==
Date: Sat, 19 Jul 2025 23:24:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 00/11] wifi: ath12k: Fix endianness handling in QMI
Message-ID: <a2sjvescdtdo75lpt6e7tnf7c46sj6g3mlakva5nzsa2p643w2@ie4scpc5vhv7>
References: <20250716075100.1447352-1-alexander.wilhelm@westermo.com>
 <833ce5f1-51b2-4d4c-a839-38989ea10344@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <833ce5f1-51b2-4d4c-a839-38989ea10344@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_212455_738538_46B50ED4 
X-CRM114-Status: GOOD (  20.29  )
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

On Wed, Jul 16, 2025 at 08:13:20AM -0700, Jeff Johnson wrote:
> On 7/16/2025 12:50 AM, Alexander Wilhelm wrote:
> > Fix endianness handling in QMI firmware transfer on big-endian
> > platforms. Without this fix, the firmware download fails due to
> > misinterpreted data structures exchanged between the host and the
> > wireless module.
> > 
> > The issue occurs during early bring-up on big endian systems, where QMI
> > messages are not correctly parsed by the driver, leading to failed
> > initialization sequences. Ensure all relevant fields are properly
> > converted between CPU and little-endian format in request and response
> > messages, as expected by the firmware. Attached logs showing the failure
> > before the fix:
> > 
> >     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
> >     ath12k_pci 0001:01:00.0: boot pci_mem 0xcd4148e9
> >     ath12k_pci 0001:01:00.0: pci probe 17cb:1109 17cb:1109
> >     ath12k_pci 0001:01:00.0: pci tcsr_soc_hw_version major 2 minor 0
> >     ath12k_pci 0001:01:00.0: request MSI one vector
> >     ath12k_pci 0001:01:00.0: MSI vectors: 1
> >     ath12k_pci 0001:01:00.0: msi base data is 0
> >     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
> >     ath12k_pci 0001:01:00.0: boot firmware request ath12k/QCN9274/hw2.0/firmware-2.bin size 15134776
> >     ath12k_pci 0001:01:00.0: found fw timestamp 1722934582
> >     ath12k_pci 0001:01:00.0: found m3 image ie (421880 B)
> >     ath12k_pci 0001:01:00.0: found fw image ie (7229440 B)
> >     ath12k_pci 0001:01:00.0: found dualmac fw image ie (7483392 B)
> >     ath12k_pci 0001:01:00.0: found firmware features ie (1 B)
> >     ath12k_pci 0001:01:00.0: features
> >     ath12k_pci 0001:01:00.0: using fw api 2
> >     ath12k_pci 0001:01:00.0: dualmac fw selected for board id: 1005
> >     ath12k_pci 0001:01:00.0: Assign MSI to user: MHI, num_vectors: 3, user_base_data: 0, base_vector: 0
> >     ath12k_pci 0001:01:00.0: Number of assigned MSI for MHI is 3, base vector is 0
> >     ath12k_pci 0001:01:00.0: Assign MSI to user: CE, num_vectors: 1, user_base_data: 0, base_vector: 0
> >     ath12k_pci 0001:01:00.0: Assign MSI to user: DP, num_vectors: 1, user_base_data: 0, base_vector: 0
> >     ath12k_pci 0001:01:00.0: irq:18 group:0
> >     ath12k_pci 0001:01:00.0: irq:18 group:1
> >     ath12k_pci 0001:01:00.0: irq:18 group:2
> >     ath12k_pci 0001:01:00.0: irq:18 group:3
> >     ath12k_pci 0001:01:00.0: irq:18 group:4
> >     ath12k_pci 0001:01:00.0: irq:18 group:5
> >     ath12k_pci 0001:01:00.0: irq:18 group:6
> >     ath12k_pci 0001:01:00.0: irq:18 group:7
> >     ath12k_pci 0001:01:00.0: pci after request_irq msi_ep_base_data 0
> >     ath12k_pci 0001:01:00.0: cookie:0x0
> >     ath12k_pci 0001:01:00.0: WLAON_WARM_SW_ENTRY 0x2
> >     ath12k_pci 0001:01:00.0: WLAON_WARM_SW_ENTRY 0x2
> >     ath12k_pci 0001:01:00.0: soc reset cause:0
> >     ath12k_pci 0001:01:00.0: MHISTATUS 0xff04
> >     ath12k_pci 0001:01:00.0: pci link_ctl 0x0000 L0s 0 L1 0
> >     ath12k_pci 0001:01:00.0: pci reg 0x3164 instance 0x11 read val 0x11
> >     ath12k_pci 0001:01:00.0: setting mhi state: INIT(0)
> >     ath12k_pci 0001:01:00.0: setting mhi state: POWER_ON(2)
> >     ath12k_pci 0001:01:00.0: mhi notify status reason UNKNOWN
> >     ath12k_pci 0001:01:00.0: mhi notify status reason MHI_CB_EE_MISSION_MODE
> >     ath12k_pci 0001:01:00.0: qmi wifi fw qmi service connected
> >     ath12k_pci 0001:01:00.0: phy capability resp valid 1 num_phy 2 valid 1 board_id 84934656 valid 1 single_chip_mlo_support 0
> >     ath12k_pci 0001:01:00.0: intra device MLO is disabled hence skip QMI MLO cap
> > 
> > Alexander Wilhelm (11):
> >   wifi: ath12k: fix endianness handling in QMI host capability request
> >   wifi: ath12k: fix endianness handling in QMI phy capability response
> >   wifi: ath12k: fix endianness handling in QMI firmware indication
> >   wifi: ath12k: fix endianness handling in QMI firmware memory indication
> >   wifi: ath12k: fix endianness handling in QMI respond firmware memory
> >   wifi: ath12k: fix endianness handling in QMI firmware capabilities
> >   wifi: ath12k: fix endianness handling in QMI bdf download
> >   wifi: ath12k: fix endianness handling in QMI firmware m3 info
> >   wifi: ath12k: fix endianness handling in QMI firmware wlan mode
> >   wifi: ath12k: fix endianness handling in QMI wlan configuration
> >   wifi: ath12k: fix endianness handling in QMI response
> > 
> >  drivers/net/wireless/ath/ath12k/qmi.c | 149 ++++++++++++++------------
> >  drivers/net/wireless/ath/ath12k/qmi.h | 106 +++++++++---------
> >  include/linux/soc/qcom/qmi.h          |   4 +-
> >  3 files changed, 136 insertions(+), 123 deletions(-)
> > 
> 
> Frankly I'm shocked that the low-level QMI encode/decode is not doing the
> endian conversion. Since the Qualcomm internal tool that generates the data
> structures has always generated structs with cpu endianess (i.e. u8, u16, u32,
> etc) I just assumed that endian conversion was handled at a low level.
> 

I'm suspecting that those tools, just like this implementation, is
exclusively tested on little endian machines...

> So should this issue be pushed down to the QMI encode/decode rather than foist
> it upon every client's read & write?
> 

It's been a while since I looked at the implementation, but conceptually
I'm in favor of this.

Regards,
Bjorn

> /jeff

