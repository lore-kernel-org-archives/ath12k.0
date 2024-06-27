Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38145C2BD09
	for <ath12k@archiver.kernel.org>; Thu, 27 Jun 2024 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a57StgKJ3dq8cRcEZkqPTFMtN7l27yvAG/NOM6JZ4sE=; b=HE6I+RtGVhbNtWXL3VcxGeFfXW
	JcIwdUF/0EFsJuJ7llp1/DZfu/F0vYsxdOOsXVrw/5UefSVG4/9wOKvvrZhX45BprN0PMr/BK2S/Q
	I0OJK5+Ww8jWFzq4KWZhvsMhP5VUbpIPwJhaIgMBSObGV5icZKGlvSuyLK0qa94mW9cRI0rD/VQ3n
	M+TwJBt4HkmI4/KYCzZvTa0/Bcrz0/Ks+BNQWgdrrIs1/icHNnohmLKMoJfKowJzkT6SunSFRfqGJ
	tRhqMYfPB/ygMDXlI1j7MIvu1JD3iLXGPF+T7VmOT7m5IPTk37Mbl3z019o17+gwYgU98bDrGSAi2
	6fXOxMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMs1s-0000000B3mm-3uSC
	for ath12k@archiver.kernel.org;
	Thu, 27 Jun 2024 16:31:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMs1o-0000000B3lu-2lC6
	for ath12k@lists.infradead.org;
	Thu, 27 Jun 2024 16:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D04D761E13;
	Thu, 27 Jun 2024 16:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837A9C2BBFC;
	Thu, 27 Jun 2024 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719505879;
	bh=PTfSZMp3jafutVyry1fb2Jx4NzvL0t1ODQaqXdP9FxE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZgzWJScU6J5Nd4VMrBLl3jgvPjnEw6WS6ajngOF56fz9euZndjdJed2BYLWxTSUyq
	 aCHKH7BHEAVVT0M2aOSSSb6cOvX1/TSsXPHqRlf5+huLpGT0UKm09mi96cdNCEQGw7
	 ypnMMYGW95sCWlH5W7Wpj8K9PwXAVNctv0DPRLp+Pwu281bxksOfDNL41kZwurqSsT
	 HKkhEvXVrTv1Eu9uCUoHPC9fh4cEwwxgRCEeUzBLzrxYZnXwEsfoHHqCTViw/I9F2R
	 eNCDfeL5+ySkh24Q6vvwigh+69NeiswDnorTJEskVaupYQMx3K4gDcIkR6fo/VOuEh
	 tHfqtYdI6KiEA==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Rajat
 Soni <quic_rajson@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Add WMI control path stats infra
References: <20240529180920.1472003-1-quic_rgnanase@quicinc.com>
	<8d3fc6d4-abcc-4551-9837-afe7dc482cbe@quicinc.com>
Date: Thu, 27 Jun 2024 19:31:16 +0300
In-Reply-To: <8d3fc6d4-abcc-4551-9837-afe7dc482cbe@quicinc.com> (Ramya
	Gnanasekar's message of "Thu, 27 Jun 2024 17:31:28 +0530")
Message-ID: <87ed8igxez.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_093120_944743_8BB0333C 
X-CRM114-Status: GOOD (  10.45  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> On 5/29/2024 11:39 PM, Ramya Gnanasekar wrote:
>> From: Rajat Soni <quic_rajson@quicinc.com>
>> 
>> Currently, firmware stats is requested by host through HTT interface.
>> Since HTT interface is already overloaded for data path stats,
>> leveraging control path to request other stats through WMI interface.
>> 
>> Add debugfs to request the stats and dump the stats forwarded by firmware.
>> 
>> ath12k
>> `-- pci-0000:06:00.0
>>     |-- mac0
>>         `-- wmi_ctrl_stats
>> 
>> This patch also adds support to request PDEV Tx stats, parse and dump
>> the data sent from firmware.
>> 
>> Usage:
>> echo <stats id> <action> > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
>> 
>> Sample:
>> echo 1 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
>> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
>> WMI_CTRL_PATH_PDEV_TX_STATS:
>> fw_tx_mgmt_subtype =  0:0, 1:2, 2:0, 3:0, 4:0, 5:37, 6:0, 7:0, 8:908, 9:0, 10:0, 11:18, 12:2, 13:3, 14:0, 15:0,
>> fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0,
>> scan_fail_dfs_violation_time_ms = 0
>> nol_chk_fail_last_chan_freq = 0
>> nol_chk_fail_time_stamp_ms = 0
>> tot_peer_create_cnt = 7
>> tot_peer_del_cnt = 7
>> tot_peer_del_resp_cnt = 7
>> vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
>> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>> ---
>> Depends-On: [PATCH v2 3/5] wifi: ath12k: Fix Pdev id in HTT stats request for WCN7850
>> Link: https://lore.kernel.org/linux-wireless/20240510050806.514126-1-quic_rgnanase@quicinc.com

[removing over 600 lines unnecessary quotes]

> Please drop this patch. I'll send a re-based version

Dropped, thanks for letting us know. But please edit your quotes,
including the full patch in the reply makes the use of patchwork
practically unusable:

https://patchwork.kernel.org/project/linux-wireless/patch/20240529180920.1472003-1-quic_rgnanase@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

