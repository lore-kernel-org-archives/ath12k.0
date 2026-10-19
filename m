Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2949CCF2DF
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOPRAb0Kpa6dz/yQkxa87qgu8YqS6xHie1GJGb07jNA=; b=NYqwEYrBb9yBbgUUsbKAiQWiqa
	SPV4EhdwbcID6qNVYACqLGwrFGYU0OzlfuKIT740onP5EoTy+NI/CmrJkXUgyNqf7QofGJw2OvAMW
	HVb7hnE7CqFnuYrkPTMv7nf4+Y5JTBNWoc8eAdDqvFvHLXHfNtTuaRbZwi5TFRDiMXi/SsA6mD51d
	lcUnKqzmYg/MV1u1JKb38f/jHlZw90kr1RDnc4i+AKjSIl+m6T9IvCUDDuc4vw+iHNIEh1suSPSBv
	sDDPwTsOemjOrg256rCkZWG8WVmRArMR12eQlTfCWkJiKcNt6JgLwU8byruIRlXDdo0noDFvMGJ/h
	Ucu0yWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAg-0000000757m-3HrS;
	Mon, 19 Oct 2026 10:00:46 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAc-0000000756j-1VMa;
	Mon, 19 Oct 2026 10:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lO
	PRAb0Kpa6dz/yQkxa87qgu8YqS6xHie1GJGb07jNA=; b=Eho0Vz53yXYFs+E0cT
	9A4MjpBMBfnMTkjrGuP7+Z/dAbionYDPrxzp+1TUnSilL/xRNsXzeE25Nw3ZHe6K
	OI+gEBlMd86zORItDni2rY6ZMtA72zsxFa+ITwFOonVcypWi0ksTIYtRAfUvrEGM
	C+k1XRY1/weILZAEHltNSObBA=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3E3g+6tVqofy8Ag--.62619S2;
	Mon, 19 Oct 2026 18:00:31 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Kalle Valo <kvalo@kernel.org>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
Date: Mon, 19 Oct 2026 18:00:25 +0800
Message-Id: <20261019100029.1908660-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3E3g+6tVqofy8Ag--.62619S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy7tr47trW8Gry3XryUtrb_yoWkJrX_Wr
	4ktr9rX3W8GF4UKFyvkF1UZryFyayj9F1kJFWUtF93Z3yDArWYyr95AFn8ur1UAw4UXF9a
	9rnxJFWxZw129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU81v35UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh-ZFGrV6j-kzgAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030044_772059_EC74C6F5 
X-CRM114-Status: UNSURE (   5.30  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Jiale Yao <jiale.yao@example.com>

ath11k and ath12k consume two firmware-provided arrays without fully
validating their lengths. The service-ready-ext parser accepts fewer
extended regulatory capability entries than the separately reported PHY
count, while the ready-event parser trusts the reported extra MAC address
count without checking the fixed-structure array length.

Malformed firmware data can therefore make both drivers read beyond the
corresponding TLV arrays. Add matching validation to each driver before
the arrays are indexed.

The four patches are independent and each addresses one parsing path in
one driver.

Jiale Yao (4):
  wifi: ath11k: validate extended regulatory capability count
  wifi: ath12k: validate extended regulatory capability count
  wifi: ath11k: validate ready event MAC address array length
  wifi: ath12k: validate ready event MAC address array length

 drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.34.1


