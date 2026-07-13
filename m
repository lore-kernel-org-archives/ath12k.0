Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEA9C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U391dl/rHMTl9C9E5Z5fW5rknvjeA+bREnwXmKRRurs=; b=oX+hnMhVfSowv4NYx52zl/O8Jo
	88/h3q8dg/gW50f1FJes19B2qUlUqfyoUUFg2+RLVtKQ5nQfUBxU4TMokrNKB6mWOle5MLhK94fbF
	4WIxn1Tawk+r3yqCQX0uGfaJfGDxvJB8Nhv6WRteIxnHTJGfIPND6cs/wS4FQH1JSKOq79jskq8GC
	Ouen0PyY+wam8FTHQHMxbGZt1rw63RDKOpO6r+JdjNlAOrH4esvY0LG/dCAq2CR2K+hTlC94eG8oM
	ts/yEnQZJzWlwXOUfYWA1Xy/Qz3SapxgvBihz+reTLtY0rL4NApGE4m+OqlXaQKATU0+OQI79kwia
	RI/CX2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIh5-00000009oIT-1Gmc;
	Mon, 13 Jul 2026 15:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIgz-00000009oHF-47qx
	for ath12k@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=U391dl/rHMTl9C9E5Z5fW5rknvjeA+bREnwXmKRRurs=; b=YQF4A7e6X+S+/+t1bAbfMVWlJQ
	jDGsBRWvaMf7J98lnIW667ip3X/cOM/ZExWKmQk+p3hOu0g8uxe9JPYurRa4YVZmBz+/X2TgOpLGO
	zkn3hnWKpzsSz7KB0pCSsXxkL639ClTqYybj9QAzv+j3qxhfhUnEBmmDPKxzw+0EgdewpQrwvuXjE
	FAiQK2CANHTGQlk2Aoe9y3XHIBFyuPQU1nbbGfhd1I+m5mpgNmPrvosuGvYZghSQNmz0yLCRKSF3B
	YNccMeYxkYshCQI8FmIIALm38wBlk67lQ59jQpetzHx5TqMCSnO0FqdgLZ8ywrA/eICp5zDFe4Z3g
	r5kbBbXw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIgx-0000000BmpE-0aPE
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 15:35:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8O6J1922787
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 15:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U391dl/rHMTl9C9E5Z5fW5
	rknvjeA+bREnwXmKRRurs=; b=dHnMPtUAX3V+AWzBQXHIqLRCr6rpFOL4zexwqp
	TUK5PdVvJ5eszJE8HvZ+UZD1GIZ0tm6zM+yOJ6Q/ecoETiGxLLCJsIR1EFQmgI9b
	Ep3fbXlHITHwr3xMY7r1CXIvCm2ir5g5NADArfopEtyRoaFBxxu16JAFXOxQiGVk
	qlkbgvUXhR24I3n2McFEajPK9BHvL9bXBDD899YpakNFGv1yxC2mKi0TZBPP1SZW
	0htD37EEBHB+UyvQgN+FFgxj479j8jBqOQmRZmXKicOPnrC+jVFMmfULIOB73zaU
	tlz8eKjvh2k9sKgUaSOe2X+QyikUQeAVnrRCHH0Moyj8hBYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubssyad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 15:35:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso45873a91.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783956929; x=1784561729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U391dl/rHMTl9C9E5Z5fW5rknvjeA+bREnwXmKRRurs=;
        b=Nu1uoEF4iWHmPPGft6vk/3HLhliFVm71zOvXj69qZThF57v5ASWA33EHSH4NJRHjgs
         ymB9fQl3wdSlotBfQxbZxLTG7el0jeCDoGNKxWfhh1sQa5g4Hq1T7S/twulnfdPYI45J
         lXQYZqli8MBE41vEWgW4dqtxHNgEJqm8YHYh/mBWlNit6GM9hcl9cobEVB21V/HV3CVE
         L0n+Lj3T4nxOUyG/Yr7lp9Xc3pqsUN7+UHuaeBUjNKic2ig4sLqGJG+AyayEtRsDGfcr
         53IWQCBFpQTytdlyKXDwyGNaTjxoGOzFPu5VrPIKwZVOmyvUCfXvq4vGDhNyK1WcG8an
         lcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783956929; x=1784561729;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U391dl/rHMTl9C9E5Z5fW5rknvjeA+bREnwXmKRRurs=;
        b=PILrT5/brlLQF9Z6+fWbADJFIBKLssrGPEdFs8YSf8SZzO5vTY8XnJl0NUJyZr+0Ev
         SJ8WPuPThPqQCN/5kpoR6tv+81SrqNqPUoiyq2JglYgmTdiC1ZDVynMyaVjpTcIa+CVv
         0VobE2xj9NsPVXv5pfHYMnRQQyrwqv01hUnep6dGwDt4Lls6/a0FW6A3LoiIFxmjElyM
         7SE/8asnefNRaYylJ8D6gacOubaSjB2hDIBuG3A+V41p3lqso9HFFy4HgTxDzlcdBkI7
         GtPaWNlN0JAEOgkS/W+2j4gdZKD6x1KrMG429UybhnlflA8l9Hq0cIIqcVY7xpOxX6Oi
         hNwA==
X-Forwarded-Encrypted: i=1; AHgh+RpTcls3C2B5N3SCYtCoqiN297eVD4zupRfskz0DYusSywlhJjuwfZ/DAbHK/MQpMNYonefvvp4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2yzcJV8AvUwZeaK6agITvpAvFJpIZnoIyPTTeziyCD3FoTB+f
	TY4tCy/jfrU3vt6n9rleqIv0m2GDSvOhMly03+jjfAKi9DYJZLU9kVQXi1/eu8oma6SZ7nxsD/9
	BYsWBiaCY2hILjCGCwnIK8DEeEghbY+FcIYpYBtjdbhZpA8Et/iuTL3EIqAwxCr45
X-Gm-Gg: AfdE7cnkC9XK/Ww/zll8/xa8AIchyO1fAif2lKAgJIWKw87gQ+NRuUAK0OpgmT0G6B9
	KpSUHPG/eFI496389QCRzC/qGa9VLZ7mO+kSL0uj6BojOkZ011118Lf7l1tzs+ntLm+ZIW3HIn3
	LZUeel+CgGZjI2VM67BST4kD+eXHd2u7Cx95Fj9CFXDdm7P3S7xp7yoKo/0tkivIG4m4ctVhgNt
	oDkF4TLfTSHDHucuWKuhm9//gr3ly4N/wBZLsO2Pw4VMN8WhyEoGcxiosoeJ8fkHPzB5bVwv1pE
	qNleVxOn7lwcA+GZY3xsU05SoEw/mh27u7QDvGOjZD3aiQFMj77KdtxO/rivo93Y/jgwpinxp7P
	b+5oCY7V/l4D+cY99EbhPzF25w4xkNUmnpO8doquT+kI1Ec8=
X-Received: by 2002:a17:90b:1fc8:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38dec314a44mr5219712a91.41.1783956928884;
        Mon, 13 Jul 2026 08:35:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc8:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38dec314a44mr5219688a91.41.1783956928429;
        Mon, 13 Jul 2026 08:35:28 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm81030633eec.14.2026.07.13.08.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:35:27 -0700 (PDT)
Message-ID: <c4207979-e004-43ff-9a11-519302a15f77@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 08:35:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260713
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a5505c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Zsz1XpRDJix6TB4E5yEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: eQMZVlaf6e76s4IEAeY3mVLqd7ESGD62
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2MiBTYWx0ZWRfX6hbxn5Nm5RE0
 Es0dosRerCpTCH2VLAHphNG3CSeLBbgj6KlKLc4oJXCk1cdFpGa/KErqFpw4nzg0zrqevvarUXM
 og83pFOhJi7LDYI56LrlZl9oGqjoA1g=
X-Proofpoint-GUID: eQMZVlaf6e76s4IEAeY3mVLqd7ESGD62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2MiBTYWx0ZWRfX1qP4F7fRX08r
 EP7LhhT+zpAAzqSnS8D8E5dDc2qMxhu8AA2Repax8yp8oV+0wVEu4AguvDjevTk3qMqVcQ8EYa4
 BoV8q3LfKhzAP3x/VYZdncua4ywpsxK4SFIJk+E5ERpu6NvIbh7ixx6T5iggMgHvEFNsAEXDQA1
 zuB/l7omnn8EjzHDxO1uDS94Xi/DrajJc+pmNWfoi8UJ8fvtjqMhJTQNXHB3oGnoeRYFz+7TGK+
 4ylR0M2JpbWpnELEtFcwaiAlkcOQcjpQyP5Bj8FNR+W1+vu1fVEXN92UnAhpD/ZR7Ca1MaJF59O
 LEimez9OxCbKPsQE6dcR+fAURH1SWOdYNiP8ex9satl/wcaPWoJmHoGRc65B23feUsJICKc9Wo4
 HpvFODAVfbf5a3EDBHaCiYMjXWvc/C8O15HwRA62bUFRA9Qwo/6w2v0PtpiZc0wjFKNt3kp3si5
 hBIGcYxsoD7e/3aitFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_163535_471437_FA4CE17A 
X-CRM114-Status: GOOD (  10.62  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260713

for you to fetch changes up to a1a21995c2e1cc2ca6b2226cfe4f5f018370182a:

  wifi: carl9170: fix buffer overflow in rx_stream failover path (2026-07-13 06:55:20 -0700)

----------------------------------------------------------------
ath.git update for v7.2-rc4

The most significant change is to fix an ath12k regression which led
to low MLO RX throughput on WCN7850.

The remainder are an assortment of minor bug fixes spread across many
of the ath drivers.

----------------------------------------------------------------
Cheng Yongkang (1):
      wifi: ath9k: hif_usb: don't dereference hif_dev after re-arming firmware request

Daniel Hodges (1):
      wifi: ath6kl: fix use-after-free in aggr_reset_state()

Dmitry Morgun (1):
      wifi: ath11k: fix potential buffer underflow in ath11k_hal_rx_msdu_list_get()

Gaole Zhang (1):
      wifi: ath11k: fix NULL pointer dereference in ath11k_hal_srng_access_begin

Jose Ignacio Tornos Martinez (1):
      wifi: ath12k: fix NULL pointer dereference in rhash table destroy

Manikanta Pubbisetty (1):
      wifi: ath10k: fix skb leak on incomplete msdu during rx pop

Manivannan Sadhasivam (2):
      wifi: ath11k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
      wifi: ath12k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET

Tristan Madani (6):
      wifi: ath6kl: fix OOB access from firmware ADDBA window size
      wifi: ath6kl: fix OOB read from firmware num_msg in TX complete handler
      wifi: ath6kl: fix OOB read from firmware IE lengths in connect event
      wifi: carl9170: bound memcpy length in cmd callback to prevent OOB read
      wifi: carl9170: fix OOB read from off-by-two in TX status handler
      wifi: carl9170: fix buffer overflow in rx_stream failover path

Wentao Liang (1):
      wifi: ath11k: fix refcount leak in ath11k_ahb_fw_resources_init()

Yingying Tang (1):
      wifi: ath12k: Fix low MLO RX throughput on WCN7850

 drivers/net/wireless/ath/ath10k/htt_rx.c      |  2 ++
 drivers/net/wireless/ath/ath11k/ahb.c         |  1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  3 +++
 drivers/net/wireless/ath/ath11k/pci.c         |  4 ++++
 drivers/net/wireless/ath/ath11k/qmi.c         | 11 ++++++---
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 11 +++++++--
 drivers/net/wireless/ath/ath12k/dp_peer.h     |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  7 +++---
 drivers/net/wireless/ath/ath12k/hw.h          | 16 +++++++++++++
 drivers/net/wireless/ath/ath12k/mac.c         | 10 +++++---
 drivers/net/wireless/ath/ath12k/pci.c         |  4 ++++
 drivers/net/wireless/ath/ath12k/peer.c        |  3 +++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 33 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  6 +++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  3 +++
 drivers/net/wireless/ath/ath6kl/txrx.c        | 12 ++++++----
 drivers/net/wireless/ath/ath6kl/wmi.c         | 20 ++++++++++++++++
 drivers/net/wireless/ath/ath9k/hif_usb.c      |  7 +-----
 drivers/net/wireless/ath/carl9170/rx.c        |  7 ++++--
 drivers/net/wireless/ath/carl9170/tx.c        |  2 +-
 20 files changed, 137 insertions(+), 26 deletions(-)

