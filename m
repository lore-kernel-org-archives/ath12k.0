Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78EDC3ABD8
	for <ath12k@archiver.kernel.org>; Wed, 14 May 2025 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KTzmnKzLvxHCXdEX/W0vOtqVWJk7XhcUTCfpD3xKwI=; b=InwAk2Y3HK4JvAPvlCO7AF+hOC
	v6sDi4jbICbgT/q8FVeI66zLR06a2CYqBJsDUQtf7jqcOnx2wxnuVMohJ2Wt7uXBbor1Na/nuz2sN
	/BbcQS8jFMUm7rOateQT9S3ZwskDQGN7d1J063wwRQ9o0edkT9DbGBESVEcKv9QjROOx+Wgv/1wct
	pCJW4d+U9g1vSFRRfnHxqku4Nt0tV41hGn6F6iYQZg16/UdT5WwLXZTbctK3pl6288HF4B60xyDoW
	iAoFELrx5rqz01+DQW6aR+BlQtBCYTkYnwAA9xxTATlczz08HJ56EAGaoioeAL9ZZKXBS63ley+OP
	LKey1KiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDQK-0000000FTHD-1pKS;
	Wed, 14 May 2025 14:49:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDB0-0000000FQMu-3Rya;
	Wed, 14 May 2025 14:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A587F5C5F48;
	Wed, 14 May 2025 14:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26498C4CEE3;
	Wed, 14 May 2025 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747233221;
	bh=0QNOi5L2b6Wa2pW0QAao2Q8QYjITnD2KoyJF4sxWD54=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=ZVDp1fmwFAgjLPYgfBK8JEyim2lvuwSWNxpMRv48dTBxRZgf98A7Bp1FBHiYBS6x0
	 gPuGvNpbrqZOC/hIkT2C2cDqMJAuiilSjo3ys/JLZnv4DZhhRobbn+2gXjLlw0G0R0
	 9Quc1N74yM6vpTTimXFGEqiWfilwMteaqOa5hZxnLPEvlpem2LTYjZsBi5R8i9YBxH
	 jOR+4rWA5kYn2SjPCx8Pks+0k1wIsOP9XPtyqDCo9lIpjqzys8TrE46A7F20c+0O4c
	 ErDb7zAW/KPvX3T2KLSBtsHjjZmEz8e9jQaB4knFfIJyzp/0RamvRbzxSA3aNv3KC6
	 dIhz3sM2dcQZA==
Message-ID: <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
Date: Wed, 14 May 2025 09:33:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org,
 "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
 Christian Heusel <christian@heusel.eu>
References: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_073342_944886_9611DD3B 
X-CRM114-Status: GOOD (  14.19  )
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

On 4/24/2025 3:38 PM, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath11k and ath12k.
> 
> For ath11k, update the firmware for IPQ5018 and update the board file
> for WCN6855. For ath12k, update the firmware for WCN7850 and update
> the board file for QCN9274.
> 
> Please let me know if there are any problems.
> 
> /jeff
> 
> The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6da3:
> 
>    Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +0000)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250424
> 
> for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:
> 
>    ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)
> 
> ----------------------------------------------------------------
> Jeff Johnson (4):
>        ath12k: QCN9274 hw2.0: update board-2.bin
>        ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>        ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
>        ath11k: WCN6855 hw2.0: update board-2.bin
> 
>   WHENCE                           |    4 +-
>   ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------------
>   ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
>   ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
>   ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
>   ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
>   ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
>   ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
>   15 files changed, 315 insertions(+), 3607 deletions(-)
> 

FWIW - this appears to have broken Wifi for a bunch of people.

https://discuss.cachyos.org/t/wifi-interface-fails-to-initialize-after-linux-firmware-upgrade-qualcomm-wcn7850-ath12k/8765

https://bugzilla.opensuse.org/show_bug.cgi?id=1241986

https://www.reddit.com/r/archlinux/comments/1kja6f9/ath12k_regression_on_latest_linuxfirmware_upgrade/



